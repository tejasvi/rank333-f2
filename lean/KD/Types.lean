module
public import R22Port.U_d41d8cd98f00
public import KD.Canon
public import RootSound.LemmaG
/-! # KD.Types: the type sets `--typecut 31` / `95` and their reduction to lemma-level facts (G3)

`--typecut 31` = bits 1, 2, 4, 8, 16 of prof7's `typeOK`.  With `n1 + n2 + n3 = 22` and `Δ = n2 + 2 n3 - 5` it allows exactly the
types with `Δ ≥ 2`, and `(16,6,0)` at `Δ = 1` (`typeOK31_iff`).
**`typeFacts31_of`**: the type facts for this set follow from
* the split-flattening bound `Δ ≥ 0` (`RootSound.LemmaG.split_flattening`, proved);
* `NoDelta0`: no decomposition has `∑ rank a_t = 27` (Δ = 0; Lemma S's types and `(17,5,0)`);
* `NoType 19 0 3`, `NoType 18 2 2`, `NoType 17 4 1`: the other three `Δ = 1` types (Lemmas S3, S22 and the `(17,4,1)` run).
The last four are the Gram-state computations of r22/thm4/THM_TYPES.md (d = 0 and d = 1).  **`typeFacts_of`** (`KD.TypeFacts`, the
run's set `--typecut 95`): the same and `NoType 17 3 2`, `NoType 18 1 3` (d = 2). -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

/-- prof7's `typeOK` with `TYPECUT = 31`, literally -/
def typeOKcpp31 (n1 n2 n3 : ℤ) : Bool :=
  let D := n1 + 2 * n2 + 3 * n3 - 27
  !(decide (n1 + n2 + n3 = 22)) ||
  (!(decide (D < 0)) && !(decide (D = 0) && decide (n3 ≥ 1)) && !(decide (n3 ≥ 3) && decide (D ≤ 1)) && !(decide (D < 1)) &&
   !(decide (n3 ≥ 2) && decide (n2 ≥ 2) && decide (D ≤ 1)) && !(decide (n3 ≥ 1) && decide (n2 ≥ 4) && decide (D ≤ 1)))

theorem typeOK31_cpp : S5.allLT 40 (fun a => S5.allLT 40 (fun b => S5.allLT 40 (fun c =>
    typeOK31 a b c == typeOKcpp31 a b c))) = true := by decide +kernel

/-- the decomposition's rank sum -/
def rankSum (A : Dec22) : ℕ := ∑ s, (toM3 (A.av s)).rank

def NoDelta0 : Prop := ∀ A : Dec22, rankSum A ≠ 27
def NoType (n1 n2 n3 : ℕ) : Prop := ∀ A : Dec22, ¬ (nType A 1 = n1 ∧ nType A 2 = n2 ∧ nType A 3 = n3)

/-- the type facts for `--typecut 31` -/
def TypeFacts31 : Prop := ∀ A : Dec22, typeOK31 (nType A 1) (nType A 2) (nType A 3) = true

theorem toM3_ne_zero {v : ℕ} (hv : v < 512) (h0 : v ≠ 0) : toM3 v ≠ 0 := by
  intro h
  apply h0
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.zero_testBit]
  by_cases hi : i < 9
  · have := congrFun (congrFun h ⟨i / 3, by omega⟩) ⟨i % 3, by omega⟩
    simp only [toM3, bitF, Matrix.zero_apply] at this
    rw [show 3 * (i / 3) + i % 3 = i by omega] at this
    by_contra hc; simp [hc] at this
  · push Not at hi
    exact Nat.testBit_lt_two_pow (lt_of_lt_of_le hv (Nat.pow_le_pow_right (by norm_num : 0 < 2) hi))

theorem rank_pos_of_ne_zero (M : M3) (h : M ≠ 0) : 1 ≤ M.rank := by
  by_contra hc
  have h0 : M.rank = 0 := by omega
  rw [Matrix.rank, Submodule.finrank_eq_zero, LinearMap.range_eq_bot] at h0
  apply h; ext i j
  have := congrArg (fun f => f (Pi.single j 1)) h0
  simp only [Matrix.mulVecLin_apply, LinearMap.zero_apply] at this
  have h2 := congrFun this i
  simp [Matrix.mulVec_single] at h2
  simpa using h2

theorem rank_mem (A : Dec22) (s : Fin 22) : (toM3 (A.av s)).rank = 1 ∨ (toM3 (A.av s)).rank = 2 ∨
    (toM3 (A.av s)).rank = 3 := by
  have h3 : (toM3 (A.av s)).rank ≤ 3 := (Matrix.rank_le_card_width _).trans (by simp)
  have h1 := rank_pos_of_ne_zero _ (toM3_ne_zero (A.lt s) (A.ne s))
  omega

theorem type_sum (A : Dec22) : KD.nType A 1 + KD.nType A 2 + KD.nType A 3 = 22 := by
  unfold KD.nType
  rw [← Finset.card_union_of_disjoint, ← Finset.card_union_of_disjoint]
  · have : (Finset.univ.filter (fun s : Fin 22 => (toM3 (A.av s)).rank = 1) ∪
        Finset.univ.filter (fun s : Fin 22 => (toM3 (A.av s)).rank = 2)) ∪
        Finset.univ.filter (fun s : Fin 22 => (toM3 (A.av s)).rank = 3) = Finset.univ := by
      ext s; simp only [Finset.mem_union, Finset.mem_filter, Finset.mem_univ, true_and, iff_true]
      rcases rank_mem A s with h | h | h
      · exact Or.inl (Or.inl h)
      · exact Or.inl (Or.inr h)
      · exact Or.inr h
    rw [this]; simp
  · rw [Finset.disjoint_union_left, Finset.disjoint_filter, Finset.disjoint_filter]
    exact ⟨fun s _ h1 h2 => by omega, fun s _ h1 h2 => by omega⟩
  · rw [Finset.disjoint_filter]; intro s _ h1 h2; omega

theorem rankSum_eq (A : Dec22) : rankSum A = KD.nType A 1 + 2 * KD.nType A 2 + 3 * KD.nType A 3 := by
  unfold rankSum KD.nType
  have : ∀ s, (toM3 (A.av s)).rank = (if (toM3 (A.av s)).rank = 1 then 1 else 0) +
      2 * (if (toM3 (A.av s)).rank = 2 then 1 else 0) + 3 * (if (toM3 (A.av s)).rank = 3 then 1 else 0) := by
    intro s; rcases rank_mem A s with h | h | h <;> simp [h]
  rw [Finset.sum_congr rfl (fun s _ => this s), Finset.sum_add_distrib, Finset.sum_add_distrib, ← Finset.mul_sum,
    ← Finset.mul_sum]
  simp only [Finset.sum_boole, Nat.cast_id]

theorem rankSum_ge (A : Dec22) : 27 ≤ rankSum A := RootSound.LemmaG.split_flattening A.dec

/-- **G3's reduction.** -/
theorem typeFacts31_of (h0 : NoDelta0) (h1 : NoType 19 0 3) (h2 : NoType 18 2 2) (h3 : NoType 17 4 1) :
    TypeFacts31 := by
  intro A
  have hs := type_sum A
  have hr := rankSum_eq A
  have hge := rankSum_ge A
  have hne := h0 A
  show typeOK31 (nType A 1) (nType A 2) (nType A 3) = true
  unfold typeOK31
  rw [hs]
  by_cases h7 : 7 ≤ KD.nType A 2 + 2 * KD.nType A 3
  · have : Nat.ble 7 (KD.nType A 2 + 2 * KD.nType A 3) = true := Nat.ble_eq.mpr h7
    simp [this]
  · -- Δ = 1: n2 + 2 n3 = 6
    have h6 : KD.nType A 2 + 2 * KD.nType A 3 = 6 := by omega
    have hn1 := h1 A; have hn2 := h2 A; have hn3 := h3 A
    have hn3' : KD.nType A 3 = 0 := by
      by_contra hc
      rcases (show KD.nType A 3 = 1 ∨ KD.nType A 3 = 2 ∨ KD.nType A 3 = 3 by omega) with h | h | h
      · exact hn3 ⟨by omega, by omega, h⟩
      · exact hn2 ⟨by omega, by omega, h⟩
      · exact hn1 ⟨by omega, by omega, h⟩
    have hn2' : KD.nType A 2 = 6 := by omega
    simp [hn2', hn3']

end KD

namespace KD
open R3RT R3RT.Spec

def typeOKcpp95 (n1 n2 n3 : ℤ) : Bool :=
  typeOKcpp31 n1 n2 n3 && (!(decide (n1 + n2 + n3 = 22)) || !((decide (n2 = 3) && decide (n3 = 2)) || (decide (n2 = 1) && decide (n3 = 3))))

theorem typeOK95_cpp : S5.allLT 40 (fun a => S5.allLT 40 (fun b => S5.allLT 40 (fun c =>
    typeOK95 a b c == typeOKcpp95 a b c))) = true := by decide +kernel

def TypeFacts95 : Prop := ∀ A : Dec22, typeOK95 (nType A 1) (nType A 2) (nType A 3) = true

theorem typeFacts95_of (h0 : NoDelta0) (h1 : NoType 19 0 3) (h2 : NoType 18 2 2) (h3 : NoType 17 4 1)
    (h4 : NoType 17 3 2) (h5 : NoType 18 1 3) : TypeFacts95 := by
  intro A
  unfold typeOK95
  rw [show typeOK31 (nType A 1) (nType A 2) (nType A 3) = true from typeFacts31_of h0 h1 h2 h3 A, Bool.true_and]
  have hn4 := h4 A; have hn5 := h5 A
  cases e1 : Nat.beq (nType A 2) 3 <;> cases e2 : Nat.beq (nType A 3) 2 <;> cases e3 : Nat.beq (nType A 1) 17 <;>
    cases e4 : Nat.beq (nType A 2) 1 <;> cases e5 : Nat.beq (nType A 3) 3 <;> cases e6 : Nat.beq (nType A 1) 18 <;>
    simp_all [Nat.beq_eq_true_eq]
/-- **G3's reduction for the run's set** (`KD.typeOK` = `--typecut 95`). -/
theorem typeFacts_of (h0 : NoDelta0) (h1 : NoType 19 0 3) (h2 : NoType 18 2 2) (h3 : NoType 17 4 1)
    (h4 : NoType 17 3 2) (h5 : NoType 18 1 3) : TypeFacts :=
  typeFacts95_of h0 h1 h2 h3 h4 h5
end KD
