module
public import R22Port.U_d41d8cd98f00
public import E1.OK_e339
public import E1.ExtLeaf
public import E1.C339X
public import E1.E339M_Lits
public import L5.t.E339S0
public import L5.t.E339S1
public import L5.t.E339S2
public import L5.t.E339S3
public import L5.t.E339S4
public import L5.t.E339S5
public import L5.t.E339S6
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # E1 for `e339`, end to end: chain `C339X`, 7 external leaves (7 split, 0 monolithic in 0 chunks). -/
namespace E1.E339
open E1S E1.IP_e339

theorem hmono : extChk C 7 E1.E339M.lits 0 0 = true := by
  rfl

theorem hsplit : ∀ k < 7, LeafND C (C.EXT.getD k 0) := by
  intro k hk
  interval_cases k
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S0.lits.getD 0 0) (by decide +kernel) E339S0.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S1.lits.getD 0 0) (by decide +kernel) E339S1.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S2.lits.getD 0 0) (by decide +kernel) E339S2.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S3.lits.getD 0 0) (by decide +kernel) E339S3.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S4.lits.getD 0 0) (by decide +kernel) E339S4.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S5.lits.getD 0 0) (by decide +kernel) E339S5.leaf
  · exact leafND_of_split C (by decide) (by decide +kernel) _ (E339S6.lits.getD 0 0) (by decide +kernel) E339S6.leaf

theorem hext : ∀ pl ∈ C.EXT, LeafND C pl :=
  hext_of C (by decide) (by decide +kernel) 7 E1.E339M.lits hsplit (by decide +kernel)
    (by rw [show E1.E339M.lits.length = 0 by decide +kernel]; exact hmono)

/-- **E1 for `e339`, end to end** (`HC.E1Concl Em 17`), given the IP's class table -/
theorem e339_final (hcls : ∀ c, RT.Fact (RT.kM RT.Cls_e339.CL c) (RT.cLB RT.Cls_e339.CL c)) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → RootSound.M3), (∀ s, av s < 512) →
      RootSound.IsDecomp (fun s => RootSound.toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (Finset.univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = 17 → False :=
  E1.OK_e339.e339_sound hcls hext E1.C339X.lits (by rw [E1.C339X.len]; decide) (by decide +kernel)
    (blkChk_spec _ _ _ _ _ _ (E1.C339X.len ▸ E1.C339X.okAll)) (glueChk_spec _ _ E1.C339X.okGlue)

end E1.E339

#print axioms E1.E339.e339_final
