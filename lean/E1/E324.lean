module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e324
public import E1.ExtLeaf
public import E1.C324X
public import E1.E324M_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e324`, end to end: chain `C324X`, 0 external leaves (0 split, 0 monolithic in 0 chunks). -/
namespace E1.E324
open E1S E1.IP_e324

theorem hmono : extChk C 0 E1.E324M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 0, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  omega

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 0 E1.E324M.lits hsplit (by decide +kernel)
    (by rw [show E1.E324M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e324`, end to end** (`HC.E1Concl Em 16`), given the IP's class table -/
theorem e324_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e324.CL c) (RT.cLB RT.Cls_e324.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 16 → False :=
  E1.OK_e324.e324_sound hcls hext E1.C324X.lits (by rw [E1.C324X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C324X.len ▸ E1.C324X.okAll)) (glueChk_spec _ _ E1.C324X.okGlue)

end E1.E324

#print axioms E1.E324.e324_final
