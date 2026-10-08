module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e291
public import E1.ExtLeaf
public import E1.C291X
public import E1.E291M_Lits
public import L5.t.E291S0
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e291`, end to end: chain `C291X`, 1 external leaves (1 split, 0 monolithic in 0 chunks). -/
namespace E1.E291
open E1S E1.IP_e291

theorem hmono : extChk C 1 E1.E291M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 1, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E291S0.lits.getD 0 0) (by decide +kernel) E291S0.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 1 E1.E291M.lits hsplit (by decide +kernel)
    (by rw [show E1.E291M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e291`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e291_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e291.CL c) (RT.cLB RT.Cls_e291.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e291.e291_sound hcls hext E1.C291X.lits (by rw [E1.C291X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C291X.len ▸ E1.C291X.okAll)) (glueChk_spec _ _ E1.C291X.okGlue)

end E1.E291

#print axioms E1.E291.e291_final
