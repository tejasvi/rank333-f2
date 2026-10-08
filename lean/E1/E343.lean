module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e343
public import E1.ExtLeaf
public import E1.C343X
public import E1.E343M_C0
public import E1.E343M_C1
public import E1.E343M_C2
public import E1.E343M_C3
public import L5.t.E343S0
public import L5.t.E343S1
public import L5.t.E343S2
public import L5.t.E343S3
public import L5.t.E343S4
public import L5.t.E343S5
public import L5.t.E343S6
public import L5.t.E343S7
public import L5.t.E343S8
public import L5.t.E343S9
public import L5.t.E343S10
public import L5.t.E343S11
public import L5.t.E343S12
public import L5.t.E343S13
public import L5.t.E343S14
public import L5.t.E343S15
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e343`, end to end: chain `C343X`, 20 external leaves (16 split, 4 monolithic in 4 chunks). -/
namespace E1.E343
open E1S E1.IP_e343

theorem hmono : extChk C 16 E1.E343M.lits 0 4 = true := by
  have h0 : extChk C 16 E1.E343M.lits 0 1 = true := E1.E343M.ok0
  have h1 : extChk C 16 E1.E343M.lits 0 2 = true := extChk_join C 16 E1.E343M.lits 0 1 1 h0 E1.E343M.ok1
  have h2 : extChk C 16 E1.E343M.lits 0 3 = true := extChk_join C 16 E1.E343M.lits 0 2 1 h1 E1.E343M.ok2
  have h3 : extChk C 16 E1.E343M.lits 0 4 = true := extChk_join C 16 E1.E343M.lits 0 3 1 h2 E1.E343M.ok3
  exact h3

theorem hsplit : ∀ k < 16, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S0.lits.getD 0 0) (by decide +kernel) E343S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S1.lits.getD 0 0) (by decide +kernel) E343S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S2.lits.getD 0 0) (by decide +kernel) E343S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S3.lits.getD 0 0) (by decide +kernel) E343S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S4.lits.getD 0 0) (by decide +kernel) E343S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S5.lits.getD 0 0) (by decide +kernel) E343S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S6.lits.getD 0 0) (by decide +kernel) E343S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S7.lits.getD 0 0) (by decide +kernel) E343S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S8.lits.getD 0 0) (by decide +kernel) E343S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S9.lits.getD 0 0) (by decide +kernel) E343S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S10.lits.getD 0 0) (by decide +kernel) E343S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S11.lits.getD 0 0) (by decide +kernel) E343S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S12.lits.getD 0 0) (by decide +kernel) E343S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S13.lits.getD 0 0) (by decide +kernel) E343S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S14.lits.getD 0 0) (by decide +kernel) E343S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E343S15.lits.getD 0 0) (by decide +kernel) E343S15.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 16 E1.E343M.lits hsplit (by decide +kernel)
    (by rw [show E1.E343M.lits.length = 4 by decide +kernel]; exact hmono)

/-- **E1 for `e343`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e343_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e343.CL c) (RT.cLB RT.Cls_e343.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e343.e343_sound hcls hext E1.C343X.lits (by rw [E1.C343X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C343X.len ▸ E1.C343X.okAll)) (glueChk_spec _ _ E1.C343X.okGlue)

end E1.E343

#print axioms E1.E343.e343_final
