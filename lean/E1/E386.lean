module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e386
public import E1.ExtLeaf
public import E1.C386X
public import E1.E386M_Lits
public import E1.E386M_C0
public import E1.E386M_C1
public import L5.t.E386S0
public import L5.t.E386S1
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e386`, end to end: chain `C386X`, 4 external leaves (2 split, 2 monolithic in 2 chunks). -/
namespace E1.E386
open E1S E1.IP_e386

theorem hmono : extChk C 2 E1.E386M.lits 0 2 = true := by
  have h0 : extChk C 2 E1.E386M.lits 0 1 = true := E1.E386M.ok0
  have h1 : extChk C 2 E1.E386M.lits 0 2 = true := extChk_join C 2 E1.E386M.lits 0 1 1 h0 E1.E386M.ok1
  exact h1

theorem hsplit : ∀ k < 2, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E386S0.lits.getD 0 0) (by decide +kernel) E386S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E386S1.lits.getD 0 0) (by decide +kernel) E386S1.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 2 E1.E386M.lits hsplit (by decide +kernel)
    (by rw [show E1.E386M.lits.length = 2 by decide +kernel]; exact hmono)

/-- **E1 for `e386`, end to end** (`HC.E1Concl Em 18`), given the IP's class table -/
theorem e386_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e386.CL c) (RT.cLB RT.Cls_e386.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 18 → False :=
  E1.OK_e386.e386_sound hcls hext E1.C386X.lits (by rw [E1.C386X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C386X.len ▸ E1.C386X.okAll)) (glueChk_spec _ _ E1.C386X.okGlue)

end E1.E386

#print axioms E1.E386.e386_final
