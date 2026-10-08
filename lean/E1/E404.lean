module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e404
public import E1.ExtLeaf
public import E1.C404X
public import E1.E404M_Lits
public import E1.E404M_C0
public import E1.E404M_C1
public import E1.E404M_C2
public import E1.E404M_C3
public import L5.t.E404S0
public import L5.t.E404S1
public import L5.t.E404S2
public import L5.t.E404S3
public import L5.t.E404S4
public import L5.t.E404S5
public import L5.t.E404S6
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e404`, end to end: chain `C404X`, 11 external leaves (7 split, 4 monolithic in 4 chunks). -/
namespace E1.E404
open E1S E1.IP_e404

theorem hmono : extChk C 7 E1.E404M.lits 0 4 = true := by
  have h0 : extChk C 7 E1.E404M.lits 0 1 = true := E1.E404M.ok0
  have h1 : extChk C 7 E1.E404M.lits 0 2 = true := extChk_join C 7 E1.E404M.lits 0 1 1 h0 E1.E404M.ok1
  have h2 : extChk C 7 E1.E404M.lits 0 3 = true := extChk_join C 7 E1.E404M.lits 0 2 1 h1 E1.E404M.ok2
  have h3 : extChk C 7 E1.E404M.lits 0 4 = true := extChk_join C 7 E1.E404M.lits 0 3 1 h2 E1.E404M.ok3
  exact h3

theorem hsplit : ∀ k < 7, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S0.lits.getD 0 0) (by decide +kernel) E404S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S1.lits.getD 0 0) (by decide +kernel) E404S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S2.lits.getD 0 0) (by decide +kernel) E404S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S3.lits.getD 0 0) (by decide +kernel) E404S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S4.lits.getD 0 0) (by decide +kernel) E404S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S5.lits.getD 0 0) (by decide +kernel) E404S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E404S6.lits.getD 0 0) (by decide +kernel) E404S6.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 7 E1.E404M.lits hsplit (by decide +kernel)
    (by rw [show E1.E404M.lits.length = 4 by decide +kernel]; exact hmono)

/-- **E1 for `e404`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e404_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e404.CL c) (RT.cLB RT.Cls_e404.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e404.e404_sound hcls hext E1.C404X.lits (by rw [E1.C404X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C404X.len ▸ E1.C404X.okAll)) (glueChk_spec _ _ E1.C404X.okGlue)

end E1.E404

#print axioms E1.E404.e404_final
