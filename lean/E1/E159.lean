module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e159
public import E1.ExtLeaf
public import E1.C159X
public import E1.E159M_C0
public import L5.t.E159S0
public import L5.t.E159S1
public import L5.t.E159S2
public import L5.t.E159S3
public import L5.t.E159S4
public import L5.t.E159S5
public import L5.t.E159S6
public import L5.t.E159S7
public import L5.t.E159S8
public import L5.t.E159S9
public import L5.t.E159S10
public import L5.t.E159S11
public import L5.t.E159S12
public import L5.t.E159S13
public import L5.t.E159S14
public import L5.t.E159S15
public import L5.t.E159S16
public import L5.t.E159S17
public import L5.t.E159S18
public import L5.t.E159S19
public import L5.t.E159S20
public import L5.t.E159S21
public import L5.t.E159S22
public import L5.t.E159S23
public import L5.t.E159S24
public import L5.t.E159S25
public import L5.t.E159S26
public import L5.t.E159S27
public import L5.t.E159S28
public import L5.t.E159S29
public import L5.t.E159S30
public import L5.t.E159S31
public import L5.t.E159S32
public import L5.t.E159S33
public import L5.t.E159S34
public import L5.t.E159S35
public import L5.t.E159S36
public import L5.t.E159S37
public import L5.t.E159S38
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e159`, end to end: chain `C159X`, 40 external leaves (39 split, 1 monolithic in 1 chunks). -/
namespace E1.E159
open E1S E1.IP_e159

theorem hmono : extChk C 39 E1.E159M.lits 0 1 = true := by
  have h0 : extChk C 39 E1.E159M.lits 0 1 = true := E1.E159M.ok0
  exact h0

theorem hsplit : ∀ k < 39, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S0.lits.getD 0 0) (by decide +kernel) E159S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S1.lits.getD 0 0) (by decide +kernel) E159S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S2.lits.getD 0 0) (by decide +kernel) E159S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S3.lits.getD 0 0) (by decide +kernel) E159S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S4.lits.getD 0 0) (by decide +kernel) E159S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S5.lits.getD 0 0) (by decide +kernel) E159S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S6.lits.getD 0 0) (by decide +kernel) E159S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S7.lits.getD 0 0) (by decide +kernel) E159S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S8.lits.getD 0 0) (by decide +kernel) E159S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S9.lits.getD 0 0) (by decide +kernel) E159S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S10.lits.getD 0 0) (by decide +kernel) E159S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S11.lits.getD 0 0) (by decide +kernel) E159S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S12.lits.getD 0 0) (by decide +kernel) E159S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S13.lits.getD 0 0) (by decide +kernel) E159S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S14.lits.getD 0 0) (by decide +kernel) E159S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S15.lits.getD 0 0) (by decide +kernel) E159S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S16.lits.getD 0 0) (by decide +kernel) E159S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S17.lits.getD 0 0) (by decide +kernel) E159S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S18.lits.getD 0 0) (by decide +kernel) E159S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S19.lits.getD 0 0) (by decide +kernel) E159S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S20.lits.getD 0 0) (by decide +kernel) E159S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S21.lits.getD 0 0) (by decide +kernel) E159S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S22.lits.getD 0 0) (by decide +kernel) E159S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S23.lits.getD 0 0) (by decide +kernel) E159S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S24.lits.getD 0 0) (by decide +kernel) E159S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S25.lits.getD 0 0) (by decide +kernel) E159S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S26.lits.getD 0 0) (by decide +kernel) E159S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S27.lits.getD 0 0) (by decide +kernel) E159S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S28.lits.getD 0 0) (by decide +kernel) E159S28.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S29.lits.getD 0 0) (by decide +kernel) E159S29.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S30.lits.getD 0 0) (by decide +kernel) E159S30.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S31.lits.getD 0 0) (by decide +kernel) E159S31.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S32.lits.getD 0 0) (by decide +kernel) E159S32.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S33.lits.getD 0 0) (by decide +kernel) E159S33.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S34.lits.getD 0 0) (by decide +kernel) E159S34.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S35.lits.getD 0 0) (by decide +kernel) E159S35.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S36.lits.getD 0 0) (by decide +kernel) E159S36.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S37.lits.getD 0 0) (by decide +kernel) E159S37.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E159S38.lits.getD 0 0) (by decide +kernel) E159S38.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 39 E1.E159M.lits hsplit (by decide +kernel)
    (by rw [show E1.E159M.lits.length = 1 by decide +kernel]; exact hmono)

/-- **E1 for `e159`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e159_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e159.CL c) (RT.cLB RT.Cls_e159.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e159.e159_sound hcls hext E1.C159X.lits (by rw [E1.C159X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C159X.len ▸ E1.C159X.okAll)) (glueChk_spec _ _ E1.C159X.okGlue)

end E1.E159

#print axioms E1.E159.e159_final
