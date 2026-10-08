module
public import R22Port.U_d41d8cd98f00
public import NNP.Dead
public import NNP.Node0
/-! # NNP.Cut: node cuts 5 / 6 (bulk-peel certificates) through the X tier's `XT.checkCut`

`cutXOK` builds a dictionary of the cut's own rows (R1 = the node record's residual-1 rows and the exclusion rows, R2 = its
residual-2 rows), checks each against the parent's child prefix `S'` (`rowsOK`), and calls `XT.checkCut` on the parent's child
frame.  **`cutXOK_sound`**: given the X tier's refinement for `checkCut` (hypothesis `hCut`, discharged by `NNP.cutBridge`), an
accepted cut refutes every decomposition of `Ω` below the cut node. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- the top bit of a prefix -/
theorem topL_shr (S : Array UInt64) (last : ℕ) (hb : bit8 S last = true) (hl : last < 511)
    (hn : noBitsFrom S (last + 1) = true) : natL S 0 8 >>> last = 1 := by
  rw [bit8_eq _ _ (by omega)] at hb
  have hlt := noBitsFrom_lt S (last + 1) hn
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_shiftRight]
  cases i with
  | zero => simpa using hb
  | succ i =>
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [Nat.testBit_succ]

/-- the dictionary of residual-1 rows `r1` and residual-2 rows `r2`, each checked on the prefix -/
theorem dictSem_r12 (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (S' : Array UInt64) (last : ℕ)
    (r1 r2 : Array ℕ) (h1 : rowsOK tab S' 1 r1 = true) (h2 : rowsOK tab S' 2 r2 = true)
    (hb : ∀ l, (natL S' 0 8).testBit l = true → l ≤ last) (hS511 : natL S' 0 8 < 2 ^ 511) :
    DictSemXO O Ω (natL S' 0 8) last (dictRowV tab (r1 ++ r2)) (KD.rposB r1.size (r1.size + r2.size) (r1.size + r2.size)) := by
  let nd : NodeRec2 := ⟨0, 0, #[], r1, r2, #[], #[], #[]⟩
  have hids : dictIds2 nd = r1 ++ r2 := by simp [dictIds2, nd]
  have hE : ∀ r, rowsOK tab S' r #[] = true := fun r => by
    unfold rowsOK; exact (allN_iff _ _).mpr (fun j hj => by simp at hj)
  have h0 : rowsOK tab S' 0 nd.r0 = true := hE 0
  have hx : rowsOK tab S' 1 nd.x1 = true := hE 1
  have hx2 : rowsOK tab S' 2 nd.x2 = true := hE 2
  have hdict := dict_ok2 tab hT hW nd S' h0 h1 h2 hx hx2
  rw [hids] at hdict
  have hdlt := dictRowV_lt tab hW (r1 ++ r2)
  intro p A hΩ hB
  refine le_trans (row_aboveO hb hS511 A hΩ hB (dictRowV tab (r1 ++ r2) p) _
    (by rw [Nat.mod_eq_of_lt (hdlt p)]; exact hdict p)) ?_
  have := resid_le_rposB nd.r0.size nd.r1.size nd.r2.size nd.x1.size p
  simp only [nd, Array.size_empty, Nat.zero_add, Nat.add_zero] at this
  exact this

/-- **node cuts 5 / 6** -/
theorem cutXOK_sound (S : IStat) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (loc : ℕ → ℕ) (fr : Frame)
    (u : ℕ) (exs : Array ℕ) (nd ce : ByteArray)
    (hF : FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d)
    (hCut : ∀ (last b1 m : ℕ) (ids : Array ℕ) (pos expos : Array ℕ),
      XT.checkCut fr.S fr.D fr.N fr.U fr.d last b1 m m (mkDict tab ids) S.c2W S.npW u nd ce pos expos = true →
      natL fr.S 0 8 >>> last = 1 →
      DictSemXO O Ω (natL fr.S 0 8) last (dictRowV tab ids) (KD.rposB b1 m m) →
      (∀ p, dictRowV tab ids p < 2 ^ 511) →
      ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL fr.S 0 8) last u)
    (h : cutXOK S tab loc fr u exs nd ce = true) :
    ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Below O A (natL fr.S 0 8 ||| 2 ^ u) u := by
  unfold cutXOK at h
  split at h
  · exact absurd h (by simp)
  rename_i ents _
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨_, hlu⟩, hu⟩, hbit⟩, hnb⟩, hr1⟩, hr2⟩, hchk⟩ := h
  set last := topL fr.S
  have hl511 : last < 511 := by omega
  have hshr := topL_shr fr.S last hbit hl511 hnb
  have hb : ∀ l, (natL fr.S 0 8).testBit l = true → l ≤ last := by
    intro l hl; by_contra hc
    rw [KD.shr_one_bit hshr l (by omega)] at hl; simp at hl; omega
  intro A hΩ hB
  refine hCut last _ _ _ _ _ hchk hshr ?_ (dictRowV_lt tab hW _) A hΩ ⟨hlu, hu, hB⟩
  exact dictSem_r12 tab hT hW fr.S last _ _ hr1 hr2 hb hF.2.1

end NNP
