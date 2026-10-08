module
public import R22Port.U_d41d8cd98f00
public import RT.Sound
/-! # The row table for a fixed number of distinct nonzero first factors (the main search: 22)

`FactN R m k`: every decomposition with exactly `R` terms whose first factors are distinct nonzero 9-bit codes has at least
`k` terms outside `m`.  `Fact` implies it (`fact_factN`).  Closure rows of the kept-row file (integer closure over the caps
of a row's subspaces, which needs distinct points) are only valid in this sense, so the main search's table is stated with
`FactN`.  `entry_soundN`: the entry theorem for `FactN` (the group element keeps the codes distinct and nonzero). -/
@[expose] public section
namespace RT
open BC4 BC5 RootSound Matrix

def FactN (R m k : Nat) : Prop := ∀ (av : Fin R → ℕ) (b c : Fin R → M3), (∀ s, av s < 512) → (∀ s, av s ≠ 0) →
  Function.Injective av → IsDecomp (fun s => toM3 (av s)) b c →
    k ≤ (Finset.univ.filter (fun s => m.testBit (av s) = false)).card

theorem fact_factN {m k : Nat} (R : Nat) (h : Fact m k) : FactN R m k :=
  fun av b c hav _ _ hd => h R av b c hav hd

/-- **Entry theorem (distinct nonzero first factors).** -/
theorem entry_soundN (R CL e : Nat) (hcls : FactN R (kM CL (eCls e)) (cLB CL (eCls e))) (h : entryOK R CL e = true) :
    FactN R (dualM e) (R - eCap e) := by
  unfold entryOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, Nat.ble_eq] at h
  obtain ⟨⟨⟨⟨⟨_, hsd⟩, hP⟩, hQ⟩, hmap⟩, hR⟩ := h
  have hgen := mapsIn_spec CL e hmap
  intro av b c hav hnz hinj hd
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN (t := eT e) hd hP hQ
  have hnz' : ∀ s, C3.actN (eT e) (eP e) (eQ e) (av s) ≠ 0 := by
    intro s h0
    rw [← actN_zero (eT e) (eP e) (eQ e)] at h0
    exact hnz s (C3.actN_inj hP hQ (hav s) (by norm_num) h0)
  have hinj' : Function.Injective (fun s => C3.actN (eT e) (eP e) (eQ e) (av s)) := by
    intro s s' h'
    exact hinj (C3.actN_inj hP hQ (hav s) (hav s') h')
  have hk := hcls (fun s => C3.actN (eT e) (eP e) (eQ e) (av s)) b' c' (fun s => C3.actN_lt _ _ _ _) hnz' hinj' hd'
  refine le_trans (by omega) (le_trans hk (Finset.card_le_card ?_))
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e2 : (dualM e).testBit (av s)
  · rfl
  · exfalso
    rw [← hsd] at e2
    obtain ⟨_, hin⟩ := spanM_ind e (fun w => inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) w) = true)
      (by show inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) 0) = true
          rw [actN_zero]; exact inK_zero _ _) hgen
      (fun x y hx hy h1 h2 => by
        show inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (x ^^^ y)) = true
        rw [actN_xor _ _ _ _ _ hx hy]; exact inK_xor (C3.actN_lt _ _ _ _) (C3.actN_lt _ _ _ _) h1 h2)
      (av s) e2
    have hin' : inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (av s)) = true := hin
    rw [kM_testBit _ _ _ (C3.actN_lt _ _ _ _), hin'] at hs
    exact absurd hs (by decide)

end RT
