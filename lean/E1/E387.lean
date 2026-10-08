module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e387
public import E1.ExtLeaf
public import E1.C387X
public import E1.E387M_Lits
public import E1.E387M_C0
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e387`, end to end: chain `C387X`, 1 external leaves (0 split, 1 monolithic in 1 chunks). -/
namespace E1.E387
open E1S E1.IP_e387

theorem hmono : extChk C 0 E1.E387M.lits 0 1 = true := by
  have h0 : extChk C 0 E1.E387M.lits 0 1 = true := E1.E387M.ok0
  exact h0

theorem hsplit : ∀ k < 0, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  omega

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 0 E1.E387M.lits hsplit (by decide +kernel)
    (by rw [show E1.E387M.lits.length = 1 by decide +kernel]; exact hmono)

/-- **E1 for `e387`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e387_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e387.CL c) (RT.cLB RT.Cls_e387.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e387.e387_sound hcls hext E1.C387X.lits (by rw [E1.C387X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C387X.len ▸ E1.C387X.okAll)) (glueChk_spec _ _ E1.C387X.okGlue)

end E1.E387

#print axioms E1.E387.e387_final
