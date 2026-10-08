module
public import R22Port.U_d41d8cd98f00
public import NNP.Kill2
public import NNP.Node
public import NNP.Seg
/-! # NNP.Node2: soundness of the native node step of the r3 path (`nodeStep2`)

The same conclusions as `NNP.nodeStep_sound`, for the record with explicit fields: the child frame and its validity, the T/C
kills, the dictionary's residual facts (`DictSemXO`), plus the facts the tree layer's `NodeSound` needs (prefix count ≤ 21,
the label above the parent prefix). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

theorem headOK2_spec (fr : Frame) (nd : NodeRec2) (h : headOK2 fr nd = true) :
    nd.lab < 511 ∧ nd.d = fr.d + 1 ∧ nd.d ≤ 21 ∧ noBitsFrom fr.S nd.lab = true := by
  unfold headOK2 at h
  simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, _⟩, _⟩, _⟩, _⟩ := h
  exact ⟨h1, h2, h3, h4⟩

theorem dictIds2_size (nd : NodeRec2) :
    (dictIds2 nd).size = nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size + nd.x2.size := by
  unfold dictIds2; simp only [Array.size_append]

theorem dictIds2_getD (nd : NodeRec2) (p : Nat) :
    (dictIds2 nd).getD p 0 =
      if p < nd.r0.size then nd.r0.getD p 0
      else if p < nd.r0.size + nd.r1.size then nd.r1.getD (p - nd.r0.size) 0
      else if p < nd.r0.size + nd.r1.size + nd.r2.size then nd.r2.getD (p - (nd.r0.size + nd.r1.size)) 0
      else if p < nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size then
        nd.x1.getD (p - (nd.r0.size + nd.r1.size + nd.r2.size)) 0
      else nd.x2.getD (p - (nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size)) 0 := by
  unfold dictIds2
  simp only [getD_append, Array.size_append]
  split_ifs <;> first | rfl | (exfalso; omega) | (congr 1; omega)

/-- every dictionary row of the r3 path is valid with its residual class -/
theorem dict_ok2 (tab : Tab) (hT : R3RT.SpecO.TabOK O Ω (tabV tab)) (hW : TabWF tab) (nd : NodeRec2) (S' : Array UInt64)
    (h0 : rowsOK tab S' 0 nd.r0 = true) (h1 : rowsOK tab S' 1 nd.r1 = true) (h2 : rowsOK tab S' 2 nd.r2 = true)
    (hx1 : rowsOK tab S' 1 nd.x1 = true) (hx2 : rowsOK tab S' 2 nd.x2 = true) :
    ∀ p, R3RT.SpecO.RowOK O Ω (dictRowV tab (dictIds2 nd) p)
      (L5.pcnt 512 (dictRowV tab (dictIds2 nd) p &&& natL S' 0 8) +
        resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p) := by
  intro p
  unfold dictRowV
  rw [dictIds2_size]
  split
  · rename_i hp
    have key : ∀ (L : Array Nat) (r j : Nat), rowsOK tab S' r L = true → j < L.size →
        resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p = r → (dictIds2 nd).getD p 0 = L.getD j 0 →
        R3RT.SpecO.RowOK O Ω (rowT tab ((dictIds2 nd).getD p 0))
          (L5.pcnt 512 (rowT tab ((dictIds2 nd).getD p 0) &&& natL S' 0 8) + resid nd.r0.size nd.r1.size nd.r2.size nd.x1.size p) := by
      intro L r j hL hj hr he
      obtain ⟨_, hc⟩ := rowsOK_spec tab S' r L hL j hj
      rw [hr, he, hc]
      exact rowOK_tab tab hT hW _
    have hr0 := dictIds2_getD nd p
    by_cases c1 : p < nd.r0.size
    · rw [if_pos c1] at hr0
      exact key nd.r0 0 _ h0 c1 (by unfold resid; rw [if_pos c1]) hr0
    rw [if_neg c1] at hr0
    by_cases c2 : p < nd.r0.size + nd.r1.size
    · rw [if_pos c2] at hr0
      exact key nd.r1 1 _ h1 (by omega) (by unfold resid; rw [if_neg c1, if_pos c2]) hr0
    rw [if_neg c2] at hr0
    by_cases c3 : p < nd.r0.size + nd.r1.size + nd.r2.size
    · rw [if_pos c3] at hr0
      exact key nd.r2 2 _ h2 (by omega) (by unfold resid; rw [if_neg c1, if_neg c2, if_pos c3]) hr0
    rw [if_neg c3] at hr0
    by_cases c4 : p < nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size
    · rw [if_pos c4] at hr0
      exact key nd.x1 1 _ hx1 (by omega) (by unfold resid; rw [if_neg c1, if_neg c2, if_neg c3, if_pos c4]) hr0
    rw [if_neg c4] at hr0
    exact key nd.x2 2 _ hx2 (by omega) (by unfold resid; rw [if_neg c1, if_neg c2, if_neg c3, if_neg c4]) hr0
  · intro A _; simp [R3RT.SpecO.inMask]

/-- **soundness of one native node step** -/
theorem nodeStep2_sound (st : Statics) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (fr : Frame) (nd : NodeRec2)
    (out : StepOut)
    (hF : FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d)
    (hC2 : C2OK O Ω (nd.lab) (c2tV st (nd.lab)))
    (hH : HOK O (nd.lab) (hV st (nd.lab)))
    (h : nodeStep2 st tab fr nd = some out) :
    natL out.fr.S 0 8 = natL fr.S 0 8 ||| 2 ^ nd.lab ∧
    natL out.fr.N 0 4096 = natL fr.N 0 4096 ||| c2tV st (nd.lab) ∧
    natU out.fr.U = natU fr.U + hV st (nd.lab) ∧
    out.fr.d = fr.d + 1 ∧
    FrameOK O Ω (natL out.fr.S 0 8) (natL out.fr.D 0 8) (natL out.fr.N 0 4096) (natU out.fr.U) out.fr.d ∧
    (∀ k ∈ nd.kills, ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL fr.S 0 8 ||| 2 ^ nd.lab) nd.lab k.u) ∧
    pcard (natL fr.S 0 8 ||| 2 ^ nd.lab) ≤ 21 ∧ natL fr.S 0 8 < 2 ^ nd.lab ∧ nd.lab < 511 ∧
    (natL fr.S 0 8 ||| 2 ^ nd.lab) >>> nd.lab = 1 ∧
    DictSemXO O Ω (natL fr.S 0 8 ||| 2 ^ nd.lab) (nd.lab) (dictRowV tab out.ids)
      (KD.rposB out.b1 out.m out.e1) ∧
    (∀ p, dictRowV tab out.ids p < 2 ^ 511) ∧
    out.ids = dictIds2 nd ∧ out.b1 = nd.r0.size + nd.r1.size ∧ out.m = nd.r0.size + nd.r1.size + nd.r2.size ∧
    out.e1 = nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size := by
  -- unfold the checks
  unfold nodeStep2 at h
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
  obtain ⟨hl511, hd, hd21, hnb⟩ := headOK2_spec fr nd hhead
  set last := nd.lab with hlastdef
  set nV := nd.r0.size with hnVdef
  set n1 := nd.r1.size with hn1def
  set n2 := nd.r2.size with hn2def
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
  set ids := dictIds2 nd with hidsdef
  have hsize : ids.size = nd.r0.size + nd.r1.size + nd.r2.size + nd.x1.size + nd.x2.size := dictIds2_size nd
  have hdict := dict_ok2 tab hT hW nd (setBit8 fr.S last) hr0 hr1 hr2 hx1 hx2
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
  have hpc21 : pcard (S ||| 2 ^ last) ≤ 21 := by
    show ((Finset.range 511).filter (fun l => S'.testBit l = true)).card ≤ 21
    rw [hcard]; omega
  refine ⟨hS'v, hNv, hUv, hd, ?_, ?_, hpc21, hSlt, hl511, hshr, ?_, hdlt, rfl, rfl, rfl, rfl⟩
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
    intro k hk A hΩ
    have hk' := (Array.all_eq_true_iff_forall_mem.mp hkills) k hk
    exact killOK2_sound tab hW ids D'a _ (last + 1) nV n1 (nV + n1 + n2) (21 - nd.d) k S' last nd.d hS'lt hbits
      (by rw [hcard, hd]) rfl rfl (by omega) (by omega) hR1 hR2 hdead
      (fun A hΩ hB => by rw [hNv]; exact hconf A hΩ hB) hk' A hΩ
  · -- the dictionary's residual facts
    intro p A hΩ hB
    refine le_trans (row_aboveO hbits hS'lt A hΩ hB (dictRowV tab ids p) _ (by rw [hmod]; exact hdict p)) ?_
    have := resid_le_rposB nd.r0.size nd.r1.size nd.r2.size nd.x1.size p
    dsimp only
    exact this

end NNP
