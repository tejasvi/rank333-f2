module
public import NN.Core
/-! # NN.Node: the native L1 v5 node step of `KD.batchX` (core only)

One call `nodeStep st tab fr nd` does, on machine words, what `KD.batchX'` does for one node before the X part:
* the dictionary (`foldR` over the five id lists): its rows are table rows, cited by id (`ids`, in dictionary order:
  V, R1, R2, X1, X2, each list reversed as `foldR` packs it); `cap ≥ r`; list lengths as the header claims;
* `node5`: header fields, prefix test, depth, the two hyperplane guards (parity only: the soundness proof does not use them),
  `blocks` (every row's popcount on the child prefix is `cap - r`, for L1's rows and the extras alike), the dead mask
  `D' = D ∪ N[last] ∪ (V rows)`, the conflict table `N' = N ∪ c2t[last]`, the counters `U' = U + h[last]`, the T/C kills;
* it returns the child frame and the dictionary ids; `mkDict` builds the X tier's limb dictionary when the node has an X part.
The checks are per row / per kill instead of `node5`'s SWAR blocks; `NNP.Node` proves that an accepted step gives
`node5_spec`'s conclusions (and `KD.batchX`'s dictionary facts) directly from the semantic lemmas of `L5` / `KD`. -/
@[expose] public section

namespace NN

/-- the static tables (built once per process): `c2t[l]` (4096 limbs) = `L1.T.c2t_l`, `conf1` = `L1.T.CONF1T`,
`h[l]` / `suf[l]` = the unpacked 7-bit fields of `L1.T.h_l` / `L1.T.suf_l`, `rk3[X] = 3 rk X` (guards only) -/
structure Statics where
  c2t : Array (Array UInt64)
  conf1 : Array UInt64
  h : Array ByteArray
  suf : Array ByteArray
  rk3 : ByteArray

/-- a frame of L1's stack: prefix `S` and dead mask `D` (8 limbs), conflict table `N` (4096 limbs), counters `U` (512 fields),
depth `d` -/
structure Frame where
  S : Array UInt64
  D : Array UInt64
  N : Array UInt64
  U : ByteArray
  d : Nat

/-- the per-job row table: entry `i` has label mask `rows[8i ..< 8i+8]` (bit 511 clear), cap `caps[i]`, RT row id `ids[i]` -/
structure Tab where
  rows : Array UInt64
  caps : Array Nat
  ids : Array Nat

/-- a node record (L1 part): label, header, the five id lists in item order (R2, R1, V, X2, X1), the kill records (limbs) -/
structure NodeRec where
  lab : Nat
  hdr : Nat
  r2 : Array Nat
  r1 : Array Nat
  r0 : Array Nat
  x2 : Array Nat
  x1 : Array Nat
  ks : Array (Array UInt64)

/-! ## Word helpers -/

/-- the mask of bits `[lo, 511)` inside limb `k` (bits `64k ..< 64k+64`) -/
def aboveW (lo k : Nat) : UInt64 :=
  let a := 64 * k
  let hiM : UInt64 := if k = 7 then 0x7FFFFFFFFFFFFFFF else 0xFFFFFFFFFFFFFFFF
  if lo ≤ a then hiM
  else if lo ≥ a + 64 then 0
  else hiM &&& ((0xFFFFFFFFFFFFFFFF : UInt64) <<< (lo - a).toUInt64)

/-- the mask of bits `≥ lo` inside limb `k` -/
def fromW (lo k : Nat) : UInt64 :=
  if lo ≤ 64 * k then 0xFFFFFFFFFFFFFFFF
  else if lo ≥ 64 * k + 64 then 0 else (0xFFFFFFFFFFFFFFFF : UInt64) <<< (lo - 64 * k).toUInt64

/-- true iff limbs `[0, 8)` have no bit at or above `lo` -/
def noBitsFrom (a : Array UInt64) (lo : Nat) : Bool :=
  allN (fun k => (a.getD k 0) &&& fromW lo k == 0) 8

/-- `S ||| 2^l` on 8 limbs -/
def setBit8 (S : Array UInt64) (l : Nat) : Array UInt64 :=
  (Array.range 8).map fun k => if k = l / 64 then (S.getD k 0) ||| ((1 : UInt64) <<< (l % 64).toUInt64) else (S.getD k 0)

/-! ## Table rows and the dictionary -/

/-- limb `k` of the table row of id `i` (0 past the table) -/
@[inline] def tW (tab : Tab) (i k : Nat) : UInt64 := if 8 * i + 8 ≤ tab.rows.size then tab.rows.getD (8 * i + k) 0 else 0

/-- cap of id `i` (0 past the table) -/
@[inline] def capOf (tab : Tab) (i : Nat) : Nat := tab.caps.getD i 0

/-- popcount of (row of id `i`) ∩ `S'` (limbs where `S'` is zero are skipped without reading the row) -/
def popRowS (tab : Tab) (S' : Array UInt64) (i : Nat) : Nat :=
  sumN (fun k => let s := S'.getD k 0; if s == 0 then 0 else pop64 (tW tab i k &&& s)) 8

/-- every id of the list: `cap ≥ r` and popcount(row ∩ S') = cap - r -/
def rowsOK (tab : Tab) (S' : Array UInt64) (r : Nat) (ids : Array Nat) : Bool :=
  allN (fun j => let i := ids.getD j 0; let c := capOf tab i; r ≤ c && popRowS tab S' i == c - r) ids.size

/-- the dictionary ids: V, R1, R2, X1, X2, each list reversed -/
def dictIds (nd : NodeRec) : Array Nat :=
  nd.r0.reverse ++ nd.r1.reverse ++ nd.r2.reverse ++ nd.x1.reverse ++ nd.x2.reverse

/-- limb `k` of dictionary row `p` if `p < lim` (else 0) -/
@[inline] def dW (tab : Tab) (ids : Array Nat) (lim p k : Nat) : UInt64 := if p < lim then tW tab (ids.getD p 0) k else 0

/-- the X tier's limb dictionary (8 limbs per row) -/
def mkDict (tab : Tab) (ids : Array Nat) : Array UInt64 :=
  (Array.range (8 * ids.size)).map fun j => tW tab (ids.getD (j / 8) 0) (j % 8)

/-! ## The kills -/

/-- one kill record `kr` (limbs) at the node: window start `w0`, child dead mask `D'`, child conflict table `N'`, the counts
`nV`, `n1`, `m` of L1's rows, `nu = 21 - d` -/
def killOK (tab : Tab) (ids : Array Nat) (D' N' : Array UInt64) (w0 nV n1 m nu : Nat) (kr : Array UInt64) : Bool :=
  let u := fieldL kr 0 0 9
  let nX := fieldL kr 0 9 5
  let nC := fieldL kr 0 14 5
  let ix := fun (i : Nat) => fieldL kr 0 (19 + 10 * i) 10
  let uq := u / 64
  let us := (u % 64).toUInt64
  -- exclusion rows: R1 rows (index < n1), each must contain u
  let exOK := allN (fun i => let e := ix i; e < n1 && (dW tab ids m (nV + e) uq >>> us) &&& 1 == 1) nX
  -- cover rows: index into R1 ∪ R2, side test on u
  let cvOK := allN (fun i => let c := ix (nX + i);
    (dW tab ids m (nV + c) uq >>> us) &&& 1 == (if c < n1 then 0 else 1)) nC
  let yW := fun (k : Nat) =>
    let x1 := aboveW (u + 1) k &&& ~~~(D'.getD k 0) &&& ~~~(N'.getD (8 * u + k) 0)
    let z := orN (fun i => let e := ix i; if e < n1 then dW tab ids m (nV + e) k else 0) nX |||
      orN (fun i => dW tab ids m (nV + ix (nX + i)) k) nC
    x1 &&& ~~~z
  w0 ≤ u && u < 511 && exOK && cvOK && sumFrom (fun k => pop64 (yW k)) ((u + 1) / 64) 8 + nC < nu

/-! ## The counters -/

/-- `U' = U + h` field by field -/
def addU (U h : ByteArray) : ByteArray :=
  ByteArray.mk ((Array.range 512).map fun X => U.get! X + h.get! X)

/-- no field of `U + h` reaches 128 -/
def addUOK (U h : ByteArray) : Bool := allN (fun X => (U.get! X).toNat + (h.get! X).toNat < 128) 512

/-- the two hyperplane guards of `node5` (parity only), on the unpacked counters -/
def guardsOK (U' suf rk3 : ByteArray) (d : Nat) : Bool :=
  allN (fun X =>
    let u := (U'.get! X).toNat
    let r := (rk3.get! X).toNat
    let g1 := u + (22 - d) + 64 - r
    let g2 := u + (suf.get! X).toNat + 64 - r
    64 ≤ g1 && g1 < 128 && 64 ≤ g2 && g2 < 128 && r ≤ 64) 512

/-! ## The node step -/

/-- the header fields -/
def hLast (hdr : Nat) : Nat := (hdr >>> 8) % 512
def hD (hdr : Nat) : Nat := (hdr >>> 17) % 32
def hNV (hdr : Nat) : Nat := (hdr >>> 22) % 1024
def hN1 (hdr : Nat) : Nat := (hdr >>> 32) % 1024
def hN2 (hdr : Nat) : Nat := (hdr >>> 52) % 1024

/-- the result of an accepted step: child frame, dictionary ids, `b1 = nV + n1`, `m`, `e1 = m + |x1|` -/
structure StepOut where
  fr : Frame
  ids : Array Nat
  b1 : Nat
  m : Nat
  e1 : Nat

/-- the header and shape checks of a node on its frame -/
def headOK (fr : Frame) (nd : NodeRec) : Bool :=
  let hdr := nd.hdr
  let last := hLast hdr
  nd.lab == last && last < 511 && (hdr >>> 42) % 1024 == 0 && nd.r0.size == hNV hdr && nd.r1.size == hN1 hdr &&
    nd.r2.size == hN2 hdr && hD hdr == fr.d + 1 && noBitsFrom fr.S last && fr.S.size == 8 && fr.D.size == 8 &&
    fr.N.size == 4096 && fr.U.size == 512 && nd.ks.size ≤ 512

/-- **one node** (L1 part) on the frame `fr` -/
def nodeStep (st : Statics) (tab : Tab) (fr : Frame) (nd : NodeRec) : Option StepOut :=
  let hdr := nd.hdr
  let last := hLast hdr
  let d := hD hdr
  let nV := hNV hdr
  let n1 := hN1 hdr
  let n2 := hN2 hdr
  let m := nV + n1 + n2
  if !(headOK fr nd) then none else
  let S' := setBit8 fr.S last
  if !(rowsOK tab S' 0 nd.r0 && rowsOK tab S' 1 nd.r1 && rowsOK tab S' 2 nd.r2 && rowsOK tab S' 1 nd.x1 &&
      rowsOK tab S' 2 nd.x2) then none else
  let ids := dictIds nd
  -- the child frame
  let D' := (Array.range 8).map fun k => (fr.D.getD k 0) ||| (fr.N.getD (8 * last + k) 0) ||| orN (fun p => dW tab ids nV p k) nV
  let c2 := st.c2t.getD last #[]
  let N' := (Array.range 4096).map fun k => (fr.N.getD k 0) ||| (c2.getD k 0)
  let h := st.h.getD last ByteArray.empty
  if !(addUOK fr.U h) then none else
  let U' := addU fr.U h
  if !(guardsOK U' (st.suf.getD last ByteArray.empty) st.rk3 d) then none else
  if !(nd.ks.all (killOK tab ids D' N' (last + 1) nV n1 m (21 - d))) then none else
  some { fr := { S := S', D := D', N := N', U := U', d := d }, ids := ids, b1 := nV + n1, m := m, e1 := m + nd.x1.size }

end NN

namespace NN

/-! ## Static tables from Nat constants (once per process) -/

/-- the low `k` limbs of `n` (divide and conquer: `O(size · log size)` bignum work), as a list -/
def limbsN : Nat → Nat → List UInt64
  | 0, _ => []
  | 1, n => [n.toUInt64]
  | k + 2, n =>
    let h := (k + 2) / 2
    limbsN h (n % 2 ^ (64 * h)) ++ limbsN (k + 2 - h) (n >>> (64 * h))
termination_by k => k
decreasing_by all_goals omega

/-- `limbsN` with the low half cut by a mask (bignum `and`) instead of a division: half the time (511 cap-2 tables: 1.2 s →
0.6 s); the compiler uses it for `limbsN` (`limbsN_csimp`) -/
def limbsNF : Nat → Nat → List UInt64
  | 0, _ => []
  | 1, n => [n.toUInt64]
  | k + 2, n =>
    let h := (k + 2) / 2
    limbsNF h (n &&& (2 ^ (64 * h) - 1)) ++ limbsNF (k + 2 - h) (n >>> (64 * h))
termination_by k => k
decreasing_by all_goals omega

theorem limbsN_eq_limbsNF : ∀ k n, limbsN k n = limbsNF k n
  | 0, _ => by simp only [limbsN, limbsNF]
  | 1, n => by simp only [limbsN, limbsNF]
  | k + 2, n => by
    simp only [limbsN, limbsNF]
    rw [Nat.and_two_pow_sub_one_eq_mod, limbsN_eq_limbsNF ((k + 2) / 2), limbsN_eq_limbsNF (k + 2 - (k + 2) / 2)]
termination_by k => k
decreasing_by all_goals omega

@[csimp] theorem limbsN_csimp : @limbsN = @limbsNF := by
  funext k n; exact limbsN_eq_limbsNF k n

/-- the low `k` limbs of `n` as an array -/
def limbsOfNat (n k : Nat) : Array UInt64 := (limbsN k n).toArray

/-- the 512 7-bit fields of a packed counter Nat -/
def unpack7N (n : Nat) : ByteArray :=
  let l := limbsOfNat n 56
  ByteArray.mk ((Array.range 512).map fun X => (fieldL l 0 (7 * X) 7).toUInt8)

/-- the statics from the Nat constants `L1.T.c2t_l`, `L1.T.CONF1T`, `L1.T.h_l`, `L1.T.suf_l` (and `3 rk X`, guards only) -/
def buildStatics (c2tN : Array Nat) (conf1N : Nat) (hN sufN : Array Nat) (rk3 : ByteArray) : Statics where
  c2t := c2tN.map fun n => limbsOfNat n 4096
  conf1 := limbsOfNat conf1N 4096
  h := hN.map unpack7N
  suf := sufN.map unpack7N
  rk3 := rk3

/-- the size facts the views need: every table below `2^(64·4096)`, every counter vector below `2^3584` -/
def staticsOK (c2tN : Array Nat) (conf1N : Nat) (hN sufN : Array Nat) : Bool :=
  c2tN.size == 511 && hN.size == 511 && sufN.size == 511 && c2tN.all (fun n => n >>> 262144 == 0) &&
    conf1N >>> 262144 == 0 && hN.all (fun n => n >>> 3584 == 0) && sufN.all (fun n => n >>> 3584 == 0)

end NN
