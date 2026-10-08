module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e394
public import E1.ExtLeaf
public import E1.C394X
public import E1.E394M_Lits
public import E1.E394M_C0
public import E1.E394M_C1
public import L5.t.E394S0
public import L5.t.E394S1
public import L5.t.E394S2
public import L5.t.E394S3
public import L5.t.E394S4
public import L5.t.E394S5
public import L5.t.E394S6
public import L5.t.E394S7
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e394`, end to end: chain `C394X`, 10 external leaves (8 split, 2 monolithic in 2 chunks). -/
namespace E1.E394
open E1S E1.IP_e394

theorem hmono : extChk C 8 E1.E394M.lits 0 2 = true := by
  have h0 : extChk C 8 E1.E394M.lits 0 1 = true := E1.E394M.ok0
  have h1 : extChk C 8 E1.E394M.lits 0 2 = true := extChk_join C 8 E1.E394M.lits 0 1 1 h0 E1.E394M.ok1
  exact h1

theorem hsplit : ∀ k < 8, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S0.lits.getD 0 0) (by decide +kernel) E394S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S1.lits.getD 0 0) (by decide +kernel) E394S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S2.lits.getD 0 0) (by decide +kernel) E394S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S3.lits.getD 0 0) (by decide +kernel) E394S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S4.lits.getD 0 0) (by decide +kernel) E394S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S5.lits.getD 0 0) (by decide +kernel) E394S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S6.lits.getD 0 0) (by decide +kernel) E394S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E394S7.lits.getD 0 0) (by decide +kernel) E394S7.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 8 E1.E394M.lits hsplit (by decide +kernel)
    (by rw [show E1.E394M.lits.length = 2 by decide +kernel]; exact hmono)

/-- **E1 for `e394`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e394_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e394.CL c) (RT.cLB RT.Cls_e394.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e394.e394_sound hcls hext E1.C394X.lits (by rw [E1.C394X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C394X.len ▸ E1.C394X.okAll)) (glueChk_spec _ _ E1.C394X.okGlue)

end E1.E394

#print axioms E1.E394.e394_final
