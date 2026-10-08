module
public import R22Port.U_d41d8cd98f00
public import HC.Asm
public import RT.SoundN
/-! # The main search needs the capacity table only for 22 distinct nonzero first factors; class 492 is trivial there

`RT.K3eD.row_factN` and `RT.K3eD_ClosF.hclos` use `hcls` only through `fact_factN 22 (hcls c _)`: the main search's rows
are valid for decompositions with 22 distinct nonzero first factors (`FactN 22`).  In that form the point class 492 (bound
21 in C3eD, RR's 20) is trivial: its subspace is `{0, e}`, and 22 distinct nonzero first factors have at most one term
equal to `e` (`factN_point`).  `hclsN_K3eD` proves

  `hclsN : ∀ c < 496, FactN 22 (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c)`

from RR's table and the E1 statements of the other 110 raised classes.

This does **not** remove the point lemma: the step from "a 22-term decomposition" to "22 distinct nonzero first factors"
needs `Fact (K_492) 21` (two equal rank-1 first factors leave at most 20 terms outside their point), so 492 enters there
(DESIGN 29.3, `top/`).  The interface change for `RT.K3eD.row_valid` and `RT.K3eD_ClosF.hclos` is requested in
`hcls/REQUESTS.md`. -/
@[expose] public section
namespace HC
open RT Finset

/-- **`FactN R m (R - 1)` for a point**: if `m` has at most one nonzero point `u` (below 512), distinct nonzero first
factors put at most one term in `m`. -/
theorem factN_point {R m u : Nat} (hm : ∀ w < 512, w ≠ 0 → m.testBit w = true → w = u) : FactN R m (R - 1) := by
  intro av b c hav hnz hinj _
  have hin : (univ.filter (fun s : Fin R => ¬ (m.testBit (av s) = false))).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro s hs s' hs'
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, Bool.not_eq_false] at hs hs'
    exact hinj ((hm _ (hav s) (hnz s) hs).trans (hm _ (hav s') (hnz s') hs').symm)
  have htot := Finset.filter_card_add_filter_neg_card_eq_card (s := (univ : Finset (Fin R)))
    (fun s => m.testBit (av s) = false)
  simp only [Finset.card_univ, Fintype.card_fin] at htot
  omega

theorem kM_492 : kM K3eD_Cls.CL 492 = 3 := by decide +kernel
theorem cLB_492 : cLB K3eD_Cls.CL 492 = 21 := by decide +kernel

theorem point_3 : ∀ w < 512, w ≠ 0 → Nat.testBit 3 w = true → w = 1 := by
  intro w _ hw0 h
  have : w < 2 := by
    by_contra hge
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (by norm_num : 3 < 2 ^ 2) (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h
    exact absurd h (by decide)
  omega

/-- class 492 of `K3eD` for 22 distinct nonzero first factors -/
theorem factN_492 : FactN 22 (kM K3eD_Cls.CL 492) (cLB K3eD_Cls.CL 492) := by
  rw [kM_492, cLB_492]
  exact factN_point point_3

/-- the raised classes of `K3eD` other than the point 492 (110) -/
def RAISED_K3eD_N : List Nat := RAISED_K3eD.erase 492

theorem mem_raisedN {c : Nat} (h : c ∈ RAISED_K3eD) (h2 : c ≠ 492) : c ∈ RAISED_K3eD_N :=
  (List.mem_erase_of_ne h2).mpr h

/-- **The main search's capacity table, distinct-factor form**: RR's table and the E1 statements of the 110 raised
classes other than 492 (each on its class representative `K_c`, with `lb_c - 1` factors outside). -/
theorem hclsN_K3eD (hrr : RRAll)
    (hraise : ∀ c ∈ RAISED_K3eD_N, E1Concl (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c - 1)) :
    ∀ c < 496, FactN 22 (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c) := by
  intro c hc
  by_cases h : c = 492
  · subst h; exact factN_492
  · exact fact_factN 22 (class_factK _ subZ_K3eD hrr z_K3eD c hc
      (fun hlt => hraise c (mem_raisedN (raised_rec _ _ 496 raised_K3eD c hc hlt) h)))

/-- the same with general certificates for the 110 classes -/
theorem hclsN_K3eD_cert (hrr : RRAll) (hraise : ∀ c ∈ RAISED_K3eD_N, RaiseCert K3eD_Cls.CL c) :
    ∀ c < 496, FactN 22 (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c) := by
  intro c hc
  by_cases h : c = 492
  · subst h; exact factN_492
  · exact fact_factN 22 (class_fact _ subZ_K3eD hrr c hc
      (fun hlt => hraise c (mem_raisedN (raised_rec _ _ 496 raised_K3eD c hc hlt) h)))

theorem raisedN_length : RAISED_K3eD_N.length = 110 := by decide

end HC
