module
/-! # E1N: the native checker for E1-family enumeration blocks (core only)

A machine-word re-implementation of the kernel checkers `E1P.block` (`hcls/E1P/Check.lean`), `E1G.block`
(`hcls/E1G/Check.lean`) and `E1.block` (`leaf2/E1/Check.lean`).  It reads the SAME block literals (as little-endian bytes)
and accepts only blocks the kernel checker accepts (refinement theorems in `R/`).  Where the kernel works on 65,536-bit
packed vectors, this works on arrays of small `Nat`s (machine scalars):

* the block stream is a `ByteArray`; `rdE B q e k` reads `k ≤ 48` bits at bit `q` of the window `[q, e)` (zero at and
  past `e`), as the kernel's `rd k` of a stream truncated by `rd len`;
* the prefix multiset is the list of its labels `labs` (the kernel's `pl` is `∑ labs[i] 2^(lb i)`, its `MV`/`MVR` the
  packed multiplicities of `labs`);
* the budgets are `u : Array Nat` (`nl` entries; the kernel's `UF = V u`, `UFR = VR u`);
* a dual is `(BC, T)` with `T : Array Nat` (`nl` entries; the kernel's `T = V T`);
* the IP's slot table is unpacked once per process into 32-bit mask words (`IPD.sm`) and caps (`IPD.sc`); the reversed
  masks are never read: the refinement proof gets their reversal property from the slots' validity (`SlotV`), which
  every `JobOK` statement assumes.

The format parameters (`IPD.lb` label bits, `sib` slot-index bits, `satb` child saturation-count bits, `gb` group-index
bits) select the checker: E1P `8, 19, 6, 11`; E1G `7, 15, 6, 11`; E1 `7, 15, 4, 4`.

Strictness: besides everything the kernel checks, the native checker rejects a block whose prefix has a label `≥ nl`, or
(mode 0) a prefix multiplicity above the label cap, or a canonicity witness whose image has a label `≥ nl`.  These never
occur in emitted blocks; there the kernel would compute with carries between packed fields. -/
@[expose] public section
namespace E1N

/-! ## Bits of a byte array -/

/-- byte `i` of `B`, `0` past the end -/
@[inline] def byte (B : ByteArray) (i : Nat) : UInt64 :=
  if h : i < B.size then (B.get i h).toUInt64 else 0

/-- the 56-bit little-endian window at byte `a` -/
@[inline] def w56 (B : ByteArray) (a : Nat) : UInt64 :=
  byte B a ||| (byte B (a + 1) <<< 8) ||| (byte B (a + 2) <<< 16) ||| (byte B (a + 3) <<< 24) |||
    (byte B (a + 4) <<< 32) ||| (byte B (a + 5) <<< 40) ||| (byte B (a + 6) <<< 48)

/-- bits `[q, q + k)` of `B` (little-endian, `k ≤ 48`) -/
@[inline] def bits (B : ByteArray) (q k : Nat) : Nat :=
  ((w56 B (q >>> 3) >>> (q &&& 7).toUInt64) &&& (((1 : UInt64) <<< k.toUInt64) - 1)).toNat

/-- `k ≤ 48` bits at `q` of the window `[q, e)`: zero at and past `e` -/
@[inline] def rdE (B : ByteArray) (q e k : Nat) : Nat := bits B q (min k (e - q))

/-- `(1 <<< 30)`: the scale of the duals -/
@[inline] def SC : Nat := 1073741824

/-! ## IP data and block context -/

/-- per-IP data, unpacked once (see `E1N.Load`) -/
structure IPD where
  /-- label bits (`8`: E1P; `7`: E1, E1G) -/
  lb : Nat
  /-- label fields `2 ^ lb - 1` -/
  nl : Nat
  /-- slot-table index bits -/
  sib : Nat
  /-- child saturation-count bits -/
  satb : Nat
  /-- group-index bits -/
  gb : Nat
  /-- slots `2 ^ sib` (index `ns` is an empty slot: past the arrays) -/
  ns : Nat
  /-- 32-bit mask words per slot (`⌈nl / 32⌉`) -/
  mw : Nat
  R : Nat
  N : Nat
  /-- label caps (`nl` entries) -/
  ub : Array Nat
  /-- slot masks: word `w` of slot `i` at `mw * i + w` (32-bit words of the `nl`-bit label mask), slots `i < 2 ^ sib` -/
  sm : Array Nat
  /-- slot caps, slots `i < 2 ^ sib` -/
  sc : Array Nat
  /-- group: the image of label `x` under element `g` at `nl * g + x` -/
  gp : Array Nat
  /-- the leaf check of a prefix (labels) whose certificate is the window `[q, e)` of `B` -/
  leaf : Array Nat → ByteArray → Nat → Nat → Bool
  /-- the once-per-IP check passed: every label cap is at most `2 ^ 32` -/
  ok : Bool

/-- record bits: `[5] d, [lb] pos, 21 × [lb]` prefix, `nl × [3]` budgets -/
@[inline] def IPD.rw (D : IPD) : Nat := 5 + D.lb + 3 * D.nl + 21 * D.lb

/-- per-block context -/
structure Blk where
  B : ByteArray
  /-- the block's row table: slot-table indices -/
  ix : Array Nat
  /-- bit offset of the header records -/
  hs : Nat
  /-- number of header records -/
  nd : Nat

/-- the slot-table index of block row `j`; past the row table, `ns` (an empty slot) -/
@[inline] def gix (D : IPD) (K : Blk) (j : Nat) : Nat := if h : j < K.ix.size then K.ix[j] else D.ns

/-- label `x` is in the mask of slot `i` -/
@[inline] def sbit (D : IPD) (i x : Nat) : Bool := (D.sm.getD (D.mw * i + (x >>> 5)) 0 >>> (x &&& 31)) &&& 1 == 1

/-- the cap of slot `i` -/
@[inline] def scap (D : IPD) (i : Nat) : Nat := D.sc.getD i 0

/-- `a + ∑_{t ≤ r < t + n} [labs[r] ∈ slot i]` -/
def msumGo (D : IPD) (labs : Array Nat) (i : Nat) : Nat → Nat → Nat → Nat
  | 0, _, a => a
  | n + 1, t, a => msumGo D labs i n (t + 1) (if sbit D i (labs.getD t 0) then a + 1 else a)

/-- the labels of the multiset `labs` in the mask of slot `i`, with multiplicity -/
@[inline] def msumL (D : IPD) (labs : Array Nat) (i : Nat) : Nat := msumGo D labs i labs.size 0 0

/-- `∑_{lo ≤ x < nl} u x`, outside the mask of row `j` when `useRow` -/
def woutGo (D : IPD) (u : Array Nat) (useRow : Bool) (i : Nat) : Nat → Nat → Nat → Nat
  | 0, _, a => a
  | n + 1, x, a => woutGo D u useRow i n (x + 1) (if useRow && sbit D i x then a else a + u.getD x 0)

/-- `∑_{lo ≤ x < nl} u x`, outside the mask of slot `i` when `useRow` -/
@[inline] def wout (D : IPD) (u : Array Nat) (useRow : Bool) (i lo : Nat) : Nat :=
  woutGo D u useRow i (D.nl - lo) lo 0

/-! ## Duals

A dual is kept as its rows: `BC = ∑ Y cap`, slot indices `is`, weights `ys`.  Its label weights
`T x = ∑_r ys[r] [x ∈ is[r]]` are computed only where they are needed: at the labels with positive budget (`deficit`),
at fixed labels, and through the prefix (`dotD = ∑_r ys[r] · msum`). -/

structure Dual where
  BC : Nat
  is : Array Nat
  ys : Array Nat

/-- a dual of `k` rows (`[12] row, [36] Y`) read at `q`; it ends at `q + 48 k` -/
def rdual (D : IPD) (K : Blk) (e : Nat) : Nat → Nat → Dual → Dual
  | 0, _, du => du
  | k + 1, q, du =>
    rdual D K e k (q + 48) ⟨du.BC + rdE K.B (q + 12) e 36 * scap D (gix D K (rdE K.B q e 12)),
      du.is.push (gix D K (rdE K.B q e 12)), du.ys.push (rdE K.B (q + 12) e 36)⟩

/-- `∑_{r < n} ys[r] [x ∈ is[r]]` from row `r` -/
def tGo (D : IPD) (du : Dual) (x : Nat) : Nat → Nat → Nat → Nat
  | 0, _, a => a
  | n + 1, r, a => tGo D du x n (r + 1) (if sbit D (du.is.getD r D.ns) x then a + du.ys.getD r 0 else a)

/-- the dual's weight `T x` of label `x` -/
@[inline] def tAt (D : IPD) (du : Dual) (x : Nat) : Nat := tGo D du x du.is.size 0 0

/-- `∑_{lo ≤ x < nl} u x * (SC - T x)` (truncated subtraction) -/
def defGo (D : IPD) (u : Array Nat) (du : Dual) : Nat → Nat → Nat → Nat
  | 0, _, a => a
  | n + 1, x, a => defGo D u du n (x + 1) (if u.getD x 0 == 0 then a else a + u.getD x 0 * (SC - tAt D du x))

@[inline] def deficit (D : IPD) (u : Array Nat) (du : Dual) (lo : Nat) : Nat := defGo D u du (D.nl - lo) lo 0

/-- `∑_r ys[r] · msum(labs, is[r]) = ∑_{x ∈ labs} T x` -/
def dotGo (D : IPD) (labs : Array Nat) (du : Dual) : Nat → Nat → Nat → Nat
  | 0, _, a => a
  | n + 1, r, a => dotGo D labs du n (r + 1) (a + du.ys.getD r 0 * msumL D labs (du.is.getD r D.ns))

@[inline] def dotD (D : IPD) (labs : Array Nat) (du : Dual) : Nat := dotGo D labs du du.is.size 0 0

/-- the empty dual -/
@[inline] def Dual.empty : Dual := ⟨0, #[], #[]⟩

/-! ## Saturations and fixings -/

/-- `U |= mask of slot i` (32-bit words) -/
def orRowGo (D : IPD) (i : Nat) : Nat → Nat → Array Nat → Array Nat
  | 0, _, U => U
  | n + 1, w, U => orRowGo D i n (w + 1) (U.set! w (U.getD w 0 ||| D.sm.getD (D.mw * i + w) 0))

/-- `n` saturating rows (`[12]`) read at `q`, each full for the multiset `labs`: the union of their masks, or `none` -/
def satsGo (D : IPD) (K : Blk) (labs : Array Nat) (e : Nat) : Nat → Nat → Array Nat → Option (Array Nat)
  | 0, _, U => some U
  | n + 1, q, U =>
    if msumL D labs (gix D K (rdE K.B q e 12)) == scap D (gix D K (rdE K.B q e 12)) then
      satsGo D K labs e n (q + 12) (orRowGo D (gix D K (rdE K.B q e 12)) D.mw 0 U)
    else none

/-- the budgets with those of the union mask `U` zeroed, labels from `x` (`n` labels) -/
def zeroGo (U : Array Nat) : Nat → Nat → Array Nat → Array Nat
  | 0, _, u => u
  | n + 1, x, u => zeroGo U n (x + 1) (if (U.getD (x >>> 5) 0 >>> (x &&& 31)) &&& 1 == 1 then u.set! x 0 else u)

@[inline] def zeroU (D : IPD) (u U : Array Nat) : Array Nat := zeroGo U D.nl 0 u

/-- budget fixings `[lb] l, [3] ν` read at `q`: `(ν + 1)(T l - SC) > gap`, `ν < u l`; the new budgets, or `none` -/
def fixesGo (D : IPD) (K : Blk) (e gap : Nat) (du : Dual) : Nat → Nat → Array Nat → Option (Array Nat)
  | 0, _, u => some u
  | n + 1, q, u =>
    let l := rdE K.B q e D.lb
    let nu := rdE K.B (q + D.lb) e 3
    if l < D.nl && SC + 1 ≤ tAt D du l && nu + 1 ≤ u.getD l 0 && gap + 1 ≤ (nu + 1) * (tAt D du l - SC) then
      fixesGo D K e gap du n (q + D.lb + 3) (u.set! l nu)
    else none

/-! ## Canonicity witnesses -/

/-- `c[x] += 1` for the labels `x = f labs[r]`, `r < n` from `r` (`nl` counters); `none` if a label is `≥ nl` -/
def countGo (nl : Nat) (f : Nat → Nat) (labs : Array Nat) : Nat → Nat → Array Nat → Option (Array Nat)
  | 0, _, c => some c
  | n + 1, r, c =>
    let x := f (labs.getD r 0)
    if x < nl then countGo nl f labs n (r + 1) (c.set! x (c.getD x 0 + 1)) else none

/-- `a < b` in the multiplicity order: at the first label where they differ, `a` is smaller -/
def lexLt (a b : Array Nat) : Nat → Nat → Bool
  | 0, _ => false
  | n + 1, x => if a.getD x 0 == b.getD x 0 then lexLt a b n (x + 1) else decide (a.getD x 0 < b.getD x 0)

/-- the child multiset `labs` (prefix and the new label) is beaten by its image under group element `g` -/
def canonOK (D : IPD) (labs : Array Nat) (g : Nat) : Bool :=
  match countGo D.nl id labs labs.size 0 (Array.replicate D.nl 0),
        countGo D.nl (fun x => D.gp.getD (D.nl * g + x) 0) labs labs.size 0 (Array.replicate D.nl 0) with
  | some a, some b => lexLt a b D.nl 0
  | _, _ => false

/-! ## Header records -/

/-- the prefix fields of record window `[rs, re)` from label `i` (`n` labels) equal `labs` -/
def recLabsGo (D : IPD) (K : Blk) (rs re : Nat) (labs : Array Nat) : Nat → Nat → Bool
  | 0, _ => true
  | n + 1, i => rdE K.B (rs + 5 + D.lb + D.lb * i) re D.lb == labs.getD i 0 && recLabsGo D K rs re labs n (i + 1)

/-- the budget fields at `b` of record window `[_, re)` from label `x` (`n` labels) equal `u` -/
def recBudGo (K : Blk) (b re : Nat) (u : Array Nat) : Nat → Nat → Bool
  | 0, _ => true
  | n + 1, x => rdE K.B (b + 3 * x) re 3 == u.getD x 0 && recBudGo K b re u n (x + 1)

/-- record `idx` of the block header is the state `(d, pos, labs, u)` -/
def stEqN (D : IPD) (K : Blk) (idx d pos : Nat) (labs u : Array Nat) : Bool :=
  let rs := K.hs + D.rw * idx
  let re := rs + D.rw
  idx < K.nd && rdE K.B rs re 5 == d && rdE K.B (rs + 5) re D.lb == pos && recLabsGo D K rs re labs d 0 &&
    recBudGo K (rs + 5 + D.lb + D.lb * d) re u D.nl 0

/-! ## Nodes -/

/-- one label `l` of a branch node's children loop, reading at `q` (window end `e`): the position after it, or `0` if
rejected.  `ih` checks a child subtree. -/
def kidStep (D : IPD) (K : Blk) (ih : Nat → Nat → Array Nat → Array Nat → Nat → Nat → Bool)
    (d : Nat) (labs u : Array Nat) (e l q : Nat) : Nat :=
  let code := rdE K.B q e 2
  if code == 0 then (if u.getD l 0 == 0 then q + 2 else 0)
  else if code == 3 then (if canonOK D (labs.push l) (rdE K.B (q + 2) e D.gb) then q + 2 + D.gb else 0)
  else if u.getD l 0 == 0 then 0
  else
    let q1 := q + 2 + D.satb
    let n := rdE K.B (q + 2) e D.satb
    let labs' := labs.push l
    match satsGo D K labs' e n q1 (Array.replicate D.mw 0) with
    | none => 0
    | some U =>
      let u' := zeroU D (u.set! l (u.getD l 0 - 1)) U
      let q2 := q1 + 12 * n
      let rem' := D.R - (d + 1)
      if code == 1 then
        if rdE K.B q2 e 1 == 0 then (if wout D u' false 0 l < rem' then q2 + 1 else 0)
        else
          let i := gix D K (rdE K.B (q2 + 1) e 12)
          let need := rem' + msumL D labs' i - scap D i
          if 1 ≤ need && wout D u' true i l < need then q2 + 13 else 0
      else
        let len := rdE K.B q2 e 24
        if len == 0 then
          (if stEqN D K (rdE K.B (q2 + 24) e 8) (d + 1) l labs' u' then q2 + 32 else 0)
        else if ih (d + 1) l labs' u' (q2 + 24) (min e (q2 + 24 + len)) then q2 + 24 + len else 0

/-- the children loop over `cnt` labels from `l`, reading at `q` -/
def kids (D : IPD) (K : Blk) (ih : Nat → Nat → Array Nat → Array Nat → Nat → Nat → Bool)
    (d : Nat) (labs u : Array Nat) (e : Nat) : Nat → Nat → Nat → Bool
  | 0, _, _ => true
  | cnt + 1, l, q =>
    let q' := kidStep D K ih d labs u e l q
    q' != 0 && kids D K ih d labs u e cnt (l + 1) q'

/-- the cut condition (kinds 0-3) -/
@[inline] def cutOK (D : IPD) (K : Blk) (kind cut cj rem : Nat) (labs u' : Array Nat) (hd : Bool) (du : Dual)
    (RS : Nat) : Bool :=
  if kind == 0 then D.N ≤ cut
  else if kind == 1 then
    let i := gix D K cj
    let need := rem + msumL D labs i - scap D i
    1 ≤ need && wout D u' true i cut < need
  else if kind == 2 then wout D u' false 0 cut < rem
  else hd && du.BC + deficit D u' du cut < RS

/-- a branch node (tag 2 or 3) whose header starts at `p` -/
@[inline] def branch (D : IPD) (K : Blk) (ih : Nat → Nat → Array Nat → Array Nat → Nat → Nat → Bool)
    (d pos : Nat) (labs u : Array Nat) (p e : Nat) : Bool :=
  let rem := D.R - d
  let cut := rdE K.B p e D.lb
  let kind := rdE K.B (p + D.lb) e 2
  let cj := rdE K.B (p + D.lb + 2) e 12
  let q0 := if kind == 1 then p + D.lb + 14 else p + D.lb + 2
  let hd := rdE K.B q0 e 1 == 1
  let q1 := q0 + 1
  let top := if D.N ≤ cut then D.N else cut
  if hd then
    let k := rdE K.B q1 e 6
    let du := rdual D K e k (q1 + 6) Dual.empty
    let q2 := q1 + 6 + 48 * k
    let RS := rem * SC + dotD D labs du
    let B0 := du.BC + deficit D u du pos
    let nf := rdE K.B q2 e D.lb
    RS ≤ B0 &&
      match fixesGo D K e (B0 - RS) du nf (q2 + D.lb) u with
      | none => false
      | some u' =>
        cutOK D K kind cut cj rem labs u' true du RS && kids D K ih d labs u' e (top - pos) pos (q2 + D.lb + (D.lb + 3) * nf)
  else
    cutOK D K kind cut cj rem labs u false Dual.empty (rem * SC) && kids D K ih d labs u e (top - pos) pos q1

/-- the node checker with `fuel` levels: state `(d, pos, labs, u)`, stream window `[p, e)` -/
def node (D : IPD) (K : Blk) : Nat → Nat → Nat → Array Nat → Array Nat → Nat → Nat → Bool
  | 0, _, _, _, _, _, _ => false
  | fuel + 1, d, pos, labs, u, p, e =>
    let tag := rdE K.B p e 2
    if tag == 0 then D.R - d == 0 && D.leaf labs K.B (p + 2) e
    else if D.R - d == 0 then false
    else if tag == 1 then
      let du := rdual D K e (rdE K.B (p + 2) e 6) (p + 8) Dual.empty
      du.BC + deficit D u du pos < (D.R - d) * SC + dotD D labs du
    else branch D K (node D K fuel) d pos labs u (p + 2) e

/-! ## Blocks -/

/-- `m x ≤ ub x` for the labels `x < nl` from `x` (`n` labels) -/
def leUbGo (D : IPD) (m : Array Nat) : Nat → Nat → Bool
  | 0, _ => true
  | n + 1, x => m.getD x 0 ≤ D.ub.getD x 0 && leUbGo D m n (x + 1)

/-- the start budgets of a mode-0 block: label caps minus the prefix (`none` if a multiplicity exceeds its cap) -/
def startU (D : IPD) (labs : Array Nat) : Option (Array Nat) :=
  match countGo D.nl id labs labs.size 0 (Array.replicate D.nl 0) with
  | none => none
  | some m => if leUbGo D m D.nl 0 then some (Array.ofFn (n := D.nl) fun x => D.ub.getD x 0 - m.getD x 0) else none

/-- a block (the kernel checker's stream format; see `hcls/E1P/Check.lean`) -/
def block (D : IPD) (B : ByteArray) : Bool :=
  let e := 8 * B.size
  let mode := rdE B 0 e 1
  let d := rdE B 1 e 5
  let pos := rdE B 6 e D.lb
  let po := 6 + D.lb
  let labs := Array.ofFn (n := d) fun i => rdE B (po + D.lb * i.1) e D.lb
  let s1 := po + D.lb * d
  let s2 := if mode == 1 then s1 + 3 * D.nl else s1
  let nd := rdE B s2 e 8
  let hs := s2 + 8
  let s3 := hs + D.rw * nd
  let k := rdE B s3 e 12
  let ix := Array.ofFn (n := k) fun j => rdE B (s3 + 12 + D.sib * j.1) e D.sib
  let s4 := s3 + 12 + D.sib * k
  let K : Blk := ⟨B, ix, hs, nd⟩
  D.ok && labs.all (· < D.nl) && d ≤ D.R &&
    if mode == 1 then
      node D K 24 d pos labs (Array.ofFn (n := D.nl) fun x => rdE B (s1 + 3 * x.1) e 3) s4 e
    else
      match startU D labs with
      | none => false
      | some u0 =>
        let n := rdE B s4 e 8
        match satsGo D K labs e n (s4 + 8) (Array.replicate D.mw 0) with
        | none => false
        | some U => node D K 24 d pos labs (zeroU D u0 U) (s4 + 8 + 12 * n) e

end E1N
