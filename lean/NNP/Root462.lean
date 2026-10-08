module
public import R22Port.U_1220ddfa2eb4
public import NNP.Seg
public import KD321.Kinds
public import R22N.Glue
/-! # NNP.Root462: the depth-1 root `(2^462, 462)` of cases (I) / (I13) as a one-node dead segment (proof only; no NN code)

Job 2 of cases (I) / (I13) is the depth-1 node of label 462 (code 1, the first rank-1 label of `--rord 321`).  Its item is a dead
root (node cut 7) whose parent is the empty frame, which `NN.deadR3` does not take (guard `0 < fr.d`).  The node is empty in both
cases: every label after 462 is rank 1, so all 22 first factors would be rank 1.  Here the segment is built directly:
* `K462`: the key of root `(2^462, 462)`, `lo = 0`, no external children, no ranges (`R22N.SegI.ofKey` decodes it so,
  `K462_root`, `K462_lo`, `K462_ext`, `K462_rng`);
* `root462_empty` / `root462_empty13`: the node is empty (the rank-1 window at the frame `(2^462, 0, 0, packU, 1)`;
  copied from kinds/lean/KD321/Root.lean, md5 9dd05c99db3c3894589eacfcce693da0, theorems `frame_root`, `root_cut7`,
  `root462_empty`, `root462_empty13`, which are not in the frozen base);
* **`ref462I`** / **`ref462I13`**: in `NNP.refI`'s per-key shape, for the key `K462`, so infra's composition can take
  `cI' k := NN.CheckedI k ∨ k = K462` and `rI'` from `refI` and `ref462I`. -/
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
namespace NNP
open R3RT.SpecO

/-- the key of the segment with root `(2^462, 462)`, `lo = 0`, no external children and no ranges -/
def K462 : ℕ := 2 ^ 462 + 462 * 2 ^ 512

theorem K462_root : (R22N.SegI.ofKey K462).root = (2 ^ 462, 462) := by decide +kernel
theorem K462_lo : (R22N.SegI.ofKey K462).lo = 0 := by decide +kernel
theorem K462_ext : (R22N.SegI.ofKey K462).ext = [] := by decide +kernel
theorem K462_rng : (R22N.SegI.ofKey K462).rng = [] := by decide +kernel

/-- `(2^l, 0, 0, packU (2^l), 1)` is a valid frame: no dead labels, no conflicts (copy of `KD321.frame_root`) -/
theorem frame_root (O : LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop) (l : ℕ) (hl : l < 511) :
    FrameOK O Ω (2 ^ l) 0 0 (packU O (2 ^ l)) 1 := by
  refine ⟨Nat.two_pow_pos l, Nat.pow_lt_pow_right (by norm_num) hl, ?_, rfl, fun A _ _ => ⟨fun _ _ _ h => by simp at h,
    fun _ _ _ _ _ _ _ h => by simp at h⟩⟩
  have := L5O.card_or_pow 0 l (Nat.two_pow_pos l) hl
  rw [Nat.zero_or] at this; rw [this]; simp

/-- a depth-1 node cut by the rank-1 window with no dead labels (copy of `KD321.root_cut7`) -/
theorem root_cut7 {O : LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop} {r1m nr1m : ℕ} (hR : KD321.R1OK O r1m nr1m)
    (l lo hi : ℕ) (hl : l < 511) (h : KD321.winOKO r1m nr1m (2 ^ l) 0 1 l lo hi = true) :
    ∀ A : R3RT.Spec.Dec22, Ω A → CaseK lo hi A → ¬ Below O A (2 ^ l) l :=
  KD321.winO_sound hR (frame_root O Ω l hl) (by rw [Nat.shiftRight_eq_div_pow, Nat.div_self (Nat.two_pow_pos l)]) (by norm_num) h

/-- **job 2 of case (I)**: the depth-1 node of label 462 has no decomposition with at most 12 rank-1 first factors -/
theorem root462_empty : ∀ A : R3RT.Spec.Dec22, CaseK 0 12 A → ¬ Below Top321.O A (2 ^ 462) 462 :=
  fun A hC => root_cut7 (Ω := fun _ => True) KD321.r1OK321 462 0 12 (by norm_num) (by decide +kernel) A trivial hC

/-- **job 2 of case (I13)**: the same for exactly 13 rank-1 first factors -/
theorem root462_empty13 : ∀ A : R3RT.Spec.Dec22, CaseK 13 13 A → ¬ Below Top321.O A (2 ^ 462) 462 :=
  fun A hC => root_cut7 (Ω := fun _ => True) KD321.r1OK321 462 13 13 (by norm_num) (by decide +kernel) A trivial hC

/-- the one-node dead segment at `(2^462, 462)` -/
def seg462 : Seg := ⟨(2 ^ 462, 462), 0, ∅, {(2 ^ 462, 462)}, ∅, ∅⟩

/-- it is certified whenever its root is empty -/
theorem seg462_ok (C : R3RT.Spec.Dec22 → Prop) (hE : ∀ A : R3RT.Spec.Dec22, C A → ¬ Below Top321.O A (2 ^ 462) 462) :
    SegOKO Top321.O C seg462 := by
  refine ⟨Or.inr rfl, fun h => absurd h (by simp [seg462]), fun p hp => by simp [seg462] at hp, ?_,
    fun n hn => by simp [seg462] at hn⟩
  intro n hn A _ hC hB
  simp only [seg462, Set.mem_singleton_iff] at hn
  subst hn
  exact hE A hC hB

theorem seg462_iface (k : ℕ) (hk : k = K462) :
    seg462.root = (R22N.SegI.ofKey k).root ∧ seg462.lo = (R22N.SegI.ofKey k).lo ∧
      seg462.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ seg462.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} := by
  subst hk
  refine ⟨K462_root.symm, K462_lo.symm, ?_, ?_⟩
  · rw [K462_ext]; ext e; simp [seg462]
  · rw [K462_rng]; ext p; simp [seg462]

/-- **case (I), root 462**, in `NNP.refI`'s per-key shape -/
theorem ref462I : ∀ k, k = K462 → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
    g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧
    (R3RT.Spec.ClassFacts → SegOKO Top321.O (CaseK 0 12) g) := by
  intro k hk
  obtain ⟨h1, h2, h3, h4⟩ := seg462_iface k hk
  exact ⟨seg462, h1, h2, h3, h4, fun _ => seg462_ok _ root462_empty⟩

/-- **case (I13), root 462** -/
theorem ref462I13 : ∀ k, k = K462 → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
    g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧
    (R3RT.Spec.ClassFacts → SegOKO Top321.O (CaseK 13 13) g) := by
  intro k hk
  obtain ⟨h1, h2, h3, h4⟩ := seg462_iface k hk
  exact ⟨seg462, h1, h2, h3, h4, fun _ => seg462_ok _ root462_empty13⟩

end NNP
#print axioms NNP.ref462I
#print axioms NNP.ref462I13
#print axioms NNP.K462_root
