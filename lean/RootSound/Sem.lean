module
public import R22Port.U_d41d8cd98f00
public import RootSound.PerXAll
public import RootSound.Check
/-! # From the per-functional facts to Lemma R in mask form

For `X ≠ 0`, `X < 512`: `rank T(X) = 3 rk X`; vectors in the range of `T(X)` have the columns of their `b`-matrix in
`Q_X`, vectors in the range of `T(X)ᵀ` have the rows of their `c`-matrix in `P_X`; and
`tr(Z_X (T(X) x) (T(X)ᵀ y)) = y ⬝ᵥ T(X) x`. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

theorem rank_Dk (k : Nat) (hk : k ∈ ({0, 3, 6, 9} : Finset Nat)) : (Dk k).rank = k := by
  unfold Dk
  rw [Matrix.rank_diagonal]
  simp only [Finset.mem_insert, Finset.mem_singleton] at hk
  rcases hk with rfl | rfl | rfl | rfl <;> decide

theorem rkOf_le (X : Nat) : rkOf X < 4 := Nat.mod_lt _ (by norm_num)

theorem rank_TX (X : Nat) (hX : X < 512) (h0 : X ≠ 0) : (TX (toM3 X)).rank = 3 * rkOf X := by
  have F := perX_all X hX h0
  have hk : 3 * rkOf X ∈ ({0, 3, 6, 9} : Finset Nat) := by
    have := rkOf_le X; interval_cases (rkOf X) <;> simp
  apply le_antisymm
  · rw [F.rank_hi]
    calc (toM9 (UOf X) * Dk (3 * rkOf X) * toM9 (VOf X)).rank ≤ (toM9 (UOf X) * Dk (3 * rkOf X)).rank :=
          Matrix.rank_mul_le_left _ _
      _ ≤ (Dk (3 * rkOf X)).rank := Matrix.rank_mul_le_right _ _
      _ = 3 * rkOf X := rank_Dk _ hk
  · calc 3 * rkOf X = (Dk (3 * rkOf X)).rank := (rank_Dk _ hk).symm
      _ = (toM9 (LOf X) * TX (toM3 X) * toM9 (ROf X)).rank := by rw [F.rank_lo]
      _ ≤ (toM9 (LOf X) * TX (toM3 X)).rank := Matrix.rank_mul_le_left _ _
      _ ≤ (TX (toM3 X)).rank := Matrix.rank_mul_le_right _ _

/-! ## Masks of subspaces of `F2^3` -/

theorem enc3_lt (w : Fin 3 → F2) : enc3 w < 8 := by
  revert w; decide

theorem enc3_add (u v : Fin 3 → F2) : enc3 (u + v) = enc3 u ^^^ enc3 v := by
  revert u v; decide

theorem enc3_zero : enc3 (0 : Fin 3 → F2) = 0 := by decide

/-- the vectors of `F2^9` whose `b`-matrix has all columns in the mask `Q` (a subspace) -/
def subQ (Q : Nat) (h0 : Q.testBit 0 = true)
    (hx : ∀ w1 w2 : Fin 8, Q.testBit w1.val = true → Q.testBit w2.val = true → Q.testBit (w1.val ^^^ w2.val) = true) :
    Submodule F2 (Fin 9 → F2) where
  carrier := {v | ∀ k, memM Q (colB (matOf v) k)}
  add_mem' := by
    intro u v hu hv k
    have e : colB (matOf (u + v)) k = colB (matOf u) k + colB (matOf v) k := by
      funext j; simp [colB, matOf]
    simp only [memM] at *
    rw [e, enc3_add]
    exact hx ⟨_, enc3_lt _⟩ ⟨_, enc3_lt _⟩ (hu k) (hv k)
  zero_mem' := by
    intro k
    have e : colB (matOf (0 : Fin 9 → F2)) k = 0 := by funext j; simp [colB, matOf]
    simp only [memM]; rw [e, enc3_zero]; exact h0
  smul_mem' := by
    intro r v hv k
    rcases zmod2_cases r with rfl | rfl
    · have e : colB (matOf ((0 : F2) • v)) k = 0 := by funext j; simp [colB, matOf]
      simp only [memM]; rw [e, enc3_zero]; exact h0
    · simpa using hv k

/-- the vectors of `F2^9` whose `c`-matrix has all rows in the mask `P` (a subspace) -/
def subP (P : Nat) (h0 : P.testBit 0 = true)
    (hx : ∀ w1 w2 : Fin 8, P.testBit w1.val = true → P.testBit w2.val = true → P.testBit (w1.val ^^^ w2.val) = true) :
    Submodule F2 (Fin 9 → F2) where
  carrier := {v | ∀ k, memM P (rowC (matOf v) k)}
  add_mem' := by
    intro u v hu hv k
    have e : rowC (matOf (u + v)) k = rowC (matOf u) k + rowC (matOf v) k := by
      funext j; simp [rowC, matOf]
    simp only [memM] at *
    rw [e, enc3_add]
    exact hx ⟨_, enc3_lt _⟩ ⟨_, enc3_lt _⟩ (hu k) (hv k)
  zero_mem' := by
    intro k
    have e : rowC (matOf (0 : Fin 9 → F2)) k = 0 := by funext j; simp [rowC, matOf]
    simp only [memM]; rw [e, enc3_zero]; exact h0
  smul_mem' := by
    intro r v hv k
    rcases zmod2_cases r with rfl | rfl
    · have e : rowC (matOf ((0 : F2) • v)) k = 0 := by funext j; simp [rowC, matOf]
      simp only [memM]; rw [e, enc3_zero]; exact h0
    · simpa using hv k

theorem range_cols (X : Nat) (hX : X < 512) (h0 : X ≠ 0) (v : Fin 9 → F2)
    (hv : v ∈ LinearMap.range (TX (toM3 X)).mulVecLin) : ∀ k, memM (qxOf X) (colB (matOf v) k) := by
  have F := perX_all X hX h0
  have hle : LinearMap.range (TX (toM3 X)).mulVecLin ≤ subQ (qxOf X) F.q_zero F.q_xor := by
    rw [Matrix.range_mulVecLin, Submodule.span_le]
    rintro _ ⟨z, rfl⟩ k
    exact F.q_cols z k
  exact hle hv

theorem range_rows (X : Nat) (hX : X < 512) (h0 : X ≠ 0) (v : Fin 9 → F2)
    (hv : v ∈ LinearMap.range (TX (toM3 X))ᵀ.mulVecLin) : ∀ k, memM (pxOf X) (rowC (matOf v) k) := by
  have F := perX_all X hX h0
  have hle : LinearMap.range (TX (toM3 X))ᵀ.mulVecLin ≤ subP (pxOf X) F.p_zero F.p_xor := by
    rw [Matrix.range_mulVecLin, Submodule.span_le]
    rintro _ ⟨w, rfl⟩ k
    simpa using F.p_rows w k
  exact hle hv

end RootSound
