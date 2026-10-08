module
public import XT.W8
/-! # XT.Rec: the X part of a node record (core only): types and the byte parser

The X part of a `KD.batchX` node in kx2/kx3's layout (`kinds/py/kx3.py`, loader `kinds/lean/KD/LoadXB.lean`), starting at the item
`|nr|`: `|nr|, nr*, na, aggs, |XL|, XL*, HP, DEFP, nk, kids`, with
* an aggregate in layout `lay`: 0 `x, B, k, pos*k` (B literal), 1 `x, k, pos*k, mask*k` (`KX2_NOB=1`), 2 `x, k, pos*k`;
* a child: `kind, bb, u, Fu, ncr, crpos*ncr, tree`;
* a tree in preorder: leaf `0, ns, (j, d)*ns, fj, fd`; node `1, ns, (j, d)*ns, v, k, left, right`; cut `2, 0`.
Items are `[u64 len][len bytes LE]`; every value is read as the Nat of its bytes (any length), as the kernel loader does.
The parser is total (fuel = bytes left) and unverified: the views (`XTP`) are defined on the parsed `XRec`.  Internally a failed
read is the offset `b.size + 1` (no per-item allocation). -/
@[expose] public section

namespace XT

/-! Byte helpers (verbatim copies of `natB`, `rdU64`, `lowBytes` from native/node/NN/Core.lean, md5 db055d2f; copied so
that the checker modules import only each other) -/

/-- the Nat of the little-endian bytes `[o, o+n)` -/
def natB (b : ByteArray) (o : Nat) : Nat → Nat
  | 0 => 0
  | n + 1 => (b.get! o).toNat + 256 * natB b (o + 1) n

/-- 8 bytes little-endian at `o`; bytes past the end read as 0 -/
def rdU64 (b : ByteArray) (o : Nat) : UInt64 :=
  (b.get! o).toUInt64 ||| (b.get! (o+1)).toUInt64 <<< 8 ||| (b.get! (o+2)).toUInt64 <<< 16 |||
  (b.get! (o+3)).toUInt64 <<< 24 ||| (b.get! (o+4)).toUInt64 <<< 32 ||| (b.get! (o+5)).toUInt64 <<< 40 |||
  (b.get! (o+6)).toUInt64 <<< 48 ||| (b.get! (o+7)).toUInt64 <<< 56

/-- the low `n` bytes of a word (`n ≤ 8`) -/
def lowBytes (x : UInt64) (n : Nat) : UInt64 :=
  if n ≥ 8 then x else x &&& (((1 : UInt64) <<< (8 * n).toUInt64) - 1)

/-- a tree: steps flattened `[j0, d0, j1, d1, ...]` -/
inductive XTN where
  | leaf (sts : Array Nat) (fj fd : Nat)
  | node (sts : Array Nat) (v k : Nat) (l r : XTN)
  | cut
  deriving Inhabited

/-- an aggregate: label, dictionary positions, and (layout 0) its `B` literal as 512 slots or (layout 1) its masks -/
structure XAgg where
  x : Nat
  ps : Array Nat
  B : Array W8
  ms : Array W8
  deriving Inhabited

structure XKid where
  kind : Nat
  bb : Nat
  u : Nat
  Fu : W8
  cr : Array Nat
  t : XTN
  deriving Inhabited

/-- the decoded X part: deficit-table masks `HP` (one slot per entry, bit 511 clear, as `KD.hslot` reads them) and bounds `DEF` -/
structure XRec where
  lay : Nat
  nrows : Array Nat
  aggs : Array XAgg
  XL : Array Nat
  HP : Array W8
  DEF : Array Nat
  kids : Array XKid
  deriving Inhabited

/-- the labels of the children (the node agent's coverage) -/
def kidLabels (x : XRec) : Array Nat := x.kids.map (·.u)

/-- 8 bytes little-endian at `o` (one bounds check; zero bytes past the end) -/
@[inline] def rd64 (b : ByteArray) (o : Nat) : UInt64 :=
  if h : o + 8 ≤ b.size then
    b[o].toUInt64 ||| (b[o + 1].toUInt64 <<< 8) ||| (b[o + 2].toUInt64 <<< 16) ||| (b[o + 3].toUInt64 <<< 24) |||
    (b[o + 4].toUInt64 <<< 32) ||| (b[o + 5].toUInt64 <<< 40) ||| (b[o + 6].toUInt64 <<< 48) ||| (b[o + 7].toUInt64 <<< 56)
  else rdU64 b o

/-- the offset after the item at `o` (`b.size + 1` if it does not fit) -/
@[inline] def itemEnd (b : ByteArray) (o : Nat) : Nat :=
  if o + 8 ≤ b.size then
    (if o + 8 + (rd64 b o).toNat ≤ b.size then o + 8 + (rd64 b o).toNat else b.size + 1)
  else b.size + 1

/-- the value of the item at `o` (the Nat of its bytes) -/
@[inline] def itemVal (b : ByteArray) (o : Nat) : Nat :=
  if (rd64 b o).toNat ≤ 8 then (lowBytes (rd64 b (o + 8)) (rd64 b o).toNat).toNat else natB b (o + 8) (rd64 b o).toNat

/-- word `k` of the payload `[p, p+n)` (zero past `n`) -/
@[inline] def limbP (b : ByteArray) (p n k : Nat) : UInt64 :=
  if 8 * k < n then lowBytes (rd64 b (p + 8 * k)) (n - 8 * k) else 0

/-- 512-bit slot `i` of the payload -/
@[inline] def slotP (b : ByteArray) (p n i : Nat) : W8 :=
  ⟨limbP b p n (8 * i), limbP b p n (8 * i + 1), limbP b p n (8 * i + 2), limbP b p n (8 * i + 3), limbP b p n (8 * i + 4),
   limbP b p n (8 * i + 5), limbP b p n (8 * i + 6), limbP b p n (8 * i + 7)⟩

/-- the payload's bytes from index `s` on are zero -/
def zeroP (b : ByteArray) (p n s : Nat) : Bool := (List.range (n - s)).all fun i => b.get! (p + s + i) == 0

/-- the item at `o` as a mask (at most 512 bits: higher bytes must be zero) -/
@[inline] def maskP (b : ByteArray) (o : Nat) : Option W8 :=
  if (rd64 b o).toNat ≤ 64 || zeroP b (o + 8) (rd64 b o).toNat 64 then some (slotP b (o + 8) (rd64 b o).toNat 0) else none

/-- `k` item values from `o` pushed onto `acc`; the offset after them (`b.size + 1` on failure) -/
def valsP (b : ByteArray) : Nat → Nat → Array Nat → Array Nat × Nat
  | 0, o, acc => (acc, o)
  | k + 1, o, acc =>
    if itemEnd b o ≤ b.size then valsP b k (itemEnd b o) (acc.push (itemVal b o)) else (acc, b.size + 1)

/-- `k` masks (items of at most 512 bits) -/
def masksP (b : ByteArray) : Nat → Nat → Array W8 → Array W8 × Nat
  | 0, o, acc => (acc, o)
  | k + 1, o, acc =>
    if itemEnd b o ≤ b.size then
      match maskP b o with
      | some w => masksP b k (itemEnd b o) (acc.push w)
      | none => (acc, b.size + 1)
    else (acc, b.size + 1)

/-- a counted list of values -/
@[inline] def listP (b : ByteArray) (o : Nat) : Array Nat × Nat :=
  if itemEnd b o ≤ b.size ∧ itemVal b o ≤ b.size then valsP b (itemVal b o) (itemEnd b o) (Array.mkEmpty (itemVal b o))
  else (#[], b.size + 1)

/-- a tree (fuel: an upper bound on the items left) -/
def treeP (b : ByteArray) : Nat → Nat → XTN × Nat
  | 0, _ => (.cut, b.size + 1)
  | fuel + 1, o =>
    if itemEnd b o ≤ b.size ∧ itemEnd b (itemEnd b o) ≤ b.size then
      let tag := itemVal b o
      let o1 := itemEnd b o
      let ns := itemVal b o1
      let o2 := itemEnd b o1
      if tag = 2 then (if ns = 0 then (.cut, o2) else (.cut, b.size + 1))
      else if 2 * ns > b.size then (.cut, b.size + 1)
      else
        let (sts, o3) := valsP b (2 * ns) o2 (Array.mkEmpty (2 * ns))
        if o3 > b.size then (.cut, b.size + 1)
        else if tag = 0 then
          let (f, o4) := valsP b 2 o3 (Array.mkEmpty 2)
          if o4 > b.size then (.cut, b.size + 1) else (.leaf sts f[0]! f[1]!, o4)
        else if tag = 1 then
          let (vk, o4) := valsP b 2 o3 (Array.mkEmpty 2)
          if o4 > b.size then (.cut, b.size + 1) else
          let (l, o5) := treeP b fuel o4
          if o5 > b.size then (.cut, b.size + 1) else
          let (r, o6) := treeP b fuel o5
          if o6 > b.size then (.cut, b.size + 1) else (.node sts vk[0]! vk[1]! l r, o6)
        else (.cut, b.size + 1)
    else (.cut, b.size + 1)

/-- `na` aggregates in layout `lay` -/
def aggsP (lay : Nat) (b : ByteArray) : Nat → Nat → Array XAgg → Array XAgg × Nat
  | 0, o, acc => (acc, o)
  | na + 1, o, acc =>
    if itemEnd b o > b.size then (acc, b.size + 1) else
    let x := itemVal b o
    let o1 := itemEnd b o
    if lay = 0 then
      -- the B literal: 512 slots; bytes past them must be zero (else B ≠ the bxOK formula, which lies below 2^(512·512))
      if itemEnd b o1 > b.size then (acc, b.size + 1) else
      if !((rd64 b o1).toNat ≤ 32768 || zeroP b (o1 + 8) (rd64 b o1).toNat 32768) then (acc, b.size + 1) else
      let B := (Array.range 512).map fun i => slotP b (o1 + 8) (rd64 b o1).toNat i
      let (ps, o3) := listP b (itemEnd b o1)
      if o3 > b.size then (acc, b.size + 1) else
      aggsP lay b na o3 (acc.push { x, ps, B, ms := #[] })
    else
      let (ps, o2) := listP b o1
      if o2 > b.size then (acc, b.size + 1) else
      if lay = 1 then
        let (ms, o3) := masksP b ps.size o2 #[]
        if o3 > b.size then (acc, b.size + 1) else
        aggsP lay b na o3 (acc.push { x, ps, B := #[], ms })
      else aggsP lay b na o2 (acc.push { x, ps, B := #[], ms := #[] })

/-- `nk` children -/
def kidsP (b : ByteArray) : Nat → Nat → Array XKid → Array XKid × Nat
  | 0, o, acc => (acc, o)
  | nk + 1, o, acc =>
    let (h, o1) := valsP b 3 o (Array.mkEmpty 3)
    if o1 > b.size ∨ itemEnd b o1 > b.size then (acc, b.size + 1) else
    let (cr, o3) := listP b (itemEnd b o1)
    if o3 > b.size then (acc, b.size + 1) else
    let (t, o4) := treeP b (b.size - o3) o3
    if o4 > b.size then (acc, b.size + 1) else
    match maskP b o1 with
    | some Fu => kidsP b nk o4 (acc.push { kind := h[0]!, bb := h[1]!, u := h[2]!, Fu, cr, t })
    | none => (acc, b.size + 1)

/-- the X part at byte offset `o` in layout `lay`; returns the record and the offset after it -/
def parse (lay : Nat) (b : ByteArray) (o : Nat) : Option (XRec × Nat) :=
  let (nrows, o1) := listP b o
  if o1 > b.size ∨ itemEnd b o1 > b.size then none else
  let na := itemVal b o1
  if na > b.size then none else
  let (aggs, o3) := aggsP lay b na (itemEnd b o1) (Array.mkEmpty na)
  if o3 > b.size then none else
  let (XL, o4) := listP b o3
  if o4 > b.size ∨ itemEnd b o4 > b.size then none else
  let o5 := itemEnd b o4
  if itemEnd b o5 > b.size then none else
  let o6 := itemEnd b o5
  if itemEnd b o6 > b.size then none else
  let nk := itemVal b o6
  if nk > b.size then none else
  let (kids, o8) := kidsP b nk (itemEnd b o6) (Array.mkEmpty nk)
  if o8 > b.size then none else
  -- deficit table: slot j of HP (bit 511 cleared), byte j of DEFP, for j < |XL|
  let J := XL.size
  let hp := o4 + 8; let hn := (rd64 b o4).toNat
  let HP := (Array.range J).map fun j => let w := slotP b hp hn j; { w with a7 := w.a7 &&& 0x7FFFFFFFFFFFFFFF }
  let dp := o5 + 8; let dn := (rd64 b o5).toNat
  let DEF := (Array.range J).map fun j => if j < dn then (b.get! (dp + j)).toNat else 0
  some ({ lay, nrows, aggs, XL, HP, DEF, kids }, o8)

end XT
