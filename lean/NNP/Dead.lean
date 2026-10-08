module
public import R22Port.U_fd169a116a7a
public import NNP.ItemN
public import NN.Dead
/-! # NNP.Dead: the frame of a node without child loop (`NN.frameStep`, L1 v5's `frame5`)

**`frameStep_sound`**: on a valid parent frame, an accepted `frameStep` gives the valid frame of the dead node (prefix
`S ∪ {lab}`, dead mask with the node's full VROWS rows, conflict table, counters, one more label), as `L5O.frame5`'s
`Frame5Spec` does. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

theorem frameStep_lab (st : Statics) (tab : Tab) (fr : Frame) (lab : ℕ) (vs : Array ℕ) (f : Frame)
    (h : frameStep st tab fr lab vs = some f) : lab < 511 := by
  unfold frameStep at h
  simp only [] at h
  split at h
  · exact absurd h (by simp)
  rename_i hc
  simp only [Bool.not_eq_true', Bool.not_eq_false, Bool.and_eq_true, decide_eq_true_eq] at hc
  exact hc.1

/-- **the frame of a node without child loop is valid** -/
theorem frameStep_sound (st : Statics) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab)
    (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV st l)) (hH : ∀ l, l < 511 → HOK O l (hV st l))
    (fr : Frame) (lab : ℕ) (vs : Array ℕ) (f : Frame)
    (hF : FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d)
    (h : frameStep st tab fr lab vs = some f) :
    natL f.S 0 8 = natL fr.S 0 8 ||| 2 ^ lab ∧ natL fr.S 0 8 < 2 ^ lab ∧ lab < 511 ∧
      natL f.S 0 8 >>> lab = 1 ∧ FrameOK O Ω (natL f.S 0 8) (natL f.D 0 8) (natL f.N 0 4096) (natU f.U) f.d ∧
      (∀ j, j < 512 → (f.U.get! j).toNat < 128) := by
  unfold frameStep at h
  simp only [] at h
  split at h
  · exact absurd h (by simp)
  rename_i hc
  simp only [Bool.not_eq_true', Bool.not_eq_false, Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨hl511, hnb⟩ := hc
  split at h
  · exact absurd h (by simp)
  rename_i hrows
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hrows
  split at h
  · exact absurd h (by simp)
  rename_i hU
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hU
  simp only [Option.some.injEq] at h
  subst h
  set last := lab with hlastdef
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
  have hcard : ((Finset.range 511).filter (fun l => S'.testBit l = true)).card = fr.d + 1 := by
    rw [hS'def, L5O.card_or_pow S last hSlt hl511, hScard]
  have hSl : S.testBit last = false := Nat.testBit_lt_two_pow hSlt
  have hlastOf : R3RT.Spec.lastOf S' = last := L5O.lastOf_or S last hSlt
  have hshr : S' >>> last = 1 := by
    rw [hS'def, Nat.shiftRight_eq_div_pow, L5O.or_pow_eq S last hSlt, Nat.add_div_left _ (by positivity),
      Nat.div_eq_of_lt hSlt]
  -- the VROWS rows are full at the new prefix
  have hR0 : ∀ p < vs.size, RowOK O Ω (dictRowV tab vs p % 2 ^ 511) (L5.pcnt 512 (dictRowV tab vs p &&& S')) := by
    intro p hp
    obtain ⟨_, hpc⟩ := rowsOK_spec tab (setBit8 fr.S last) 0 vs hrows p hp
    rw [hS'v, Nat.add_zero] at hpc
    unfold dictRowV
    rw [if_pos hp, Nat.mod_eq_of_lt (rowT_lt tab hW _), hpc]
    exact rowOK_tab tab hT hW _
  set D'a := (Array.range 8).map fun k =>
    (fr.D.getD k 0) ||| (fr.N.getD (8 * last + k) 0) ||| orN (fun p => dW tab vs vs.size p k) vs.size with hD'a
  have hNv : natL (orArr fr.N (st.c2t.getD last #[])) 0 4096 = natL fr.N 0 4096 ||| c2tV st last := by
    unfold orArr; rw [conf_view]; rfl
  have hUv : natU (addU fr.U (st.h.getD last ByteArray.empty)) = natU fr.U + hV st last := addU_view _ _ hU
  have hdead : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ l, last < l → l < 511 → (natL D'a 0 8).testBit l = true → ¬ Has O A l := by
    intro A hΩ hB
    exact dead_ok' S (natL fr.D 0 8) (natL fr.N 0 4096) (natL D'a 0 8) last vs.size (dictRowV tab vs) A hΩ hl511 hSlt hS0
      hFA hR0 (fun l hl hb => dead_view tab vs fr.D fr.N last vs.size le_rfl hl511 l (by omega) hb) hB
  have hconf : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ v w, v < 511 → w < 511 → S'.testBit v = false → S'.testBit w = false → v ≠ w →
        ((natL fr.N 0 4096 ||| c2tV st last) >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w := by
    intro A hΩ hB
    exact L5O.conf_ok S (natL fr.N 0 4096) (c2tV st last) last A hΩ hl511 hSlt hS0 (fun A hΩ hB' => (hFA A hΩ hB').2)
      (hC2 last hl511) hB
  refine ⟨hS'v, hSlt, hl511, by rw [hS'v]; exact hshr, ?_, addU_lt _ _ hU⟩
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · show 0 < natL (setBit8 fr.S last) 0 8
    rw [hS'v, hS'def, L5O.or_pow_eq S _ hSlt]; positivity
  · show natL (setBit8 fr.S last) 0 8 < 2 ^ 511
    rw [hS'v]; exact hS'lt
  · show ((Finset.range 511).filter (fun l => (natL (setBit8 fr.S last) 0 8).testBit l = true)).card = fr.d + 1
    rw [hS'v, hcard]
  · show natU (addU fr.U (st.h.getD last ByteArray.empty)) = packU O (natL (setBit8 fr.S last) 0 8)
    rw [hUv, hS'v, hUeq, hS'def, L5O.packU_or S last _ hSl hl511 (hH last hl511)]
  · intro A hΩ hB
    show (∀ l, R3RT.Spec.lastOf (natL (setBit8 fr.S last) 0 8) < l → l < 511 → (natL D'a 0 8).testBit l = true →
        ¬ Has O A l) ∧
      (∀ v w, v < 511 → w < 511 → (natL (setBit8 fr.S last) 0 8).testBit v = false →
        (natL (setBit8 fr.S last) 0 8).testBit w = false → v ≠ w →
        (natL (orArr fr.N (st.c2t.getD last #[])) 0 4096 >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w)
    rw [hS'v, hlastOf, hNv]
    rw [hS'v, hlastOf] at hB
    exact ⟨hdead A hΩ hB, hconf A hΩ hB⟩

/-! ## The dead-child check -/

theorem flookAt_spec (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last t : ℕ) (h : flookAt ks S D U d last t = true) :
    ∃ r, flookChk ks S D U d last r = true := by
  unfold flookAt at h
  split at h
  · rename_i r _; exact ⟨r, h⟩
  · exact absurd h (by simp)

theorem flookAny_spec (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last : ℕ) (h : flookAny ks S D U d last = true) :
    ∃ r, flookChk ks S D U d last r = true := by
  unfold flookAny at h
  obtain ⟨l, _, hl⟩ := List.any_eq_true.mp h
  simp only [Bool.and_eq_true] at hl
  obtain ⟨_, hl⟩ := hl
  split at hl
  · rename_i r _; exact ⟨r, hl⟩
  · exact absurd hl (by simp)

end NNP
