module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e267
public import E1.ExtLeaf
public import E1.C267X
public import E1.E267M_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e267`, end to end: chain `C267X`, 0 external leaves (0 split, 0 monolithic in 0 chunks). -/
namespace E1.E267
open E1S E1.IP_e267

theorem hmono : extChk C 0 E1.E267M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 0, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  omega

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 0 E1.E267M.lits hsplit (by decide +kernel)
    (by rw [show E1.E267M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e267`, end to end** (`HC.E1Concl Em 16`), given the IP's class table -/
theorem e267_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e267.CL c) (RT.cLB RT.Cls_e267.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 16 → False :=
  E1.OK_e267.e267_sound hcls hext E1.C267X.lits (by rw [E1.C267X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C267X.len ▸ E1.C267X.okAll)) (glueChk_spec _ _ E1.C267X.okGlue)

end E1.E267

#print axioms E1.E267.e267_final
