module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e205
public import E1.ExtLeaf
public import E1.C205X
public import E1.E205M_Lits
public import E1.E205M_C0
public import E1.E205M_C1
public import E1.E205M_C2
public import E1.E205M_C3
public import E1.E205M_C4
public import E1.E205M_C5
public import E1.E205M_C6
public import L5.t.E205S0
public import L5.t.E205S1
public import L5.t.E205S2
public import L5.t.E205S3
public import L5.t.E205S4
public import L5.t.E205S5
public import L5.t.E205S6
public import L5.t.E205S7
public import L5.t.E205S8
public import L5.t.E205S9
public import L5.t.E205S10
public import L5.t.E205S11
public import L5.t.E205S12
public import L5.t.E205S13
public import L5.t.E205S14
public import L5.t.E205S15
public import L5.t.E205S16
public import L5.t.E205S17
public import L5.t.E205S18
public import L5.t.E205S19
public import L5.t.E205S20
public import L5.t.E205S21
public import L5.t.E205S22
public import L5.t.E205S23
public import L5.t.E205S24
public import L5.t.E205S25
public import L5.t.E205S26
public import L5.t.E205S27
public import L5.t.E205S28
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e205`, end to end: chain `C205X`, 36 external leaves (29 split, 7 monolithic in 7 chunks). -/
namespace E1.E205
open E1S E1.IP_e205

theorem hmono : extChk C 29 E1.E205M.lits 0 7 = true := by
  have h0 : extChk C 29 E1.E205M.lits 0 1 = true := E1.E205M.ok0
  have h1 : extChk C 29 E1.E205M.lits 0 2 = true := extChk_join C 29 E1.E205M.lits 0 1 1 h0 E1.E205M.ok1
  have h2 : extChk C 29 E1.E205M.lits 0 3 = true := extChk_join C 29 E1.E205M.lits 0 2 1 h1 E1.E205M.ok2
  have h3 : extChk C 29 E1.E205M.lits 0 4 = true := extChk_join C 29 E1.E205M.lits 0 3 1 h2 E1.E205M.ok3
  have h4 : extChk C 29 E1.E205M.lits 0 5 = true := extChk_join C 29 E1.E205M.lits 0 4 1 h3 E1.E205M.ok4
  have h5 : extChk C 29 E1.E205M.lits 0 6 = true := extChk_join C 29 E1.E205M.lits 0 5 1 h4 E1.E205M.ok5
  have h6 : extChk C 29 E1.E205M.lits 0 7 = true := extChk_join C 29 E1.E205M.lits 0 6 1 h5 E1.E205M.ok6
  exact h6

theorem hsplit : ∀ k < 29, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S0.lits.getD 0 0) (by decide +kernel) E205S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S1.lits.getD 0 0) (by decide +kernel) E205S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S2.lits.getD 0 0) (by decide +kernel) E205S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S3.lits.getD 0 0) (by decide +kernel) E205S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S4.lits.getD 0 0) (by decide +kernel) E205S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S5.lits.getD 0 0) (by decide +kernel) E205S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S6.lits.getD 0 0) (by decide +kernel) E205S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S7.lits.getD 0 0) (by decide +kernel) E205S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S8.lits.getD 0 0) (by decide +kernel) E205S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S9.lits.getD 0 0) (by decide +kernel) E205S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S10.lits.getD 0 0) (by decide +kernel) E205S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S11.lits.getD 0 0) (by decide +kernel) E205S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S12.lits.getD 0 0) (by decide +kernel) E205S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S13.lits.getD 0 0) (by decide +kernel) E205S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S14.lits.getD 0 0) (by decide +kernel) E205S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S15.lits.getD 0 0) (by decide +kernel) E205S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S16.lits.getD 0 0) (by decide +kernel) E205S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S17.lits.getD 0 0) (by decide +kernel) E205S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S18.lits.getD 0 0) (by decide +kernel) E205S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S19.lits.getD 0 0) (by decide +kernel) E205S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S20.lits.getD 0 0) (by decide +kernel) E205S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S21.lits.getD 0 0) (by decide +kernel) E205S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S22.lits.getD 0 0) (by decide +kernel) E205S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S23.lits.getD 0 0) (by decide +kernel) E205S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S24.lits.getD 0 0) (by decide +kernel) E205S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S25.lits.getD 0 0) (by decide +kernel) E205S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S26.lits.getD 0 0) (by decide +kernel) E205S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S27.lits.getD 0 0) (by decide +kernel) E205S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E205S28.lits.getD 0 0) (by decide +kernel) E205S28.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 29 E1.E205M.lits hsplit (by decide +kernel)
    (by rw [show E1.E205M.lits.length = 7 by decide +kernel]; exact hmono)

/-- **E1 for `e205`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e205_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e205.CL c) (RT.cLB RT.Cls_e205.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e205.e205_sound hcls hext E1.C205X.lits (by rw [E1.C205X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C205X.len ▸ E1.C205X.okAll)) (glueChk_spec _ _ E1.C205X.okGlue)

end E1.E205

#print axioms E1.E205.e205_final
