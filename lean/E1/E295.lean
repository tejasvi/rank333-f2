module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e295
public import E1.ExtLeaf
public import E1.C295X
public import E1.E295M_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e295`, end to end: chain `C295X`, 0 external leaves (0 split, 0 monolithic in 0 chunks). -/
namespace E1.E295
open E1S E1.IP_e295

theorem hmono : extChk C 0 E1.E295M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 0, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  omega

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 0 E1.E295M.lits hsplit (by decide +kernel)
    (by rw [show E1.E295M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e295`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e295_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e295.CL c) (RT.cLB RT.Cls_e295.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e295.e295_sound hcls hext E1.C295X.lits (by rw [E1.C295X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C295X.len ▸ E1.C295X.okAll)) (glueChk_spec _ _ E1.C295X.okGlue)

end E1.E295

#print axioms E1.E295.e295_final
