module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e390
public import E1.ExtLeaf
public import E1.C390X
public import E1.E390M_Lits
public import E1.E390M_C0
public import L5.t.E390S0
public import L5.t.E390S1
public import L5.t.E390S2
public import L5.t.E390S3
public import L5.t.E390S4
public import L5.t.E390S5
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e390`, end to end: chain `C390X`, 7 external leaves (6 split, 1 monolithic in 1 chunks). -/
namespace E1.E390
open E1S E1.IP_e390

theorem hmono : extChk C 6 E1.E390M.lits 0 1 = true := by
  have h0 : extChk C 6 E1.E390M.lits 0 1 = true := E1.E390M.ok0
  exact h0

theorem hsplit : ∀ k < 6, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E390S0.lits.getD 0 0) (by decide +kernel) E390S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E390S1.lits.getD 0 0) (by decide +kernel) E390S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E390S2.lits.getD 0 0) (by decide +kernel) E390S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E390S3.lits.getD 0 0) (by decide +kernel) E390S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E390S4.lits.getD 0 0) (by decide +kernel) E390S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E390S5.lits.getD 0 0) (by decide +kernel) E390S5.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 6 E1.E390M.lits hsplit (by decide +kernel)
    (by rw [show E1.E390M.lits.length = 1 by decide +kernel]; exact hmono)

/-- **E1 for `e390`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e390_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e390.CL c) (RT.cLB RT.Cls_e390.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e390.e390_sound hcls hext E1.C390X.lits (by rw [E1.C390X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C390X.len ▸ E1.C390X.okAll)) (glueChk_spec _ _ E1.C390X.okGlue)

end E1.E390

#print axioms E1.E390.e390_final
