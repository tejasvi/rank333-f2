module
public import R22Port.U_d41d8cd98f00
public import RootSound.Bits
public import C3.Tab
public import C3.Lex
/-! # prof7's symmetry group on 9-bit first factors, in kernel-cheap `Nat` arithmetic

`g = (t, P, Q)` acts by `v ↦ P · (t ? vᵀ : v) · Q` (cpp/common.h `build_group`): 2 · 168² = 56,448 elements.
* `mulF u v` is the matrix product: column `k` of `u` (bits `k, k+3, k+6`, i.e. `(u >>> k) &&& 73`) times row `k` of `v`
  (`(v >>> 3k) &&& 7`).  Each product has disjoint 3-bit groups, so there are no carries.
* `toM3_mulF`, `toM3_trN`: the encoding is multiplicative and transposes; `toM3` is injective below 512 (`toM3_inj`).
* `Gset`, the maps `actN t P Q` with `P, Q` invertible (`GLM`), is finite, nonempty and closed under composition below 512.
* `labK`: prof7's label order (`--rord 123`) as an injective key. -/
@[expose] public section
namespace C3
open RootSound Matrix

/-! ## Primitives (direct `Nat` calls for the kernel; the `_eq` lemmas restate them with notation) -/

/-- field `i` (9 bits) of `S` -/
def fld9 (S i : Nat) : Nat := Nat.land (Nat.shiftRight S (Nat.mul 9 i)) 511

def mulF (u v : Nat) : Nat :=
  Nat.xor (Nat.xor (Nat.mul (Nat.land u 73) (Nat.land v 7))
    (Nat.mul (Nat.land (Nat.shiftRight u 1) 73) (Nat.land (Nat.shiftRight v 3) 7)))
    (Nat.mul (Nat.land (Nat.shiftRight u 2) 73) (Nat.land (Nat.shiftRight v 6) 7))

/-- the transpose: bits `0, 4, 8` stay, `1 ↔ 3`, `2 ↔ 6`, `5 ↔ 7` -/
def trN (v : Nat) : Nat :=
  Nat.lor (Nat.lor (Nat.lor (Nat.lor (Nat.land v 273) (Nat.shiftLeft (Nat.land v 34) 2))
    (Nat.shiftRight (Nat.land v 136) 2)) (Nat.shiftLeft (Nat.land v 4) 4)) (Nat.shiftRight (Nat.land v 64) 4)

/-- the group element `(t, P, Q)`: `v ↦ P (t ? vᵀ : v) Q` -/
def actN (t : Bool) (P Q v : Nat) : Nat := mulF (mulF P (cond t (trN v) v)) Q

def isGL (P : Nat) : Bool := Nat.testBit GLM P
def invN (P : Nat) : Nat := fld9 INVT P
def labN (v : Nat) : Nat := fld9 LABT v
def vecN (k : Nat) : Nat := fld9 VECT k
/-- prof7's label order as an injective key on `ℕ` (`labK_inj`); below 512 it is `labN` (`labK_lt`) -/
def labK (v : Nat) : Nat := labN (v % 512) + 512 * (v / 512)

/-- the group `G` -/
def Gset : Set (ℕ → ℕ) := {g | ∃ t P Q, isGL P = true ∧ isGL Q = true ∧ g = actN t P Q}

theorem fld9_eq (S i : Nat) : fld9 S i = (S >>> (9 * i)) &&& 511 := rfl
theorem fld9_lt (S i : Nat) : fld9 S i < 512 := Nat.lt_succ_of_le Nat.and_le_right

theorem mulF_eq (u v : Nat) : mulF u v = ((u &&& 73) * (v &&& 7)) ^^^ (((u >>> 1) &&& 73) * ((v >>> 3) &&& 7)) ^^^
    (((u >>> 2) &&& 73) * ((v >>> 6) &&& 7)) := rfl
theorem trN_eq (v : Nat) : trN v = (v &&& 273) ||| ((v &&& 34) <<< 2) ||| ((v &&& 136) >>> 2) ||| ((v &&& 4) <<< 4) |||
    ((v &&& 64) >>> 4) := rfl

/-! ## The encoding is a homomorphism -/

theorem spr_mul_all : ∀ a < 74, ∀ b < 8, a &&& 73 = a → ∀ i < 3, ∀ j < 3,
    (a * b).testBit (3 * i + j) = (a.testBit (3 * i) && b.testBit j) := by decide +kernel

theorem prod_lt (x y : Nat) : (x &&& 73) * (y &&& 7) < 2 ^ 9 := by
  have h1 : x &&& 73 ≤ 73 := Nat.and_le_right
  have h2 : y &&& 7 ≤ 7 := Nat.and_le_right
  calc (x &&& 73) * (y &&& 7) ≤ 73 * 7 := Nat.mul_le_mul h1 h2
    _ < 2 ^ 9 := by norm_num

theorem prod_testBit (x y i j : Nat) (hi : i < 3) (hj : j < 3) :
    ((x &&& 73) * (y &&& 7)).testBit (3 * i + j) = (x.testBit (3 * i) && y.testBit j) := by
  have h1 : x &&& 73 < 74 := Nat.lt_succ_of_le Nat.and_le_right
  have h2 : (x &&& 73) &&& 73 = x &&& 73 := by rw [Nat.and_assoc, Nat.and_self]
  have h3 : y &&& 7 < 8 := Nat.lt_succ_of_le Nat.and_le_right
  rw [spr_mul_all _ h1 _ h3 h2 i hi j hj, Nat.testBit_and, Nat.testBit_and]
  have e1 : Nat.testBit 73 (3 * i) = true := by interval_cases i <;> decide
  have e2 : Nat.testBit 7 j = true := by interval_cases j <;> decide
  rw [e1, e2, Bool.and_true, Bool.and_true]

theorem mulF_lt (u v : Nat) : mulF u v < 512 := by
  rw [mulF_eq]
  exact Nat.xor_lt_two_pow (Nat.xor_lt_two_pow (prod_lt _ _) (prod_lt _ _)) (prod_lt _ _)

theorem mulF_testBit (u v i j : Nat) (hi : i < 3) (hj : j < 3) :
    (mulF u v).testBit (3 * i + j) = ((u.testBit (3 * i) && v.testBit j) ^^ (u.testBit (3 * i + 1) && v.testBit (3 + j)) ^^
      (u.testBit (3 * i + 2) && v.testBit (6 + j))) := by
  rw [mulF_eq, Nat.testBit_xor, Nat.testBit_xor, prod_testBit _ _ _ _ hi hj, prod_testBit _ _ _ _ hi hj,
    prod_testBit _ _ _ _ hi hj, Nat.testBit_shiftRight, Nat.testBit_shiftRight, Nat.testBit_shiftRight,
    Nat.testBit_shiftRight, show 1 + 3 * i = 3 * i + 1 by omega, show 2 + 3 * i = 3 * i + 2 by omega]

def b2 (x : Bool) : F2 := if x then 1 else 0
theorem b2_xor (x y : Bool) : b2 (x ^^ y) = b2 x + b2 y := by cases x <;> cases y <;> decide
theorem b2_and (x y : Bool) : b2 (x && y) = b2 x * b2 y := by cases x <;> cases y <;> decide
theorem bitF_b2 (v i : Nat) : bitF v i = b2 (v.testBit i) := rfl

theorem toM3_mulF (u v : Nat) : toM3 (mulF u v) = toM3 u * toM3 v := by
  ext i j
  have hi := i.isLt
  have hj := j.isLt
  rw [Matrix.mul_apply, Fin.sum_univ_three]
  simp only [toM3, bitF_b2]
  rw [mulF_testBit u v i.val j.val hi hj, b2_xor, b2_xor, b2_and, b2_and, b2_and]
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, Nat.add_zero, Nat.mul_zero, Nat.zero_add, Nat.mul_one]

theorem trN_testBit (v i j : Nat) (hi : i < 3) (hj : j < 3) : (trN v).testBit (3 * i + j) = v.testBit (3 * j + i) := by
  rw [trN_eq]
  interval_cases i <;> interval_cases j <;>
    simp only [Nat.testBit_or, Nat.testBit_and, Nat.testBit_shiftLeft, Nat.testBit_shiftRight] <;> simp [Nat.testBit]

theorem toM3_trN (v : Nat) : toM3 (trN v) = (toM3 v)ᵀ := by
  ext i j
  simp only [toM3, Matrix.transpose_apply, bitF_b2]
  rw [trN_testBit v i.val j.val i.isLt j.isLt]

theorem toM3_inj {u v : Nat} (hu : u < 512) (hv : v < 512) (h : toM3 u = toM3 v) : u = v := by
  apply Nat.eq_of_testBit_eq
  intro p
  by_cases hp : p < 9
  · have e := congrFun (congrFun h ⟨p / 3, by omega⟩) ⟨p % 3, by omega⟩
    simp only [toM3, bitF_b2] at e
    rw [show 3 * (p / 3) + p % 3 = p by omega] at e
    cases hu' : u.testBit p <;> cases hv' : v.testBit p <;> rw [hu', hv'] at e <;> first | rfl | exact absurd e (by decide)
  · have h512 : 512 ≤ 2 ^ p := by
      calc 512 = 2 ^ 9 := by norm_num
        _ ≤ 2 ^ p := Nat.pow_le_pow_right (by norm_num) (by omega)
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hu h512), Nat.testBit_lt_two_pow (lt_of_lt_of_le hv h512)]

theorem toM3_273 : toM3 273 = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> decide

theorem actN_lt (t : Bool) (P Q v : Nat) : actN t P Q v < 512 := mulF_lt _ _

theorem toM3_actN (t : Bool) (P Q v : Nat) :
    toM3 (actN t P Q v) = toM3 P * (cond t (toM3 v)ᵀ (toM3 v)) * toM3 Q := by
  cases t
  · rw [actN, cond_false, cond_false, toM3_mulF, toM3_mulF]
  · rw [actN, cond_true, cond_true, toM3_mulF, toM3_mulF, toM3_trN]

/-! ## `GL3(F2)` facts, checked by the kernel -/

theorem gl_facts : ∀ P < 512, isGL P = true →
    (mulF P (invN P) = 273 ∧ mulF (invN P) P = 273 ∧ isGL (trN P) = true) := by decide +kernel

theorem gl_mul_all : ∀ P < 512, isGL P = true → ∀ Q < 512, isGL Q = true → isGL (mulF P Q) = true := by
  decide +kernel

theorem GLM_lt : GLM < 2 ^ 512 := by decide +kernel

theorem isGL_lt {P : Nat} (h : isGL P = true) : P < 512 := by
  by_contra hc
  have h1 : 2 ^ 512 ≤ 2 ^ P := Nat.pow_le_pow_right (by norm_num) (by omega)
  have : Nat.testBit GLM P = false := Nat.testBit_lt_two_pow (lt_of_lt_of_le GLM_lt h1)
  rw [isGL, this] at h
  exact absurd h (by decide)

theorem isGL_273 : isGL 273 = true := by decide +kernel

theorem gl_inv {P : Nat} (h : isGL P = true) : toM3 P * toM3 (invN P) = 1 ∧ toM3 (invN P) * toM3 P = 1 := by
  obtain ⟨h1, h2, -⟩ := gl_facts P (isGL_lt h) h
  rw [← toM3_mulF, ← toM3_mulF, h1, h2, toM3_273]
  exact ⟨rfl, rfl⟩

theorem gl_mul {P Q : Nat} (hP : isGL P = true) (hQ : isGL Q = true) : isGL (mulF P Q) = true :=
  gl_mul_all P (isGL_lt hP) hP Q (isGL_lt hQ) hQ

theorem gl_tr {P : Nat} (hP : isGL P = true) : isGL (trN P) = true := (gl_facts P (isGL_lt hP) hP).2.2

/-! ## The group -/

theorem Gset_finite : Gset.Finite := by
  have hsub : Gset ⊆ (fun p : Bool × ℕ × ℕ => actN p.1 p.2.1 p.2.2) ''
      ((Set.univ : Set Bool) ×ˢ ((Set.Iio 512 : Set ℕ) ×ˢ (Set.Iio 512 : Set ℕ))) := by
    rintro g ⟨t, P, Q, hP, hQ, rfl⟩
    exact ⟨(t, P, Q), ⟨Set.mem_univ _, isGL_lt hP, isGL_lt hQ⟩, rfl⟩
  exact Set.Finite.subset (Set.Finite.image _ (Set.finite_univ.prod ((Set.finite_Iio 512).prod (Set.finite_Iio 512)))) hsub

theorem Gset_nonempty : Gset.Nonempty := ⟨actN false 273 273, false, 273, 273, isGL_273, isGL_273, rfl⟩

theorem Gset_comp : ∀ g ∈ Gset, ∀ h ∈ Gset, ∃ k ∈ Gset, ∀ x ∈ {x : ℕ | x < 512}, h (g x) = k x := by
  rintro g ⟨t1, P1, Q1, hP1, hQ1, rfl⟩ h ⟨t2, P2, Q2, hP2, hQ2, rfl⟩
  cases t2
  · refine ⟨actN t1 (mulF P2 P1) (mulF Q1 Q2), ⟨t1, _, _, gl_mul hP2 hP1, gl_mul hQ1 hQ2, rfl⟩, fun x _ => ?_⟩
    apply toM3_inj (actN_lt _ _ _ _) (actN_lt _ _ _ _)
    rw [toM3_actN, toM3_actN, toM3_actN, toM3_mulF, toM3_mulF, cond_false]
    simp only [Matrix.mul_assoc]
  · refine ⟨actN (!t1) (mulF P2 (trN Q1)) (mulF (trN P1) Q2),
      ⟨!t1, _, _, gl_mul hP2 (gl_tr hQ1), gl_mul (gl_tr hP1) hQ2, rfl⟩, fun x _ => ?_⟩
    apply toM3_inj (actN_lt _ _ _ _) (actN_lt _ _ _ _)
    rw [toM3_actN, toM3_actN, toM3_actN, toM3_mulF, toM3_mulF, toM3_trN, toM3_trN, cond_true]
    cases t1
    · rw [Bool.not_false, cond_false, cond_true]
      simp only [Matrix.transpose_mul, Matrix.mul_assoc]
    · rw [Bool.not_true, cond_true, cond_false]
      simp only [Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.mul_assoc]

theorem actN_inj {t : Bool} {P Q : Nat} (hP : isGL P = true) (hQ : isGL Q = true) {x y : Nat} (hx : x < 512)
    (hy : y < 512) (h : actN t P Q x = actN t P Q y) : x = y := by
  apply toM3_inj hx hy
  have e := congrArg toM3 h
  rw [toM3_actN, toM3_actN] at e
  obtain ⟨hP1, hP2⟩ := gl_inv hP
  obtain ⟨hQ1, hQ2⟩ := gl_inv hQ
  have e2 : cond t (toM3 x)ᵀ (toM3 x) = cond t (toM3 y)ᵀ (toM3 y) := by
    have := congrArg (fun M => toM3 (invN P) * M * toM3 (invN Q)) e
    simp only [← Matrix.mul_assoc, hP2, Matrix.one_mul] at this
    simpa only [Matrix.mul_assoc, hQ1, Matrix.mul_one] using this
  cases t
  · rwa [cond_false, cond_false] at e2
  · rw [cond_true, cond_true] at e2
    exact Matrix.transpose_injective e2

/-! ## The label order -/

theorem lab_vec : ∀ v < 512, vecN (labN v) = v := by decide +kernel

theorem labN_lt (v : Nat) : labN v < 512 := fld9_lt _ _

theorem labN_inj {u v : Nat} (hu : u < 512) (hv : v < 512) (h : labN u = labN v) : u = v := by
  rw [← lab_vec u hu, ← lab_vec v hv, h]

theorem labK_lt {v : Nat} (hv : v < 512) : labK v = labN v := by
  simp only [labK, Nat.mod_eq_of_lt hv, Nat.div_eq_of_lt hv, Nat.mul_zero, Nat.add_zero]

theorem labK_inj : Function.Injective labK := by
  intro u v h
  simp only [labK] at h
  have h1 := labN_lt (u % 512)
  have h2 := labN_lt (v % 512)
  have hd : u / 512 = v / 512 := by omega
  have hm : labN (u % 512) = labN (v % 512) := by omega
  have := labN_inj (Nat.mod_lt u (by norm_num)) (Nat.mod_lt v (by norm_num)) hm
  omega

end C3
