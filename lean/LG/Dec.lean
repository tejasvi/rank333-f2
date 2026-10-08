module
public import R22Port.U_d41d8cd98f00
public import RT.SoundN
public import RT.K3eD_Cls
public import KD.Kinds
/-! # Facts about a `Dec22` used by the L479 glue

* `dec_nz`: every term of a `Dec22` has `b, c ≠ 0` (dropping a zero term gives a 21-term decomposition, against the
  class bound 22 of the zero space `K_495 = {0}`: RR's bound, `HC.rr_fact 495`, given as the hypothesis `h495`).
* `entry_soundN2`: an RT entry passing `entryOK 20` gives the `FactN 22` bound `20 - cap` for its row (the 20-term cap of
  the L479 coset IP, from the 22-term capacity table); the proof is `RT.entry_soundN`'s.
* `rank_actN`: the group action preserves ranks. -/
@[expose] public section
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

namespace L479
open RootSound Matrix Finset R3RT.Spec

theorem kM495 : RT.kM RT.K3eD_Cls.CL 495 = 1 := by decide +kernel

/-- every term of a `Dec22` is nonzero, given the class bound 22 of `K_495 = {0}` -/
theorem dec_nz (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) (A : Dec22) (s : Fin 22) : A.b s ≠ 0 ∧ A.c s ≠ 0 := by
  -- dropping a zero term leaves a 21-term decomposition
  have key : ∀ s0 : Fin 22, (∀ i j j' k k' i', toM3 (A.av s0) i j * A.b s0 j' k * A.c s0 k' i' = 0) → False := by
    intro s0 hz
    have hd : IsDecomp (fun t : Fin 21 => toM3 (A.av (s0.succAbove t))) (fun t => A.b (s0.succAbove t))
        (fun t => A.c (s0.succAbove t)) := by
      intro i j j' k k' i'
      have h := A.dec i j j' k k' i'
      rw [Fin.sum_univ_succAbove _ s0, hz, zero_add] at h
      exact h
    have hF := h495 21 (fun t => A.av (s0.succAbove t)) _ _ (fun t => A.lt _) hd
    rw [kM495] at hF
    simp only at hF
    have : (univ.filter (fun t : Fin 21 => (1 : ℕ).testBit (A.av (s0.succAbove t)) = false)).card ≤ 21 := by
      calc _ ≤ (univ : Finset (Fin 21)).card := card_le_card (filter_subset _ _)
        _ = 21 := by simp
    omega
  constructor
  · intro h0; exact key s (fun i j j' k k' i' => by rw [h0]; simp)
  · intro h0; exact key s (fun i j j' k k' i' => by rw [h0]; simp)

/-- **The entry theorem for the L479 coset IP.** -/
theorem entry_soundN2 (CL e : Nat) (hcls : RT.FactN 22 (RT.kM CL (RT.eCls e)) (RT.cLB CL (RT.eCls e)))
    (h : RT.entryOK 20 CL e = true) : RT.FactN 22 (RT.dualM e) (20 - RT.eCap e) := by
  unfold RT.entryOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, Nat.ble_eq] at h
  obtain ⟨⟨⟨⟨⟨_, hsd⟩, hP⟩, hQ⟩, hmap⟩, hR⟩ := h
  have hgen := RT.mapsIn_spec CL e hmap
  intro av b c hav hnz hinj hd
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN (t := RT.eT e) hd hP hQ
  have hnz' : ∀ s, C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s) ≠ 0 := by
    intro s h0
    rw [← RT.actN_zero (RT.eT e) (RT.eP e) (RT.eQ e)] at h0
    exact hnz s (C3.actN_inj hP hQ (hav s) (by norm_num) h0)
  have hinj' : Function.Injective (fun s => C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s)) := by
    intro s s' h'
    exact hinj (C3.actN_inj hP hQ (hav s) (hav s') h')
  have hk := hcls (fun s => C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s)) b' c' (fun s => C3.actN_lt _ _ _ _) hnz' hinj' hd'
  refine le_trans (by omega) (le_trans hk (Finset.card_le_card ?_))
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e2 : (RT.dualM e).testBit (av s)
  · rfl
  · exfalso
    rw [← hsd] at e2
    obtain ⟨_, hin⟩ := RT.spanM_ind e (fun w => RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) w) = true)
      (by show RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) 0) = true
          rw [RT.actN_zero]; exact RT.inK_zero _ _) hgen
      (fun x y hx hy h1 h2 => by
        show RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (x ^^^ y)) = true
        rw [RT.actN_xor _ _ _ _ _ hx hy]; exact RT.inK_xor (C3.actN_lt _ _ _ _) (C3.actN_lt _ _ _ _) h1 h2)
      (av s) e2
    have hin' : RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s)) = true := hin
    rw [RT.kM_testBit _ _ _ (C3.actN_lt _ _ _ _), hin'] at hs
    exact absurd hs (by decide)

/-- the group action preserves ranks -/
theorem rank_actN {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true) (v : ℕ) :
    (toM3 (C3.actN t P Q v)).rank = (toM3 v).rank := by
  obtain ⟨hP1, -⟩ := C3.gl_inv hP
  obtain ⟨-, hQ2⟩ := C3.gl_inv hQ
  rw [C3.toM3_actN, Matrix.rank_mul_eq_left_of_isUnit_det _ _ (Matrix.isUnit_det_of_left_inverse hQ2),
    Matrix.rank_mul_eq_right_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hP1)]
  cases t
  · rfl
  · exact Matrix.rank_transpose _

end L479
