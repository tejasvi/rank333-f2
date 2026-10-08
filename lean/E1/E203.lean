module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e203
public import E1.ExtLeaf
public import E1.C203X
public import E1.E203M_Lits
public import L5.t.E203S0
public import L5.t.E203S1
public import L5.t.E203S2
public import L5.t.E203S3
public import L5.t.E203S4
public import L5.t.E203S5
public import L5.t.E203S6
public import L5.t.E203S7
public import L5.t.E203S8
public import L5.t.E203S9
public import L5.t.E203S10
public import L5.t.E203S11
public import L5.t.E203S12
public import L5.t.E203S13
public import L5.t.E203S14
public import L5.t.E203S15
public import L5.t.E203S16
public import L5.t.E203S17
public import L5.t.E203S18
public import L5.t.E203S19
public import L5.t.E203S20
public import L5.t.E203S21
public import L5.t.E203S22
public import L5.t.E203S23
public import L5.t.E203S24
public import L5.t.E203S25
public import L5.t.E203S26
public import L5.t.E203S27
public import L5.t.E203S28
public import L5.t.E203S29
public import L5.t.E203S30
public import L5.t.E203S31
public import L5.t.E203S32
public import L5.t.E203S33
public import L5.t.E203S34
public import L5.t.E203S35
public import L5.t.E203S36
public import L5.t.E203S37
public import L5.t.E203S38
public import L5.t.E203S39
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e203`, end to end: chain `C203X`, 40 external leaves (40 split, 0 monolithic in 0 chunks). -/
namespace E1.E203
open E1S E1.IP_e203

theorem hmono : extChk C 40 E1.E203M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 40, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S0.lits.getD 0 0) (by decide +kernel) E203S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S1.lits.getD 0 0) (by decide +kernel) E203S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S2.lits.getD 0 0) (by decide +kernel) E203S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S3.lits.getD 0 0) (by decide +kernel) E203S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S4.lits.getD 0 0) (by decide +kernel) E203S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S5.lits.getD 0 0) (by decide +kernel) E203S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S6.lits.getD 0 0) (by decide +kernel) E203S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S7.lits.getD 0 0) (by decide +kernel) E203S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S8.lits.getD 0 0) (by decide +kernel) E203S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S9.lits.getD 0 0) (by decide +kernel) E203S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S10.lits.getD 0 0) (by decide +kernel) E203S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S11.lits.getD 0 0) (by decide +kernel) E203S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S12.lits.getD 0 0) (by decide +kernel) E203S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S13.lits.getD 0 0) (by decide +kernel) E203S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S14.lits.getD 0 0) (by decide +kernel) E203S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S15.lits.getD 0 0) (by decide +kernel) E203S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S16.lits.getD 0 0) (by decide +kernel) E203S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S17.lits.getD 0 0) (by decide +kernel) E203S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S18.lits.getD 0 0) (by decide +kernel) E203S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S19.lits.getD 0 0) (by decide +kernel) E203S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S20.lits.getD 0 0) (by decide +kernel) E203S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S21.lits.getD 0 0) (by decide +kernel) E203S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S22.lits.getD 0 0) (by decide +kernel) E203S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S23.lits.getD 0 0) (by decide +kernel) E203S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S24.lits.getD 0 0) (by decide +kernel) E203S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S25.lits.getD 0 0) (by decide +kernel) E203S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S26.lits.getD 0 0) (by decide +kernel) E203S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S27.lits.getD 0 0) (by decide +kernel) E203S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S28.lits.getD 0 0) (by decide +kernel) E203S28.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S29.lits.getD 0 0) (by decide +kernel) E203S29.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S30.lits.getD 0 0) (by decide +kernel) E203S30.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S31.lits.getD 0 0) (by decide +kernel) E203S31.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S32.lits.getD 0 0) (by decide +kernel) E203S32.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S33.lits.getD 0 0) (by decide +kernel) E203S33.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S34.lits.getD 0 0) (by decide +kernel) E203S34.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S35.lits.getD 0 0) (by decide +kernel) E203S35.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S36.lits.getD 0 0) (by decide +kernel) E203S36.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S37.lits.getD 0 0) (by decide +kernel) E203S37.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S38.lits.getD 0 0) (by decide +kernel) E203S38.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E203S39.lits.getD 0 0) (by decide +kernel) E203S39.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 40 E1.E203M.lits hsplit (by decide +kernel)
    (by rw [show E1.E203M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e203`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e203_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e203.CL c) (RT.cLB RT.Cls_e203.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e203.e203_sound hcls hext E1.C203X.lits (by rw [E1.C203X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C203X.len ▸ E1.C203X.okAll)) (glueChk_spec _ _ E1.C203X.okGlue)

end E1.E203

#print axioms E1.E203.e203_final
