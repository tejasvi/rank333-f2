module
public import R22Port.U_d41d8cd98f00
public import S5.Masks
/-! # Linear algebra of an accepted elimination

For `M0` whose slot `z` is `(column z of A | e_z)` and `elimOk (elim M0)`:
* every slot of the final `P`, `M` is `(A r | r)` (`linP`, `linM`), and the columns of `A` lie in the span of the
  pivot rows (`colsub`);
* `rank A ≥ rk` (`rank_ge_elim`), `col A ⊆ lmC` (`lmC_of_range`), `xof` inverts `A` on its column space
  (`xof_inv`), `row A ⊆ kerM` (`kerM_of_range`). -/
@[expose] public section
namespace S5
open BC4 BC5 RootSound Matrix

def lix (y : Fin 9) : Fin 18 := ⟨y.val, by omega⟩
def rix (j : Fin 9) : Fin 18 := ⟨9 + j.val, by omega⟩
def leftL : (Fin 18 → F2) →ₗ[F2] (Fin 9 → F2) := LinearMap.funLeft F2 F2 lix
def rightL : (Fin 18 → F2) →ₗ[F2] (Fin 9 → F2) := LinearMap.funLeft F2 F2 rix

/-- left / right half of slot `z` -/
def lv (N z : Nat) : Fin 9 → F2 := fun y => bitF N (18 * z + y.val)
def rv (N z : Nat) : Fin 9 → F2 := fun j => bitF N (18 * z + (9 + j.val))

theorem leftL_sv (N z : Nat) : leftL (sv N z) = lv N z := rfl
theorem rightL_sv (N z : Nat) : rightL (sv N z) = rv N z := rfl

/-- the matrix whose column `z` is the left half of slot `z` -/
def amat (M0 : Nat) : Matrix (Fin 9) (Fin 9) F2 := fun y z => bitF M0 (18 * z.val + y.val)

/-- the right halves are the identity -/
def RightId (M0 : Nat) : Prop := ∀ z j, z < 9 → j < 9 → M0.testBit (18 * z + (9 + j)) = decide (j = z)

def linA (A : Matrix (Fin 9) (Fin 9) F2) : Submodule F2 (Fin 18 → F2) :=
  LinearMap.ker (leftL - A.mulVecLin ∘ₗ rightL)

theorem mem_linA {A : Matrix (Fin 9) (Fin 9) F2} {w : Fin 18 → F2} : w ∈ linA A ↔ leftL w = A *ᵥ rightL w := by
  simp [linA, LinearMap.mem_ker, sub_eq_zero]

theorem span0_le (M0 : Nat) (hR : RightId M0) : spanS ⟨0, 0, 0, 0, 0, M0⟩ ≤ linA (amat M0) := by
  apply Submodule.span_le.mpr
  rintro _ ⟨i, rfl⟩
  rcases i with h | z
  · show sv 0 h.val ∈ linA _
    have : sv 0 h.val = 0 := by funext i; simp [sv, bitF]
    rw [this]; exact Submodule.zero_mem _
  · show sv M0 z.val ∈ linA _
    rw [mem_linA, leftL_sv, rightL_sv]
    have hr : rv M0 z.val = Pi.single z 1 := by
      funext j
      simp only [rv, bitF, hR z.val j.val z.isLt j.isLt, Pi.single_apply]
      by_cases e : j = z
      · subst e; simp
      · have : j.val ≠ z.val := fun h => e (Fin.ext h)
        simp [e, this]
    rw [hr]
    funext y
    simp [Matrix.mulVec, dotProduct, Pi.single_apply, amat, lv]

structure ElimFacts (A : Matrix (Fin 9) (Fin 9) F2) (s : ES) : Prop where
  linP : ∀ h : Fin 9, lv s.P h.val = A *ᵥ rv s.P h.val
  linM : ∀ z : Fin 9, lv s.M z.val = A *ᵥ rv s.M z.val
  colsub : ∀ z : Fin 9, (fun y => A y z) ∈ Submodule.span F2 (Set.range (fun h : Fin 9 => lv s.P h.val))
  mzero : ∀ z y, z < 9 → y < 9 → s.M.testBit (18 * z + y) = false
  above : ∀ h j, h < 9 → j < 9 → h < j → s.P.testBit (18 * h + j) = false
  piv : ∀ h j, h < 9 → j < 9 → s.PM.testBit j = true → s.P.testBit (18 * h + j) = decide (h = j)
  pz : ∀ i, s.P.testBit i = true → s.PM.testBit (i / 18) = true
  pre : Pre 0 s

theorem elim_facts (M0 : Nat) (hR : RightId M0) (hok : elimOk (elim M0) = true) :
    ElimFacts (amat M0) (elim M0) := by
  obtain ⟨hpre, hspan⟩ := elim_spec M0
  obtain ⟨o1, o2, o3, o4⟩ := elimOk_spec _ hpre hok
  have hle : spanS (elim M0) ≤ linA (amat M0) := by rw [hspan]; exact span0_le M0 hR
  refine ⟨fun h => mem_linA.mp (hle (sv_memP _ h)), fun z => mem_linA.mp (hle (sv_mem _ z)), ?_, o1, o2, o3, o4,
    hpre⟩
  intro z
  have hmem : sv M0 z.val ∈ spanS (elim M0) := by
    rw [hspan]; exact sv_mem ⟨0, 0, 0, 0, 0, M0⟩ z
  have h2 : leftL (sv M0 z.val) ∈ (spanS (elim M0)).map leftL := Submodule.mem_map_of_mem hmem
  rw [spanS, Submodule.map_span] at h2
  show leftL (sv M0 z.val) ∈ _
  refine (Submodule.span_le.mpr ?_) h2
  rintro _ ⟨_, ⟨i, rfl⟩, rfl⟩
  rcases i with h | z'
  · exact Submodule.subset_span ⟨h, rfl⟩
  · have : leftL (fam (elim M0) (Sum.inr z')) = 0 := by
      funext y; show bitF (elim M0).M (18 * z'.val + y.val) = 0
      rw [bitF_bf, o1 z'.val y.val z'.isLt y.isLt]; rfl
    rw [this]; exact Submodule.zero_mem _

variable {A : Matrix (Fin 9) (Fin 9) F2} {s : ES}

theorem rank_ge_elim (hf : ElimFacts A s) : s.rk ≤ A.rank := by
  classical
  let S : Finset (Fin 9) := Finset.univ.filter (fun h => s.PM.testBit h.val = true)
  have hS : s.rk = S.card := by
    rw [hf.pre.rk, cntB_sum, Finset.card_filter, ← Fin.sum_univ_eq_sum_range]
    apply Finset.sum_congr rfl; intro i _; cases s.PM.testBit i.val <;> rfl
  rw [hS]
  let e := S.orderEmbOfFin rfl
  have hmemS : ∀ i, s.PM.testBit (e i).val = true := by
    intro i; have := S.orderEmbOfFin_mem rfl i; exact (Finset.mem_filter.mp this).2
  apply rank_ge_of_pivots A (fun i => lv s.P (e i).val) (fun i => e i) e.injective
  · intro i
    show bitF s.P (18 * (e i).val + (e i).val) ≠ 0
    rw [bitF_bf, hf.piv _ _ (e i).isLt (e i).isLt (hmemS i)]; simp [bf]
  · intro i j hij
    show bitF s.P (18 * (e i).val + j.val) = 0
    rw [bitF_bf, hf.above _ _ (e i).isLt j.isLt hij]; rfl
  · intro i
    show lv s.P (e i).val ∈ _
    rw [hf.linP (e i)]; exact LinearMap.mem_range_self _ _

theorem range_le_span (hf : ElimFacts A s) :
    LinearMap.range A.mulVecLin ≤ Submodule.span F2 (Set.range (fun h : Fin 9 => lv s.P h.val)) := by
  rw [Matrix.range_mulVecLin]
  apply Submodule.span_le.mpr
  rintro _ ⟨z, rfl⟩
  exact hf.colsub z

theorem lv_zero (hf : ElimFacts A s) (h : Fin 9) (hh : s.PM.testBit h.val = false) : lv s.P h.val = 0 := by
  funext y; show bitF s.P _ = 0
  rw [bitF_bf]; cases e : s.P.testBit (18 * h.val + y.val)
  · rfl
  · have := hf.pz _ e
    rw [show (18 * h.val + y.val) / 18 = h.val by omega, hh] at this
    exact absurd this (by decide)

/-- in the span of the pivot rows, a vector is the sum of the pivot rows weighted by its own coordinates -/
theorem rref_recon (hf : ElimFacts A s) (v : Fin 9 → F2)
    (hv : v ∈ Submodule.span F2 (Set.range (fun h : Fin 9 => lv s.P h.val))) :
    ∑ h : Fin 9, v h • lv s.P h.val = v := by
  obtain ⟨c, rfl⟩ := (Submodule.mem_span_range_iff_exists_fun F2).mp hv
  have hcoef : ∀ h : Fin 9, s.PM.testBit h.val = true → (∑ h', c h' • lv s.P h'.val) h = c h := by
    intro h hh
    rw [Finset.sum_apply]
    simp only [Pi.smul_apply, smul_eq_mul]
    rw [Finset.sum_eq_single h]
    · show c h * bitF s.P (18 * h.val + h.val) = c h
      rw [bitF_bf, hf.piv _ _ h.isLt h.isLt hh]; simp [bf]
    · intro h' _ hne
      show c h' * bitF s.P (18 * h'.val + h.val) = 0
      rw [bitF_bf, hf.piv _ _ h'.isLt h.isLt hh]
      have : ¬ (h'.val = h.val) := fun e => hne (Fin.ext e)
      simp [this, bf]
    · simp
  apply Finset.sum_congr rfl
  intro h _
  by_cases hh : s.PM.testBit h.val = true
  · rw [hcoef h hh]
  · rw [Bool.not_eq_true] at hh; rw [lv_zero hf h hh, smul_zero, smul_zero]

theorem nv_xof (P w : Nat) (hw : w < 512) : nv (xof P w) = ∑ h : Fin 9, bitF w h.val • rv P h.val := by
  funext j
  rw [Finset.sum_apply]; simp only [Pi.smul_apply, smul_eq_mul]
  show bitF (xof P w) j.val = _
  rw [bitF_bf, xof_bf P w j.val hw j.isLt, ← Fin.sum_univ_eq_sum_range]
  rfl

/-- `xof P` inverts `A` on its column space -/
theorem xof_inv (hf : ElimFacts A s) (w : Nat) (hw : w < 512) (hv : nv w ∈ LinearMap.range A.mulVecLin) :
    A *ᵥ nv (xof s.P w) = nv w := by
  rw [nv_xof s.P w hw, Matrix.mulVec_sum]
  simp only [Matrix.mulVec_smul]
  have : ∀ h : Fin 9, A *ᵥ rv s.P h.val = lv s.P h.val := fun h => (hf.linP h).symm
  simp only [this]
  exact rref_recon hf (nv w) (range_le_span hf hv)

theorem gor_bit (P j i : Nat) (hi : i < 9) :
    (gather P j ||| 2 ^ j).testBit i = (decide (i = j) || P.testBit (18 * i + j)) := by
  rw [Nat.testBit_or, gather_bit, Nat.testBit_two_pow]
  have : (j = i) ↔ (i = j) := ⟨fun h => h.symm, fun h => h.symm⟩
  simp only [hi, decide_true, Bool.true_and, this, Bool.or_comm]

/-- the constraint of a non-pivot column `j` kills every pivot row -/
theorem lv_dot_g (hf : ElimFacts A s) (j : Nat) (hj : j < 9) (hpj : s.PM.testBit j = false) (h : Fin 9) :
    lv s.P h.val ⬝ᵥ nv (gather s.P j ||| 2 ^ j) = 0 := by
  by_cases hh : s.PM.testBit h.val = true
  · have hjh : h.val ≠ j := fun e => by rw [e, hpj] at hh; exact absurd hh (by decide)
    have pt : ∀ i : Fin 9, lv s.P h.val i * nv (gather s.P j ||| 2 ^ j) i =
        (if i = (⟨j, hj⟩ : Fin 9) then bitF s.P (18 * h.val + j) else 0) +
        (if i = h then bitF s.P (18 * h.val + j) else 0) := by
      intro i
      have hiff : (i = (⟨j, hj⟩ : Fin 9)) ↔ i.val = j := Fin.ext_iff
      simp only [lv, nv, bitF_bf, gor_bit s.P j i.val i.isLt]
      by_cases e1 : i.val = j
      · have e2 : i ≠ h := fun x => hjh (by rw [← x, e1])
        rw [if_pos (hiff.mpr e1), if_neg e2, e1]
        simp [bf]
      · rw [if_neg (fun x => e1 (hiff.mp x))]
        by_cases e2 : i = h
        · rw [if_pos e2]
          subst e2
          rw [hf.piv _ _ i.isLt i.isLt hh]
          simp [e1, bf]
        · rw [if_neg e2]
          have e2' : h.val ≠ i.val := fun x => e2 (Fin.ext x.symm)
          simp only [e1, decide_false, Bool.false_or, add_zero]
          by_cases hi : s.PM.testBit i.val = true
          · rw [hf.piv _ _ h.isLt i.isLt hi]; simp [e2', bf]
          · rw [Bool.not_eq_true] at hi
            have : s.P.testBit (18 * i.val + j) = false := by
              cases e : s.P.testBit (18 * i.val + j)
              · rfl
              · have := hf.pz _ e
                rw [show (18 * i.val + j) / 18 = i.val by omega, hi] at this
                exact absurd this (by decide)
            rw [this]; simp [bf]
    simp only [dotProduct, pt, Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.sum_ite_eq, Finset.mem_univ,
      if_true]
    exact f2_add_self _
  · rw [Bool.not_eq_true] at hh; rw [lv_zero hf h hh, zero_dotProduct]

theorem lmC_of_range (hf : ElimFacts A s) (w : Nat) (hw : w < 512) (hv : nv w ∈ LinearMap.range A.mulVecLin) :
    (lmC s.P s.PM).testBit w = true := by
  apply lmC_mem _ _ _ hw
  intro j hj hpj
  apply bf_inj
  rw [← dot_nv w _ hw]
  show nv w ⬝ᵥ nv (gather s.P j ||| 2 ^ j) = 0
  refine Submodule.span_induction (p := fun v _ => v ⬝ᵥ nv (gather s.P j ||| 2 ^ j) = 0) ?_ ?_ ?_ ?_
    (range_le_span hf hv)
  · rintro _ ⟨h, rfl⟩; exact lv_dot_g hf j hj hpj h
  · simp
  · intro x y _ _ hx hy; rw [add_dotProduct, hx, hy, add_zero]
  · intro a x _ hx; rw [smul_dotProduct, hx, smul_zero]

theorem nv_rgt (M z : Nat) : nv (((M >>> (18 * z)) &&& M18) >>> 9) = rv M z := by
  funext j; show bitF _ j.val = bitF M (18 * z + (9 + j.val))
  rw [bitF_bf, bitF_bf, rgt_bit M z j.val j.isLt]

theorem kerM_of_range (hf : ElimFacts A s) (w : Nat) (hw : w < 512) (hv : nv w ∈ LinearMap.range Aᵀ.mulVecLin) :
    (kerM s.M).testBit w = true := by
  apply kerM_mem _ _ hw
  intro z hz
  apply bf_inj
  rw [← dot_nv w _ hw, nv_rgt]
  obtain ⟨u, hu⟩ := hv
  rw [Matrix.mulVecLin_apply] at hu
  rw [← hu, Matrix.mulVec_transpose, ← Matrix.dotProduct_mulVec, ← hf.linM ⟨z, hz⟩]
  have : lv s.M z = 0 := by
    funext y; show bitF s.M _ = 0; rw [bitF_bf, hf.mzero z y.val hz y.isLt]; rfl
  rw [this, dotProduct_zero]; rfl

end S5
