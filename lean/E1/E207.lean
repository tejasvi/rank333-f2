module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e207
public import E1.ExtLeaf
public import E1.C207X
public import E1.E207M_Lits
public import E1.E207M_C0
public import E1.E207M_C1
public import E1.E207M_C2
public import E1.E207M_C3
public import E1.E207M_C4
public import L5.t.E207S0
public import L5.t.E207S1
public import L5.t.E207S2
public import L5.t.E207S3
public import L5.t.E207S4
public import L5.t.E207S5
public import L5.t.E207S6
public import L5.t.E207S7
public import L5.t.E207S8
public import L5.t.E207S9
public import L5.t.E207S10
public import L5.t.E207S11
public import L5.t.E207S12
public import L5.t.E207S13
public import L5.t.E207S14
public import L5.t.E207S15
public import L5.t.E207S16
public import L5.t.E207S17
public import L5.t.E207S18
public import L5.t.E207S19
public import L5.t.E207S20
public import L5.t.E207S21
public import L5.t.E207S22
public import L5.t.E207S23
public import L5.t.E207S24
public import L5.t.E207S25
public import L5.t.E207S26
public import L5.t.E207S27
public import L5.t.E207S28
public import L5.t.E207S29
public import L5.t.E207S30
public import L5.t.E207S31
public import L5.t.E207S32
public import L5.t.E207S33
public import L5.t.E207S34
public import L5.t.E207S35
public import L5.t.E207S36
public import L5.t.E207S37
public import L5.t.E207S38
public import L5.t.E207S39
public import L5.t.E207S40
public import L5.t.E207S41
public import L5.t.E207S42
public import L5.t.E207S43
public import L5.t.E207S44
public import L5.t.E207S45
public import L5.t.E207S46
public import L5.t.E207S47
public import L5.t.E207S48
public import L5.t.E207S49
public import L5.t.E207S50
public import L5.t.E207S51
public import L5.t.E207S52
public import L5.t.E207S53
public import L5.t.E207S54
public import L5.t.E207S55
public import L5.t.E207S56
public import L5.t.E207S57
public import L5.t.E207S58
public import L5.t.E207S59
public import L5.t.E207S60
public import L5.t.E207S61
public import L5.t.E207S62
public import L5.t.E207S63
public import L5.t.E207S64
public import L5.t.E207S65
public import L5.t.E207S66
public import L5.t.E207S67
public import L5.t.E207S68
public import L5.t.E207S69
public import L5.t.E207S70
public import L5.t.E207S71
public import L5.t.E207S72
public import L5.t.E207S73
public import L5.t.E207S74
public import L5.t.E207S75
public import L5.t.E207S76
public import L5.t.E207S77
public import L5.t.E207S78
public import L5.t.E207S79
public import L5.t.E207S80
public import L5.t.E207S81
public import L5.t.E207S82
public import L5.t.E207S83
public import L5.t.E207S84
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e207`, end to end: chain `C207X`, 90 external leaves (85 split, 5 monolithic in 5 chunks). -/
namespace E1.E207
open E1S E1.IP_e207

theorem hmono : extChk C 85 E1.E207M.lits 0 5 = true := by
  have h0 : extChk C 85 E1.E207M.lits 0 1 = true := E1.E207M.ok0
  have h1 : extChk C 85 E1.E207M.lits 0 2 = true := extChk_join C 85 E1.E207M.lits 0 1 1 h0 E1.E207M.ok1
  have h2 : extChk C 85 E1.E207M.lits 0 3 = true := extChk_join C 85 E1.E207M.lits 0 2 1 h1 E1.E207M.ok2
  have h3 : extChk C 85 E1.E207M.lits 0 4 = true := extChk_join C 85 E1.E207M.lits 0 3 1 h2 E1.E207M.ok3
  have h4 : extChk C 85 E1.E207M.lits 0 5 = true := extChk_join C 85 E1.E207M.lits 0 4 1 h3 E1.E207M.ok4
  exact h4

theorem hsplit : ∀ k < 85, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S0.lits.getD 0 0) (by decide +kernel) E207S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S1.lits.getD 0 0) (by decide +kernel) E207S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S2.lits.getD 0 0) (by decide +kernel) E207S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S3.lits.getD 0 0) (by decide +kernel) E207S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S4.lits.getD 0 0) (by decide +kernel) E207S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S5.lits.getD 0 0) (by decide +kernel) E207S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S6.lits.getD 0 0) (by decide +kernel) E207S6.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S7.lits.getD 0 0) (by decide +kernel) E207S7.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S8.lits.getD 0 0) (by decide +kernel) E207S8.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S9.lits.getD 0 0) (by decide +kernel) E207S9.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S10.lits.getD 0 0) (by decide +kernel) E207S10.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S11.lits.getD 0 0) (by decide +kernel) E207S11.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S12.lits.getD 0 0) (by decide +kernel) E207S12.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S13.lits.getD 0 0) (by decide +kernel) E207S13.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S14.lits.getD 0 0) (by decide +kernel) E207S14.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S15.lits.getD 0 0) (by decide +kernel) E207S15.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S16.lits.getD 0 0) (by decide +kernel) E207S16.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S17.lits.getD 0 0) (by decide +kernel) E207S17.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S18.lits.getD 0 0) (by decide +kernel) E207S18.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S19.lits.getD 0 0) (by decide +kernel) E207S19.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S20.lits.getD 0 0) (by decide +kernel) E207S20.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S21.lits.getD 0 0) (by decide +kernel) E207S21.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S22.lits.getD 0 0) (by decide +kernel) E207S22.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S23.lits.getD 0 0) (by decide +kernel) E207S23.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S24.lits.getD 0 0) (by decide +kernel) E207S24.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S25.lits.getD 0 0) (by decide +kernel) E207S25.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S26.lits.getD 0 0) (by decide +kernel) E207S26.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S27.lits.getD 0 0) (by decide +kernel) E207S27.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S28.lits.getD 0 0) (by decide +kernel) E207S28.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S29.lits.getD 0 0) (by decide +kernel) E207S29.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S30.lits.getD 0 0) (by decide +kernel) E207S30.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S31.lits.getD 0 0) (by decide +kernel) E207S31.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S32.lits.getD 0 0) (by decide +kernel) E207S32.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S33.lits.getD 0 0) (by decide +kernel) E207S33.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S34.lits.getD 0 0) (by decide +kernel) E207S34.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S35.lits.getD 0 0) (by decide +kernel) E207S35.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S36.lits.getD 0 0) (by decide +kernel) E207S36.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S37.lits.getD 0 0) (by decide +kernel) E207S37.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S38.lits.getD 0 0) (by decide +kernel) E207S38.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S39.lits.getD 0 0) (by decide +kernel) E207S39.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S40.lits.getD 0 0) (by decide +kernel) E207S40.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S41.lits.getD 0 0) (by decide +kernel) E207S41.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S42.lits.getD 0 0) (by decide +kernel) E207S42.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S43.lits.getD 0 0) (by decide +kernel) E207S43.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S44.lits.getD 0 0) (by decide +kernel) E207S44.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S45.lits.getD 0 0) (by decide +kernel) E207S45.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S46.lits.getD 0 0) (by decide +kernel) E207S46.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S47.lits.getD 0 0) (by decide +kernel) E207S47.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S48.lits.getD 0 0) (by decide +kernel) E207S48.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S49.lits.getD 0 0) (by decide +kernel) E207S49.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S50.lits.getD 0 0) (by decide +kernel) E207S50.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S51.lits.getD 0 0) (by decide +kernel) E207S51.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S52.lits.getD 0 0) (by decide +kernel) E207S52.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S53.lits.getD 0 0) (by decide +kernel) E207S53.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S54.lits.getD 0 0) (by decide +kernel) E207S54.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S55.lits.getD 0 0) (by decide +kernel) E207S55.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S56.lits.getD 0 0) (by decide +kernel) E207S56.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S57.lits.getD 0 0) (by decide +kernel) E207S57.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S58.lits.getD 0 0) (by decide +kernel) E207S58.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S59.lits.getD 0 0) (by decide +kernel) E207S59.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S60.lits.getD 0 0) (by decide +kernel) E207S60.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S61.lits.getD 0 0) (by decide +kernel) E207S61.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S62.lits.getD 0 0) (by decide +kernel) E207S62.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S63.lits.getD 0 0) (by decide +kernel) E207S63.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S64.lits.getD 0 0) (by decide +kernel) E207S64.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S65.lits.getD 0 0) (by decide +kernel) E207S65.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S66.lits.getD 0 0) (by decide +kernel) E207S66.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S67.lits.getD 0 0) (by decide +kernel) E207S67.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S68.lits.getD 0 0) (by decide +kernel) E207S68.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S69.lits.getD 0 0) (by decide +kernel) E207S69.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S70.lits.getD 0 0) (by decide +kernel) E207S70.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S71.lits.getD 0 0) (by decide +kernel) E207S71.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S72.lits.getD 0 0) (by decide +kernel) E207S72.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S73.lits.getD 0 0) (by decide +kernel) E207S73.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S74.lits.getD 0 0) (by decide +kernel) E207S74.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S75.lits.getD 0 0) (by decide +kernel) E207S75.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S76.lits.getD 0 0) (by decide +kernel) E207S76.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S77.lits.getD 0 0) (by decide +kernel) E207S77.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S78.lits.getD 0 0) (by decide +kernel) E207S78.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S79.lits.getD 0 0) (by decide +kernel) E207S79.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S80.lits.getD 0 0) (by decide +kernel) E207S80.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S81.lits.getD 0 0) (by decide +kernel) E207S81.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S82.lits.getD 0 0) (by decide +kernel) E207S82.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S83.lits.getD 0 0) (by decide +kernel) E207S83.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E207S84.lits.getD 0 0) (by decide +kernel) E207S84.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 85 E1.E207M.lits hsplit (by decide +kernel)
    (by rw [show E1.E207M.lits.length = 5 by decide +kernel]; exact hmono)

/-- **E1 for `e207`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e207_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e207.CL c) (RT.cLB RT.Cls_e207.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e207.e207_sound hcls hext E1.C207X.lits (by rw [E1.C207X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C207X.len ▸ E1.C207X.okAll)) (glueChk_spec _ _ E1.C207X.okGlue)

end E1.E207

#print axioms E1.E207.e207_final
