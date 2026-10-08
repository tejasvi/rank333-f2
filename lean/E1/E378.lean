module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e378
public import E1.ExtLeaf
public import E1.C378X
public import E1.E378M_Lits
public import E1.E378M_C0
public import E1.E378M_C1
public import E1.E378M_C2
public import E1.E378M_C3
public import E1.E378M_C4
public import E1.E378M_C5
public import E1.E378M_C6
public import L5.t.E378S0
public import L5.t.E378S1
public import L5.t.E378S2
public import L5.t.E378S3
public import L5.t.E378S4
public import L5.t.E378S5
public import L5.t.E378S6
public import L5.t.E378S7
public import L5.t.E378S8
public import L5.t.E378S9
public import L5.t.E378S10
public import L5.t.E378S11
public import L5.t.E378S12
public import L5.t.E378S13
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e378`, end to end: chain `C378X`, 21 external leaves (14 split, 7 monolithic in 7 chunks). -/
namespace E1.E378
open E1S E1.IP_e378

theorem hmono : extChk C 14 E1.E378M.lits 0 7 = true := by
  have h0 : extChk C 14 E1.E378M.lits 0 1 = true := E1.E378M.ok0
  have h1 : extChk C 14 E1.E378M.lits 0 2 = true := extChk_join C 14 E1.E378M.lits 0 1 1 h0 E1.E378M.ok1
  have h2 : extChk C 14 E1.E378M.lits 0 3 = true := extChk_join C 14 E1.E378M.lits 0 2 1 h1 E1.E378M.ok2
  have h3 : extChk C 14 E1.E378M.lits 0 4 = true := extChk_join C 14 E1.E378M.lits 0 3 1 h2 E1.E378M.ok3
  have h4 : extChk C 14 E1.E378M.lits 0 5 = true := extChk_join C 14 E1.E378M.lits 0 4 1 h3 E1.E378M.ok4
  have h5 : extChk C 14 E1.E378M.lits 0 6 = true := extChk_join C 14 E1.E378M.lits 0 5 1 h4 E1.E378M.ok5
  have h6 : extChk C 14 E1.E378M.lits 0 7 = true := extChk_join C 14 E1.E378M.lits 0 6 1 h5 E1.E378M.ok6
  exact h6

theorem hsplit : ∀ k < 14, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S0.lits.getD 0 0) (by decide +kernel) E378S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S1.lits.getD 0 0) (by decide +kernel) E378S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S2.lits.getD 0 0) (by decide +kernel) E378S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S3.lits.getD 0 0) (by decide +kernel) E378S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S4.lits.getD 0 0) (by decide +kernel) E378S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S5.lits.getD 0 0) (by decide +kernel) E378S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S6.lits.getD 0 0) (by decide +kernel) E378S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S7.lits.getD 0 0) (by decide +kernel) E378S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S8.lits.getD 0 0) (by decide +kernel) E378S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S9.lits.getD 0 0) (by decide +kernel) E378S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S10.lits.getD 0 0) (by decide +kernel) E378S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S11.lits.getD 0 0) (by decide +kernel) E378S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S12.lits.getD 0 0) (by decide +kernel) E378S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E378S13.lits.getD 0 0) (by decide +kernel) E378S13.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 14 E1.E378M.lits hsplit (by decide +kernel)
    (by rw [show E1.E378M.lits.length = 7 by decide +kernel]; exact hmono)

/-- **E1 for `e378`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e378_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e378.CL c) (RT.cLB RT.Cls_e378.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e378.e378_sound hcls hext E1.C378X.lits (by rw [E1.C378X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C378X.len ▸ E1.C378X.okAll)) (glueChk_spec _ _ E1.C378X.okGlue)

end E1.E378

#print axioms E1.E378.e378_final
