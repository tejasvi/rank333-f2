module
public import R22Port.U_bae7867d0867
public import Mathlib.LinearAlgebra.Matrix.Rank
public import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
/-! # Rank lemmas for decompositions with few terms (general field)

`M = B * Cᵀ` with `B : Matrix m ι K`, `C : Matrix n ι K`: the columns `B · t`, `C · t` are the factors of the rank-one
terms.  With `card ι = rank M` every term is "tight"; with `card ι = rank M + 1`, every term has a factor in the column
or the row space of `M`. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

variable {K : Type*} [Field K] {m n ι : Type*} [Fintype m] [Fintype n] [Fintype ι] [DecidableEq ι]

theorem injective_of_rank_eq_card (B : Matrix m ι K) (h : B.rank = Fintype.card ι) :
    Function.Injective B.mulVec := by
  have hrn := LinearMap.finrank_range_add_finrank_ker B.mulVecLin
  rw [Module.finrank_fintype_fun_eq_card] at hrn
  have hk : Module.finrank K (LinearMap.ker B.mulVecLin) = 0 := by
    unfold Matrix.rank at h; omega
  rw [Submodule.finrank_eq_zero] at hk
  have := LinearMap.ker_eq_bot.mp hk
  exact this

theorem range_mul_le (B : Matrix m ι K) (D : Matrix ι n K) :
    LinearMap.range (B * D).mulVecLin ≤ LinearMap.range B.mulVecLin := by
  rw [Matrix.mulVecLin_mul]
  exact LinearMap.range_comp_le_range _ _

theorem range_eq_of_rank_eq (B : Matrix m ι K) (D : Matrix ι n K) (h : (B * D).rank = B.rank) :
    LinearMap.range (B * D).mulVecLin = LinearMap.range B.mulVecLin :=
  Submodule.eq_of_le_of_finrank_eq (range_mul_le B D) h

theorem rank_mul_of_injective (B : Matrix m ι K) (D : Matrix ι n K) (hB : Function.Injective B.mulVec) :
    (B * D).rank = D.rank := by
  unfold Matrix.rank
  rw [Matrix.mulVecLin_mul, LinearMap.range_comp]
  exact LinearEquiv.finrank_eq (Submodule.equivMapOfInjective _ hB _).symm

/-- the column `t` of `B` -/
def col (B : Matrix m ι K) (t : ι) : m → K := fun i => B i t

theorem col_eq_mulVec (B : Matrix m ι K) (t : ι) : col B t = B.mulVec (Pi.single t 1) := by
  funext i; simp [col, Matrix.mulVec, dotProduct, Pi.single_apply]

/-- **Tight terms.**  `M = B Cᵀ`, `rank M = card ι`: the column `B · t` lies in the range of `M`, the column `C · t` in
the range of `Mᵀ`, and `M x = B · t` forces `(Cᵀ x) t = 1`. -/
theorem tight (B : Matrix m ι K) (C : Matrix n ι K) (h : (B * Cᵀ).rank = Fintype.card ι) (t : ι) :
    col B t ∈ LinearMap.range (B * Cᵀ).mulVecLin ∧
    col C t ∈ LinearMap.range (B * Cᵀ)ᵀ.mulVecLin ∧
    ∀ x, (B * Cᵀ).mulVec x = col B t → (Cᵀ.mulVec x) t = 1 := by
  have hB : B.rank = Fintype.card ι :=
    le_antisymm (Matrix.rank_le_card_width B) (h ▸ Matrix.rank_mul_le_left B Cᵀ)
  have hC : C.rank = Fintype.card ι := by
    have hT : (B * Cᵀ)ᵀ = C * Bᵀ := by rw [Matrix.transpose_mul, Matrix.transpose_transpose]
    have h2 : (C * Bᵀ).rank = Fintype.card ι := by rw [← hT, Matrix.rank_transpose]; exact h
    exact le_antisymm (Matrix.rank_le_card_width C) (h2 ▸ Matrix.rank_mul_le_left C Bᵀ)
  refine ⟨?_, ?_, ?_⟩
  · rw [range_eq_of_rank_eq B Cᵀ (h.trans hB.symm), col_eq_mulVec]
    exact LinearMap.mem_range_self _ _
  · have hT : (B * Cᵀ)ᵀ = C * Bᵀ := by rw [Matrix.transpose_mul, Matrix.transpose_transpose]
    have h2 : (C * Bᵀ).rank = C.rank := by
      rw [← hT, Matrix.rank_transpose, h, hC]
    rw [hT, range_eq_of_rank_eq C Bᵀ h2, col_eq_mulVec]
    exact LinearMap.mem_range_self _ _
  · intro x hx
    have hinj := injective_of_rank_eq_card B hB
    have : B.mulVec (Cᵀ.mulVec x) = B.mulVec (Pi.single t 1) := by
      rw [Matrix.mulVec_mulVec, hx, col_eq_mulVec]
    rw [hinj this]; simp

/-- **Slack-one terms.**  `M = B Cᵀ`, `rank M + 1 = card ι`: for every `t`, the column `B · t` lies in the range of `M`
or the column `C · t` lies in the range of `Mᵀ`. -/
theorem slack (B : Matrix m ι K) (C : Matrix n ι K) (h : (B * Cᵀ).rank + 1 = Fintype.card ι) (t : ι) :
    col B t ∈ LinearMap.range (B * Cᵀ).mulVecLin ∨ col C t ∈ LinearMap.range (B * Cᵀ)ᵀ.mulVecLin := by
  have hT : (B * Cᵀ)ᵀ = C * Bᵀ := by rw [Matrix.transpose_mul, Matrix.transpose_transpose]
  have hMt : (C * Bᵀ).rank = (B * Cᵀ).rank := by rw [← hT, Matrix.rank_transpose]
  by_contra hno
  rw [not_or] at hno
  obtain ⟨hb, hc⟩ := hno
  -- rank B = card ι, else range M = range B contains B · t
  have hB : B.rank = Fintype.card ι := by
    have h1 := Matrix.rank_mul_le_left B Cᵀ
    have h2 := Matrix.rank_le_card_width B
    by_contra hne
    have heq : (B * Cᵀ).rank = B.rank := by omega
    apply hb; rw [range_eq_of_rank_eq B Cᵀ heq, col_eq_mulVec]; exact LinearMap.mem_range_self _ _
  have hC : C.rank = Fintype.card ι := by
    have h1 := Matrix.rank_mul_le_left C Bᵀ
    have h2 := Matrix.rank_le_card_width C
    by_contra hne
    have heq : (C * Bᵀ).rank = C.rank := by omega
    apply hc; rw [hT, range_eq_of_rank_eq C Bᵀ heq, col_eq_mulVec]; exact LinearMap.mem_range_self _ _
  have := rank_mul_of_injective B Cᵀ (injective_of_rank_eq_card B hB)
  rw [Matrix.rank_transpose, hC] at this
  omega

end RootSound

namespace RootSound

variable {K : Type*} [Field K] {m n ι : Type*} [Fintype m] [Fintype n] [DecidableEq ι]

/-- the factor matrices of `∑_{s ∈ S} β_s γ_sᵀ`, indexed by `S` -/
def facB (S : Finset ι) (β : ι → m → K) : Matrix m S K := fun i s => β s.1 i

theorem sum_vecMulVec_eq (S : Finset ι) (β : ι → m → K) (γ : ι → n → K) :
    (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)) = facB S β * (facB S γ)ᵀ := by
  ext i j
  simp only [Matrix.sum_apply, Matrix.vecMulVec_apply, Matrix.mul_apply, facB, Matrix.transpose_apply]
  rw [← Finset.sum_coe_sort S]

/-- `tight` for a sum over a finset -/
theorem tight_fs (S : Finset ι) (β : ι → m → K) (γ : ι → n → K)
    (h : (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).rank = S.card) (t : ι) (ht : t ∈ S) :
    β t ∈ LinearMap.range (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).mulVecLin ∧
    γ t ∈ LinearMap.range (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s))ᵀ.mulVecLin ∧
    ∀ x, (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).mulVec x = β t → γ t ⬝ᵥ x = 1 := by
  rw [sum_vecMulVec_eq] at h ⊢
  rw [← Fintype.card_coe S] at h
  obtain ⟨h1, h2, h3⟩ := tight (facB S β) (facB S γ) h ⟨t, ht⟩
  exact ⟨h1, h2, fun x hx => h3 x hx⟩

/-- `slack` for a sum over a finset -/
theorem slack_fs (S : Finset ι) (β : ι → m → K) (γ : ι → n → K)
    (h : (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).rank + 1 = S.card) (t : ι) (ht : t ∈ S) :
    β t ∈ LinearMap.range (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).mulVecLin ∨
    γ t ∈ LinearMap.range (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s))ᵀ.mulVecLin := by
  rw [sum_vecMulVec_eq] at h ⊢
  rw [← Fintype.card_coe S] at h
  exact slack (facB S β) (facB S γ) h ⟨t, ht⟩

end RootSound
