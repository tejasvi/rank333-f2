module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e334
public import E1.ExtLeaf
public import E1.C334X
public import E1.E334M_Lits
public import E1.E334M_C0
public import E1.E334M_C1
public import E1.E334M_C2
public import E1.E334M_C3
public import E1.E334M_C4
public import E1.E334M_C5
public import E1.E334M_C6
public import E1.E334M_C7
public import E1.E334M_C8
public import E1.E334M_C9
public import E1.E334M_C10
public import E1.E334M_C11
public import E1.E334M_C12
public import L5.t.E334S0
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e334`, end to end: chain `C334X`, 14 external leaves (1 split, 13 monolithic in 13 chunks). -/
namespace E1.E334
open E1S E1.IP_e334

theorem hmono : extChk C 1 E1.E334M.lits 0 13 = true := by
  have h0 : extChk C 1 E1.E334M.lits 0 1 = true := E1.E334M.ok0
  have h1 : extChk C 1 E1.E334M.lits 0 2 = true := extChk_join C 1 E1.E334M.lits 0 1 1 h0 E1.E334M.ok1
  have h2 : extChk C 1 E1.E334M.lits 0 3 = true := extChk_join C 1 E1.E334M.lits 0 2 1 h1 E1.E334M.ok2
  have h3 : extChk C 1 E1.E334M.lits 0 4 = true := extChk_join C 1 E1.E334M.lits 0 3 1 h2 E1.E334M.ok3
  have h4 : extChk C 1 E1.E334M.lits 0 5 = true := extChk_join C 1 E1.E334M.lits 0 4 1 h3 E1.E334M.ok4
  have h5 : extChk C 1 E1.E334M.lits 0 6 = true := extChk_join C 1 E1.E334M.lits 0 5 1 h4 E1.E334M.ok5
  have h6 : extChk C 1 E1.E334M.lits 0 7 = true := extChk_join C 1 E1.E334M.lits 0 6 1 h5 E1.E334M.ok6
  have h7 : extChk C 1 E1.E334M.lits 0 8 = true := extChk_join C 1 E1.E334M.lits 0 7 1 h6 E1.E334M.ok7
  have h8 : extChk C 1 E1.E334M.lits 0 9 = true := extChk_join C 1 E1.E334M.lits 0 8 1 h7 E1.E334M.ok8
  have h9 : extChk C 1 E1.E334M.lits 0 10 = true := extChk_join C 1 E1.E334M.lits 0 9 1 h8 E1.E334M.ok9
  have h10 : extChk C 1 E1.E334M.lits 0 11 = true := extChk_join C 1 E1.E334M.lits 0 10 1 h9 E1.E334M.ok10
  have h11 : extChk C 1 E1.E334M.lits 0 12 = true := extChk_join C 1 E1.E334M.lits 0 11 1 h10 E1.E334M.ok11
  have h12 : extChk C 1 E1.E334M.lits 0 13 = true := extChk_join C 1 E1.E334M.lits 0 12 1 h11 E1.E334M.ok12
  exact h12

theorem hsplit : ∀ k < 1, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E334S0.lits.getD 0 0) (by decide +kernel) E334S0.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 1 E1.E334M.lits hsplit (by decide +kernel)
    (by rw [show E1.E334M.lits.length = 13 by decide +kernel]; exact hmono)

/-- **E1 for `e334`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e334_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e334.CL c) (RT.cLB RT.Cls_e334.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e334.e334_sound hcls hext E1.C334X.lits (by rw [E1.C334X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C334X.len ▸ E1.C334X.okAll)) (glueChk_spec _ _ E1.C334X.okGlue)

end E1.E334

#print axioms E1.E334.e334_final
