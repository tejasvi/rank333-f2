module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e382
public import E1.ExtLeaf
public import E1.C382X
public import E1.E382M_Lits
public import E1.E382M_C0
public import E1.E382M_C1
public import L5.t.E382S0
public import L5.t.E382S1
public import L5.t.E382S2
public import L5.t.E382S3
public import L5.t.E382S4
public import L5.t.E382S5
public import L5.t.E382S6
public import L5.t.E382S7
public import L5.t.E382S8
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e382`, end to end: chain `C382X`, 11 external leaves (9 split, 2 monolithic in 2 chunks). -/
namespace E1.E382
open E1S E1.IP_e382

theorem hmono : extChk C 9 E1.E382M.lits 0 2 = true := by
  have h0 : extChk C 9 E1.E382M.lits 0 1 = true := E1.E382M.ok0
  have h1 : extChk C 9 E1.E382M.lits 0 2 = true := extChk_join C 9 E1.E382M.lits 0 1 1 h0 E1.E382M.ok1
  exact h1

theorem hsplit : ∀ k < 9, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S0.lits.getD 0 0) (by decide +kernel) E382S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S1.lits.getD 0 0) (by decide +kernel) E382S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S2.lits.getD 0 0) (by decide +kernel) E382S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S3.lits.getD 0 0) (by decide +kernel) E382S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S4.lits.getD 0 0) (by decide +kernel) E382S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S5.lits.getD 0 0) (by decide +kernel) E382S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S6.lits.getD 0 0) (by decide +kernel) E382S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S7.lits.getD 0 0) (by decide +kernel) E382S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E382S8.lits.getD 0 0) (by decide +kernel) E382S8.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 9 E1.E382M.lits hsplit (by decide +kernel)
    (by rw [show E1.E382M.lits.length = 2 by decide +kernel]; exact hmono)

/-- **E1 for `e382`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e382_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e382.CL c) (RT.cLB RT.Cls_e382.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e382.e382_sound hcls hext E1.C382X.lits (by rw [E1.C382X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C382X.len ▸ E1.C382X.okAll)) (glueChk_spec _ _ E1.C382X.okGlue)

end E1.E382

#print axioms E1.E382.e382_final
