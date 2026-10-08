module
public import R22Port.U_d41d8cd98f00
public import E1P.Tables
public import RT.Defs
public import BranchCheck7
/-! # E1P: the enumeration checker for coset IPs with up to 255 labels (the point IP of class 492)

E1P is E1 (`leaf2/E1/Check.lean`) with every label-sized constant widened. Labels have 8 bits and `N ≤ 255`. Packed
vectors have 256 fields of 256 bits (`ECTP`). Slots have 520 bits and slot-table indices have 19 bits. Delegated
records have 946 bits. Group permutations have 8-bit fields, 2048 bits per element.

Per-IP data are explicit arguments (the soundness proof is generic in them): `R`, `N` (labels `< N ≤ 255`), the IP's
slot table `sl`, the representatives `VT` (9-bit fields), the leaf domain `DOM` and the group `GP` (a function: element
`g < 2048` ↦ its label permutation, 8-bit fields; the point IP's group has 1152 elements).

**Block.**
- Header: `[1] mode`, `[5] d`, `[8] pos`, `d × [8]` prefix labels (ascending); mode 1 adds `255 × [3]` budgets.
- `[8] nd`, then `nd × [946]` delegated child states. Each is `[5] d, [8] pos, d × [8] prefix, 255 × [3] budgets`,
  zero-padded, so `d ≤ 21`.
- `[12] k`, then `k × [19]` slot-table indices: the block's row table.
- Mode 0 only: `[8] n`, then `n × [12]` rows saturated at the start.
- Then the node.

Row table slot `j` (520 bits): `[255]` label mask, `[255]` reversed mask, `[5]` cap. Rows in the stream are `[12]` slots.

**Node.** A `[2]` tag, then:
- 0, leaf: the rest of the node is a v7 leaf certificate.
- 1, kill: `[6] k, k × ([12] row, [36] Y)`.
- 2, branch: `[8] cut, [2] kind, (kind 1: [12] row), [1] hd, (hd: [6] k, k × ([12], [36]), [8] nfix, nfix × ([8] l,
  [3] ν))`.

A branch then has, per label in `[pos, min(cut, N))`, a `[2]` code:
- 0, skip;
- 3, non-canonical, `[11] g` (the group is a function `C.GP : g ↦` packed label permutation, `g < 2048`);
- 1, lookahead-killed child: `[6] n, n × [12], [1] pk, (pk 1: [12] row)`;
- 2, child subtree: `[6] n, n × [12], [24] len, node`. With `len = 0` the child is delegated, and `[8]` gives the
  index of its state in the block header.

The proofs are E1's with the constants changed (`hcls/E1P/`).

**Kernel cost** (DESIGN §31; point job 433, 2,082 st-nodes: 18.4 → ~6.4 ms per st-node).
- `fsum` is `v mod (2^256 - 1)`, not a 65,536-bit multiplication (−27%).
- Each row reference extracts its 520-bit slot once (`slotAt`, shared through the kernel's cache).
- The row table is built by divide and conquer from the index field (`mkRTd`), and the slot table is read through
  `slc P.chunk`, which caches one dispatch per chunk (`chunkL`).
- The emitter puts the most referenced rows at the top of the row table, where a right shift moves least. -/
@[expose] public section
namespace E1P
open ECTP

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)
local macro:35 a:term:36 " ∧ᵇ " b:term:35 : term => `(@Bool.rec (fun _ => Bool) false $b $a)

noncomputable section

@[inline] def rd (k S : Nat) : Nat := Nat.land S (Nat.sub (Nat.shiftLeft 1 k) 1)
@[inline] def sk (k S : Nat) : Nat := Nat.shiftRight S k
@[inline] def FM : Nat := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
@[inline] def M64 : Nat := 0xffffffffffffffff
@[inline] def M255 : Nat := 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
@[inline] def SC : Nat := 1073741824
@[inline] def spread (m : Nat) : Nat := Nat.land (Nat.mul m SPM) REP
@[inline] def fmask (m : Nat) : Nat := Nat.mul (spread m) FM
/-- the sum of the fields: `v mod (2^256 - 1)` (exact while the sum is below `2^256 - 1`; one division by a 4-limb number,
where the field-sum product `v · REP` was a full 65,536-bit multiplication) -/
@[inline] def fsum (v : Nat) : Nat := Nat.mod v FM
@[inline] def dot (vr x : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.mul vr x) 65024) FM
@[inline] def fld (v l : Nat) : Nat := Nat.land (Nat.shiftRight v (Nat.mul 256 l)) FM
@[inline] def hif (lo : Nat) : Nat := Nat.shiftLeft (Nat.shiftRight FMALL (Nat.mul 256 lo)) (Nat.mul 256 lo)
@[inline] def one (l : Nat) : Nat := Nat.shiftLeft 1 (Nat.mul 256 l)
@[inline] def oner (l : Nat) : Nat := Nat.shiftLeft 1 (Nat.mul 256 (Nat.sub 254 l))
@[inline] def deficit (T UFR lo : Nat) : Nat :=
  let D := Nat.sub DSCREP T
  dot UFR (Nat.land (Nat.land D (Nat.mul (Nat.land (Nat.shiftRight D 64) REP) M64)) (hif lo))

@[inline] def MSL : Nat := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
/-- slot `j` of the row table.  The three accessors share it: the kernel caches `slotAt RTb j`, so each row reference
moves the table once, not three times -/
@[inline] def slotAt (RTb j : Nat) : Nat := Nat.land (Nat.shiftRight RTb (Nat.mul 520 j)) MSL
@[inline] def rmask (RTb j : Nat) : Nat := Nat.land (slotAt RTb j) M255
@[inline] def rmaskr (RTb j : Nat) : Nat := Nat.land (Nat.shiftRight (slotAt RTb j) 255) M255
@[inline] def rcap (RTb j : Nat) : Nat := Nat.land (Nat.shiftRight (slotAt RTb j) 510) 31
/-- weight of the budgets at labels `≥ lo` outside the label mask `m` -/
@[inline] def wout (UF m lo : Nat) : Nat := fsum (Nat.land (Nat.land UF (Nat.xor FMALL (fmask m))) (hif lo))

/-! ## The per-operation definitions as macros

The checker's definitions below use these macros, which expand to the `Nat` operations themselves: the kernel then takes no
delta step per operation (−16% kernel time, DESIGN 31.4).  The named definitions above stay for the proofs; each macro is
its definition's body (`rfl` relates the two forms). -/
local macro "rd " k:term:max S:term:max : term => `(Nat.land $S (Nat.sub (Nat.shiftLeft 1 $k) 1))
local macro "sk " k:term:max S:term:max : term => `(Nat.shiftRight $S $k)
local macro "spread " m:term:max : term => `(Nat.land (Nat.mul $m SPM) REP)
local macro "fmask " m:term:max : term => `(Nat.mul (spread $m) FM)
local macro "fsum " v:term:max : term => `(Nat.mod $v FM)
local macro "dot " vr:term:max x:term:max : term => `(Nat.land (Nat.shiftRight (Nat.mul $vr $x) 65024) FM)
local macro "fld " v:term:max l:term:max : term => `(Nat.land (Nat.shiftRight $v (Nat.mul 256 $l)) FM)
local macro "hif " lo:term:max : term => `(Nat.shiftLeft (Nat.shiftRight FMALL (Nat.mul 256 $lo)) (Nat.mul 256 $lo))
local macro "one " l:term:max : term => `(Nat.shiftLeft 1 (Nat.mul 256 $l))
local macro "oner " l:term:max : term => `(Nat.shiftLeft 1 (Nat.mul 256 (Nat.sub 254 $l)))
local macro "deficit " T:term:max UFR:term:max lo:term:max : term =>
  `(dot $UFR (Nat.land (Nat.land (Nat.sub DSCREP $T) (Nat.mul (Nat.land (Nat.shiftRight (Nat.sub DSCREP $T) 64) REP) M64)) (hif $lo)))
local macro "slotAt " RTb:term:max j:term:max : term => `(Nat.land (Nat.shiftRight $RTb (Nat.mul 520 $j)) MSL)
local macro "rmask " RTb:term:max j:term:max : term => `(Nat.land (slotAt $RTb $j) M255)
local macro "rmaskr " RTb:term:max j:term:max : term => `(Nat.land (Nat.shiftRight (slotAt $RTb $j) 255) M255)
local macro "rcap " RTb:term:max j:term:max : term => `(Nat.land (Nat.shiftRight (slotAt $RTb $j) 510) 31)
local macro "wout " UF:term:max m:term:max lo:term:max : term => `(fsum (Nat.land (Nat.land $UF (Nat.xor FMALL (fmask $m))) (hif $lo)))

/-! ## Slots (checked once per IP against the verified row table) -/

/-- labels whose representative has odd `<X, v>` (planes `LB`, 256 bits each) -/
def lpar (LB X : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0
    (fun i acc => cond (Nat.testBit X i) (Nat.xor acc (Nat.land (Nat.shiftRight LB (Nat.mul 256 i)) M255)) acc) 9
/-- label mask of an entry's row: the common kernel of its dual vectors -/
def labM (LB e : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) M255
    (fun j acc => Nat.land acc (Nat.xor M255 (lpar LB (RT.eV e (Nat.add (RT.eD e) j))))) (Nat.sub 9 (RT.eD e))
def slot (LB LBR e : Nat) : Nat :=
  Nat.lor (labM LB e) (Nat.lor (Nat.shiftLeft (labM LBR e) 255) (Nat.shiftLeft (RT.eCap e) 510))
/-- every dual vector of `e` is a functional of the domain, i.e. `E ⊆ U` -/
def dualIn (DOM e : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun j b => b && Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) j))) (Nat.sub 9 (RT.eD e))

/-! ## The block's row table -/

/-- the row table of the `n` slots indexed by `IX` (`n × [19]`), divide and conquer (`h` levels of fuel; out of fuel, a
remaining range of more than one slot gives no slots, which is sound): `O(n log n)` bits moved, where appending slot by slot
moved `O(n²)` -/
def mkRTd (sl : Nat → Nat) (h : Nat) : Nat → Nat → Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat)
    (fun n IX => sel (Nat.beq n 1) (sl (rd 19 IX)) 0)
    (fun _ ih n IX => sel (Nat.ble n 1) (sel (Nat.beq n 1) (sl (rd 19 IX)) 0)
      (Nat.lor (ih (Nat.shiftRight n 1) (rd (Nat.mul 19 (Nat.shiftRight n 1)) IX))
        (Nat.shiftLeft (ih (Nat.sub n (Nat.shiftRight n 1)) (sk (Nat.mul 19 (Nat.shiftRight n 1)) IX))
          (Nat.mul 520 (Nat.shiftRight n 1))))) h
/-- the block's row table from `k` slot indices (`[19]` each) and the rest of the stream -/
def mkRT (sl : Nat → Nat) (k S : Nat) : Nat × Nat := (mkRTd sl 13 k (rd (Nat.mul 19 k) S), sk (Nat.mul 19 k) S)

/-! ## Slot tables in chunks

A slot table loaded by `#rttablew P "file" 64 520` has `P.entry i = (P.chunk (i / 64) >>> 520 (i % 64)) &&& (2^520 - 1)`,
where `P.chunk` dispatches on the 13 bits of the chunk index (13 `Bool.rec` levels, ~70 µs).  The block checker is used
with `sl := slc P.chunk`: `chunkL` passes the chunk index through a literal (`Nat.rec` on it) and makes `ch (succ n)` an
argument of `Nat.add`, so the kernel caches the dispatch per chunk.  The rows of a block cluster in the IP's slot order
(job 433: ~5.5 rows per chunk). -/

/-- chunk `c`, cached by the kernel per chunk (`= ch c`, `chunkL_eq`) -/
def chunkL (ch : Nat → Nat) (c : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) (Nat.add (ch 0) 0) (fun n _ => Nat.add (ch (Nat.succ n)) 0) c
/-- slot `i` of a slot table in chunks of 64 slots of 520 bits -/
def slc (ch : Nat → Nat) (i : Nat) : Nat :=
  Nat.land (Nat.shiftRight (chunkL ch (Nat.shiftRight i 6)) (Nat.mul 520 (Nat.land i 63))) MSL

/-- read a dual of `k` rows (`[12]` slot, `[36] Y`): `(∑ Y cap, T, rest)` -/
def rdual (RTb k S : Nat) : Nat × Nat × Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat × Nat) (fun BC T S => (BC, T, S))
    (fun _ ih BC T S => ih (Nat.add BC (Nat.mul (rd 36 (sk 12 S)) (rcap RTb (rd 12 S))))
      (Nat.add T (Nat.mul (rd 36 (sk 12 S)) (spread (rmask RTb (rd 12 S))))) (sk 48 S)) k 0 0 S

/-- saturation events: `n` slots; each row must be full (`m(U) = cap` for the multiplicity vector `MV`).  Returns
`(ok, ∪ masks, ∪ reversed masks, rest)`; the budgets of all the rows' labels are zeroed at once (`satsZ`), where E1 zeroed
per row (two packed-vector updates per row) -/
def satsM (RTb n MV S : Nat) : Bool × Nat × Nat × Nat :=
  Nat.rec (motive := fun _ => Bool → Nat → Nat → Nat → Bool × Nat × Nat × Nat) (fun ok M MR S => (ok, M, MR, S))
    (fun _ ih ok M MR S =>
      ih (ok ∧ᵇ Nat.beq (fsum (Nat.land MV (fmask (rmask RTb (rd 12 S))))) (rcap RTb (rd 12 S)))
        (Nat.lor M (rmask RTb (rd 12 S))) (Nat.lor MR (rmaskr RTb (rd 12 S))) (sk 12 S)) n true 0 0 S

/-- the budgets after a saturation result `r`: those of the union of the full rows are zeroed -/
def satsZ (UF UFR : Nat) (r : Bool × Nat × Nat × Nat) : Bool × Nat × Nat × Nat :=
  (r.1, Nat.land UF (Nat.xor FMALL (fmask r.2.1)), Nat.land UFR (Nat.xor FMALL (fmask r.2.2.1)), r.2.2.2)

/-- saturation events for the multiplicity vector `MV` on the budgets `UF`, `UFR` -/
def sats (RTb n MV UF UFR S : Nat) : Bool × Nat × Nat × Nat := satsZ UF UFR (satsM RTb n MV S)

/-- budget fixings `(l, ν)` from a node dual: `(ν + 1)(T_l - SC) > gap` and `ν < u_l` -/
def fixes (n T gap UF UFR S : Nat) : Bool × Nat × Nat × Nat :=
  Nat.rec (motive := fun _ => Bool → Nat → Nat → Nat → Bool × Nat × Nat × Nat) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      let l := rd 8 S
      let nu := rd 3 (sk 8 S)
      let u := fld UF l
      let t := fld T l
      ih (ok ∧ᵇ Nat.ble (Nat.succ SC) t ∧ᵇ Nat.ble (Nat.succ nu) u ∧ᵇ Nat.ble (Nat.succ gap) (Nat.mul (Nat.succ nu) (Nat.sub t SC)))
        (Nat.sub UF (Nat.mul (Nat.sub u nu) (one l))) (Nat.sub UFR (Nat.mul (Nat.sub u nu) (oner l))) (sk 11 S)) n true UF UFR S


/-! ## Canonicity witnesses -/

/-- the reversed packing of the image of the multiset with labels `pl` (`m` entries, `[8]` each) under the label
permutation `gp` (8-bit fields) -/
def imgR (gp pl m : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat) (fun acc _ => acc)
    (fun _ ih acc pl => ih (Nat.add acc (oner (Nat.land (Nat.shiftRight gp (Nat.mul 8 (rd 8 pl))) 255))) (sk 8 pl)) m 0 pl

/-! ## Leaves -/

/-- the v7 leaf record of the prefix `pl` (`R` labels) with certificate `cert`: `[6] R`, terms, dom mode `01`, `DOM`, cert -/
def leafRec (R VT DOM pl cert : Nat) : Nat :=
  let terms := Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) (fun acc _ _ => acc)
    (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (rd 8 pl))) 511) (Nat.mul 9 i)))
      (Nat.succ i) (sk 8 pl)) R 0 0 pl
  Nat.lor R (Nat.lor (Nat.shiftLeft terms 6) (Nat.shiftLeft (Nat.lor 1 (Nat.lor (Nat.shiftLeft DOM 2) (Nat.shiftLeft cert 514)))
    (Nat.add 6 (Nat.mul 9 R))))

/-! ## States -/

/-- packed budgets (field `l` at `256 l`) from `255 × [3]` fields -/
def budU (B : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun l U => Nat.add U (Nat.mul (rd 3 (sk (Nat.mul 3 l) B)) (one l))) 255
/-- reversed packed budgets (field `l` at `256 (254 - l)`) -/
def budUR (B : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun l U => Nat.add U (Nat.mul (rd 3 (sk (Nat.mul 3 l) B)) (oner l))) 255
/-- the record `r` (`[5] d, [8] pos, d × [8] prefix, 255 × [3] budgets`) is the state `(d, pos, pl, UF)` -/
def stEq (r d pos pl UF : Nat) : Bool :=
  Nat.beq (rd 5 r) d ∧ᵇ Nat.beq (rd 8 (sk 5 r)) pos ∧ᵇ Nat.beq (rd (Nat.mul 8 d) (sk 13 r)) pl ∧ᵇ
    Nat.beq (budU (sk (Nat.add 13 (Nat.mul 8 d)) r)) UF

structure Ctx where
  R : Nat
  N : Nat
  VT : Nat
  DOM : Nat
  GP : Nat → Nat

/-! ## The node -/

/-- a child with codes 1 (lookahead-killed) or 2 (subtree), after its saturation events `s`
(let-free: the kernel shares repeated subterms through its cache) -/
def kidC12 (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (code d pl MV MVR l : Nat) (ihl : Nat → Nat → Bool) (s : Bool × Nat × Nat × Nat) : Bool :=
  sel (Nat.beq code 1)
    (sel (Nat.beq (rd 1 s.2.2.2) 0)
      (Nat.blt (wout s.2.1 0 l) (Nat.sub C.R (Nat.succ d)) ∧ᵇ ihl (Nat.succ l) (sk 1 s.2.2.2))
      (Nat.ble 1 (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (fsum (Nat.land (Nat.add MV (one l))
          (fmask (rmask RTb (rd 12 (sk 1 s.2.2.2))))))) (rcap RTb (rd 12 (sk 1 s.2.2.2)))) ∧ᵇ
       Nat.blt (wout s.2.1 (rmask RTb (rd 12 (sk 1 s.2.2.2))) l)
         (Nat.sub (Nat.add (Nat.sub C.R (Nat.succ d)) (fsum (Nat.land (Nat.add MV (one l))
          (fmask (rmask RTb (rd 12 (sk 1 s.2.2.2))))))) (rcap RTb (rd 12 (sk 1 s.2.2.2)))) ∧ᵇ
       ihl (Nat.succ l) (sk 13 s.2.2.2)))
    (sel (Nat.beq (rd 24 s.2.2.2) 0)
      (stEq (rd 946 (sk (Nat.mul 946 (rd 8 (sk 24 s.2.2.2))) H)) (Nat.succ d) l
          (Nat.lor pl (Nat.shiftLeft l (Nat.mul 8 d))) s.2.1 ∧ᵇ ihl (Nat.succ l) (sk 32 s.2.2.2))
      (ih (Nat.succ d) l (Nat.lor pl (Nat.shiftLeft l (Nat.mul 8 d))) (Nat.add MV (one l)) (Nat.add MVR (oner l))
          s.2.1 s.2.2.1 (rd (rd 24 s.2.2.2) (sk 24 s.2.2.2)) ∧ᵇ
        ihl (Nat.succ l) (sk (Nat.add 24 (rd 24 s.2.2.2)) s.2.2.2)))

/-- one label of the children loop (`ihl`: the rest of the loop) -/
def kidStep (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (d pl MV MVR UF UFR : Nat) (ihl : Nat → Nat → Bool) (l S : Nat) : Bool :=
  sel (Nat.beq (rd 2 S) 0)
    (Nat.beq (fld UF l) 0 ∧ᵇ ihl (Nat.succ l) (sk 2 S))
    (sel (Nat.beq (rd 2 S) 3)
      (Nat.blt (Nat.add MVR (oner l))
          (imgR (C.GP (rd 11 (sk 2 S))) (Nat.lor pl (Nat.shiftLeft l (Nat.mul 8 d))) (Nat.succ d)) ∧ᵇ
        ihl (Nat.succ l) (sk 11 (sk 2 S)))
      (Nat.ble 1 (fld UF l) ∧ᵇ
        (sats RTb (rd 6 (sk 2 S)) (Nat.add MV (one l)) (Nat.sub UF (one l)) (Nat.sub UFR (oner l)) (sk 6 (sk 2 S))).1 ∧ᵇ
        kidC12 ih C RTb H (rd 2 S) d pl MV MVR l ihl
          (sats RTb (rd 6 (sk 2 S)) (Nat.add MV (one l)) (Nat.sub UF (one l)) (Nat.sub UFR (oner l)) (sk 6 (sk 2 S)))))

/-- the children loop of a branch node over `cnt` labels from `l` -/
def kids (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (cnt d pl MV MVR UF UFR l S : Nat) : Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Bool) (fun _ _ => true)
    (fun _ ihl l S => kidStep ih C RTb H d pl MV MVR UF UFR ihl l S) cnt l S

/-- the cut condition: no completion has all its new labels `≥ cut` -/
def cutOK (C : Ctx) (RTb kind cut cj rem MV UF' : Nat) (hd : Bool) (BC T UFR' RS : Nat) : Bool :=
  sel (Nat.beq kind 0) (Nat.ble C.N cut)
    (sel (Nat.beq kind 1)
      (Nat.ble 1 (Nat.sub (Nat.add rem (fsum (Nat.land MV (fmask (rmask RTb cj))))) (rcap RTb cj)) ∧ᵇ
       Nat.blt (wout UF' (rmask RTb cj) cut) (Nat.sub (Nat.add rem (fsum (Nat.land MV (fmask (rmask RTb cj))))) (rcap RTb cj)))
      (sel (Nat.beq kind 2) (Nat.blt (wout UF' 0 cut) rem)
        (hd ∧ᵇ Nat.blt (Nat.add BC (deficit T UFR' cut)) RS)))

/-- a branch node after its dual `du` (`(∑ Y cap, T, rest)`) and budget fixings `fx` -/
def branchT (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool) (C : Ctx) (RTb H : Nat)
    (d pos pl MV MVR UFR rem cut kind cj : Nat) (hd : Bool) (du : Nat × Nat × Nat) (fx : Bool × Nat × Nat × Nat) : Bool :=
  (@Bool.rec (fun _ => Bool) true
    (Nat.ble (Nat.add (Nat.mul rem SC) (dot MVR du.2.1)) (Nat.add du.1 (deficit du.2.1 UFR pos))) hd) ∧ᵇ fx.1 ∧ᵇ
    cutOK C RTb kind cut cj rem MV fx.2.1 hd du.1 du.2.1 fx.2.2.1 (Nat.add (Nat.mul rem SC) (dot MVR du.2.1)) ∧ᵇ
    kids ih C RTb H (Nat.sub (sel (Nat.ble C.N cut) C.N cut) pos) d pl MV MVR fx.2.1 fx.2.2.1 pos fx.2.2.2

/-- the stream after the branch header up to the dual: `S4` (`cut`, `kind`, optional row, `hd` read) -/
@[inline] def brS4 (S1 : Nat) : Nat := sk 1 (sel (Nat.beq (rd 2 (sk 8 S1)) 1) (sk 12 (sk 10 S1)) (sk 10 S1))
/-- the node dual flag -/
@[inline] def brHd (S1 : Nat) : Bool := Nat.beq (rd 1 (sel (Nat.beq (rd 2 (sk 8 S1)) 1) (sk 12 (sk 10 S1)) (sk 10 S1))) 1
/-- the node dual (or the empty dual) -/
@[inline] def brDu (RTb S1 : Nat) : Nat × Nat × Nat := sel (brHd S1) (rdual RTb (rd 6 (brS4 S1)) (sk 6 (brS4 S1))) (0, 0, brS4 S1)

/-- one node (`ih`: the node checker with one less fuel) -/
def nodeStep (C : Ctx) (RTb H : Nat) (ih : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool)
    (d pos pl MV MVR UF UFR S : Nat) : Bool :=
  sel (Nat.beq (rd 2 S) 0)
    (Nat.beq (Nat.sub C.R d) 0 ∧ᵇ BC7.leafS (leafRec C.R C.VT C.DOM pl (sk 2 S)))
    (Nat.ble 1 (Nat.sub C.R d) ∧ᵇ
      sel (Nat.beq (rd 2 S) 1)
        (Nat.blt (Nat.add (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).1 (deficit (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).2.1 UFR pos))
          (Nat.add (Nat.mul (Nat.sub C.R d) SC) (dot MVR (rdual RTb (rd 6 (sk 2 S)) (sk 6 (sk 2 S))).2.1)))
        (branchT ih C RTb H d pos pl MV MVR UFR (Nat.sub C.R d) (rd 8 (sk 2 S)) (rd 2 (sk 8 (sk 2 S))) (rd 12 (sk 10 (sk 2 S)))
          (brHd (sk 2 S)) (brDu RTb (sk 2 S))
          (sel (brHd (sk 2 S))
            (fixes (rd 8 (brDu RTb (sk 2 S)).2.2) (brDu RTb (sk 2 S)).2.1
              (Nat.sub (Nat.add (brDu RTb (sk 2 S)).1 (deficit (brDu RTb (sk 2 S)).2.1 UFR pos))
                (Nat.add (Nat.mul (Nat.sub C.R d) SC) (dot MVR (brDu RTb (sk 2 S)).2.1)))
              UF UFR (sk 8 (brDu RTb (sk 2 S)).2.2))
            (true, UF, UFR, brS4 (sk 2 S)))))

/-- the node checker with `fuel` levels -/
def node (C : Ctx) (RTb H fuel : Nat) : Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat → Nat → Nat → Nat → Nat → Bool)
    (fun _ _ _ _ _ _ _ _ => false)
    (fun _ ih d pos pl MV MVR UF UFR S => nodeStep C RTb H ih d pos pl MV MVR UF UFR S)
    fuel

/-- the header's delegated states: `(nd, H, rest)` -/
@[inline] def hdr (S : Nat) : Nat × Nat × Nat :=
  (rd 8 S, rd (Nat.mul 946 (rd 8 S)) (sk 8 S), sk (Nat.add 8 (Nat.mul 946 (rd 8 S))) S)

/-- prefix multiplicities `(MV, MVR)` of the `d` labels in `pl` -/
def mvOf (d pl : Nat) : Nat × Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat × Nat) (fun MV MVR _ => (MV, MVR))
    (fun _ ih MV MVR pl => ih (Nat.add MV (one (rd 8 pl))) (Nat.add MVR (oner (rd 8 pl))) (sk 8 pl)) d 0 0 pl

/-! ## Blocks (let-free, with the header fields as small named pieces) -/

/-- the block's depth -/
@[inline] def bD (S : Nat) : Nat := rd 5 (sk 1 S)
/-- the block's prefix labels (`[8]` each) -/
@[inline] def bPl (S : Nat) : Nat := rd (Nat.mul 8 (bD S)) (sk 14 S)
/-- the stream after the prefix -/
@[inline] def bS1 (S : Nat) : Nat := sk (Nat.add 14 (Nat.mul 8 (bD S))) S
/-- the stream after the budgets (mode 1) -/
@[inline] def bS2 (S : Nat) : Nat := sel (Nat.beq (rd 1 S) 1) (sk 765 (bS1 S)) (bS1 S)
/-- the block's row table and the rest of the stream -/
@[inline] def bRT (sl : Nat → Nat) (S : Nat) : Nat × Nat := mkRT sl (rd 12 (hdr (bS2 S)).2.2) (sk 12 (hdr (bS2 S)).2.2)
/-- the start budgets: mode 1 explicit, mode 0 the label caps minus the prefix -/
@[inline] def bUF (UB S : Nat) : Nat := sel (Nat.beq (rd 1 S) 1) (budU (bS1 S)) (Nat.sub UB (mvOf (bD S) (bPl S)).1)
@[inline] def bUFR (UBR S : Nat) : Nat := sel (Nat.beq (rd 1 S) 1) (budUR (bS1 S)) (Nat.sub UBR (mvOf (bD S) (bPl S)).2)
/-- mode 0: the rows saturated at the start -/
@[inline] def bSat (sl : Nat → Nat) (UB UBR S : Nat) : Bool × Nat × Nat × Nat :=
  sel (Nat.beq (rd 1 S) 0)
    (sats (bRT sl S).1 (rd 8 (bRT sl S).2) (mvOf (bD S) (bPl S)).1 (bUF UB S) (bUFR UBR S) (sk 8 (bRT sl S).2))
    (true, bUF UB S, bUFR UBR S, (bRT sl S).2)

/-- a block (see the module docstring) -/
def block (C : Ctx) (sl : Nat → Nat) (UB UBR S : Nat) : Bool :=
  (bSat sl UB UBR S).1 ∧ᵇ Nat.ble (bD S) C.R ∧ᵇ
    node C (bRT sl S).1 (hdr (bS2 S)).2.1 24 (bD S) (rd 8 (sk 6 S)) (bPl S) (mvOf (bD S) (bPl S)).1 (mvOf (bD S) (bPl S)).2
      (bSat sl UB UBR S).2.1 (bSat sl UB UBR S).2.2.1 (bSat sl UB UBR S).2.2.2

/-- the block `Sc` starts (mode 1) in the state recorded as `r` -/
def glue (r Sc : Nat) : Bool :=
  Nat.beq (rd 1 Sc) 1 ∧ᵇ Nat.beq (rd (Nat.add 778 (Nat.mul 8 (rd 5 r))) (sk 1 Sc)) r

/-- the block `Sc` is a mode-0 block (a search job: budgets from the label caps) with the prefix recorded as `r`
(depth, position, labels); the recorded budgets are not needed -/
def glue0 (r Sc : Nat) : Bool :=
  Nat.beq (rd 1 Sc) 0 ∧ᵇ Nat.beq (rd (Nat.add 13 (Nat.mul 8 (rd 5 r))) (sk 1 Sc)) (rd (Nat.add 13 (Nat.mul 8 (rd 5 r))) r)

end
end E1P
