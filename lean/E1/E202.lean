module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e202
public import E1.ExtLeaf
public import E1.C202X
public import E1.E202M_C0
public import E1.E202M_C1
public import E1.E202M_C2
public import E1.E202M_C3
public import L5.t.E202S0
public import L5.t.E202S1
public import L5.t.E202S2
public import L5.t.E202S3
public import L5.t.E202S4
public import L5.t.E202S5
public import L5.t.E202S6
public import L5.t.E202S7
public import L5.t.E202S8
public import L5.t.E202S9
public import L5.t.E202S10
public import L5.t.E202S11
public import L5.t.E202S12
public import L5.t.E202S13
public import L5.t.E202S14
public import L5.t.E202S15
public import L5.t.E202S16
public import L5.t.E202S17
public import L5.t.E202S18
public import L5.t.E202S19
public import L5.t.E202S20
public import L5.t.E202S21
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e202`, end to end: chain `C202X`, 26 external leaves (22 split, 4 monolithic in 4 chunks). -/
namespace E1.E202
open E1S E1.IP_e202

theorem hmono : extChk C 22 E1.E202M.lits 0 4 = true := by
  have h0 : extChk C 22 E1.E202M.lits 0 1 = true := E1.E202M.ok0
  have h1 : extChk C 22 E1.E202M.lits 0 2 = true := extChk_join C 22 E1.E202M.lits 0 1 1 h0 E1.E202M.ok1
  have h2 : extChk C 22 E1.E202M.lits 0 3 = true := extChk_join C 22 E1.E202M.lits 0 2 1 h1 E1.E202M.ok2
  have h3 : extChk C 22 E1.E202M.lits 0 4 = true := extChk_join C 22 E1.E202M.lits 0 3 1 h2 E1.E202M.ok3
  exact h3

theorem hsplit : ∀ k < 22, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S0.lits.getD 0 0) (by decide +kernel) E202S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S1.lits.getD 0 0) (by decide +kernel) E202S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S2.lits.getD 0 0) (by decide +kernel) E202S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S3.lits.getD 0 0) (by decide +kernel) E202S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S4.lits.getD 0 0) (by decide +kernel) E202S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S5.lits.getD 0 0) (by decide +kernel) E202S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S6.lits.getD 0 0) (by decide +kernel) E202S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S7.lits.getD 0 0) (by decide +kernel) E202S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S8.lits.getD 0 0) (by decide +kernel) E202S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S9.lits.getD 0 0) (by decide +kernel) E202S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S10.lits.getD 0 0) (by decide +kernel) E202S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S11.lits.getD 0 0) (by decide +kernel) E202S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S12.lits.getD 0 0) (by decide +kernel) E202S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S13.lits.getD 0 0) (by decide +kernel) E202S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S14.lits.getD 0 0) (by decide +kernel) E202S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S15.lits.getD 0 0) (by decide +kernel) E202S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S16.lits.getD 0 0) (by decide +kernel) E202S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S17.lits.getD 0 0) (by decide +kernel) E202S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S18.lits.getD 0 0) (by decide +kernel) E202S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S19.lits.getD 0 0) (by decide +kernel) E202S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S20.lits.getD 0 0) (by decide +kernel) E202S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E202S21.lits.getD 0 0) (by decide +kernel) E202S21.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 22 E1.E202M.lits hsplit (by decide +kernel)
    (by rw [show E1.E202M.lits.length = 4 by decide +kernel]; exact hmono)

/-- **E1 for `e202`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e202_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e202.CL c) (RT.cLB RT.Cls_e202.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e202.e202_sound hcls hext E1.C202X.lits (by rw [E1.C202X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C202X.len ▸ E1.C202X.okAll)) (glueChk_spec _ _ E1.C202X.okGlue)

end E1.E202

#print axioms E1.E202.e202_final
