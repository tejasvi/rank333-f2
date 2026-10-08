module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e408
public import E1.ExtLeaf
public import E1.C408X
public import E1.E408M_Lits
public import E1.E408M_C0
public import L5.t.E408S0
public import L5.t.E408S1
public import L5.t.E408S2
public import L5.t.E408S3
public import L5.t.E408S4
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e408`, end to end: chain `C408X`, 6 external leaves (5 split, 1 monolithic in 1 chunks). -/
namespace E1.E408
open E1S E1.IP_e408

theorem hmono : extChk C 5 E1.E408M.lits 0 1 = true := by
  have h0 : extChk C 5 E1.E408M.lits 0 1 = true := E1.E408M.ok0
  exact h0

theorem hsplit : ∀ k < 5, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E408S0.lits.getD 0 0) (by decide +kernel) E408S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E408S1.lits.getD 0 0) (by decide +kernel) E408S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E408S2.lits.getD 0 0) (by decide +kernel) E408S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E408S3.lits.getD 0 0) (by decide +kernel) E408S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E408S4.lits.getD 0 0) (by decide +kernel) E408S4.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 5 E1.E408M.lits hsplit (by decide +kernel)
    (by rw [show E1.E408M.lits.length = 1 by decide +kernel]; exact hmono)

/-- **E1 for `e408`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e408_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e408.CL c) (RT.cLB RT.Cls_e408.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e408.e408_sound hcls hext E1.C408X.lits (by rw [E1.C408X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C408X.len ▸ E1.C408X.okAll)) (glueChk_spec _ _ E1.C408X.okGlue)

end E1.E408

#print axioms E1.E408.e408_final
