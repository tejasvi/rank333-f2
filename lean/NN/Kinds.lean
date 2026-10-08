module
public import NN.Node
/-! # NN.Kinds: the kinds records of an OPEN node, natively (core only)

On the node's child frame `(S', D', N', U', d')` (prefix including the node's label `last`), for each child record `u > last`:
* **PREFF** `(u, X)`: with `h` = hits of `S'` on `X` (`U'[X]`), `pb` = `par(vec u ∧ X)`, `r = 3 rk X`: `h + pb < r` and either
  `h + pb + (21 - d') < r` or fewer than `r - h - pb` labels above `u` hit `X` (`KD321.preffOKO`'s test);
* **DOOM** `u`: the child's rank-1 window test (`KD321.doomOKO` with the rank-1 labels `0..48` of `--rord 123`);
* **TYPE** `u`: every first-factor type reachable from `S' ∪ {u}` fails `KD.typeOK` (`KD.tyOK`; labels are rank-ordered);
* **CANON** `(u, ty, g)`: `g = (t, P, Q)` (`t << 18 | P << 9 | Q`) with `P`, `Q` invertible maps `T = S' ∪ {u}` to a lex-smaller set:
  the least label `m` of `g(T) \ T` is below 511 and every label of `T` below `m` is in `g(T)` (`C3.LexLt` in label order);
* **suffix break**: every `u ≥ u0` with fewer than `21 - d'` available labels above `u0` (`KD.sufOK`).
The static tables (`KStatics`): label codes `vec`, odd-pairing masks `np` (built from `vec`), `3 rk X` (`rk3`), the code → label map
`inv` (checked against `vec` by `invOK`) and the invertible matrices `gl`. -/
@[expose] public section

namespace NN

/-- the case configuration: rank-1 window `[lo, hi]` (`CaseK lo hi`), rank-1 labels `[r1lo, r1hi)` of the label order, TYPE
records allowed (`--typecut`; their check assumes the ranks of `--rord 123`) -/
structure Cfg where
  lo : Nat
  hi : Nat
  r1lo : Nat
  r1hi : Nat
  ty : Bool
  deriving Inhabited

/-- the kinds records' static tables -/
structure KStatics where
  vec : Array Nat
  np : Array (Array UInt64)
  rk3 : ByteArray
  inv : Array Nat
  gl : ByteArray

/-- parity of the low `k` bits -/
def parBits (x : Nat) : Nat → Bool
  | 0 => false
  | k + 1 => xor (parBits x k) (x.testBit k)

/-- parity of a 9-bit code -/
@[inline] def parN (x : Nat) : Bool := parBits x 9

/-- popcount of `m` on `[lo, hi)` (8 limbs) -/
def popIn (m : Array UInt64) (lo hi : Nat) : Nat :=
  sumN (fun k => pop64 (m.getD k 0 &&& fromW lo k &&& ~~~(fromW hi k))) 8

/-- limb `k` of the available labels: below 511 and not in `D` -/
@[inline] def availW (D : Array UInt64) (k : Nat) : UInt64 := ~~~(D.getD k 0) &&& aboveW 0 k

/-- the number of available labels in `[lo, hi)` -/
def availIn (D : Array UInt64) (lo hi : Nat) : Nat :=
  sumN (fun k => pop64 (availW D k &&& fromW lo k &&& ~~~(fromW hi k))) 8

/-! ## Statics -/

/-- the odd-pairing mask of `X` (8 limbs): labels `l < 511` with `par(vec l ∧ X)` -/
def npOf (vec : Array Nat) (X : Nat) : Array UInt64 :=
  (Array.range 8).map fun k =>
    (List.range 64).foldl (fun (w : UInt64) j =>
      let l := 64 * k + j
      if l < 511 && parN (vec.getD l 0 &&& X) then w ||| ((1 : UInt64) <<< j.toUInt64) else w) 0

/-- the code → label map of `vec` (511 for codes without a label) -/
def invOf (vec : Array Nat) : Array Nat :=
  (List.range 511).foldl (fun (a : Array Nat) l => a.set! (vec.getD l 0) l) (Array.replicate 512 511)

/-- `inv` inverts `vec` on the nonzero codes, and code 0 has no label -/
def invOK (vec inv : Array Nat) : Bool :=
  allN (fun c => if c == 0 then inv.getD 0 511 == 511 else (inv.getD c 511 < 511 && vec.getD (inv.getD c 511) 0 == c)) 512

/-- build the kinds statics from the label codes, the `3 rk` table and the invertible-matrix table -/
def buildK (vec : Array Nat) (rk3 gl : ByteArray) : KStatics :=
  { vec, np := (Array.range 512).map (npOf vec), rk3, inv := invOf vec, gl }

/-! ## PREFF, DOOM, TYPE -/

/-- PREFF `(u, X)` on the child frame (counters `U`, `d` prefix labels) -/
def preffN (ks : KStatics) (U : ByteArray) (d u X : Nat) : Bool :=
  let h := (U.get! X).toNat
  let pb := if parN (ks.vec.getD u 0 &&& X) then 1 else 0
  let r := (ks.rk3.get! X).toNat
  decide (0 < X) && decide (X < 512) && decide (h + pb < r) &&
    (decide (h + pb + (21 - d) < r) || decide (popIn (ks.np.getD X #[]) (u + 1) 512 + (h + pb) + 1 ≤ r))

/-- the window test: `r` rank-1 labels so far, `ra` / `rb` available rank-1 / other labels, `n` labels to come -/
def winTestN (r ra rb n lo hi : Nat) : Bool :=
  decide (r + min ra n < lo) || decide (hi < r) || decide (rb + min ra (hi - r) < n)

/-- DOOM `u` (the child's rank-1 window `[c.lo, c.hi]`; rank-1 labels `[c.r1lo, c.r1hi)`) -/
def doomN (S D : Array UInt64) (d u : Nat) (c : Cfg) : Bool :=
  let ra := availIn D (max (u + 1) c.r1lo) c.r1hi
  winTestN (popIn S c.r1lo c.r1hi + (if c.r1lo ≤ u ∧ u < c.r1hi then 1 else 0)) ra (availIn D (u + 1) 511 - ra) (21 - d) c.lo c.hi

/-- node cut 7: the cut node's own rank-1 window, on its frame (`d` labels, top `last`) -/
def winN (S D : Array UInt64) (d last : Nat) (c : Cfg) : Bool :=
  let ra := availIn D (max (last + 1) c.r1lo) c.r1hi
  decide (d ≤ 22) && winTestN (popIn S c.r1lo c.r1hi) ra (availIn D (last + 1) 511 - ra) (22 - d) c.lo c.hi

/-- `KD.typeOK31` -/
def typeOK31N (n1 n2 n3 : Nat) : Bool :=
  !(Nat.beq (n1 + n2 + n3) 22) || (Nat.ble 7 (n2 + 2 * n3) || (Nat.beq n2 6 && Nat.beq n3 0))

/-- `KD.typeOK` (= `typeOK95`) -/
def typeOKN (n1 n2 n3 : Nat) : Bool :=
  typeOK31N n1 n2 n3 && !(Nat.beq n2 3 && Nat.beq n3 2 && Nat.beq n1 17) && !(Nat.beq n2 1 && Nat.beq n3 3 && Nat.beq n1 18)

/-- TYPE `u` (ranks of `--rord 123`: `0..48`, `49..342`, `343..510`) -/
def tyN (S : Array UInt64) (d u : Nat) : Bool :=
  let c1 := popIn S 0 49 + (if u < 49 then 1 else 0)
  let c2 := popIn S 49 343 + (if 49 ≤ u && u < 343 then 1 else 0)
  let c3 := popIn S 343 511 + (if 343 ≤ u then 1 else 0)
  let nd := 21 - d
  allN (fun y => allN (fun x => !typeOKN (c1 + y) (c2 + x) (c3 + (nd - y - x)))
    (if u < 343 then nd - y + 1 else 1)) (if u < 49 then nd + 1 else 1)

/-! ## CANON -/

/-- `C3.mulF` -/
def mulFN (u v : Nat) : Nat :=
  Nat.xor (Nat.xor (Nat.mul (Nat.land u 73) (Nat.land v 7))
    (Nat.mul (Nat.land (Nat.shiftRight u 1) 73) (Nat.land (Nat.shiftRight v 3) 7)))
    (Nat.mul (Nat.land (Nat.shiftRight u 2) 73) (Nat.land (Nat.shiftRight v 6) 7))

/-- `C3.trN` -/
def trNN (v : Nat) : Nat :=
  Nat.lor (Nat.lor (Nat.lor (Nat.lor (Nat.land v 273) (Nat.shiftLeft (Nat.land v 34) 2))
    (Nat.shiftRight (Nat.land v 136) 2)) (Nat.shiftLeft (Nat.land v 4) 4)) (Nat.shiftRight (Nat.land v 64) 4)

/-- `C3.actN` -/
def actNN (t : Bool) (P Q v : Nat) : Nat := mulFN (mulFN P (cond t (trNN v) v)) Q

/-- bit `l` of an 8-limb mask -/
@[inline] def bit8 (m : Array UInt64) (l : Nat) : Bool := (m.getD (l / 64) 0 >>> (l % 64).toUInt64) &&& 1 == 1

/-- the image labels of the labels of `T` under `(t, P, Q)` -/
def imgL (ks : KStatics) (t : Bool) (P Q : Nat) (T : Array UInt64) : Array UInt64 :=
  (List.range 511).foldl (fun I l =>
    if bit8 T l then setBit8 I (ks.inv.getD (actNN t P Q (ks.vec.getD l 0)) 511) else I) #[0, 0, 0, 0, 0, 0, 0, 0]

/-- the least label of a nonempty 8-limb mask (512 if empty) -/
def lowL (m : Array UInt64) : Nat := (List.range 512).foldr (fun l acc => if bit8 m l then l else acc) 512

/-- `LexLt` in label order for label sets `I`, `T`: the least `m ∈ I \ T` is below 511 and `T ∩ [0, m) ⊆ I` -/
def lexLtN (I T : Array UInt64) : Bool :=
  let Dm := (Array.range 8).map fun k => I.getD k 0 &&& ~~~(T.getD k 0)
  let m := lowL Dm
  decide (m < 511) && allN (fun k => (T.getD k 0 &&& ~~~(fromW m k) &&& ~~~(I.getD k 0)) == 0) 8

/-- CANON `(u, ty, g)` on the child frame's prefix `S` -/
def canonN (ks : KStatics) (S : Array UInt64) (u g : Nat) : Bool :=
  let t := g >>> 18
  let P := (g >>> 9) % 512
  let Q := g % 512
  let T := setBit8 S u
  (ks.gl.get! P) == 1 && (ks.gl.get! Q) == 1 && lexLtN (imgL ks (t != 0) P Q T) T

/-! ## The suffix break -/

/-- the least `u0 > last` such that every label `≥ u0` has fewer than `nn` available labels above it (511 if none) -/
def sufStart (D : Array UInt64) (last nn : Nat) : Nat := Id.run do
  let mut c := 0
  let mut u := 510
  let mut res := 511
  for _ in [0:511] do
    if u ≤ last || c ≥ nn then break
    res := u
    if (availW D (u / 64) >>> (u % 64).toUInt64) &&& 1 == 1 then c := c + 1
    u := u - 1
  return res

/-- the children after the suffix break (8 limbs): `[u0, 511)`, verified at `u0` -/
def sufMask (D : Array UInt64) (last nn : Nat) : Array UInt64 :=
  let u0 := sufStart D last nn
  if decide (last < u0) && decide (u0 < 511) && decide (availIn D (u0 + 1) 511 < nn) then
    (Array.range 8).map fun k => fromW u0 k &&& aboveW 0 k
  else #[0, 0, 0, 0, 0, 0, 0, 0]

end NN
