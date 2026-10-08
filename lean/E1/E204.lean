module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e204
public import E1.ExtLeaf
public import E1.C204X
public import E1.E204M_Lits
public import L5.t.E204S0
public import L5.t.E204S1
public import L5.t.E204S2
public import L5.t.E204S3
public import L5.t.E204S4
public import L5.t.E204S5
public import L5.t.E204S6
public import L5.t.E204S7
public import L5.t.E204S8
public import L5.t.E204S9
public import L5.t.E204S10
public import L5.t.E204S11
public import L5.t.E204S12
public import L5.t.E204S13
public import L5.t.E204S14
public import L5.t.E204S15
public import L5.t.E204S16
public import L5.t.E204S17
public import L5.t.E204S18
public import L5.t.E204S19
public import L5.t.E204S20
public import L5.t.E204S21
public import L5.t.E204S22
public import L5.t.E204S23
public import L5.t.E204S24
public import L5.t.E204S25
public import L5.t.E204S26
public import L5.t.E204S27
public import L5.t.E204S28
public import L5.t.E204S29
public import L5.t.E204S30
public import L5.t.E204S31
public import L5.t.E204S32
public import L5.t.E204S33
public import L5.t.E204S34
public import L5.t.E204S35
public import L5.t.E204S36
public import L5.t.E204S37
public import L5.t.E204S38
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e204`, end to end: chain `C204X`, 39 external leaves (39 split, 0 monolithic in 0 chunks). -/
namespace E1.E204
open E1S E1.IP_e204

theorem hmono : extChk C 39 E1.E204M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 39, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S0.lits.getD 0 0) (by decide +kernel) E204S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S1.lits.getD 0 0) (by decide +kernel) E204S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S2.lits.getD 0 0) (by decide +kernel) E204S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S3.lits.getD 0 0) (by decide +kernel) E204S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S4.lits.getD 0 0) (by decide +kernel) E204S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S5.lits.getD 0 0) (by decide +kernel) E204S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S6.lits.getD 0 0) (by decide +kernel) E204S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S7.lits.getD 0 0) (by decide +kernel) E204S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S8.lits.getD 0 0) (by decide +kernel) E204S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S9.lits.getD 0 0) (by decide +kernel) E204S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S10.lits.getD 0 0) (by decide +kernel) E204S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S11.lits.getD 0 0) (by decide +kernel) E204S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S12.lits.getD 0 0) (by decide +kernel) E204S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S13.lits.getD 0 0) (by decide +kernel) E204S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S14.lits.getD 0 0) (by decide +kernel) E204S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S15.lits.getD 0 0) (by decide +kernel) E204S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S16.lits.getD 0 0) (by decide +kernel) E204S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S17.lits.getD 0 0) (by decide +kernel) E204S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S18.lits.getD 0 0) (by decide +kernel) E204S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S19.lits.getD 0 0) (by decide +kernel) E204S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S20.lits.getD 0 0) (by decide +kernel) E204S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S21.lits.getD 0 0) (by decide +kernel) E204S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S22.lits.getD 0 0) (by decide +kernel) E204S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S23.lits.getD 0 0) (by decide +kernel) E204S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S24.lits.getD 0 0) (by decide +kernel) E204S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S25.lits.getD 0 0) (by decide +kernel) E204S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S26.lits.getD 0 0) (by decide +kernel) E204S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S27.lits.getD 0 0) (by decide +kernel) E204S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S28.lits.getD 0 0) (by decide +kernel) E204S28.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S29.lits.getD 0 0) (by decide +kernel) E204S29.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S30.lits.getD 0 0) (by decide +kernel) E204S30.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S31.lits.getD 0 0) (by decide +kernel) E204S31.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S32.lits.getD 0 0) (by decide +kernel) E204S32.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S33.lits.getD 0 0) (by decide +kernel) E204S33.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S34.lits.getD 0 0) (by decide +kernel) E204S34.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S35.lits.getD 0 0) (by decide +kernel) E204S35.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S36.lits.getD 0 0) (by decide +kernel) E204S36.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S37.lits.getD 0 0) (by decide +kernel) E204S37.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E204S38.lits.getD 0 0) (by decide +kernel) E204S38.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 39 E1.E204M.lits hsplit (by decide +kernel)
    (by rw [show E1.E204M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e204`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e204_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e204.CL c) (RT.cLB RT.Cls_e204.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e204.e204_sound hcls hext E1.C204X.lits (by rw [E1.C204X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C204X.len ▸ E1.C204X.okAll)) (glueChk_spec _ _ E1.C204X.okGlue)

end E1.E204

#print axioms E1.E204.e204_final
