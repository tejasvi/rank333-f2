module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e279
public import E1.ExtLeaf
public import E1.C279X
public import E1.E279M_Lits
public import E1.E279M_C0
public import E1.E279M_C1
public import E1.E279M_C2
public import E1.E279M_C3
public import E1.E279M_C4
public import E1.E279M_C5
public import E1.E279M_C6
public import L5.t.E279S0
public import L5.t.E279S1
public import L5.t.E279S2
public import L5.t.E279S3
public import L5.t.E279S4
public import L5.t.E279S5
public import L5.t.E279S6
public import L5.t.E279S7
public import L5.t.E279S8
public import L5.t.E279S9
public import L5.t.E279S10
public import L5.t.E279S11
public import L5.t.E279S12
public import L5.t.E279S13
public import L5.t.E279S14
public import L5.t.E279S15
public import L5.t.E279S16
public import L5.t.E279S17
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e279`, end to end: chain `C279X`, 25 external leaves (18 split, 7 monolithic in 7 chunks). -/
namespace E1.E279
open E1S E1.IP_e279

theorem hmono : extChk C 18 E1.E279M.lits 0 7 = true := by
  have h0 : extChk C 18 E1.E279M.lits 0 1 = true := E1.E279M.ok0
  have h1 : extChk C 18 E1.E279M.lits 0 2 = true := extChk_join C 18 E1.E279M.lits 0 1 1 h0 E1.E279M.ok1
  have h2 : extChk C 18 E1.E279M.lits 0 3 = true := extChk_join C 18 E1.E279M.lits 0 2 1 h1 E1.E279M.ok2
  have h3 : extChk C 18 E1.E279M.lits 0 4 = true := extChk_join C 18 E1.E279M.lits 0 3 1 h2 E1.E279M.ok3
  have h4 : extChk C 18 E1.E279M.lits 0 5 = true := extChk_join C 18 E1.E279M.lits 0 4 1 h3 E1.E279M.ok4
  have h5 : extChk C 18 E1.E279M.lits 0 6 = true := extChk_join C 18 E1.E279M.lits 0 5 1 h4 E1.E279M.ok5
  have h6 : extChk C 18 E1.E279M.lits 0 7 = true := extChk_join C 18 E1.E279M.lits 0 6 1 h5 E1.E279M.ok6
  exact h6

theorem hsplit : ∀ k < 18, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S0.lits.getD 0 0) (by decide +kernel) E279S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S1.lits.getD 0 0) (by decide +kernel) E279S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S2.lits.getD 0 0) (by decide +kernel) E279S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S3.lits.getD 0 0) (by decide +kernel) E279S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S4.lits.getD 0 0) (by decide +kernel) E279S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S5.lits.getD 0 0) (by decide +kernel) E279S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S6.lits.getD 0 0) (by decide +kernel) E279S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S7.lits.getD 0 0) (by decide +kernel) E279S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S8.lits.getD 0 0) (by decide +kernel) E279S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S9.lits.getD 0 0) (by decide +kernel) E279S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S10.lits.getD 0 0) (by decide +kernel) E279S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S11.lits.getD 0 0) (by decide +kernel) E279S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S12.lits.getD 0 0) (by decide +kernel) E279S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S13.lits.getD 0 0) (by decide +kernel) E279S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S14.lits.getD 0 0) (by decide +kernel) E279S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S15.lits.getD 0 0) (by decide +kernel) E279S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S16.lits.getD 0 0) (by decide +kernel) E279S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E279S17.lits.getD 0 0) (by decide +kernel) E279S17.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 18 E1.E279M.lits hsplit (by decide +kernel)
    (by rw [show E1.E279M.lits.length = 7 by decide +kernel]; exact hmono)

/-- **E1 for `e279`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e279_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e279.CL c) (RT.cLB RT.Cls_e279.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e279.e279_sound hcls hext E1.C279X.lits (by rw [E1.C279X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C279X.len ▸ E1.C279X.okAll)) (glueChk_spec _ _ E1.C279X.okGlue)

end E1.E279

#print axioms E1.E279.e279_final
