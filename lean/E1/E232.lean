module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e232
public import E1.ExtLeaf
public import E1.C232X
public import E1.E232M_Lits
public import L5.t.E232S0
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e232`, end to end: chain `C232X`, 1 external leaves (1 split, 0 monolithic in 0 chunks). -/
namespace E1.E232
open E1S E1.IP_e232

theorem hmono : extChk C 1 E1.E232M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 1, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E232S0.lits.getD 0 0) (by decide +kernel) E232S0.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 1 E1.E232M.lits hsplit (by decide +kernel)
    (by rw [show E1.E232M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e232`, end to end** (`HC.E1Concl Em 16`), given the IP's class table -/
theorem e232_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e232.CL c) (RT.cLB RT.Cls_e232.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 16 → False :=
  E1.OK_e232.e232_sound hcls hext E1.C232X.lits (by rw [E1.C232X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C232X.len ▸ E1.C232X.okAll)) (glueChk_spec _ _ E1.C232X.okGlue)

end E1.E232

#print axioms E1.E232.e232_final
