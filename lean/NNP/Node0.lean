module
public import R22Port.U_d41d8cd98f00
public import NNP.Node2
public import NNP.Root
/-! # NNP.Node0: the native node step from the empty parent frame

A top segment's root `(2^l, l)` at depth 1 has the empty parent: prefix 0, dead mask 0, conflict table = the cap-1 table, counters
0, depth 0.  That frame is not `FrameOK` (it needs a nonempty prefix), so **`nodeStep2_sound0`** restates `nodeStep2_sound` for it:
the dead labels of the child frame come from the cap-1 table and the full VROWS rows, its conflicts from the cap-1 table and
`c2t[l]` (as `KD321.node5_spec_empty`). -/
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1024
namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- **soundness of one native node step from the empty parent frame** (the root `(2^l, l)` of a top segment at depth 1) -/
theorem nodeStep2_sound0 (st : Statics) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (fr : Frame) (nd : NodeRec2)
    (out : StepOut)
    (hSz : natL fr.S 0 8 = 0) (hDz : natL fr.D 0 8 = 0) (hNc : natL fr.N 0 4096 = natL st.conf1 0 4096)
    (hUz : natU fr.U = 0) (hdz : fr.d = 0) (hc1 : Conf1OK O Ω (natL st.conf1 0 4096))
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
  have hS511 : S < 2 ^ 511 := by rw [hSz]; positivity
  have hScard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = fr.d := by rw [hSz, hdz]; simp
  have hUeq : natU fr.U = packU O S := by rw [hUz, hSz, packU_zero]
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
    · rw [hSz, Nat.zero_testBit] at h'; exact absurd h' (by decide)
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
    intro A hΩ hB l hl1 hl2 hDl hA
    have hAl : Has O A last := (hB last hl511 le_rfl).2 (by rw [L5O.testBit_or_pow]; simp)
    have hSl' : S'.testBit l = false := by
      cases h' : S'.testBit l
      · rfl
      · have := hbits l h'; omega
    rcases dead_view tab ids fr.D fr.N last nV (by omega) hl511 l (by omega) hDl with h1 | h1 | ⟨p, hp, hbit⟩
    · rw [hDz, Nat.zero_testBit] at h1; exact absurd h1 (by decide)
    · rw [hNc] at h1
      obtain ⟨m, hm, hm1, hm2⟩ := hc1 last l hl511 hl2 (by omega) h1
      have hc := card_two_le' (inMask O A m) last l
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hl511, hm1, hAl⟩)
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hl2, hm2, hA⟩) (by omega)
      have := hm A hΩ; omega
    · have hrc := L5O.row_count A hΩ _ last _ _ hS'lt hbits hB (hR0 p hp) {l}
        (by intro x hx; rw [Finset.mem_singleton] at hx; rw [hx]; exact ⟨hA, hbit, hSl'⟩)
      rw [Finset.card_singleton] at hrc
      omega
  have hconf : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ v w, v < 511 → w < 511 → S'.testBit v = false → S'.testBit w = false → v ≠ w →
        ((natL fr.N 0 4096 ||| c2tV st last) >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w := by
    intro A hΩ hB v w hv hw hSv hSw hvw hbit hAv hAw
    have hAl : Has O A last := (hB last hl511 le_rfl).2 (by rw [L5O.testBit_or_pow]; simp)
    have hvl : v ≠ last := by intro e; rw [e, L5O.testBit_or_pow] at hSv; simp at hSv
    have hwl : w ≠ last := by intro e; rw [e, L5O.testBit_or_pow] at hSw; simp at hSw
    rw [hNc, Nat.testBit_shiftRight, Nat.testBit_or, Bool.or_eq_true] at hbit
    rcases hbit with h1 | h1
    · obtain ⟨m, hm, hmv, hmw⟩ := hc1 v w hv hw (Ne.symm hvw) (by rw [Nat.testBit_shiftRight]; exact h1)
      have hc := card_two_le' (inMask O A m) v w
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hv, hmv, hAv⟩)
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hw, hmw, hAw⟩) hvw
      have := hm A hΩ; omega
    · obtain ⟨m, hm, hml, hmv, hmw⟩ := hC2 v w hv hw hwl (Ne.symm hvw) (by rw [Nat.testBit_shiftRight]; exact h1)
      have hc := card_three_le' (inMask O A m) last v w
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hl511, hml, hAl⟩)
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hv, hmv, hAv⟩)
        (by simp only [inMask, Finset.mem_filter, Finset.mem_range]; exact ⟨hw, hmw, hAw⟩)
        (Ne.symm hvl) (Ne.symm hwl) hvw
      have := hm A hΩ; omega
  have hpc21 : pcard (S ||| 2 ^ last) ≤ 21 := by
    show ((Finset.range 511).filter (fun l => S'.testBit l = true)).card ≤ 21
    rw [hcard]; omega
  refine ⟨hS'v, hNv, hUv, hd, ?_, ?_, hpc21, hSlt, hl511, hshr, ?_, hdlt, rfl, rfl, rfl, rfl⟩
  · -- the child frame is valid
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · rw [hS'v, hS'def, hSz, Nat.zero_or]; positivity
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

namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- the empty parent frame of a top segment's root -/
def EmptyFr (st : Statics) (fr : Frame) : Prop :=
  natL fr.S 0 8 = 0 ∧ natL fr.D 0 8 = 0 ∧ natL fr.N 0 4096 = natL st.conf1 0 4096 ∧ natU fr.U = 0 ∧ fr.d = 0

/-- the invariant of item frames, the empty parent frame included -/
def FInv0 (O : LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop) (st : Statics) (fr : Frame) : Prop :=
  FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d ∨ EmptyFr st fr

theorem rootFrame0_spec (st : Statics) (Dh : Array UInt64) (fr : Frame) (h : rootFrame0 st Dh = some fr) : EmptyFr st fr := by
  unfold rootFrame0 at h
  split at h
  · simp only [Option.some.injEq] at h
    subst h
    exact ⟨natL_zero8, natL_zero8, rfl, natU_zeroU, rfl⟩
  · exact absurd h (by simp)

/-- **one native node step from a valid or the empty parent frame** -/
theorem nodeStep2_ok (st : Statics) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (fr : Frame) (nd : NodeRec2)
    (out : StepOut) (hI : FInv0 O Ω st fr) (hc1 : Conf1OK O Ω (natL st.conf1 0 4096))
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
  rcases hI with hF | ⟨hSz, hDz, hNc, hUz, hdz⟩
  · exact nodeStep2_sound st tab hT hW fr nd out hF hC2 hH h
  · exact nodeStep2_sound0 st tab hT hW fr nd out hSz hDz hNc hUz hdz hc1 hC2 hH h

end NNP
