module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e237
public import E1.ExtLeaf
public import E1.C237X
public import E1.E237M_Lits
public import E1.E237M_C0
public import E1.E237M_C1
public import E1.E237M_C2
public import E1.E237M_C3
public import L5.t.E237S0
public import L5.t.E237S1
public import L5.t.E237S2
public import L5.t.E237S3
public import L5.t.E237S4
public import L5.t.E237S5
public import L5.t.E237S6
public import L5.t.E237S7
public import L5.t.E237S8
public import L5.t.E237S9
public import L5.t.E237S10
public import L5.t.E237S11
public import L5.t.E237S12
public import L5.t.E237S13
public import L5.t.E237S14
public import L5.t.E237S15
public import L5.t.E237S16
public import L5.t.E237S17
public import L5.t.E237S18
public import L5.t.E237S19
public import L5.t.E237S20
public import L5.t.E237S21
public import L5.t.E237S22
public import L5.t.E237S23
public import L5.t.E237S24
public import L5.t.E237S25
public import L5.t.E237S26
public import L5.t.E237S27
public import L5.t.E237S28
public import L5.t.E237S29
public import L5.t.E237S30
public import L5.t.E237S31
public import L5.t.E237S32
public import L5.t.E237S33
public import L5.t.E237S34
public import L5.t.E237S35
public import L5.t.E237S36
public import L5.t.E237S37
public import L5.t.E237S38
public import L5.t.E237S39
public import L5.t.E237S40
public import L5.t.E237S41
public import L5.t.E237S42
public import L5.t.E237S43
public import L5.t.E237S44
public import L5.t.E237S45
public import L5.t.E237S46
public import L5.t.E237S47
public import L5.t.E237S48
public import L5.t.E237S49
public import L5.t.E237S50
public import L5.t.E237S51
public import L5.t.E237S52
public import L5.t.E237S53
public import L5.t.E237S54
public import L5.t.E237S55
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e237`, end to end: chain `C237X`, 60 external leaves (56 split, 4 monolithic in 4 chunks). -/
namespace E1.E237
open E1S E1.IP_e237

theorem hmono : extChk C 56 E1.E237M.lits 0 4 = true := by
  have h0 : extChk C 56 E1.E237M.lits 0 1 = true := E1.E237M.ok0
  have h1 : extChk C 56 E1.E237M.lits 0 2 = true := extChk_join C 56 E1.E237M.lits 0 1 1 h0 E1.E237M.ok1
  have h2 : extChk C 56 E1.E237M.lits 0 3 = true := extChk_join C 56 E1.E237M.lits 0 2 1 h1 E1.E237M.ok2
  have h3 : extChk C 56 E1.E237M.lits 0 4 = true := extChk_join C 56 E1.E237M.lits 0 3 1 h2 E1.E237M.ok3
  exact h3

theorem hsplit : ∀ k < 56, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S0.lits.getD 0 0) (by decide +kernel) E237S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S1.lits.getD 0 0) (by decide +kernel) E237S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S2.lits.getD 0 0) (by decide +kernel) E237S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S3.lits.getD 0 0) (by decide +kernel) E237S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S4.lits.getD 0 0) (by decide +kernel) E237S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S5.lits.getD 0 0) (by decide +kernel) E237S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S6.lits.getD 0 0) (by decide +kernel) E237S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S7.lits.getD 0 0) (by decide +kernel) E237S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S8.lits.getD 0 0) (by decide +kernel) E237S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S9.lits.getD 0 0) (by decide +kernel) E237S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S10.lits.getD 0 0) (by decide +kernel) E237S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S11.lits.getD 0 0) (by decide +kernel) E237S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S12.lits.getD 0 0) (by decide +kernel) E237S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S13.lits.getD 0 0) (by decide +kernel) E237S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S14.lits.getD 0 0) (by decide +kernel) E237S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S15.lits.getD 0 0) (by decide +kernel) E237S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S16.lits.getD 0 0) (by decide +kernel) E237S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S17.lits.getD 0 0) (by decide +kernel) E237S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S18.lits.getD 0 0) (by decide +kernel) E237S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S19.lits.getD 0 0) (by decide +kernel) E237S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S20.lits.getD 0 0) (by decide +kernel) E237S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S21.lits.getD 0 0) (by decide +kernel) E237S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S22.lits.getD 0 0) (by decide +kernel) E237S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S23.lits.getD 0 0) (by decide +kernel) E237S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S24.lits.getD 0 0) (by decide +kernel) E237S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S25.lits.getD 0 0) (by decide +kernel) E237S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S26.lits.getD 0 0) (by decide +kernel) E237S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S27.lits.getD 0 0) (by decide +kernel) E237S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S28.lits.getD 0 0) (by decide +kernel) E237S28.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S29.lits.getD 0 0) (by decide +kernel) E237S29.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S30.lits.getD 0 0) (by decide +kernel) E237S30.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S31.lits.getD 0 0) (by decide +kernel) E237S31.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S32.lits.getD 0 0) (by decide +kernel) E237S32.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S33.lits.getD 0 0) (by decide +kernel) E237S33.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S34.lits.getD 0 0) (by decide +kernel) E237S34.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S35.lits.getD 0 0) (by decide +kernel) E237S35.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S36.lits.getD 0 0) (by decide +kernel) E237S36.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S37.lits.getD 0 0) (by decide +kernel) E237S37.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S38.lits.getD 0 0) (by decide +kernel) E237S38.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S39.lits.getD 0 0) (by decide +kernel) E237S39.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S40.lits.getD 0 0) (by decide +kernel) E237S40.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S41.lits.getD 0 0) (by decide +kernel) E237S41.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S42.lits.getD 0 0) (by decide +kernel) E237S42.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S43.lits.getD 0 0) (by decide +kernel) E237S43.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S44.lits.getD 0 0) (by decide +kernel) E237S44.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S45.lits.getD 0 0) (by decide +kernel) E237S45.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S46.lits.getD 0 0) (by decide +kernel) E237S46.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S47.lits.getD 0 0) (by decide +kernel) E237S47.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S48.lits.getD 0 0) (by decide +kernel) E237S48.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S49.lits.getD 0 0) (by decide +kernel) E237S49.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S50.lits.getD 0 0) (by decide +kernel) E237S50.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S51.lits.getD 0 0) (by decide +kernel) E237S51.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S52.lits.getD 0 0) (by decide +kernel) E237S52.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S53.lits.getD 0 0) (by decide +kernel) E237S53.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S54.lits.getD 0 0) (by decide +kernel) E237S54.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E237S55.lits.getD 0 0) (by decide +kernel) E237S55.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 56 E1.E237M.lits hsplit (by decide +kernel)
    (by rw [show E1.E237M.lits.length = 4 by decide +kernel]; exact hmono)

/-- **E1 for `e237`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e237_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e237.CL c) (RT.cLB RT.Cls_e237.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e237.e237_sound hcls hext E1.C237X.lits (by rw [E1.C237X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C237X.len ▸ E1.C237X.okAll)) (glueChk_spec _ _ E1.C237X.okGlue)

end E1.E237

#print axioms E1.E237.e237_final
