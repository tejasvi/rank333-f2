module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e311
public import E1.ExtLeaf
public import E1.C311X
public import E1.E311M_C0
public import L5.t.E311S0
public import L5.t.E311S1
public import L5.t.E311S2
public import L5.t.E311S3
public import L5.t.E311S4
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e311`, end to end: chain `C311X`, 6 external leaves (5 split, 1 monolithic in 1 chunks). -/
namespace E1.E311
open E1S E1.IP_e311

theorem hmono : extChk C 5 E1.E311M.lits 0 1 = true := by
  have h0 : extChk C 5 E1.E311M.lits 0 1 = true := E1.E311M.ok0
  exact h0

theorem hsplit : ∀ k < 5, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E311S0.lits.getD 0 0) (by decide +kernel) E311S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E311S1.lits.getD 0 0) (by decide +kernel) E311S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E311S2.lits.getD 0 0) (by decide +kernel) E311S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E311S3.lits.getD 0 0) (by decide +kernel) E311S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E311S4.lits.getD 0 0) (by decide +kernel) E311S4.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 5 E1.E311M.lits hsplit (by decide +kernel)
    (by rw [show E1.E311M.lits.length = 1 by decide +kernel]; exact hmono)

/-- **E1 for `e311`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e311_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e311.CL c) (RT.cLB RT.Cls_e311.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e311.e311_sound hcls hext E1.C311X.lits (by rw [E1.C311X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C311X.len ▸ E1.C311X.okAll)) (glueChk_spec _ _ E1.C311X.okGlue)

end E1.E311

#print axioms E1.E311.e311_final
