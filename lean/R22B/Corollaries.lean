module
public import R22Port.U_d41d8cd98f00
public import Top.Base
public import aux_FullTable_03_bridge
public import FullTable_02_Theorems
/-! # R22B.Corollaries: what `Top.RankGe23` gives, for the final file (audit §1.3/§1.4, recommended for the final file)

Copied verbatim (namespace `Audit` → `R22B.Cor`) from the glue agent's checks `audit/S/Stmt.lean` (md5 77910d62) and
`audit/S/RRStyle.lean` (md5 f49e1e16), standard axioms only:
* `rank_eq_23`: with Laderman's 23-term decomposition (reduced mod 2), `RankGe23` makes 23 the exact F2-rank;
* `mm_equiv`: `RankGe23` restated in the matrix-product convention (`C = AB`, third factor transposed);
* `table_23`, `recursive_23`: Rudich-Rousseau's own two statements at 23 (`TableAtLeast` for element 495, and their crown
  `RecursiveAlgorithmMultiplicationsAtLeast`: no program that works on blocks multiplies 3x3 matrices with fewer than 23
  multiplications), through RR's bridge `FullTable.Bridge.table_at_least_of_ladder` and
  `element_495_lower_bound_bounds_every_program`.
The final file applies them to the final theorem. -/
@[expose] public section
open FullTable FullTable.WangLadder RootSound Matrix

namespace R22B.Cor

/-- the bilinear-map convention: `∑_s a_s(i,j) b_s(j',k) c_s(i',k') = [i = i' ∧ j = j' ∧ k = k']` -/
def IsDecompMM {n : ℕ} (a b c : Fin n → M3) : Prop :=
  ∀ i j j' k i' k' : Fin 3,
    (∑ s, a s i j * b s j' k * c s i' k') = if j = j' ∧ k = k' ∧ i = i' then 1 else 0

theorem isDecomp_iff_mm {n : ℕ} (a b c : Fin n → M3) : IsDecomp a b c ↔ IsDecompMM a b (fun s => (c s)ᵀ) := by
  constructor
  · intro h i j j' k i' k'
    simpa only [transpose_apply] using h i j j' k k' i'
  · intro h i j j' k k' i'
    simpa only [transpose_apply] using h i j j' k i' k'

/-- **`RankGe23` in the matrix-product convention** -/
theorem mm_equiv : Top.RankGe23 ↔ ∀ (n : ℕ) (a b c : Fin n → M3), IsDecompMM a b c → 23 ≤ n := by
  constructor
  · intro h n a b c hd
    exact h n a b (fun s => (c s)ᵀ) ((isDecomp_iff_mm a b _).mpr (by simpa only [transpose_transpose] using hd))
  · intro h n a b c hd
    exact h n a b (fun s => (c s)ᵀ) ((isDecomp_iff_mm a b c).mp hd)

/-- Laderman (1976), the 23 products reduced mod 2; `c` is the transpose of the output weights, as `IsDecomp` wants -/
def LA : List ℕ := [415, 9, 16, 25, 24, 1, 193, 65, 192, 247, 128, 388, 260, 4, 384, 52, 36, 48, 2, 32, 8, 64, 256]
def LB : List ℕ := [16, 18, 379, 19, 3, 1, 37, 36, 5, 32, 253, 208, 144, 64, 192, 352, 288, 320, 8, 128, 4, 2, 256]
def LC : List ℕ := [8, 18, 2, 26, 24, 351, 324, 260, 320, 64, 4, 44, 36, 239, 40, 194, 130, 192, 1, 16, 128, 32, 256]

theorem laderman_isDecomp :
    IsDecomp (fun s : Fin 23 => toM3 (LA.getD s 0)) (fun s => toM3 (LB.getD s 0)) (fun s => toM3 (LC.getD s 0)) := by
  unfold IsDecomp LA LB LC; decide

/-- **the F2-rank is exactly 23**: a 23-term decomposition exists, and (given `RankGe23`) none shorter -/
theorem rank_eq_23 (h : Top.RankGe23) :
    (∃ (a b c : Fin 23 → M3), IsDecomp a b c) ∧ ∀ (n : ℕ) (a b c : Fin n → M3), IsDecomp a b c → 23 ≤ n :=
  ⟨⟨_, _, _, laderman_isDecomp⟩, h⟩

/-- terms with first factor `0` contribute nothing -/
theorem rank1sum_filter_ne0 : ∀ L : List (ℕ × ℕ × ℕ),
    rank1sum (L.filter fun t => !(inSpanB [] t.1)) = rank1sum L
  | [] => rfl
  | t :: L => by
    have ih := rank1sum_filter_ne0 L
    by_cases h0 : t.1 = 0
    · have hf : (!(inSpanB [] t.1)) = false := by simp [inSpanB, redBy, h0]
      rw [List.filter_cons_of_neg (by simp [hf]), ih]
      funext a b c
      show rank1sum L a b c = (rank1 t.1 t.2.1 t.2.2 a b c ^^ rank1sum L a b c)
      simp [rank1, h0]
    · have hf : (!(inSpanB [] t.1)) = true := by simp [inSpanB, redBy, h0]
      rw [List.filter_cons_of_pos (by simp [hf])]
      funext a b c
      show (rank1 t.1 t.2.1 t.2.2 a b c ^^ rank1sum (L.filter fun t => !(inSpanB [] t.1)) a b c) =
        (rank1 t.1 t.2.1 t.2.2 a b c ^^ rank1sum L a b c)
      rw [ih]

/-- **RR's table statement at 23** for element 495 (no conditions: the full matrix product over bits) -/
theorem table_23 (h : Top.RankGe23) : TableAtLeast ((table[495]!).map mask_matrix) 23 := by
  have h495 : table[495]! = [] := by
    have e := element_495_has_no_conditions
    rw [getElem!_pos table 495 (by
      have := table_has_496_elements; omega)]
    rw [getElem?_pos table 495 (by have := table_has_496_elements; omega)] at e
    exact Option.some.inj e
  rw [h495]
  apply FullTable.Bridge.table_at_least_of_ladder (rows := [])
  · rfl
  · intro x hx; simp at hx
  · intro L _ hsum
    have hsum' : rank1sum (L.filter fun t => !(inSpanB [] t.1)) = matmulT := by rw [rank1sum_filter_ne0]; exact hsum
    exact h _ _ _ _ (isDecomp_of_rank1sum _ hsum')

/-- **RR's crown at 23**: no program that works on blocks multiplies 3x3 matrices with fewer than 23 multiplications -/
theorem recursive_23 (h : Top.RankGe23) : RecursiveAlgorithmMultiplicationsAtLeast 23 :=
  element_495_lower_bound_bounds_every_program 23 (table_23 h)

end R22B.Cor

#print axioms R22B.Cor.mm_equiv
#print axioms R22B.Cor.rank_eq_23
#print axioms R22B.Cor.table_23
#print axioms R22B.Cor.recursive_23
