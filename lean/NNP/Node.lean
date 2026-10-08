module
public import R22Port.U_d41d8cd98f00
public import NNP.Kill
/-! # NNP.Node: soundness of the native node step (`node5_spec`'s conclusions, plus `KD.batchX`'s dictionary facts)

`nodeStep_sound`: from a valid frame (`FrameOK`), valid static data of the node's label (`C2OK`, `HOK`) and a valid per-job table
(`TabOK`, `TabWF`), an accepted `NN.nodeStep` gives
* the child frame as `node5` defines it (`S ∪ {last}`, `N ∪ c2`, `U + h`, depth `+1`) and its validity (`FrameOK`);
* the T/C kills (`KillsOK`);
* the facts `KD.xpartC_sound` needs about the dictionary (`DictSemX` in revision 6a form, rows below `2^511`) and the prefix. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- `KD.DictSemX` over the universe -/
def DictSemXO (O : R3RT.SpecO.LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop) (S last : ℕ) (mk rp : ℕ → ℕ) : Prop :=
  ∀ p, ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S last →
    ((Finset.range 511).filter (fun l => last < l ∧ Has O A l ∧ (mk p).testBit l = true)).card ≤ rp p

/-- `KD.row_above` over the universe -/
theorem row_aboveO {S last : ℕ} (hb : ∀ l, S.testBit l = true → l ≤ last) (hS511 : S < 2 ^ 511) (A : R3RT.Spec.Dec22)
    (hΩ : Ω A) (hA : Below O A S last) (R r : ℕ) (hR : RowOK O Ω (R % 2 ^ 511) (L5.pcnt 512 (R &&& S) + r)) :
    ((Finset.range 511).filter (fun l => last < l ∧ Has O A l ∧ R.testBit l = true)).card ≤ r := by
  have := L5O.row_count A hΩ S last R _ hS511 hb hA hR
    ((Finset.range 511).filter (fun l => last < l ∧ Has O A l ∧ R.testBit l = true)) (by
      intro l hl
      simp only [Finset.mem_filter, Finset.mem_range] at hl
      obtain ⟨_, hll, hAl, hml⟩ := hl
      refine ⟨hAl, hml, ?_⟩
      cases h' : S.testBit l
      · rfl
      · have := hb l h'; omega)
  omega

/-- the shape facts of `headOK` -/
theorem headOK_spec (fr : Frame) (nd : NodeRec) (h : headOK fr nd = true) :
    nd.lab = hLast nd.hdr ∧ hLast nd.hdr < 511 ∧ nd.r0.size = hNV nd.hdr ∧ nd.r1.size = hN1 nd.hdr ∧
      nd.r2.size = hN2 nd.hdr ∧ hD nd.hdr = fr.d + 1 ∧ noBitsFrom fr.S (hLast nd.hdr) = true ∧ nd.ks.size ≤ 512 := by
  unfold headOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, _⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, _⟩, _⟩, _⟩, _⟩, h13⟩ := h
  exact ⟨h1, h2, h4, h5, h6, h7, h8, h13⟩

/-- **soundness of one native node step** -/
theorem nodeStep_sound (st : Statics) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (fr : Frame) (nd : NodeRec)
    (out : StepOut)
    (hF : FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d)
    (hC2 : C2OK O Ω (hLast nd.hdr) (c2tV st (hLast nd.hdr)))
    (hH : HOK O (hLast nd.hdr) (hV st (hLast nd.hdr)))
    (h : nodeStep st tab fr nd = some out) :
    natL out.fr.S 0 8 = natL fr.S 0 8 ||| 2 ^ hLast nd.hdr ∧
    natL out.fr.N 0 4096 = natL fr.N 0 4096 ||| c2tV st (hLast nd.hdr) ∧
    natU out.fr.U = natU fr.U + hV st (hLast nd.hdr) ∧
    out.fr.d = fr.d + 1 ∧
    FrameOK O Ω (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d ∧
    KillsOK O Ω (natL fr.S 0 8 ||| 2 ^ hLast nd.hdr) (hLast nd.hdr) (nd.ks.toList.map killV) ∧
    (natL fr.S 0 8 ||| 2 ^ hLast nd.hdr) >>> hLast nd.hdr = 1 ∧
    DictSemXO O Ω (natL fr.S 0 8 ||| 2 ^ hLast nd.hdr) (hLast nd.hdr) (dictRowV tab out.ids)
      (KD.rposB out.b1 out.m out.e1) ∧
    (∀ p, dictRowV tab out.ids p < 2 ^ 511) ∧
    out.ids = dictIds nd ∧ out.b1 = hNV nd.hdr + hN1 nd.hdr ∧ out.m = hNV nd.hdr + hN1 nd.hdr + hN2 nd.hdr ∧
    out.e1 = hNV nd.hdr + hN1 nd.hdr + hN2 nd.hdr + nd.x1.size := by
  -- unfold the checks
  unfold nodeStep at h
  simp only [] at h
  split at h
  · exact absurd h (by simp)
  rename_i hhead
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hhead
  split at h
  · exact absurd h (by simp)
  rename_i hrows
  simp only [Bool.not_eq_true', Bool.not_eq_false, Bool.and_eq_true] at hrows
  obtain ⟨⟨⟨⟨hr0, hr1⟩, hr2⟩, hx1⟩, hx2⟩ := hrows
  split at h
  · exact absurd h (by simp)
  rename_i hU
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hU
  split at h
  · exact absurd h (by simp)
  split at h
  · exact absurd h (by simp)
  rename_i hkills
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hkills
  simp only [Option.some.injEq] at h
  subst h
  -- names
  obtain ⟨hlab, hl511, hs0, hs1, hs2, hd, hnb, hks⟩ := headOK_spec fr nd hhead
  set last := hLast nd.hdr with hlastdef
  set nV := hNV nd.hdr with hnVdef
  set n1 := hN1 nd.hdr with hn1def
  set n2 := hN2 nd.hdr with hn2def
  set S := natL fr.S 0 8 with hSdef
  set S' := S ||| 2 ^ last with hS'def
  obtain ⟨hS0, hS511, hScard, hUeq, hFA⟩ := hF
  have hSlt : S < 2 ^ last := noBitsFrom_lt fr.S last hnb
  have hS'v : natL (setBit8 fr.S last) 0 8 = S' := setBit8_view fr.S last (by omega)
  have hS'lt : S' < 2 ^ 511 := by
    rw [hS'def, L5O.or_pow_eq S _ hSlt]
    calc 2 ^ last + S < 2 ^ last + 2 ^ last := by omega
      _ = 2 ^ (last + 1) := by rw [pow_succ]; ring
      _ ≤ 2 ^ 511 := Nat.pow_le_pow_right (by norm_num) (by omega)
  have hbits : ∀ l', S'.testBit l' = true → l' ≤ last := by
    intro l' h'
    rw [hS'def, L5O.testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq] at h'
    rcases h' with h' | h'
    · have := L5O.bits_le_lastOf S l' h'; have := L5O.lastOf_lt S last hS0 hSlt; omega
    · omega
  have hcard : ((Finset.range 511).filter (fun l => S'.testBit l = true)).card = fr.d + 1 := by
    rw [hS'def, L5O.card_or_pow S last hSlt hl511, hScard]
  have hSl : S.testBit last = false := Nat.testBit_lt_two_pow hSlt
  have hlastOf : R3RT.Spec.lastOf S' = last := L5O.lastOf_or S last hSlt
  have hshr : S' >>> last = 1 := by
    rw [hS'def, Nat.shiftRight_eq_div_pow, L5O.or_pow_eq S last hSlt, Nat.add_div_left _ (by positivity),
      Nat.div_eq_of_lt hSlt]
  -- the dictionary
  set ids := dictIds nd with hidsdef
  have hsize : ids.size = nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size + nd.x2.size := dictIds_size nd
  have hdict := dict_ok tab hT hW nd (setBit8 fr.S last) hr0 hr1 hr2 hx1 hx2
  rw [hS'v] at hdict
  have hdlt := dictRowV_lt tab hW ids
  have hmod : ∀ p, dictRowV tab ids p % 2 ^ 511 = dictRowV tab ids p := fun p => Nat.mod_eq_of_lt (hdlt p)
  have hR0 : ∀ p < nV, RowOK O Ω (dictRowV tab ids p % 2 ^ 511) (L5.pcnt 512 (dictRowV tab ids p &&& S')) := by
    intro p hp
    have := hdict p
    rw [show resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p = 0 by unfold resid; rw [if_pos (by omega)],
      Nat.add_zero] at this
    rw [hmod]; exact this
  have hR1 : ∀ p, nV ≤ p → p < nV + n1 → RowOK O Ω (dictRowV tab ids p % 2 ^ 511)
      (L5.pcnt 512 (dictRowV tab ids p &&& S') + 1) := by
    intro p hp1 hp2
    have := hdict p
    rw [show resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p = 1 by
      unfold resid; rw [if_neg (by omega), if_pos (by omega)]] at this
    rw [hmod]; exact this
  have hR2 : ∀ p, nV + n1 ≤ p → p < nV + n1 + n2 → RowOK O Ω (dictRowV tab ids p % 2 ^ 511)
      (L5.pcnt 512 (dictRowV tab ids p &&& S') + 2) := by
    intro p hp1 hp2
    have := hdict p
    rw [show resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p = 2 by
      unfold resid; rw [if_neg (by omega), if_neg (by omega), if_pos (by omega)]] at this
    rw [hmod]; exact this
  -- the child frame's views
  set D'a := (Array.range 8).map fun k => (fr.D.getD k 0) ||| (fr.N.getD (8 * last + k) 0) ||| orN (fun p => dW tab ids nV p k) nV
    with hD'a
  have hNv : natL ((Array.range 4096).map fun k => (fr.N.getD k 0) ||| ((st.c2t.getD last #[]).getD k 0)) 0 4096 =
      natL fr.N 0 4096 ||| c2tV st last := by rw [conf_view]; rfl
  have hUv : natU (addU fr.U (st.h.getD last ByteArray.empty)) = natU fr.U + hV st last := addU_view _ _ hU
  -- dead mask and conflict table
  have hdead : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ l, last < l → l < 511 → (natL D'a 0 8).testBit l = true → ¬ Has O A l := by
    intro A hΩ hB
    exact dead_ok' S (natL fr.D 0 8) (natL fr.N 0 4096) (natL D'a 0 8) last nV (dictRowV tab ids) A hΩ hl511 hSlt hS0 hFA
      hR0 (fun l hl hb => dead_view tab ids fr.D fr.N last nV (by omega) hl511 l (by omega) hb) hB
  have hconf : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ v w, v < 511 → w < 511 → S'.testBit v = false → S'.testBit w = false → v ≠ w →
        ((natL fr.N 0 4096 ||| c2tV st last) >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w := by
    intro A hΩ hB
    exact L5O.conf_ok S (natL fr.N 0 4096) (c2tV st last) last A hΩ hl511 hSlt hS0 (fun A hΩ hB' => (hFA A hΩ hB').2)
      hC2 hB
  refine ⟨hS'v, hNv, hUv, hd, ?_, ?_, hshr, ?_, hdlt, rfl, rfl, rfl, rfl⟩
  · -- the child frame is valid
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · rw [hS'v, hS'def, L5O.or_pow_eq S _ hSlt]; positivity
    · rw [hS'v]; exact hS'lt
    · rw [hS'v, hcard, hd]
    · rw [hUv, hS'v, hUeq, hS'def, L5O.packU_or S last _ hSl hl511 hH]
    · intro A hΩ hB
      rw [hS'v, hlastOf] at hB
      rw [hS'v, hlastOf, hNv]
      exact ⟨hdead A hΩ hB, hconf A hΩ hB⟩
  · -- the kills
    intro kr hkr A hΩ
    simp only [List.mem_map, Array.mem_toList_iff] at hkr
    obtain ⟨kra, hkra, rfl⟩ := hkr
    have hk := (Array.all_eq_true_iff_forall_mem.mp hkills) kra hkra
    exact killOK_sound tab hW ids D'a _ (last + 1) nV n1 (nV + n1 + n2) (21 - hD nd.hdr) kra S' last (hD nd.hdr) hS'lt hbits
      (by rw [hcard, hd]) rfl rfl (by omega) (by omega) hR1 hR2 hdead
      (fun A hΩ hB => by rw [hNv]; exact hconf A hΩ hB) hk A hΩ
  · -- the dictionary's residual facts
    intro p A hΩ hB
    refine le_trans (row_aboveO hbits hS'lt A hΩ hB (dictRowV tab ids p) _ (by rw [hmod]; exact hdict p)) ?_
    have := resid_le_rposB nd.r0.size nd.r1.size nd.r2.size nd.x1.size p
    dsimp only
    rw [hs0, hs1, hs2] at this ⊢
    exact this

end NNP
