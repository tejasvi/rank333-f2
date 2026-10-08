module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e185
public import E1.ExtLeaf
public import E1.C185X
public import E1.E185M_C0
public import E1.E185M_C1
public import E1.E185M_C2
public import E1.E185M_C3
public import E1.E185M_C4
public import E1.E185M_C5
public import E1.E185M_C6
public import E1.E185M_C7
public import L5.t.E185S0
public import L5.t.E185S1
public import L5.t.E185S2
public import L5.t.E185S3
public import L5.t.E185S4
public import L5.t.E185S5
public import L5.t.E185S6
public import L5.t.E185S7
public import L5.t.E185S8
public import L5.t.E185S9
public import L5.t.E185S10
public import L5.t.E185S11
public import L5.t.E185S12
public import L5.t.E185S13
public import L5.t.E185S14
public import L5.t.E185S15
public import L5.t.E185S16
public import L5.t.E185S17
public import L5.t.E185S18
public import L5.t.E185S19
public import L5.t.E185S20
public import L5.t.E185S21
public import L5.t.E185S22
public import L5.t.E185S23
public import L5.t.E185S24
public import L5.t.E185S25
public import L5.t.E185S26
public import L5.t.E185S27
public import L5.t.E185S28
public import L5.t.E185S29
public import L5.t.E185S30
public import L5.t.E185S31
public import L5.t.E185S32
public import L5.t.E185S33
public import L5.t.E185S34
public import L5.t.E185S35
public import L5.t.E185S36
public import L5.t.E185S37
public import L5.t.E185S38
public import L5.t.E185S39
public import L5.t.E185S40
public import L5.t.E185S41
public import L5.t.E185S42
public import L5.t.E185S43
public import L5.t.E185S44
public import L5.t.E185S45
public import L5.t.E185S46
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e185`, end to end: chain `C185X`, 55 external leaves (47 split, 8 monolithic in 8 chunks). -/
namespace E1.E185
open E1S E1.IP_e185

theorem hmono : extChk C 47 E1.E185M.lits 0 8 = true := by
  have h0 : extChk C 47 E1.E185M.lits 0 1 = true := E1.E185M.ok0
  have h1 : extChk C 47 E1.E185M.lits 0 2 = true := extChk_join C 47 E1.E185M.lits 0 1 1 h0 E1.E185M.ok1
  have h2 : extChk C 47 E1.E185M.lits 0 3 = true := extChk_join C 47 E1.E185M.lits 0 2 1 h1 E1.E185M.ok2
  have h3 : extChk C 47 E1.E185M.lits 0 4 = true := extChk_join C 47 E1.E185M.lits 0 3 1 h2 E1.E185M.ok3
  have h4 : extChk C 47 E1.E185M.lits 0 5 = true := extChk_join C 47 E1.E185M.lits 0 4 1 h3 E1.E185M.ok4
  have h5 : extChk C 47 E1.E185M.lits 0 6 = true := extChk_join C 47 E1.E185M.lits 0 5 1 h4 E1.E185M.ok5
  have h6 : extChk C 47 E1.E185M.lits 0 7 = true := extChk_join C 47 E1.E185M.lits 0 6 1 h5 E1.E185M.ok6
  have h7 : extChk C 47 E1.E185M.lits 0 8 = true := extChk_join C 47 E1.E185M.lits 0 7 1 h6 E1.E185M.ok7
  exact h7

theorem hsplit : ∀ k < 47, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S0.lits.getD 0 0) (by decide +kernel) E185S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S1.lits.getD 0 0) (by decide +kernel) E185S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S2.lits.getD 0 0) (by decide +kernel) E185S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S3.lits.getD 0 0) (by decide +kernel) E185S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S4.lits.getD 0 0) (by decide +kernel) E185S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S5.lits.getD 0 0) (by decide +kernel) E185S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S6.lits.getD 0 0) (by decide +kernel) E185S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S7.lits.getD 0 0) (by decide +kernel) E185S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S8.lits.getD 0 0) (by decide +kernel) E185S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S9.lits.getD 0 0) (by decide +kernel) E185S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S10.lits.getD 0 0) (by decide +kernel) E185S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S11.lits.getD 0 0) (by decide +kernel) E185S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S12.lits.getD 0 0) (by decide +kernel) E185S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S13.lits.getD 0 0) (by decide +kernel) E185S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S14.lits.getD 0 0) (by decide +kernel) E185S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S15.lits.getD 0 0) (by decide +kernel) E185S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S16.lits.getD 0 0) (by decide +kernel) E185S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S17.lits.getD 0 0) (by decide +kernel) E185S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S18.lits.getD 0 0) (by decide +kernel) E185S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S19.lits.getD 0 0) (by decide +kernel) E185S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S20.lits.getD 0 0) (by decide +kernel) E185S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S21.lits.getD 0 0) (by decide +kernel) E185S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S22.lits.getD 0 0) (by decide +kernel) E185S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S23.lits.getD 0 0) (by decide +kernel) E185S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S24.lits.getD 0 0) (by decide +kernel) E185S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S25.lits.getD 0 0) (by decide +kernel) E185S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S26.lits.getD 0 0) (by decide +kernel) E185S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S27.lits.getD 0 0) (by decide +kernel) E185S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S28.lits.getD 0 0) (by decide +kernel) E185S28.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S29.lits.getD 0 0) (by decide +kernel) E185S29.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S30.lits.getD 0 0) (by decide +kernel) E185S30.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S31.lits.getD 0 0) (by decide +kernel) E185S31.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S32.lits.getD 0 0) (by decide +kernel) E185S32.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S33.lits.getD 0 0) (by decide +kernel) E185S33.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S34.lits.getD 0 0) (by decide +kernel) E185S34.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S35.lits.getD 0 0) (by decide +kernel) E185S35.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S36.lits.getD 0 0) (by decide +kernel) E185S36.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S37.lits.getD 0 0) (by decide +kernel) E185S37.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S38.lits.getD 0 0) (by decide +kernel) E185S38.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S39.lits.getD 0 0) (by decide +kernel) E185S39.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S40.lits.getD 0 0) (by decide +kernel) E185S40.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S41.lits.getD 0 0) (by decide +kernel) E185S41.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S42.lits.getD 0 0) (by decide +kernel) E185S42.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S43.lits.getD 0 0) (by decide +kernel) E185S43.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S44.lits.getD 0 0) (by decide +kernel) E185S44.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S45.lits.getD 0 0) (by decide +kernel) E185S45.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E185S46.lits.getD 0 0) (by decide +kernel) E185S46.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 47 E1.E185M.lits hsplit (by decide +kernel)
    (by rw [show E1.E185M.lits.length = 8 by decide +kernel]; exact hmono)

/-- **E1 for `e185`, end to end** (`HC.E1Concl Em 16`), given the IP's class table -/
theorem e185_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e185.CL c) (RT.cLB RT.Cls_e185.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 16 → False :=
  E1.OK_e185.e185_sound hcls hext E1.C185X.lits (by rw [E1.C185X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C185X.len ▸ E1.C185X.okAll)) (glueChk_spec _ _ E1.C185X.okGlue)

end E1.E185

#print axioms E1.E185.e185_final
