module
public import R22Port.U_6d73af0793e7
public import S5.Leaf
public import RT.K3eD_Cls
public import HC.Transport
public import Mathlib
/-! # Lemma W(a): a W-type subspace holds at most `n - 11` first factors (`n ≤ 22`), for `W0 = {row 2 = 0}`

Proof (r22/wtight/LEMMA.md, steps 1-3), for `T = ∑_{s<n} a_s ⊗ b_s ⊗ c_s`, `O` = the terms with row 2 of `a_s` nonzero,
`p_s` = row 2 of `a_s`, `g_s` = `c_s` off column 2 (the 6 entries `c_s[k][i]`, `i < 2`):
* the map `β ↦ (β(b_s))_{s ∈ O}` on functionals of `B` is injective (contract `T` with row 2 of `a`, column 2 of `c`);
* `∑_{s∈O} b_s[y] (p_s ⊗ g_s) = 0` for every coordinate `y` of `B`; so `dim span{p_s ⊗ g_s} ≤ |O| - 9`;
* (rank-1 basis) `dim span{g_s : s ∈ O} ≤ dim span{p_s ⊗ g_s}`, because every `p_s ≠ 0`;
* if `|O| ≤ 10`, all `g_s` (`s ∈ O`) lie in one line `{0, γ}`, so the third factors of `O` lie in `K + γ`
  (`K` = column-2 space); the rotated decomposition `∑ c_s ⊗ a_s ⊗ b_s` then has at most `n - |O| ≤ 13` first factors
  outside `K + γ`, against the class bound 14 of every such subspace (classes 248, 249, 410; `fact_spanK`).
The class facts enter as the hypothesis `hcls` (from RR's table: `HC.rr_fact` with `rrLB` 14, 14, 15). -/
@[expose] public section
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

namespace L479
open RootSound Matrix Finset

/-! ## Cyclic rotation, codes of third factors -/

theorem isDecomp_rot {n : ℕ} {a b c : Fin n → M3} (hd : IsDecomp a b c) : IsDecomp b c a := by
  intro i j j' k k' i'
  have h := hd k' i' i j j' k
  have e : (∑ s, b s i j * c s j' k * a s k' i') = ∑ s, a s k' i' * b s i j * c s j' k :=
    Finset.sum_congr rfl (fun s _ => by ring)
  rw [e, h]
  by_cases hh : j = j' ∧ k = k' ∧ i = i'
  · rw [if_pos ⟨hh.2.2.symm, hh.1, hh.2.1.symm⟩, if_pos hh]
  · rw [if_neg (fun h' => hh ⟨h'.2.1, h'.2.2.symm, h'.1.symm⟩), if_neg hh]

theorem toM3_natOf_vecC (M : M3) : toM3 (S5.natOf (vecC M)) = M := by
  ext i j
  have h := congrFun (S5.nv_natOf (vecC M)) ⟨3 * i.val + j.val, by omega⟩
  show bitF (S5.natOf (vecC M)) (3 * i.val + j.val) = M i j
  have e : bitF (S5.natOf (vecC M)) (3 * i.val + j.val) = S5.nv (S5.natOf (vecC M)) ⟨3 * i.val + j.val, by omega⟩ := rfl
  rw [e, h]
  simp only [vecC, hi, lo]
  congr 1 <;> apply Fin.ext <;> simp <;> omega

theorem F2_cases (x : F2) : x = 0 ∨ x = 1 := by revert x; decide
theorem F2_add_self (x : F2) : x + x = 0 := by revert x; decide
theorem F2_ne_zero {x : F2} (h : x ≠ 0) : x = 1 := by rcases F2_cases x with e | e; exact absurd e h; exact e

/-! ## Bit facts (kernel-checked over all 512 codes) -/

/-- row 2 of `v` vanishes iff `v < 64` -/
def row2B (v : ℕ) : Bool := decide (v < 64) == (toM3 v 2 0 == 0 && toM3 v 2 1 == 0 && toM3 v 2 2 == 0)
theorem row2B_true : S5.allLT 512 row2B = true := by decide +kernel

theorem lt64_iff (v : ℕ) (hv : v < 512) : v < 64 ↔ ∀ j : Fin 3, toM3 v 2 j = 0 := by
  have h := S5.allLT_spec row2B_true v hv
  simp only [row2B, beq_iff_eq, Bool.and_eq_true, Bool.decide_eq_true] at h
  constructor
  · intro hl j
    have := h ▸ (show decide (v < 64) = true by simpa using hl)
    simp only [Bool.and_eq_true, beq_iff_eq] at this
    fin_cases j
    · exact this.1.1
    · exact this.1.2
    · exact this.2
  · intro hj
    have : (toM3 v 2 0 == 0 && toM3 v 2 1 == 0 && toM3 v 2 2 == 0) = true := by
      simp [hj 0, hj 1, hj 2]
    rw [← h] at this
    simpa using this

/-- `x &&& 219 = 0` (bits outside column 2 vanish) iff `toM3 x k i = 0` for `i < 2` -/
def kB (w : ℕ) : Bool := (w &&& 219) == 0
def col2B (x : ℕ) : Bool := kB x == (toM3 x 0 0 == 0 && toM3 x 0 1 == 0 && toM3 x 1 0 == 0 && toM3 x 1 1 == 0 &&
  toM3 x 2 0 == 0 && toM3 x 2 1 == 0)
theorem col2B_true : S5.allLT 512 col2B = true := by decide +kernel

theorem kB_iff (x : ℕ) (hx : x < 512) : kB x = true ↔ ∀ k : Fin 3, ∀ i : Fin 2, toM3 x k i.castSucc = 0 := by
  have h := S5.allLT_spec col2B_true x hx
  simp only [col2B, beq_iff_eq] at h
  rw [h]
  simp only [Bool.and_eq_true, beq_iff_eq]
  constructor
  · rintro ⟨⟨⟨⟨⟨h00, h01⟩, h10⟩, h11⟩, h20⟩, h21⟩ k i
    fin_cases k <;> fin_cases i <;> assumption
  · intro hk
    exact ⟨⟨⟨⟨⟨hk 0 0, hk 0 1⟩, hk 1 0⟩, hk 1 1⟩, hk 2 0⟩, hk 2 1⟩

/-! ## The subspaces `K + γ` and their class bound -/

/-- the point mask of `K + γ` (`K` = column-2 space `{x : x &&& 219 = 0}`) -/
def spanK (γ : ℕ) : ℕ := S5.mkB (fun w => kB w || kB (w ^^^ γ)) 512

theorem spanK_bit (γ w : ℕ) (hw : w < 512) : (spanK γ).testBit w = (kB w || kB (w ^^^ γ)) := by
  rw [spanK, S5.mkB_bit]; simp [hw]

/-- witnesses: `K + γ` maps into `K_c` (`c` = 248, 249 or 410) under `(t, P, Q)` (py/wsub.py, py/mkwtab.py) -/
def WTAB : ℕ := 0xa76640012b2a5001332a50009c664000a76640012b2a5001332a50009c6640011d2a5000672a5001352a50005c2a50011d2a5000672a5001352a50005c2a50011e2a50012e2a5000a72a50009c2a50011e2a50012e2a5000a72a50009c2a5000a3664000632a5000a32a500054664000a3664000632a5000a32a500054664000a76640012b2a5001332a50009c664000a76640012b2a5001332a50009c6640011d2a5000672a5001352a50005c2a50011d2a5000672a5001352a50005c2a50011e2a50012e2a5000a72a50009c2a50011e2a50012e2a5000a72a50009c2a5000a3664000632a5000a32a500054664000a3664000632a5000a32a500054664000e52a50010f2a5001372a5000cc2a5000e52a50010f2a5001372a5000cc2a5001392a5000a72a4001312a50009c2a4001392a5000a72a4001312a50009c2a40013e2a50010e2a5000a52a50008c2a50013e2a50010e2a5000a52a50008c2a5000e12a5000a32a4000a12a5000542a4000e12a5000a32a4000a12a5000542a4000e52a50010f2a5001372a5000cc2a5000e52a50010f2a5001372a5000cc2a5001392a5000a72a4001312a50009c2a4001392a5000a72a4001312a50009c2a40013e2a50010e2a5000a52a50008c2a50013e2a50010e2a5000a52a50008c2a5000e12a5000a32a4000a12a5000542a4000e12a5000a32a4000a12a5000542a4000e62a50012f2a5001172a5000d42a5000e62a50012f2a5001172a5000d42a50013d2a5000662a5001152a5000542a50013d2a5000662a5001152a5000542a50013a2a50012a2a5000a74640009c4640013a2a50012a2a5000a74640009c464000e22a5000622a5000a346400054464000e22a5000622a5000a346400054464000e62a50012f2a5001172a5000d42a5000e62a50012f2a5001172a5000d42a50013d2a5000662a5001152a5000542a50013d2a5000662a5001152a5000542a50013a2a50012a2a5000a74640009c4640013a2a50012a2a5000a74640009c464000e22a5000622a5000a346400054464000e22a5000622a5000a346400054464000a56640010b2a5001132a50008c664000a56640010b2a5001132a50008c664001192a5000a52a4001112a50008c2a4001192a5000a52a4001112a50008c2a40011a2a50010a2a5000a54640008c4640011a2a50010a2a5000a54640008c464000a1664000a12a4000a1464000542a6000a1664000a12a4000a1464000542a6000a56640010b2a5001132a50008c664000a56640010b2a5001132a50008c664001192a5000a52a4001112a50008c2a4001192a5000a52a4001112a50008c2a40011a2a50010a2a5000a54640008c4640011a2a50010a2a5000a54640008c464000a1664000a12a4000a1464000542a6000a1664000a12a4000a1464000542a6000a76640012b2a5001332a50009c664000a76640012b2a5001332a50009c6640011d2a5000672a5001352a50005c2a50011d2a5000672a5001352a50005c2a50011e2a50012e2a5000a72a50009c2a50011e2a50012e2a5000a72a50009c2a5000a3664000632a5000a32a500054664000a3664000632a5000a32a500054664000a76640012b2a5001332a50009c664000a76640012b2a5001332a50009c6640011d2a5000672a5001352a50005c2a50011d2a5000672a5001352a50005c2a50011e2a50012e2a5000a72a50009c2a50011e2a50012e2a5000a72a50009c2a5000a3664000632a5000a32a500054664000a3664000632a5000a32a500054664000e52a50010f2a5001372a5000cc2a5000e52a50010f2a5001372a5000cc2a5001392a5000a72a4001312a50009c2a4001392a5000a72a4001312a50009c2a40013e2a50010e2a5000a52a50008c2a50013e2a50010e2a5000a52a50008c2a5000e12a5000a32a4000a12a5000542a4000e12a5000a32a4000a12a5000542a4000e52a50010f2a5001372a5000cc2a5000e52a50010f2a5001372a5000cc2a5001392a5000a72a4001312a50009c2a4001392a5000a72a4001312a50009c2a40013e2a50010e2a5000a52a50008c2a50013e2a50010e2a5000a52a50008c2a5000e12a5000a32a4000a12a5000542a4000e12a5000a32a4000a12a5000542a4000e62a50012f2a5001172a5000d42a5000e62a50012f2a5001172a5000d42a50013d2a5000662a5001152a5000542a50013d2a5000662a5001152a5000542a50013a2a50012a2a5000a74640009c4640013a2a50012a2a5000a74640009c464000e22a5000622a5000a346400054464000e22a5000622a5000a346400054464000e62a50012f2a5001172a5000d42a5000e62a50012f2a5001172a5000d42a50013d2a5000662a5001152a5000542a50013d2a5000662a5001152a5000542a50013a2a50012a2a5000a74640009c4640013a2a50012a2a5000a74640009c464000e22a5000622a5000a346400054464000e22a5000622a5000a346400054464000a56640010b2a5001132a50008c664000a56640010b2a5001132a50008c664001192a5000a52a4001112a50008c2a4001192a5000a52a4001112a50008c2a40011a2a50010a2a5000a54640008c4640011a2a50010a2a5000a54640008c464000a1664000a12a4000a1464000542a6000a1664000a12a4000a1464000542a6000a56640010b2a5001132a50008c664000a56640010b2a5001132a50008c664001192a5000a52a4001112a50008c2a4001192a5000a52a4001112a50008c2a40011a2a50010a2a5000a54640008c4640011a2a50010a2a5000a54640008c464000a1664000a12a4000a1464000542a6000a1664000a12a4000a1464000542a6
def wf (γ : ℕ) : ℕ := (WTAB >>> (32 * γ)) % 2 ^ 32
def wc (γ : ℕ) : ℕ := if wf γ % 4 = 0 then 248 else if wf γ % 4 = 1 then 249 else 410
def wt (γ : ℕ) : Bool := (wf γ >>> 2) % 2 == 1
def wP (γ : ℕ) : ℕ := (wf γ >>> 3) % 512
def wQ (γ : ℕ) : ℕ := (wf γ >>> 12) % 512

def KM248 : ℕ := RT.kM RT.K3eD_Cls.CL 248
def KM249 : ℕ := RT.kM RT.K3eD_Cls.CL 249
def KM410 : ℕ := RT.kM RT.K3eD_Cls.CL 410
def wchkOne (γ : ℕ) : Bool :=
  C3.isGL (wP γ) && C3.isGL (wQ γ) &&
    HC.mapsTo (wt γ) (wP γ) (wQ γ) (if wf γ % 4 = 0 then KM248 else if wf γ % 4 = 1 then KM249 else KM410) (spanK γ)
theorem wchk_true : S5.allLT 512 wchkOne = true := by decide +kernel

/-- **every `K + γ` has class bound 14** (given the bounds of classes 248, 249, 410) -/
theorem fact_spanK (hcls : ∀ c, (c = 248 ∨ c = 249 ∨ c = 410) → RT.Fact (RT.kM RT.K3eD_Cls.CL c) 14)
    (γ : ℕ) (hγ : γ < 512) : RT.Fact (spanK γ) 14 := by
  have h := S5.allLT_spec wchk_true γ hγ
  simp only [wchkOne, Bool.and_eq_true] at h
  obtain ⟨⟨hP, hQ⟩, hm⟩ := h
  by_cases h0 : wf γ % 4 = 0
  · rw [if_pos h0] at hm
    exact HC.fact_transport' hP hQ hm (hcls 248 (Or.inl rfl))
  · rw [if_neg h0] at hm
    by_cases h1 : wf γ % 4 = 1
    · rw [if_pos h1] at hm
      exact HC.fact_transport' hP hQ hm (hcls 249 (Or.inr (Or.inl rfl)))
    · rw [if_neg h1] at hm
      exact HC.fact_transport' hP hQ hm (hcls 410 (Or.inr (Or.inr rfl)))

/-! ## The linear algebra of the confinement step -/

section conf
variable {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3)

/-- the terms outside `W0` -/
def Ow : Finset (Fin n) := univ.filter (fun s => ¬ av s < 64)

/-- `N β = (β(b_s))_{s ∈ O}` -/
def Nmap : (Fin 3 × Fin 3 → F2) →ₗ[F2] (↥(Ow av) → F2) :=
  Matrix.mulVecLin (fun (s : ↥(Ow av)) (y : Fin 3 × Fin 3) => b s.1 y.1 y.2)

/-- `τ_s = p_s ⊗ g_s` -/
def tau (s : ↥(Ow av)) : Fin 3 × (Fin 3 × Fin 2) → F2 := fun q => toM3 (av s.1) 2 q.1 * c s.1 q.2.1 q.2.2.castSucc

/-- `g_s` = `c_s` off column 2 -/
def gv (s : ↥(Ow av)) : Fin 3 × Fin 2 → F2 := fun z => c s.1 z.1 z.2.castSucc

variable {av b c}

theorem row2_zero (hav : ∀ s, av s < 512) {s : Fin n} (hs : s ∉ Ow av) (j : Fin 3) : toM3 (av s) 2 j = 0 := by
  simp only [Ow, mem_filter, mem_univ, true_and, not_not] at hs
  exact (lt64_iff (av s) (hav s)).mp hs j

theorem sum_O {M : Type*} [AddCommMonoid M] (f : Fin n → M) (hf : ∀ s, s ∉ Ow av → f s = 0) :
    ∑ s : ↥(Ow av), f s.1 = ∑ s, f s := by
  rw [Finset.sum_coe_sort (Ow av) f]
  exact Finset.sum_subset (subset_univ _) (fun s _ hs => hf s hs)

theorem N_inj (hav : ∀ s, av s < 512) (hd : IsDecomp (fun s => toM3 (av s)) b c) :
    Function.Injective (Nmap av b) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro β hβ
  funext y
  obtain ⟨j, k'⟩ := y
  have hz : ∀ s : ↥(Ow av), ∑ y : Fin 3 × Fin 3, b s.1 y.1 y.2 * β y = 0 := by
    intro s
    have := congrFun hβ s
    simpa [Nmap, Matrix.mulVecLin_apply, Matrix.mulVec, dotProduct] using this
  have e : ∀ y : Fin 3 × Fin 3, ∑ s, toM3 (av s) 2 j * b s y.1 y.2 * c s k' 2 =
      if y = (j, k') then 1 else 0 := by
    intro y
    rw [hd 2 j y.1 y.2 k' 2]
    by_cases h : y = (j, k')
    · subst h; simp
    · rw [if_neg, if_neg h]
      rintro ⟨h1, h2, -⟩
      exact h (Prod.ext h1.symm h2)
  have key : β (j, k') = ∑ y : Fin 3 × Fin 3, β y * ∑ s, toM3 (av s) 2 j * b s y.1 y.2 * c s k' 2 := by
    simp only [e, mul_ite, mul_one, mul_zero, Finset.sum_ite_eq', Finset.mem_univ, if_true]
  rw [key]
  have e2 : ∑ y : Fin 3 × Fin 3, β y * ∑ s, toM3 (av s) 2 j * b s y.1 y.2 * c s k' 2 =
      ∑ s, toM3 (av s) 2 j * c s k' 2 * ∑ y : Fin 3 × Fin 3, b s y.1 y.2 * β y := by
    simp only [Finset.mul_sum]
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl (fun s _ => Finset.sum_congr rfl (fun y _ => by ring))
  rw [e2]
  apply Finset.sum_eq_zero
  intro s _
  by_cases hs : s ∈ Ow av
  · rw [hz ⟨s, hs⟩, mul_zero]
  · rw [row2_zero hav hs j, zero_mul, zero_mul]

theorem tau_comb (hav : ∀ s, av s < 512) (hd : IsDecomp (fun s => toM3 (av s)) b c) (y : Fin 3 × Fin 3) :
    ∑ s : ↥(Ow av), b s.1 y.1 y.2 • tau av c s = 0 := by
  funext q
  obtain ⟨j, k', i'⟩ := q
  simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, tau, Pi.zero_apply]
  rw [sum_O (fun s => b s y.1 y.2 * (toM3 (av s) 2 j * c s k' i'.castSucc))
    (fun s hs => by beta_reduce; rw [row2_zero hav hs j]; ring)]
  have e : ∑ s, b s y.1 y.2 * (toM3 (av s) 2 j * c s k' i'.castSucc) =
      ∑ s, toM3 (av s) 2 j * b s y.1 y.2 * c s k' i'.castSucc := Finset.sum_congr rfl (fun s _ => by ring)
  rw [e, hd 2 j y.1 y.2 k' i'.castSucc, if_neg]
  rintro ⟨-, -, h⟩
  have := congrArg Fin.val h
  simp at this
  omega

theorem span_g_le (hav : ∀ s, av s < 512) :
    Module.finrank F2 (Submodule.span F2 (Set.range (gv av c))) ≤
      Module.finrank F2 (Submodule.span F2 (Set.range (tau av c))) := by
  classical
  obtain ⟨κ, a, ha, hspan, hli⟩ := exists_linearIndependent' F2 (tau av c)
  haveI : Fintype κ := Fintype.ofInjective a ha
  have h1 : Module.finrank F2 (Submodule.span F2 (Set.range (tau av c))) = Fintype.card κ := by
    rw [← hspan]; exact finrank_span_eq_card hli
  have h2 : Submodule.span F2 (Set.range (gv av c)) ≤ Submodule.span F2 (Set.range (gv av c ∘ a)) := by
    rw [Submodule.span_le]
    rintro _ ⟨s, rfl⟩
    have hs : tau av c s ∈ Submodule.span F2 (Set.range (tau av c ∘ a)) := by
      rw [hspan]; exact Submodule.subset_span ⟨s, rfl⟩
    obtain ⟨f, hf⟩ := (Submodule.mem_span_range_iff_exists_fun F2).mp hs
    have hO := s.2
    simp only [Ow, mem_filter, mem_univ, true_and] at hO
    have hex : ∃ j0, toM3 (av s.1) 2 j0 ≠ 0 := by
      by_contra hc
      push Not at hc
      exact hO ((lt64_iff _ (hav s.1)).mpr hc)
    obtain ⟨j0, hj0⟩ := hex
    have hj1 := F2_ne_zero hj0
    refine (Submodule.mem_span_range_iff_exists_fun F2).mpr ⟨fun k => f k * toM3 (av (a k).1) 2 j0, ?_⟩
    funext z
    have := congrFun hf (j0, z)
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Function.comp, tau] at this
    rw [hj1, one_mul] at this
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Function.comp, gv, SetLike.mem_coe]
    rw [← this]
    exact Finset.sum_congr rfl (fun k _ => by ring)
  calc Module.finrank F2 (Submodule.span F2 (Set.range (gv av c)))
      ≤ Module.finrank F2 (Submodule.span F2 (Set.range (gv av c ∘ a))) := Submodule.finrank_mono h2
    _ ≤ Fintype.card κ := finrank_range_le_card (gv av c ∘ a)
    _ = _ := h1.symm

end conf

/-- **Lemma W(a)** for the row-type space `W0 = {row 2 = 0}` (`av s < 64`): a decomposition with at most 22 terms has at
least 11 first factors outside `W0`. -/
theorem lemmaW0 (hcls : ∀ c, (c = 248 ∨ c = 249 ∨ c = 410) → RT.Fact (RT.kM RT.K3eD_Cls.CL c) 14)
    {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (hn : n ≤ 22) : 11 ≤ (Ow av).card := by
  classical
  by_contra hlt
  push Not at hlt
  have hNinj := N_inj hav hd
  have h9 : 9 ≤ (Ow av).card := by
    have := LinearMap.finrank_le_finrank_of_injective hNinj
    simpa [Module.finrank_fintype_fun_eq_card] using this
  have hLN : LinearMap.range (Nmap av b) ≤ LinearMap.ker (Fintype.linearCombination F2 (tau av c)) := by
    rintro x ⟨β, rfl⟩
    rw [LinearMap.mem_ker, Fintype.linearCombination_apply]
    have hN : ∀ s : ↥(Ow av), (Nmap av b β) s = ∑ y : Fin 3 × Fin 3, b s.1 y.1 y.2 * β y := fun s => rfl
    simp only [hN, Finset.sum_smul]
    rw [Finset.sum_comm]
    apply Finset.sum_eq_zero
    intro y _
    have e : ∑ s : ↥(Ow av), (b s.1 y.1 y.2 * β y) • tau av c s = β y • ∑ s : ↥(Ow av), b s.1 y.1 y.2 • tau av c s := by
      rw [Finset.smul_sum]
      exact Finset.sum_congr rfl (fun s _ => by rw [smul_smul, mul_comm])
    rw [e, tau_comb hav hd y, smul_zero]
  have hrkN : Module.finrank F2 (LinearMap.range (Nmap av b)) = 9 := by
    rw [LinearMap.finrank_range_of_inj hNinj]; simp [Module.finrank_fintype_fun_eq_card]
  have hker : 9 ≤ Module.finrank F2 (LinearMap.ker (Fintype.linearCombination F2 (tau av c))) :=
    hrkN ▸ Submodule.finrank_mono hLN
  have hsum := LinearMap.finrank_range_add_finrank_ker (Fintype.linearCombination F2 (tau av c))
  have hcardO : Module.finrank F2 (↥(Ow av) → F2) = (Ow av).card := by simp [Module.finrank_fintype_fun_eq_card]
  have hτ : Module.finrank F2 (Submodule.span F2 (Set.range (tau av c))) ≤ (Ow av).card - 9 := by
    rw [← Fintype.range_linearCombination]; omega
  have hg := span_g_le (c := c) hav
  have hg1 : Module.finrank F2 (Submodule.span F2 (Set.range (gv av c))) ≤ 1 := by omega
  obtain ⟨v, hv⟩ := (finrank_le_one_iff (K := F2)).mp hg1
  have hline : ∀ s, gv av c s = 0 ∨ gv av c s = (v : Fin 3 × Fin 2 → F2) := by
    intro s
    obtain ⟨μ, hμ⟩ := hv ⟨gv av c s, Submodule.subset_span ⟨s, rfl⟩⟩
    have hμ' := congrArg Subtype.val hμ
    simp only [SetLike.val_smul] at hμ'
    rcases F2_cases μ with h | h
    · left; rw [← hμ', h, zero_smul]
    · right; rw [← hμ', h, one_smul]
  set γ : Fin 3 × Fin 2 → F2 := (v : Fin 3 × Fin 2 → F2) with hγdef
  let γM : M3 := fun k i => if h : i.val < 2 then γ (k, ⟨i.val, h⟩) else 0
  let γc := S5.natOf (vecC γM)
  let cv : Fin n → ℕ := fun s => S5.natOf (vecC (c s))
  have hcv : ∀ s, toM3 (cv s) = c s := fun s => toM3_natOf_vecC (c s)
  have hγc : toM3 γc = γM := toM3_natOf_vecC γM
  have hin : ∀ s ∈ Ow av, (spanK γc).testBit (cv s) = true := by
    intro s hs
    rw [spanK_bit γc (cv s) (S5.natOf_lt _), Bool.or_eq_true]
    rcases hline ⟨s, hs⟩ with h0 | h1
    · left
      rw [kB_iff _ (S5.natOf_lt _)]
      intro k i
      rw [hcv]
      exact congrFun h0 (k, i)
    · right
      rw [kB_iff _ (Nat.xor_lt_two_pow (n := 9) (S5.natOf_lt _) (S5.natOf_lt _))]
      intro k i
      rw [RT.toM3_xor, hcv, hγc, Matrix.add_apply]
      have hk := congrFun h1 (k, i)
      simp only [gv] at hk
      rw [hk]
      simp only [γM, Fin.val_castSucc, i.isLt, dif_pos]
      exact F2_add_self _
  have hrot : IsDecomp (fun s => toM3 (cv s)) (fun s => toM3 (av s)) b := by
    have h2 := isDecomp_rot (isDecomp_rot hd)
    have hc : c = fun s => toM3 (cv s) := funext (fun s => (hcv s).symm)
    rw [hc] at h2
    exact h2
  have hF := fact_spanK hcls γc (S5.natOf_lt _) n cv (fun s => toM3 (av s)) b (fun s => S5.natOf_lt _) hrot
  have hsub : univ.filter (fun s => (spanK γc).testBit (cv s) = false) ⊆ univ.filter (fun s => av s < 64) := by
    intro s hs
    simp only [mem_filter, mem_univ, true_and] at hs ⊢
    by_contra h
    have := hin s (by simp only [Ow, mem_filter, mem_univ, true_and]; exact h)
    rw [this] at hs
    exact absurd hs (by decide)
  have hc1 := card_le_card hsub
  have hc2 : (univ.filter (fun s : Fin n => av s < 64)).card + (Ow av).card = n := by
    rw [Ow, ← card_union_of_disjoint (disjoint_filter_filter_not _ _ _), filter_union_filter_not_eq, card_univ,
      Fintype.card_fin]
  omega

end L479

namespace L479
open RootSound Matrix Finset

/-- column 2 of `v` vanishes iff the transpose has row 2 zero: `trN v < 64 ↔ v &&& 292 = 0` -/
def colB (v : ℕ) : Bool := decide (C3.trN v < 64) == decide (v &&& 292 = 0) && decide (C3.trN v < 512)
theorem colB_true : S5.allLT 512 colB = true := by decide +kernel

/-- **Lemma W(a)** for the column-type space `W0' = {column 2 = 0}` (`av s &&& 292 = 0`), by transposition. -/
theorem lemmaW0' (hcls : ∀ c, (c = 248 ∨ c = 249 ∨ c = 410) → RT.Fact (RT.kM RT.K3eD_Cls.CL c) 14)
    {n : ℕ} (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (hn : n ≤ 22) :
    11 ≤ (univ.filter (fun s => ¬ (av s &&& 292 = 0))).card := by
  have hcb : ∀ s, (C3.trN (av s) < 64 ↔ av s &&& 292 = 0) ∧ C3.trN (av s) < 512 := by
    intro s
    have h := S5.allLT_spec colB_true (av s) (hav s)
    simp only [colB, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    exact ⟨decide_eq_decide.mp h.1, h.2⟩
  have hdT : IsDecomp (fun s => toM3 (C3.trN (av s))) (fun s => (c s)ᵀ) (fun s => (b s)ᵀ) := by
    have := C3.isDecomp_tr hd
    simp only [C3.toM3_trN]
    exact this
  have h := lemmaW0 hcls (fun s => C3.trN (av s)) _ _ (fun s => (hcb s).2) hdT hn
  unfold Ow at h
  have e : univ.filter (fun s => ¬ C3.trN (av s) < 64) = univ.filter (fun s => ¬ (av s &&& 292 = 0)) := by
    ext s; simp only [mem_filter, mem_univ, true_and, (hcb s).1]
  rw [e] at h
  exact h

end L479

#print axioms L479.lemmaW0
#print axioms L479.lemmaW0'
