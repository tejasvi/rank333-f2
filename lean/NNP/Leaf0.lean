module
public import R22Port.U_fd169a116a7a
public import NNP.Flook
public import NN.Dead
public import NLP.LeafAt
public import KD.Leaf
public import KD321.Leaf
/-! # NNP.Leaf0: soundness of the native leaf-code-0 check (inline v7 records, `#leafv7 1`)

`leaf0OK ks S d lab blob` accepts a leaf `(S ∪ {lab}, lab)` with 22 labels when native/leaf's `NL.leafAt` accepts the v7 record
`R = natOfBytes blob` and `R` is bound to the leaf (`n = 22`, no explicit domain, the 22 terms' labels are `S ∪ {lab}`).
**`leaf0OK_sound`**: then no decomposition with nonzero `b`, `c` lies below the leaf (`NL.leafAt_blob_sound`, `KD.leafBind`,
`KD.leaf_node_dead`). -/
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1024
namespace NNP
open NN R3RT.SpecO Classical
variable {Ω : R3RT.Spec.Dec22 → Prop}

theorem eq8_natL (a b : Array UInt64) (h : eq8 a b = true) : natL a 0 8 = natL b 0 8 := by
  unfold eq8 at h
  rw [natL_eq_natF, natL_eq_natF]
  apply natF_congr; intro k hk
  have := (allN_iff _ _).mp h k hk
  simp only [beq_iff_eq] at this
  rw [Nat.zero_add]; exact this

/-- the label of a code: `inv` is `KD.labV` when `vec` is `vecL` and `invOK` holds -/
theorem inv_labV (ks : KStatics) (hvec : ∀ l, l < 511 → ks.vec.getD l 0 = R3RT.vecL l) (hinv : invOK ks.vec ks.inv = true)
    (c : ℕ) (hc : c < 512) : ks.inv.getD c 511 = KD.labV c := by
  have hinv' := (allN_iff _ _).mp hinv c hc
  by_cases h0 : c = 0
  · subst h0
    rw [if_pos (by rfl)] at hinv'
    rw [beq_iff_eq.mp hinv', KD.labV_zero]
  · rw [if_neg (by simp; omega)] at hinv'
    simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hinv'
    obtain ⟨hlt, hv⟩ := hinv'
    obtain ⟨hl2, hv2⟩ := KD.labV_spec c h0 hc
    rw [hvec _ hlt] at hv
    exact R3RT.vecL_inj _ _ hlt hl2 (by rw [hv, hv2])

/-- **leaf code 0**: an accepted inline v7 record refutes the leaf (decompositions with nonzero `b`, `c`) -/
theorem leaf0OK_sound (ks : KStatics) (hvec : ∀ l, l < 511 → ks.vec.getD l 0 = R3RT.vecL l)
    {S : Array UInt64} {D N U d : ℕ}
    (hF : FrameOK LO123 Ω (natL S 0 8) D N U d) (lab : ℕ) (blob : ByteArray) (h : leaf0OK ks S d lab blob = true) :
    ∀ A : R3RT.Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → ¬ Below LO123 A (natL S 0 8 ||| 2 ^ lab) lab := by
  unfold leaf0OK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨hinv, hl511⟩, hnb⟩, hd⟩, hn⟩, hdm⟩, heq⟩, hleaf⟩ := h
  set e := 8 * blob.size with he
  set R := NL.natOfBytes blob with hR
  have hSlt : natL S 0 8 < 2 ^ lab := noBitsFrom_lt S lab hnb
  have hwin : NL.win R e 0 = R := NL.win_blob blob
  have hRs : BC7s.leafS R = true := NL.leafAt_blob_sound blob hleaf
  -- the bind
  have hN : S5.leafN R = 22 := by rw [← hwin, NL.leafN_win blob 0 e]; exact hn
  have hDom : S6.leafDom6 R = BC4.ALLNZ := by
    rw [← hwin]; exact NL.leafDom6_win blob 0 e (by rw [hn]; simpa using hdm)
  have hS' : natL (setBit8 S lab) 0 8 = natL S 0 8 ||| 2 ^ lab := setBit8_view' S lab (by omega)
  have hM : KD.lmask (S5.leafT R) 22 = natL S 0 8 ||| 2 ^ lab := by
    rw [← hS', ← eq8_natL _ _ heq]
    apply Nat.eq_of_testBit_eq; intro b
    have hlm := KD.lmask_bit (S5.leafT R) b 22
    by_cases hb : b < 512
    · have hL := foldl_setBit8 (fun t => ks.inv.getD (NL.rdw blob e (6 + 9 * t) 9) 511) b hb (List.range 22)
        #[0, 0, 0, 0, 0, 0, 0, 0]
      unfold leafLabels
      simp only [] at hL ⊢
      rw [natL_zero8, Nat.zero_testBit] at hL
      apply Bool.eq_iff_iff.mpr
      rw [hlm, hL]
      simp only [Bool.false_eq_true, false_or, List.mem_range]
      constructor
      · rintro ⟨t, ht, hlt⟩
        refine ⟨t, ht, ?_⟩
        rw [← hlt, ← hwin, NL.aT_leafT_win blob 0 e t (by rw [hn]; exact ht), Nat.zero_add,
          inv_labV ks hvec hinv _ (by have := NL.rdw_lt blob e (6 + 9 * t) 9 (le_refl 9); simpa using this)]
      · rintro ⟨t, ht, hlt⟩
        refine ⟨t, ht, ?_⟩
        rw [← hlt, ← hwin, NL.aT_leafT_win blob 0 e t (by rw [hn]; exact ht), Nat.zero_add,
          inv_labV ks hvec hinv _ (by have := NL.rdw_lt blob e (6 + 9 * t) 9 (le_refl 9); simpa using this)]
    · -- no bit at or above 512 on either side
      have h1 : (KD.lmask (S5.leafT R) 22).testBit b = false := by
        cases h' : (KD.lmask (S5.leafT R) 22).testBit b
        · rfl
        · obtain ⟨t, _, hlt⟩ := hlm.mp h'
          have : KD.labV (S5.aT (S5.leafT R) t) < 512 := by unfold KD.labV; exact Nat.mod_lt _ (by norm_num)
          omega
      rw [h1, natL_testBit, decide_eq_false (show ¬ b < 64 * 8 by omega), Bool.false_and]
  have hbind : KD.leafBind R (natL S 0 8 ||| 2 ^ lab) = true := by
    unfold KD.leafBind
    rw [hN, hDom, hM]
    simp
  have hshr : (natL S 0 8 ||| 2 ^ lab) >>> lab = 1 := or_pow_shr _ lab hSlt
  have hS511 : natL S 0 8 ||| 2 ^ lab < 2 ^ 511 := by
    rw [L5O.or_pow_eq _ _ hSlt]
    calc 2 ^ lab + natL S 0 8 < 2 ^ lab + 2 ^ lab := by omega
      _ = 2 ^ (lab + 1) := by rw [pow_succ]; ring
      _ ≤ 2 ^ 511 := Nat.pow_le_pow_right (by norm_num) (by omega)
  have hcard : ((Finset.range 511).filter (fun l => (natL S 0 8 ||| 2 ^ lab).testBit l = true)).card = 22 := by
    rw [L5O.card_or_pow _ lab hSlt hl511, hF.2.2.1]; omega
  exact KD.leaf_node_dead hRs hbind hshr hS511 hcard

end NNP

namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- the checked inverse table is a label function of the order -/
theorem lfOK_inv (ks : KStatics) (hvec : ∀ l, l < 511 → ks.vec.getD l 0 = O.vec l) (hinv : invOK ks.vec ks.inv = true) :
    KD321.LfOK O (fun v => ks.inv.getD v 511) := by
  refine ⟨fun v hv hl => ?_⟩
  have hinv' := (allN_iff _ _).mp hinv v hv
  by_cases h0 : v = 0
  · subst h0
    have h1 : ks.inv.getD 0 511 = 511 := by simpa using hinv'
    exact absurd hl (by rw [h1]; omega)
  · rw [if_neg (by simp; omega)] at hinv'
    simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hinv'
    exact ⟨h0, by rw [← hvec _ hinv'.1]; exact hinv'.2⟩

/-- **leaf code 0 over any label order** -/
theorem leaf0OK_soundO (ks : KStatics) (hvec : ∀ l, l < 511 → ks.vec.getD l 0 = O.vec l)
    {S : Array UInt64} {D N U d : ℕ}
    (hF : FrameOK O Ω (natL S 0 8) D N U d) (lab : ℕ) (blob : ByteArray) (h : leaf0OK ks S d lab blob = true) :
    ∀ A : R3RT.Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → ¬ Below O A (natL S 0 8 ||| 2 ^ lab) lab := by
  unfold leaf0OK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨hinv, hl511⟩, hnb⟩, hd⟩, hn⟩, hdm⟩, heq⟩, hleaf⟩ := h
  set e := 8 * blob.size with he
  set R := NL.natOfBytes blob with hR
  have hSlt : natL S 0 8 < 2 ^ lab := noBitsFrom_lt S lab hnb
  have hwin : NL.win R e 0 = R := NL.win_blob blob
  have hRs : BC7s.leafS R = true := NL.leafAt_blob_sound blob hleaf
  have hN : S5.leafN R = 22 := by rw [← hwin, NL.leafN_win blob 0 e]; exact hn
  have hDom : S6.leafDom6 R = BC4.ALLNZ := by
    rw [← hwin]; exact NL.leafDom6_win blob 0 e (by rw [hn]; simpa using hdm)
  have hS' : natL (setBit8 S lab) 0 8 = natL S 0 8 ||| 2 ^ lab := setBit8_view' S lab (by omega)
  have hinvle : ∀ c, c < 512 → ks.inv.getD c 511 ≤ 511 := by
    intro c hc
    have hinv' := (allN_iff _ _).mp hinv c hc
    by_cases h0 : c = 0
    · subst h0
      have h1 : ks.inv.getD 0 511 = 511 := by simpa using hinv'
      omega
    · rw [if_neg (by simp; omega)] at hinv'
      simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hinv'; omega
  have hM : KD321.lmaskO (fun v => ks.inv.getD v 511) (S5.leafT R) 22 = natL S 0 8 ||| 2 ^ lab := by
    rw [← hS', ← eq8_natL _ _ heq]
    apply Nat.eq_of_testBit_eq; intro b
    have hlm := KD321.lmaskO_bit (fun v => ks.inv.getD v 511) (S5.leafT R) b 22
    by_cases hb : b < 512
    · have hL := foldl_setBit8 (fun t => ks.inv.getD (NL.rdw blob e (6 + 9 * t) 9) 511) b hb (List.range 22)
        #[0, 0, 0, 0, 0, 0, 0, 0]
      unfold leafLabels
      simp only [] at hL ⊢
      rw [natL_zero8, Nat.zero_testBit] at hL
      apply Bool.eq_iff_iff.mpr
      rw [hlm, hL]
      simp only [Bool.false_eq_true, false_or, List.mem_range]
      constructor
      · rintro ⟨t, ht, hlt⟩
        refine ⟨t, ht, ?_⟩
        rw [← hlt, ← hwin, NL.aT_leafT_win blob 0 e t (by rw [hn]; exact ht), Nat.zero_add]
      · rintro ⟨t, ht, hlt⟩
        refine ⟨t, ht, ?_⟩
        rw [← hlt, ← hwin, NL.aT_leafT_win blob 0 e t (by rw [hn]; exact ht), Nat.zero_add]
    · have h1 : (KD321.lmaskO (fun v => ks.inv.getD v 511) (S5.leafT R) 22).testBit b = false := by
        cases h' : (KD321.lmaskO (fun v => ks.inv.getD v 511) (S5.leafT R) 22).testBit b
        · rfl
        · obtain ⟨t, _, hlt⟩ := hlm.mp h'
          have hc : S5.aT (S5.leafT R) t < 512 := by
            unfold S5.aT; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)
          have := hinvle _ hc
          omega
      rw [h1, natL_testBit, decide_eq_false (show ¬ b < 64 * 8 by omega), Bool.false_and]
  have hbind : KD321.leafBindO (fun v => ks.inv.getD v 511) R (natL S 0 8 ||| 2 ^ lab) = true := by
    unfold KD321.leafBindO
    rw [hN, hDom, hM]
    simp
  have hshr : (natL S 0 8 ||| 2 ^ lab) >>> lab = 1 := or_pow_shr _ lab hSlt
  have hS511 : natL S 0 8 ||| 2 ^ lab < 2 ^ 511 := by
    rw [L5O.or_pow_eq _ _ hSlt]
    calc 2 ^ lab + natL S 0 8 < 2 ^ lab + 2 ^ lab := by omega
      _ = 2 ^ (lab + 1) := by rw [pow_succ]; ring
      _ ≤ 2 ^ 511 := Nat.pow_le_pow_right (by norm_num) (by omega)
  have hcard : ((Finset.range 511).filter (fun l => (natL S 0 8 ||| 2 ^ lab).testBit l = true)).card = 22 := by
    rw [L5O.card_or_pow _ lab hSlt hl511, hF.2.2.1]; omega
  exact KD321.leaf_node_deadO (lfOK_inv ks hvec hinv) hRs hbind hshr hS511 hcard

end NNP
