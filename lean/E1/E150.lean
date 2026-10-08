module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e150
public import E1.ExtLeaf
public import E1.C150X
public import E1.E150M_C0
public import E1.E150M_C1
public import E1.E150M_C2
public import E1.E150M_C3
public import E1.E150M_C4
public import E1.E150M_C5
public import E1.E150M_C6
public import E1.E150M_C7
public import E1.E150M_C8
public import E1.E150M_C9
public import E1.E150M_C10
public import E1.E150M_C11
public import E1.E150M_C12
public import E1.E150M_C13
public import E1.E150M_C14
public import E1.E150M_C15
public import E1.E150M_C16
public import E1.E150M_C17
public import E1.E150M_C18
public import L5.t.E150S0
public import L5.t.E150S1
public import L5.t.E150S2
public import L5.t.E150S3
public import L5.t.E150S4
public import L5.t.E150S5
public import L5.t.E150S6
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # Class 150 end to end: E1 on the coset IP `e150` (enumeration chain `C150X`, 6 blocks) with all 462 leaves external
(7 split leaves, `E150S<k>`; 455 monolithic leaves in 19 chunks, `E150M_C<j>`).  The only hypothesis is the class table of
the IP (`hcls`). -/
namespace E1.E150
open E1S E1.IP_e150

theorem hmono : extChk C 7 E1.E150M.lits 0 455 = true := by
  have h0 : extChk C 7 E1.E150M.lits 0 44 = true := E1.E150M.ok0
  have h1 : extChk C 7 E1.E150M.lits 0 94 = true := extChk_join C 7 E1.E150M.lits 0 44 50 h0 E1.E150M.ok1
  have h2 : extChk C 7 E1.E150M.lits 0 99 = true := extChk_join C 7 E1.E150M.lits 0 94 5 h1 E1.E150M.ok2
  have h3 : extChk C 7 E1.E150M.lits 0 134 = true := extChk_join C 7 E1.E150M.lits 0 99 35 h2 E1.E150M.ok3
  have h4 : extChk C 7 E1.E150M.lits 0 135 = true := extChk_join C 7 E1.E150M.lits 0 134 1 h3 E1.E150M.ok4
  have h5 : extChk C 7 E1.E150M.lits 0 249 = true := extChk_join C 7 E1.E150M.lits 0 135 114 h4 E1.E150M.ok5
  have h6 : extChk C 7 E1.E150M.lits 0 259 = true := extChk_join C 7 E1.E150M.lits 0 249 10 h5 E1.E150M.ok6
  have h7 : extChk C 7 E1.E150M.lits 0 313 = true := extChk_join C 7 E1.E150M.lits 0 259 54 h6 E1.E150M.ok7
  have h8 : extChk C 7 E1.E150M.lits 0 389 = true := extChk_join C 7 E1.E150M.lits 0 313 76 h7 E1.E150M.ok8
  have h9 : extChk C 7 E1.E150M.lits 0 409 = true := extChk_join C 7 E1.E150M.lits 0 389 20 h8 E1.E150M.ok9
  have h10 : extChk C 7 E1.E150M.lits 0 410 = true := extChk_join C 7 E1.E150M.lits 0 409 1 h9 E1.E150M.ok10
  have h11 : extChk C 7 E1.E150M.lits 0 414 = true := extChk_join C 7 E1.E150M.lits 0 410 4 h10 E1.E150M.ok11
  have h12 : extChk C 7 E1.E150M.lits 0 416 = true := extChk_join C 7 E1.E150M.lits 0 414 2 h11 E1.E150M.ok12
  have h13 : extChk C 7 E1.E150M.lits 0 421 = true := extChk_join C 7 E1.E150M.lits 0 416 5 h12 E1.E150M.ok13
  have h14 : extChk C 7 E1.E150M.lits 0 439 = true := extChk_join C 7 E1.E150M.lits 0 421 18 h13 E1.E150M.ok14
  have h15 : extChk C 7 E1.E150M.lits 0 449 = true := extChk_join C 7 E1.E150M.lits 0 439 10 h14 E1.E150M.ok15
  have h16 : extChk C 7 E1.E150M.lits 0 453 = true := extChk_join C 7 E1.E150M.lits 0 449 4 h15 E1.E150M.ok16
  have h17 : extChk C 7 E1.E150M.lits 0 454 = true := extChk_join C 7 E1.E150M.lits 0 453 1 h16 E1.E150M.ok17
  have h18 : extChk C 7 E1.E150M.lits 0 455 = true := extChk_join C 7 E1.E150M.lits 0 454 1 h17 E1.E150M.ok18
  exact h18

theorem hsplit : ∀ k < 7, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S0.lits.getD 0 0) (by decide +kernel) E150S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S1.lits.getD 0 0) (by decide +kernel) E150S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S2.lits.getD 0 0) (by decide +kernel) E150S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S3.lits.getD 0 0) (by decide +kernel) E150S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S4.lits.getD 0 0) (by decide +kernel) E150S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S5.lits.getD 0 0) (by decide +kernel) E150S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E150S6.lits.getD 0 0) (by decide +kernel) E150S6.leaf

/-- every external leaf of `e150` is refuted -/
theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 7 E1.E150M.lits hsplit (by decide +kernel)
    (by rw [show E1.E150M.lits.length = 455 by decide +kernel]; exact hmono)

/-- **E1 for class 150, end to end**: given the IP's class table, no decomposition has exactly 16 first factors outside `Em`
(this is `HC.E1Concl Em 16`). -/
theorem e150_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e150.CL c) (RT.cLB RT.Cls_e150.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 16 → False :=
  E1.OK_e150.e150_sound hcls hext E1.C150X.lits (by rw [E1.C150X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C150X.len ▸ E1.C150X.okAll)) (glueChk_spec _ _ E1.C150X.okGlue)

end E1.E150

#print axioms E1.E150.e150_final
