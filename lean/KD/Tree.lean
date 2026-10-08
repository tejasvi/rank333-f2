module
public import R22Port.U_d41d8cd98f00
public import KD.Canon
public import KD.Cuts
/-! # KD.Tree: job assembly as a tree closure

The main search's certified nodes form a tree.  `TreeOK opens dead`:
* every node of `dead` (a cut node or a leaf, each with its record's theorem) is empty for canonical case-(II)
  decompositions;
* every OPEN node `(S, last)` has its top bit at `last`, at most 21 prefix labels, and each child `u` above `last` is dead
  (`ChildDead`, the composed node's accounting) or is itself a node of `opens` or `dead`.
**`tree_sound`**: then every node of `opens` is empty: a decomposition below it would follow its own labels down the tree
(its next label is always a child of the current node) until a dead child or a dead node.  So a job is certified by the
records of its nodes plus the closure of the node set; pieces and skip references only change where a node's records are
stored.  With the top tree's nodes and the job roots in one tree, `tree_sound` covers all of case (II). -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

/-- node emptiness for canonical case-(II) decompositions -/
def Empty2 (S last : ℕ) : Prop := ∀ A : Dec22, A.Canon → R3RT.Spec.CaseII A → ¬ Below A S last

def TreeOK (opens dead : Set (ℕ × ℕ)) : Prop :=
  (∀ n ∈ dead, Empty2 n.1 n.2) ∧
  (∀ n ∈ opens, n.1 >>> n.2 = 1 ∧ ((Finset.range 511).filter (fun l => n.1.testBit l = true)).card ≤ 21 ∧
    ∀ u, n.2 < u → u < 511 → ChildDead n.1 n.2 u ∨ (n.1 ||| 2 ^ u, u) ∈ opens ∨ (n.1 ||| 2 ^ u, u) ∈ dead)

/-- the next label of a decomposition below a node with fewer than 22 prefix labels -/
theorem next_label {A : Dec22} {S last : ℕ} (hS : S >>> last = 1) (hA : Below A S last)
    (hcard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card ≤ 21) :
    ∃ u, Continues A S last u := by
  set d := ((Finset.range 511).filter (fun l => S.testBit l = true)).card with hd
  have hab := below_above_card hS hA d rfl
  have hne : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l)).Nonempty := by
    rw [← Finset.card_pos]; omega
  obtain ⟨u, humem, humin⟩ : ∃ u ∈ (Finset.range 511).filter (fun l => last < l ∧ A.Has l),
      ∀ l ∈ (Finset.range 511).filter (fun l => last < l ∧ A.Has l), u ≤ l :=
    ⟨_, Finset.min'_mem _ hne, fun l hl => Finset.min'_le _ l hl⟩
  simp only [Finset.mem_filter, Finset.mem_range] at humem
  obtain ⟨hu5, hlu, hAu⟩ := humem
  have hmin : ∀ l, last < l → l < u → ¬ A.Has l := by
    intro l hl hlu' hAl
    have : u ≤ l := humin l (by simp only [Finset.mem_filter, Finset.mem_range]; exact ⟨by omega, hl, hAl⟩)
    omega
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [shr_one_bit hS l (by omega)]; simp; omega
  refine ⟨u, hlu, hu5, fun l hl hle => ?_⟩
  rw [testBit_or_two_pow]
  by_cases hll : l ≤ last
  · rw [hA l hl hll]; have : l ≠ u := by omega
    simp [this]
  · push Not at hll
    rcases Nat.lt_or_ge l u with h1 | h1
    · rw [hS0 l hll]; have : l ≠ u := by omega
      simp only [this, decide_false, Bool.or_false, Bool.false_eq_true, iff_false]
      exact hmin l hll h1
    · have e : l = u := by omega
      rw [e]; simp [hAu]

theorem tree_sound {opens dead : Set (ℕ × ℕ)} (hT : TreeOK opens dead) :
    ∀ n ∈ opens, Empty2 n.1 n.2 := by
  obtain ⟨hdead, hopen⟩ := hT
  -- strong induction on 511 - last
  suffices ∀ m, ∀ n ∈ opens, 511 - n.2 = m → Empty2 n.1 n.2 by
    intro n hn; exact this _ n hn rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro n hn hm A hcan hII hA
    obtain ⟨hS, hcard, hkids⟩ := hopen n hn
    obtain ⟨u, hu⟩ := next_label hS hA hcard
    obtain ⟨hlu, hu5, hbel⟩ := hu
    rcases hkids u hlu hu5 with hdk | hon | hdn
    · exact hdk A hcan hII ⟨hlu, hu5, hbel⟩
    · exact ih (511 - u) (by omega) _ hon rfl A hcan hII hbel
    · exact hdead _ hdn A hcan hII hbel

/-! ## Combining with the canonical reduction -/

/-- **Case (II) from a certified tree.**  If the root node (empty prefix is not a node of prof7: the tree's roots are the
first-level nodes `(2^l, l)`) covers every first label, case (II) has no decomposition. -/
theorem caseII_empty {opens dead : Set (ℕ × ℕ)} (hT : TreeOK opens dead)
    (hroot : ∀ l, l < 511 → (∀ A : Dec22, A.Canon → R3RT.Spec.CaseII A → ¬ Below A (2 ^ l) l) ∨
      (2 ^ l, l) ∈ opens ∨ (2 ^ l, l) ∈ dead) :
    ∀ A : Dec22, R3RT.Spec.CaseII A → False := by
  apply canon_reduction
  intro A hcan hII
  -- the first label of A
  have hne : ((Finset.range 511).filter (fun l => A.Has l)).Nonempty := by
    rw [← Finset.card_pos, has_card A]; omega
  obtain ⟨l0, hmem, hmin0⟩ : ∃ l0 ∈ (Finset.range 511).filter (fun l => A.Has l),
      ∀ l ∈ (Finset.range 511).filter (fun l => A.Has l), l0 ≤ l :=
    ⟨_, Finset.min'_mem _ hne, fun l hl => Finset.min'_le _ l hl⟩
  simp only [Finset.mem_filter, Finset.mem_range] at hmem
  obtain ⟨hl5, hAl⟩ := hmem
  have hbel : Below A (2 ^ l0) l0 := by
    intro l hl hle
    rw [Nat.testBit_two_pow]
    rcases Nat.lt_or_ge l l0 with h1 | h1
    · have hn : ¬ A.Has l := by
        intro hA'
        have : l0 ≤ l := hmin0 l (by simp only [Finset.mem_filter, Finset.mem_range]; exact ⟨hl, hA'⟩)
        omega
      have : l0 ≠ l := by omega
      simp [hn, this]
    · have e : l = l0 := by omega
      rw [e]; simp [hAl]
  rcases hroot l0 hl5 with h | h | h
  · exact h A hcan hII hbel
  · exact tree_sound hT _ h A hcan hII hbel
  · exact hT.1 _ h A hcan hII hbel

end KD
