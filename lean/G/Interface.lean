module
public import R22Port.U_d8545239ed21
public import Mathlib.Data.Matrix.Basic
public import Mathlib.Data.ZMod.Basic
/-! # Interface between the Gram-state checkers (r22/thm4/gram) and the Dec22 bridge

This file fixes ONE encoding of Gram states.  The checkers prove the `NoFamily*` statements below; the bridge proves that a
22-term decomposition of a forbidden type yields a family as in those statements (after normalizing one term to an anchor
representative).  Everything here is plain `Nat` bit-encoding so that the checkers evaluate it in the kernel.

## Encodings
* A 3x3 matrix over F2 is a `Nat < 512`: bit `3i+j` is entry `(i, j)`.  First factors `a`, second factors `B`
  (`B[j][k]` = bit `3j+k`) and third factors `C` (`C[k][i]` = bit `3k+i`) all use this.
* A vector of F2^3 is a `Nat < 8`: bit `i` is entry `i`.
* `fac a`: a fixed rank factorization `a = ∑_{q < rk a} Lc a q ⊗ Rc a q` (outer products, bit `3i+j` = `L[i] R[j]`) with
  `Lc a q`, `Rc a q` (`q < rk a`) linearly independent (`fac_ok`).  This is `a_t = L_t R_t^T` of the split flattening.
* A state at excess `d` (`State`): first factor `a`, second and third factors `B`, `C`, and the dirt rows of `U_t` and
  `V_t` (`r × d`, `r = rk a`): row `q` is bits `[d q, d q + d)` of `U` (resp. `V`), each row a vector of F2^d (bit `x`
  = entry `x`).
* `gram t s al be` is entry `(al, be)` of `G_ts = R_t^T B_s C_t L_s` (`R_t` = the `Rc` columns of `t.a`, `L_s` = the `Lc`
  columns of `s.a`), computed as the parity of `yvec (Rc t.a al) t.C &&& xvec s.B (Lc s.a be)`, where
  `yvec R C` has bit `9j+3k+i` = `R[j] C[k][i]` and `xvec B L` has bit `9j+3k+i` = `B[j][k] L[i]`.
* `dirt d t s al be` = `U_t[al] · V_s[be]` (dot product over F2).

## The local excess-d system
`Valid d s`: `G_ss = I + U_s V_s^T`.  `Compat d t s`: distinct first factors and `G_ts = U_t V_s^T`, `G_st = U_s V_t^T`.
A *family* is a list of valid, pairwise compatible states.  For a 22-term decomposition with `∑ rank a_t = 27 + d`, the
22 terms (with `U, V` from `Π = I + G = U V^T`, `V^T U = I_d`) form a family (that is the bridge's lemma).

## Anchors
* invertible anchors: `a = 273` (the identity), `d ∈ {1, 2}`; representatives `reps d`; the stabilizer action `act3`
  (`g, h ∈ GL3`, `γ ∈ GL_d`): `(B, C, U, V) ↦ (g B h⁻¹, h C g⁻¹, g U γ, g⁻ᵀ V γ⁻ᵀ`);
* rank-2 anchors at `d = 0`: `a = 17` (diag(1,1,0)); representatives `reps0`; the action `act2` of `(P, Q, h)` with
  `P 17 Q⁻¹ = 17`: `(B, C) ↦ (Q B h⁻¹, h C P⁻¹)` (`U = V = 0` at `d = 0`).
-/
@[expose] public section
namespace G

/-! ### bit helpers -/
def bitN (x i : Nat) : Bool := Nat.testBit x i
/-- parity of the lowest `n` bits -/
def parN : Nat → Nat → Bool
  | 0, _ => false
  | n+1, x => xor (x % 2 == 1) (parN n (x / 2))

/-! ### the factorization table -/
def FACT : Nat := 0x381d0001f0c60001e8c60001e0c60001d8c60001d0c60001c8c6000038190001b8560001f08e000fac47000fa447000f9c47000f9447000188d60001f08a00017856000f74470001e88e000f6447000f5c47000150d6000f4c470001e88a00013856000f3447000f2c470001e08e000118d6000f1447000f0c470001e08a0000f856000ef447000eec470000e0d60001d88e000ed447000ecc470001d88a0000b856000eb4470000a8d6000ea447000e9c470001d08e000e8c470001d08a00007856000070d6000e6c47000e6447000e5c47000e54470001c88e0001c88a000038150001f0860001e8860001e0860001d8860001d0860001c886000038110001b88e0001f056000dec47000de447000ddc47000dd4470001c8d60001b88a0001b8c60000301d0001a8c60001a0c6000198c6000190c6000188c600003019000d7c47000170560001a88e000d6447000158d6000d5447000d4c470001a88a000d3c4700013056000d2c470001a08e000d1c47000110d6000d0c470001a08a000cfc470000f0560000e8d6000ce4470001988e000cd447000ccc470001988a000cbc470000b056000cac470000a0d6000c9c470001908e000c8c470001908a000078d600007056000c6c47000c6447000c5c47000c54470001888e0001888a0001b886000030150001a8860001a086000198860001908600018886000030110001788e000bf4470001e856000be447000bdc470001d0d6000bcc470001788a000bbc470001708e0001a856000ba447000198d6000b9447000b8c470001708a000178c6000170c60000281d000160c6000158c6000150c6000148c600002819000b3c47000b3447000128560001608e000b1c47000b1447000108d60001608a000afc470000f0d60000e856000ae4470001588e000ad447000acc470001588a0000b8d6000ab4470000a856000aa447000a9c470001508e000a8c470001508a000a7c47000a744700006856000060d6000a5c47000a54470001488e0001488a00017886000170860000281500016086000158860001508600014886000028110001388e0009f4470009ec470001e0560001d8d60009d4470009cc470001388a0009bc470001308e0009ac470001a05600099c47000190d600098c470001308a00097c47000974470001288e0001605600095c4700095447000148d60001288a000138c6000130c6000128c60000201d000118c6000110c6000108c6000020190000f8d60008f4470008ec470000e0560001188e0008d4470008cc470001188a0008bc470000b0d60008ac470000a05600089c470001108e00088c470001108a00087c4700087447000068d60000605600085c47000854470001088e0001088a00013886000130860001288600002015000118860001108600010886000020110000f88e0007f4470007ec470001e0d60001d8560007d4470007cc470000f88a0007bc470000f08e0001a8d60007a447000198560007944700078c470000f08a00077c47000170d60000e88e00076447000158560007544700074c470000e88a000138d60007344700072c470000e08e000118560007144700070c470000e08a0000f8c60000f0c60000e8c60000e0c60000181d0000d0c60000c8c6000018190006bc470006b4470006ac470006a447000098560000d08e000088d60000d08a00067c470006744700066c470006644700005856000050d60000c88e0000c88a0000f8860000f0860000e8860000e086000018150000d0860000c886000018110000b88e0005f4470001e8d60005e4470005dc470001d0560005cc470000b88a0005bc470000b08e0005ac470001a0d600059c470001905600058c470000b08a000178d6000574470000a88e0005644700055c470001505600054c470000a88a00053c47000130d600052c470000a08e00051c470001105600050c470000a08a0004fc470004f4470004ec470004e4470000988e0000d0560000c8d60000988a0000b8c60000b0c60000a8c60000a0c6000098c60000101d000088c60000101900047c470004744700046c4700046447000058d6000050560000888e0000888a0000b8860000b0860000a8860000a086000098860000101500008886000010110000788e0001f0d60003ec470003e4470003dc470003d4470001c8560000788a0001b8d60000708e0003ac470003a44700039c4700039447000188560000708a00037c47000374470000688e000160d600035c4700035447000148560000688a00033c4700033447000128d60000608e00031c4700031447000108560000608a0002fc470002f4470002ec470002e4470000588e0000d0d60000c8560000588a0002bc470002b4470002ac470002a447000098d60000508e000088560000508a000078c6000070c6000068c6000060c6000058c6000050c60000081d0000081900007886000070860000688600006086000058860000508600000815000008110000380d0001f0460001e8460001e0460001d8460001d0460001c846000038090001b8460000300d0001a8460001a0460001984600019046000188460000300900017846000170460000280d00016046000158460001504600014846000028090001384600013046000128460000200d000118460001104600010846000020090000f8460000f0460000e8460000e0460000180d0000d0460000c846000018090000b8460000b0460000a8460000a046000098460000100d00008846000010090000784600007046000068460000604600005846000050460000080d000008090000380500003005000028050000200500001805000010050000080500000000
/-- packed `r | L0 << 2 | L1 << 5 | L2 << 8 | R0 << 11 | R1 << 14 | R2 << 17` -/
def fac (a : Nat) : Nat := (FACT >>> (32 * a)) % 2 ^ 32
def rk (a : Nat) : Nat := fac a % 4
def Lc (a q : Nat) : Nat := (fac a >>> (2 + 3 * q)) % 8
def Rc (a q : Nat) : Nat := (fac a >>> (11 + 3 * q)) % 8
/-- outer product of two vectors: bit `3i+j` = `l[i] r[j]` -/
def outer (l r : Nat) : Nat :=
  (List.range 9).foldl (fun acc p => if bitN l (p / 3) && bitN r (p % 3) then acc ||| (1 <<< p) else acc) 0
/-- `∑_{q < n} Lc a q ⊗ Rc a q` -/
def facSum (a : Nat) : Nat → Nat
  | 0 => 0
  | q+1 => facSum a q ^^^ outer (Lc a q) (Rc a q)
/-- vectors `v q`, `q < n`, linearly independent over F2 (no nonempty subset xors to 0) -/
def indepN (v : Nat → Nat) (n : Nat) : Bool :=
  (List.range (2 ^ n)).all fun S => S == 0 ||
    ((List.range n).foldl (fun acc q => if bitN S q then acc ^^^ v q else acc) 0) != 0

/-! ### states and the Gram system -/
structure State where
  a : Nat
  B : Nat
  C : Nat
  U : Nat
  V : Nat
deriving DecidableEq, Repr

def yvec (R C : Nat) : Nat :=
  (List.range 27).foldl (fun acc p => if bitN R (p / 9) && bitN C (p % 9) then acc ||| (1 <<< p) else acc) 0
def xvec (B L : Nat) : Nat :=
  (List.range 27).foldl (fun acc p => if bitN B (p / 3) && bitN L (p % 3) then acc ||| (1 <<< p) else acc) 0

def row (d W q : Nat) : Nat := (W >>> (d * q)) % 2 ^ d

/-- entry `(al, be)` of `G_ts = R_t^T B_s C_t L_s` -/
def gram (t s : State) (al be : Nat) : Bool := parN 27 (yvec (Rc t.a al) t.C &&& xvec s.B (Lc s.a be))
/-- `U_t[al] · V_s[be]` -/
def dirt (d : Nat) (t s : State) (al be : Nat) : Bool := parN d (row d t.U al &&& row d s.V be)

def Valid (d : Nat) (s : State) : Prop :=
  0 < s.a ∧ s.a < 512 ∧ s.B < 512 ∧ s.C < 512 ∧ s.U < 2 ^ (d * rk s.a) ∧ s.V < 2 ^ (d * rk s.a) ∧
  ∀ al < rk s.a, ∀ be < rk s.a, gram s s al be = xor (al == be) (dirt d s s al be)

def Compat (d : Nat) (t s : State) : Prop :=
  t.a ≠ s.a ∧
  (∀ al < rk t.a, ∀ be < rk s.a, gram t s al be = dirt d t s al be) ∧
  (∀ al < rk s.a, ∀ be < rk t.a, gram s t al be = dirt d s t al be)

/-- a family: valid states, pairwise compatible -/
def Family (d : Nat) (F : List State) : Prop := (∀ s ∈ F, Valid d s) ∧ F.Pairwise (Compat d)

/-- number of members whose first factor has rank `r` -/
def count (r : Nat) (F : List State) : Nat := (F.filter fun s => rk s.a == r).length

/-! ### 3x3 and dxd matrices over F2 -/
def rowOf (M i : Nat) : Nat := (M >>> (3 * i)) % 8
/-- `v^T N` for a row vector `v`: xor of the rows `k` of `N` with `v[k] = 1` -/
def vecMul3 (v N : Nat) : Nat := (List.range 3).foldl (fun acc k => if bitN v k then acc ^^^ rowOf N k else acc) 0
def mul3 (M N : Nat) : Nat := vecMul3 (rowOf M 0) N ||| (vecMul3 (rowOf M 1) N <<< 3) ||| (vecMul3 (rowOf M 2) N <<< 6)
def tr3 (M : Nat) : Nat :=
  (List.range 9).foldl (fun acc p => if bitN M (3 * (p % 3) + p / 3) then acc ||| (1 <<< p) else acc) 0
def I3 : Nat := 273
/-- the inverse (`0` if singular) -/
def inv3 (M : Nat) : Nat := ((List.range 512).find? fun X => mul3 M X == I3).getD 0
def GL3 (M : Nat) : Prop := M < 512 ∧ mul3 M (inv3 M) = I3

/-- d x d matrices: bit `d x + y` = entry `(x, y)` -/
def rowD (d M x : Nat) : Nat := (M >>> (d * x)) % 2 ^ d
def vecMulD (d v M : Nat) : Nat := (List.range d).foldl (fun acc x => if bitN v x then acc ^^^ rowD d M x else acc) 0
def mulD (d M N : Nat) : Nat := (List.range d).foldl (fun acc x => acc ||| (vecMulD d (rowD d M x) N <<< (d * x))) 0
def trD (d M : Nat) : Nat :=
  (List.range (d * d)).foldl (fun acc p => if bitN M (d * (p % d) + p / d) then acc ||| (1 <<< p) else acc) 0
def ID (d : Nat) : Nat := (List.range d).foldl (fun acc x => acc ||| (1 <<< (d * x + x))) 0
def invD (d M : Nat) : Nat := ((List.range (2 ^ (d * d))).find? fun X => mulD d M X == ID d).getD 0
def GLd (d M : Nat) : Prop := M < 2 ^ (d * d) ∧ mulD d M (invD d M) = ID d

/-- `M W γ` for a 3 x d matrix `W` (rows packed as in `State.U`) -/
def xformRows (d M γ W : Nat) : Nat :=
  let Wg := (List.range 3).foldl (fun acc q => acc ||| (vecMulD d (row d W q) γ <<< (d * q))) 0
  (List.range 3).foldl (fun acc i =>
    acc ||| (((List.range 3).foldl (fun r j => if bitN (rowOf M i) j then r ^^^ row d Wg j else r) 0) <<< (d * i))) 0

/-! ### anchors and their symmetry actions -/
/-- the stabilizer action on invertible anchor states (`a = I3`) -/
def act3 (d g h γ : Nat) (s : State) : State :=
  ⟨I3, mul3 (mul3 g s.B) (inv3 h), mul3 (mul3 h s.C) (inv3 g),
    xformRows d g γ s.U, xformRows d (tr3 (inv3 g)) (trD d (invD d γ)) s.V⟩

/-- the action on rank-2 anchor states (`a = 17`) at `d = 0`, for `(P, Q)` with `P 17 Q⁻¹ = 17` -/
def act2 (P Q h : Nat) (s : State) : State :=
  ⟨17, mul3 (mul3 Q s.B) (inv3 h), mul3 (mul3 h s.C) (inv3 P), 0, 0⟩

/-- invertible anchor representatives at `d = 1` (7) and `d = 2` (36), from orb0d.py / orb0dg.py -/
def reps1 : List State := [
  ⟨273, 84, 84, 0, 0⟩,
  ⟨273, 84, 84, 0, 1⟩,
  ⟨273, 84, 84, 1, 0⟩,
  ⟨273, 80, 20, 1, 1⟩,
  ⟨273, 80, 84, 1, 1⟩,
  ⟨273, 84, 20, 1, 1⟩,
  ⟨273, 84, 212, 1, 2⟩]
def reps2 : List State := [
  ⟨273, 84, 84, 0, 0⟩,
  ⟨273, 84, 84, 0, 1⟩,
  ⟨273, 84, 84, 0, 6⟩,
  ⟨273, 84, 84, 1, 0⟩,
  ⟨273, 80, 20, 1, 1⟩,
  ⟨273, 80, 84, 1, 1⟩,
  ⟨273, 84, 20, 1, 1⟩,
  ⟨273, 84, 84, 1, 2⟩,
  ⟨273, 84, 212, 1, 4⟩,
  ⟨273, 84, 212, 1, 6⟩,
  ⟨273, 82, 20, 1, 7⟩,
  ⟨273, 82, 84, 1, 7⟩,
  ⟨273, 84, 148, 1, 7⟩,
  ⟨273, 84, 84, 1, 8⟩,
  ⟨273, 84, 340, 1, 24⟩,
  ⟨273, 84, 84, 6, 0⟩,
  ⟨273, 84, 92, 6, 1⟩,
  ⟨273, 80, 20, 6, 2⟩,
  ⟨273, 80, 84, 6, 2⟩,
  ⟨273, 84, 20, 6, 2⟩,
  ⟨273, 64, 4, 6, 6⟩,
  ⟨273, 64, 12, 6, 6⟩,
  ⟨273, 64, 84, 6, 6⟩,
  ⟨273, 66, 4, 6, 6⟩,
  ⟨273, 66, 68, 6, 6⟩,
  ⟨273, 66, 132, 6, 6⟩,
  ⟨273, 84, 4, 6, 6⟩,
  ⟨273, 80, 12, 6, 7⟩,
  ⟨273, 80, 140, 6, 7⟩,
  ⟨273, 84, 12, 6, 7⟩,
  ⟨273, 84, 156, 6, 11⟩,
  ⟨273, 84, 116, 6, 16⟩,
  ⟨273, 80, 52, 6, 18⟩,
  ⟨273, 80, 116, 6, 18⟩,
  ⟨273, 84, 52, 6, 18⟩,
  ⟨273, 84, 244, 6, 24⟩]
def reps (d : Nat) : List State := if d = 1 then reps1 else if d = 2 then reps2 else []
/-- rank-2 anchor representatives at `d = 0` (orbmap.build(0)) -/
def reps0 : List State := [⟨17, 10, 10, 0, 0⟩, ⟨17, 10, 106, 0, 0⟩, ⟨17, 84, 80, 0, 0⟩, ⟨17, 84, 84, 0, 0⟩]

/-! ### Statements proved by the checkers (names fixed; proofs in the checker modules) -/

/-- the factorization table is a rank factorization of every nonzero 3x3 matrix -/
def FacOK : Prop := ∀ a, 0 < a → a < 512 →
  facSum a (rk a) = a ∧ 0 < rk a ∧ rk a ≤ 3 ∧ indepN (Lc a) (rk a) = true ∧ indepN (Rc a) (rk a) = true ∧
  (∀ q < rk a, Lc a q < 8 ∧ Rc a q < 8)

/-- orbit completeness for invertible anchors -/
def OrbitComplete3 (d : Nat) : Prop := ∀ s : State, s.a = I3 → Valid d s →
  ∃ g h γ, GL3 g ∧ GL3 h ∧ GLd d γ ∧ act3 d g h γ s ∈ reps d

/-- orbit completeness for rank-2 anchors at d = 0 -/
def OrbitComplete2 : Prop := ∀ s : State, s.a = 17 → Valid 0 s →
  ∃ P Q h, GL3 P ∧ GL3 Q ∧ GL3 h ∧ mul3 (mul3 P 17) (inv3 Q) = 17 ∧ act2 P Q h s ∈ reps0

/-- no family with the anchor `t0` and at least `n1, n2, n3` further members of ranks 1, 2, 3 -/
def NoFamily (d : Nat) (t0 : State) (n1 n2 n3 : Nat) : Prop :=
  ¬ ∃ F : List State, Family d (t0 :: F) ∧ n1 ≤ count 1 F ∧ n2 ≤ count 2 F ∧ n3 ≤ count 3 F

/-- (17,3,2): Delta = 2, anchor = one of the two invertible terms -/
def NoFam_17_3_2 : Prop := ∀ t0 ∈ reps 2, NoFamily 2 t0 17 3 1
/-- (18,1,3): Delta = 2 -/
def NoFam_18_1_3 : Prop := ∀ t0 ∈ reps 2, NoFamily 2 t0 18 1 2
/-- (17,4,1): Delta = 1 -/
def NoFam_17_4_1 : Prop := ∀ t0 ∈ reps 1, NoFamily 1 t0 17 4 0
/-- (18,2,2) (Lemma S22): Delta = 1 -/
def NoFam_18_2_2 : Prop := ∀ t0 ∈ reps 1, NoFamily 1 t0 18 2 1
/-- (19,0,3) (Lemma S3): Delta = 1 -/
def NoFam_19_0_3 : Prop := ∀ t0 ∈ reps 1, NoFamily 1 t0 19 0 2
/-- (17,5,0): Delta = 0, anchor = a rank-2 term -/
def NoFam_17_5_0 : Prop := ∀ t0 ∈ reps0, NoFamily 0 t0 17 4 0

end G
