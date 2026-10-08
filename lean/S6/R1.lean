module
public import R22Port.U_d41d8cd98f00
public import S6.R1Mat
public import RootSound.Rank1
/-! # Soundness of the rank-1 claims (`rank1`, `mkRec6`, `mkSl6`, `over6`)

`rank1_facts`: for one assigned term `(b0, c0)` through `X` and passing witness checks, `rank1 X b0 c0` carries the
facts S5 needs about the residual `R = T(X) + b0 c0ᵀ` (as `ElimFacts` does for an elimination): `rk ≤ rank R`, the masks
contain `col R` / `row R`, and `xof P` inverts `R` on `col R`.  The five cases are `RootSound.Rank1.caseA..E` over
`F2`, with the root record of `X` exact (R1Mat).  Then `mkRec6_sound`, `mkSl6_sound`, `over6_false` have the shape of
S5's `mkRec_sound`, `mkSl_sound`, `over_step`, and reduce to them when the dispatch takes v5's branch. -/
@[expose] public section
namespace S6
open BC4 BC5 BC6 BC6s S5 RootSound Matrix

instance charP_F2 : CharP F2 2 := ZMod.charP 2

/-- what S5 needs about a computed record for the residual `A` -/
structure R1Facts (A : Matrix (Fin 9) (Fin 9) F2) (q : R1) : Prop where
  rk : q.rk ≤ A.rank
  col : ∀ v, v < 512 → nv v ∈ LinearMap.range A.mulVecLin → q.lm.testBit v = true
  row : ∀ w, w < 512 → nv w ∈ LinearMap.range Aᵀ.mulVecLin → q.rm.testBit w = true
  inv : ∀ w, w < 512 → nv w ∈ LinearMap.range A.mulVecLin → A *ᵥ nv (xof q.P w) = nv w

theorem nv_inj {v w : Nat} (hv : v < 512) (hw : w < 512) (h : nv v = nv w) : v = w := by
  rw [← natOf_nv v hv, ← natOf_nv w hw, h]

theorem bf_one_iff (p : Bool) : bf p = 1 ↔ p = true := by cases p <;> decide
theorem bf_zero_iff (p : Bool) : bf p = 0 ↔ p = false := by cases p <;> decide

theorem f2_cases (x : F2) : x = 0 ∨ x = 1 := zmod2_cases x

/-- `x ⬝ v` for 9-bit numbers is the parity of the AND -/
theorem dot_par (w v : Nat) (hw : w < 512) : nv w ⬝ᵥ nv v = bf (par (w &&& v)) := dot_nv w v hw

theorem lt512_of_mask (m k : Nat) (h : (m &&& M512).testBit k = true) : k < 512 := by
  by_contra hk
  have hM : M512.testBit k = false := by
    rw [m512_eq, Nat.testBit_two_pow_sub_one]; exact decide_eq_false hk
  rw [Nat.testBit_and, hM, Bool.and_false] at h
  exact absurd h Bool.false_ne_true

theorem kerm_lt {X k : Nat} (h : (kerm X).testBit k = true) : k < 512 := lt512_of_mask _ _ h
theorem lkerm_lt {X l : Nat} (h : (lkerm X).testBit l = true) : l < 512 := lt512_of_mask _ _ h

theorem inv_root (X : Nat) (hX : X < 512) : Rank1.Inv (TX (toM3 X)) (Xm (rootP X)) := by
  intro v hv
  have h := root_inv X hX (natOf v) (natOf_lt v) (by rw [nv_natOf]; exact hv)
  rw [nv_xof_mat _ _ (natOf_lt v), nv_natOf] at h
  exact h

/-! ## The five cases, by name -/

def rA (X b0 c0 : Nat) : R1 :=
  ⟨Nat.sub (rootRk X) 1, Nat.land (rlm X) (perp (gof (rootP X) c0)), Nat.land (rrm X) (perp (xof (rootP X) b0)), rootP X, true⟩
def rB (X b0 c0 : Nat) : R1 :=
  ⟨rootRk X, rlm X, rrm X, corrP (rootP X) (gof (rootP X) c0) (xof (rootP X) b0), true⟩
def kC (X c0 : Nat) : Nat := firstPar (kb18 X) c0
def x0C (X b0 c0 : Nat) : Nat := Nat.xor (xof (rootP X) b0) (cond (par (Nat.land c0 (xof (rootP X) b0))) (kC X c0) 0)
def rC (X b0 c0 : Nat) : R1 :=
  ⟨rootRk X, rlm X, Nat.lor (Nat.land (rrm X) (perp (x0C X b0 c0))) (trans (Nat.land (rrm X) (nperp (x0C X b0 c0))) c0),
   corrP (rootP X) (gof (rootP X) c0) (x0C X b0 c0), par (Nat.land (kC X c0) c0) && bit (kerm X) (kC X c0)⟩
def lD (X b0 : Nat) : Nat := firstPar (lkb18 X) b0
def zD (X b0 c0 : Nat) : Nat := Nat.xor (gof (rootP X) c0) (cond (par (Nat.land (gof (rootP X) c0) b0)) (lD X b0) 0)
def rD (X b0 c0 : Nat) : R1 :=
  ⟨rootRk X, Nat.lor (Nat.land (rlm X) (perp (gof (rootP X) c0))) (trans (Nat.land (rlm X) (nperp (gof (rootP X) c0))) b0),
   rrm X, corrP (rootP X) (zD X b0 c0) (xof (rootP X) b0), par (Nat.land (lD X b0) b0) && bit (lkerm X) (lD X b0)⟩
def b1E (X b0 c0 : Nat) : Nat := Nat.xor (xof (rootP X) b0) (cond (par (Nat.land (gof (rootP X) c0) b0)) 0 (kC X c0))
def rE (X b0 c0 : Nat) : R1 :=
  ⟨Nat.succ (rootRk X), Nat.lor (rlm X) (trans (rlm X) b0), Nat.lor (rrm X) (trans (rrm X) c0),
   corrP (corrP (rootP X) (lD X b0) (b1E X b0 c0)) (gof (rootP X) c0) (kC X c0),
   par (Nat.land (kC X c0) c0) && bit (kerm X) (kC X c0) && par (Nat.land (lD X b0) b0) && bit (lkerm X) (lD X b0)⟩

theorem rank1_eq (X b0 c0 : Nat) : rank1 X b0 c0 =
    cond (bit (rlm X) b0)
      (cond (bit (rrm X) c0) (cond (par (Nat.land c0 (xof (rootP X) b0))) (rA X b0 c0) (rB X b0 c0)) (rC X b0 c0))
      (cond (bit (rrm X) c0) (rD X b0 c0) (rE X b0 c0)) := rfl

/-! ## Shared steps -/

section cases

theorem facts_of {q : R1} {A : Matrix (Fin 9) (Fin 9) F2} (hrk : q.rk ≤ A.rank)
    (hcol : ∀ v, v < 512 → nv v ∈ LinearMap.range A.mulVecLin → q.lm.testBit v = true)
    (hrow : ∀ w, w < 512 → nv w ∈ LinearMap.range Aᵀ.mulVecLin → q.rm.testBit w = true)
    (hinv : Rank1.Inv A (Xm q.P)) : R1Facts A q :=
  ⟨hrk, hcol, hrow, fun w hw hv => by rw [nv_xof_mat _ _ hw]; exact hinv _ hv⟩

/-- a vector of `{u + (x ⬝ u) e | u ∈ S}` is in the mask `(S ∩ perp x) ∪ trans (S ∩ nperp x) e` -/
theorem sect_mask {S x e w : Nat} (hx : x < 512) (he : e < 512) (hw : w < 512) (u : Fin 9 → F2)
    (hu : (natOf u < 512 → S.testBit (natOf u) = true)) (hwu : nv w = u + (nv x ⬝ᵥ u) • nv e) :
    (Nat.lor (Nat.land S (perp x)) (trans (Nat.land S (nperp x)) e)).testBit w = true := by
  have hS := hu (natOf_lt u)
  show ((S &&& perp x) ||| trans (S &&& nperp x) e).testBit w = true
  rw [Nat.testBit_or, Nat.testBit_and, Bool.or_eq_true]
  rcases f2_cases (nv x ⬝ᵥ u) with h | h
  · rw [h, zero_smul, add_zero] at hwu
    have hwu' : w = natOf u := by rw [← natOf_nv w hw, hwu]
    left
    rw [← hwu'] at hS
    rw [hS, Bool.true_and, perp_bit x w hx hw, Bool.not_eq_true']
    have := dot_par w x hw
    rw [hwu, dotProduct_comm, h] at this
    exact (bf_zero_iff _).mp this.symm
  · rw [h, one_smul] at hwu
    right
    have hl : u = nv (w ^^^ e) := by rw [nv_xor, hwu, add_assoc, CharTwo.add_self_eq_zero, add_zero]
    rw [trans_testBit _ _ _ he hw, Nat.testBit_and]
    have hlt : w ^^^ e < 512 := xor_lt w e hw he
    have hn : natOf u = w ^^^ e := by rw [hl, natOf_nv _ hlt]
    rw [← hn, hS, Bool.true_and, nperp_bit x _ hx (natOf_lt u)]
    have := dot_par (natOf u) x (natOf_lt u)
    rw [nv_natOf, dotProduct_comm, h] at this
    exact (bf_one_iff _).mp this.symm

/-- a vector of `S ⊔ ⟨e⟩` is in the mask `S ∪ trans S e` -/
theorem sup_mask {S e w : Nat} (he : e < 512) (hw : w < 512) (L : Submodule F2 (Fin 9 → F2))
    (hL : ∀ v, v < 512 → nv v ∈ L → S.testBit v = true) (hmem : nv w ∈ L ⊔ F2 ∙ nv e) :
    (Nat.lor S (trans S e)).testBit w = true := by
  obtain ⟨u, hu, y, hy, huy⟩ := Submodule.mem_sup.1 hmem
  obtain ⟨a, rfl⟩ := Submodule.mem_span_singleton.1 hy
  show (S ||| trans S e).testBit w = true
  rw [Nat.testBit_or, Bool.or_eq_true]
  rcases f2_cases a with h | h
  · left
    rw [h, zero_smul, add_zero] at huy
    exact hL w hw (huy ▸ hu)
  · right
    rw [h, one_smul] at huy
    rw [trans_testBit _ _ _ he hw]
    have hl : u = nv (w ^^^ e) := by rw [nv_xor, ← huy, add_assoc, CharTwo.add_self_eq_zero, add_zero]
    exact hL _ (xor_lt w e hw he) (hl ▸ hu)


/-! ## Case A: `b0 ∈ col`, `c0 ∈ row`, `c0 ⬝ x(b0) = 1` -/

theorem factsA {X b0 c0 : Nat} (hX : X < 512) (h0 : X ≠ 0) (hb : b0 < 512) (hc : c0 < 512) (hl : bit (rlm X) b0 = true) (hr : bit (rrm X) c0 = true) (hp : par (Nat.land c0 (xof (rootP X) b0)) = true) :
    R1Facts (TX (toM3 X) + vecMulVec (nv b0) (nv c0)) (rA X b0 c0) := by
  rw [bit_eq, root_col_iff X b0 hX hb] at hl
  rw [bit_eq, root_row_iff X c0 hX hc] at hr
  have h1 : nv c0 ⬝ᵥ (Xm (rootP X) *ᵥ nv b0) = 1 := by
    rw [← nv_xof_mat (rootP X) b0 hb, dot_par c0 _ hc]; exact (bf_one_iff _).mpr hp
  obtain ⟨hinv, hcol, hrow, hrk⟩ := Rank1.caseA (inv_root X hX) hl hr h1
  refine facts_of ?_ ?_ ?_ hinv
  · show rootRk X - 1 ≤ _
    rw [← root_rank X hX h0]; omega
  · intro v hv hvm
    obtain ⟨hvM, hg⟩ := (hcol (nv v)).1 hvm
    show ((rlm X) &&& (perp (gof (rootP X) c0))).testBit v = true
    rw [Nat.testBit_and, (root_col_iff X v hX hv).2 hvM, Bool.true_and, perp_bit _ _ (gof_lt _ _) hv, Bool.not_eq_true']
    have := dot_par v (gof (rootP X) c0) hv
    rw [nv_gof_mat (rootP X) c0 hc, dotProduct_comm, hg] at this
    exact (bf_zero_iff _).mp this.symm
  · intro w hw hwm
    obtain ⟨hwM, hy⟩ := (hrow (nv w)).1 hwm
    show ((rrm X) &&& (perp (xof (rootP X) b0))).testBit w = true
    rw [Nat.testBit_and, (root_row_iff X w hX hw).2 hwM, Bool.true_and, perp_bit _ _ (xof_lt _ _) hw, Bool.not_eq_true']
    have := dot_par w (xof (rootP X) b0) hw
    rw [nv_xof_mat (rootP X) b0 hb, hy] at this
    exact (bf_zero_iff _).mp this.symm

/-! ## Case B: `b0 ∈ col`, `c0 ∈ row`, `c0 ⬝ x(b0) = 0` -/

theorem factsB {X b0 c0 : Nat} (hX : X < 512) (h0 : X ≠ 0) (hb : b0 < 512) (hc : c0 < 512) (hl : bit (rlm X) b0 = true) (hr : bit (rrm X) c0 = true) (hp : par (Nat.land c0 (xof (rootP X) b0)) = false) :
    R1Facts (TX (toM3 X) + vecMulVec (nv b0) (nv c0)) (rB X b0 c0) := by
  rw [bit_eq, root_col_iff X b0 hX hb] at hl
  rw [bit_eq, root_row_iff X c0 hX hc] at hr
  have h0' : nv c0 ⬝ᵥ (Xm (rootP X) *ᵥ nv b0) = 0 := by
    rw [← nv_xof_mat (rootP X) b0 hb, dot_par c0 _ hc]; exact (bf_zero_iff _).mpr hp
  obtain ⟨hinv, hcol, hrow, hrk⟩ := Rank1.caseB (inv_root X hX) hl hr h0'
  refine facts_of ?_ ?_ ?_ ?_
  · show rootRk X ≤ _
    rw [hrk, root_rank X hX h0]
  · intro v hv hvm
    show (rlm X).testBit v = true
    change nv v ∈ Rank1.colSp _ at hvm
    rw [root_col_iff X v hX hv]; rwa [hcol] at hvm
  · intro w hw hwm
    show (rrm X).testBit w = true
    change nv w ∈ Rank1.colSp _ at hwm
    rw [root_row_iff X w hX hw]; rwa [hrow] at hwm
  · show Rank1.Inv _ (Xm (corrP (rootP X) (gof (rootP X) c0) (xof (rootP X) b0)))
    rw [Xm_corrP _ _ _ (gof_lt _ _) (xof_lt _ _), nv_xof_mat (rootP X) b0 hb, nv_gof_mat (rootP X) c0 hc]
    exact hinv

/-! ## Case C: `b0 ∈ col`, `c0 ∉ row` (witness `k`) -/

theorem factsC {X b0 c0 : Nat} (hX : X < 512) (h0 : X ≠ 0) (hb : b0 < 512) (hc : c0 < 512) (hl : bit (rlm X) b0 = true) (hr : bit (rrm X) c0 = false) (hok : (rC X b0 c0).ok = true) :
    R1Facts (TX (toM3 X) + vecMulVec (nv b0) (nv c0)) (rC X b0 c0) := by
  rw [bit_eq, root_col_iff X b0 hX hb] at hl
  have hok' : par (Nat.land (kC X c0) c0) = true ∧ bit (kerm X) (kC X c0) = true := by
    have : (par (Nat.land (kC X c0) c0) && bit (kerm X) (kC X c0)) = true := hok
    simpa [Bool.and_eq_true] using this
  obtain ⟨hpk, hkm⟩ := hok'
  rw [bit_eq] at hkm
  have hk : kC X c0 < 512 := kerm_lt hkm
  have hMk : TX (toM3 X) *ᵥ nv (kC X c0) = 0 := ker_fact X _ hX hk hkm
  have hck : nv c0 ⬝ᵥ nv (kC X c0) = 1 := by
    rw [dot_par c0 _ hc, Nat.and_comm]; exact (bf_one_iff _).mpr hpk
  set lam := bf (par (Nat.land c0 (xof (rootP X) b0))) with hlam
  have hlam' : nv c0 ⬝ᵥ nv (xof (rootP X) b0) = lam := dot_par c0 _ hc
  have hx0 : nv (x0C X b0 c0) = nv (xof (rootP X) b0) + lam • nv (kC X c0) := by
    rw [x0C, show Nat.xor (xof (rootP X) b0) (cond (par (Nat.land c0 (xof (rootP X) b0))) (kC X c0) 0) =
      xof (rootP X) b0 ^^^ cond (par (Nat.land c0 (xof (rootP X) b0))) (kC X c0) 0 from rfl, nv_xor, nv_cond]
  have hx0lt : x0C X b0 c0 < 512 := by
    show xof (rootP X) b0 ^^^ cond (par (Nat.land c0 (xof (rootP X) b0))) (kC X c0) 0 < 512
    apply xor_lt _ _ (xof_lt _ _)
    cases par (Nat.land c0 (xof (rootP X) b0))
    · rw [cond_false]; norm_num
    · rw [cond_true]; exact hk
  have hMx0 : TX (toM3 X) *ᵥ nv (x0C X b0 c0) = nv b0 := by
    rw [hx0, Matrix.mulVec_add, Matrix.mulVec_smul, hMk, smul_zero, add_zero, nv_xof_mat (rootP X) b0 hb]
    exact inv_root X hX _ hl
  have hcx0 : nv c0 ⬝ᵥ nv (x0C X b0 c0) = 0 := by
    rw [hx0, dotProduct_add, dotProduct_smul, hlam', hck, smul_eq_mul, mul_one, CharTwo.add_self_eq_zero]
  obtain ⟨hinv, hcol, hrow, hrk⟩ := Rank1.caseC (inv_root X hX) hl hMk hck hMx0 hcx0
  refine facts_of ?_ ?_ ?_ ?_
  · show rootRk X ≤ _
    rw [hrk, root_rank X hX h0]
  · intro v hv hvm
    show (rlm X).testBit v = true
    change nv v ∈ Rank1.colSp _ at hvm
    rw [root_col_iff X v hX hv]; rwa [hcol] at hvm
  · intro w hw hwm
    obtain ⟨u, hu, hwu⟩ := (hrow (nv w)).1 hwm
    refine sect_mask hx0lt hc hw u (fun hlt => ?_) hwu
    rw [root_row_iff X _ hX hlt, nv_natOf]; exact hu
  · show Rank1.Inv _ (Xm (corrP (rootP X) (gof (rootP X) c0) (x0C X b0 c0)))
    rw [Xm_corrP _ _ _ (gof_lt _ _) hx0lt, nv_gof_mat (rootP X) c0 hc]
    exact hinv

/-! ## Case D: `b0 ∉ col` (witness `l`), `c0 ∈ row` -/

theorem factsD {X b0 c0 : Nat} (hX : X < 512) (h0 : X ≠ 0) (hb : b0 < 512) (hc : c0 < 512) (hl : bit (rlm X) b0 = false) (hr : bit (rrm X) c0 = true) (hok : (rD X b0 c0).ok = true) :
    R1Facts (TX (toM3 X) + vecMulVec (nv b0) (nv c0)) (rD X b0 c0) := by
  rw [bit_eq, root_row_iff X c0 hX hc] at hr
  have hok' : par (Nat.land (lD X b0) b0) = true ∧ bit (lkerm X) (lD X b0) = true := by
    have : (par (Nat.land (lD X b0) b0) && bit (lkerm X) (lD X b0)) = true := hok
    simpa [Bool.and_eq_true] using this
  obtain ⟨hpl, hlm⟩ := hok'
  rw [bit_eq] at hlm
  have hll : lD X b0 < 512 := lkerm_lt hlm
  have hMl : (TX (toM3 X))ᵀ *ᵥ nv (lD X b0) = 0 := lker_fact X _ hX hll hlm
  have hbl : nv b0 ⬝ᵥ nv (lD X b0) = 1 := by
    rw [dot_par b0 _ hb, Nat.and_comm]; exact (bf_one_iff _).mpr hpl
  set mu := bf (par (Nat.land (gof (rootP X) c0) b0)) with hmu
  have hmu' : nv b0 ⬝ᵥ nv (gof (rootP X) c0) = mu := by
    rw [dot_par b0 _ hb, Nat.and_comm]; rfl
  have hz : nv (zD X b0 c0) = nv (gof (rootP X) c0) + mu • nv (lD X b0) := by
    rw [zD, show Nat.xor (gof (rootP X) c0) (cond (par (Nat.land (gof (rootP X) c0) b0)) (lD X b0) 0) =
      gof (rootP X) c0 ^^^ cond (par (Nat.land (gof (rootP X) c0) b0)) (lD X b0) 0 from rfl, nv_xor, nv_cond]
  have hzlt : zD X b0 c0 < 512 := by
    show gof (rootP X) c0 ^^^ cond (par (Nat.land (gof (rootP X) c0) b0)) (lD X b0) 0 < 512
    apply xor_lt _ _ (gof_lt _ _)
    cases par (Nat.land (gof (rootP X) c0) b0)
    · rw [cond_false]; norm_num
    · rw [cond_true]; exact hll
  have hMz : (TX (toM3 X))ᵀ *ᵥ nv (zD X b0 c0) = nv c0 := by
    rw [hz, Matrix.mulVec_add, Matrix.mulVec_smul, hMl, smul_zero, add_zero, nv_gof_mat (rootP X) c0 hc]
    exact Rank1.inv_transpose (inv_root X hX) _ hr
  have hbz : nv b0 ⬝ᵥ nv (zD X b0 c0) = 0 := by
    rw [hz, dotProduct_add, dotProduct_smul, hmu', hbl, smul_eq_mul, mul_one, CharTwo.add_self_eq_zero]
  obtain ⟨hinv, hcol, hrow, hrk⟩ := Rank1.caseD (inv_root X hX) hr hMl hbl hMz hbz
  refine facts_of ?_ ?_ ?_ ?_
  · show rootRk X ≤ _
    rw [hrk, root_rank X hX h0]
  · intro v hv hvm
    obtain ⟨u, hu, hvu⟩ := (hcol (nv v)).1 hvm
    -- on `col T(X)` the functional of `z` is the one of `g0` (the left kernel is orthogonal to it)
    have hzu : nv (zD X b0 c0) ⬝ᵥ u = nv (gof (rootP X) c0) ⬝ᵥ u := by
      rw [hz, add_dotProduct, smul_dotProduct, Rank1.dot_colSp_of_left_ker hMl hu, smul_zero, add_zero]
    rw [hzu] at hvu
    refine sect_mask (gof_lt _ _) hb hv u (fun hlt => ?_) hvu
    rw [root_col_iff X _ hX hlt, nv_natOf]; exact hu
  · intro w hw hwm
    show (rrm X).testBit w = true
    change nv w ∈ Rank1.colSp _ at hwm
    rw [root_row_iff X w hX hw]; rwa [hrow] at hwm
  · show Rank1.Inv _ (Xm (corrP (rootP X) (zD X b0 c0) (xof (rootP X) b0)))
    rw [Xm_corrP _ _ _ hzlt (xof_lt _ _), nv_xof_mat (rootP X) b0 hb]
    exact hinv

/-! ## Case E: `b0 ∉ col`, `c0 ∉ row` (witnesses `k`, `l`) -/

theorem factsE {X b0 c0 : Nat} (hX : X < 512) (h0 : X ≠ 0) (hb : b0 < 512) (hc : c0 < 512) (hl : bit (rlm X) b0 = false) (hr : bit (rrm X) c0 = false) (hok : (rE X b0 c0).ok = true) :
    R1Facts (TX (toM3 X) + vecMulVec (nv b0) (nv c0)) (rE X b0 c0) := by
  have hok' : par (Nat.land (kC X c0) c0) = true ∧ bit (kerm X) (kC X c0) = true ∧
      par (Nat.land (lD X b0) b0) = true ∧ bit (lkerm X) (lD X b0) = true := by
    have : (par (Nat.land (kC X c0) c0) && bit (kerm X) (kC X c0) && par (Nat.land (lD X b0) b0) &&
      bit (lkerm X) (lD X b0)) = true := hok
    simp only [Bool.and_eq_true] at this
    exact ⟨this.1.1.1, this.1.1.2, this.1.2, this.2⟩
  obtain ⟨hpk, hkm, hpl, hlm⟩ := hok'
  rw [bit_eq] at hkm hlm
  have hk : kC X c0 < 512 := kerm_lt hkm
  have hll : lD X b0 < 512 := lkerm_lt hlm
  have hMk : TX (toM3 X) *ᵥ nv (kC X c0) = 0 := ker_fact X _ hX hk hkm
  have hMl : (TX (toM3 X))ᵀ *ᵥ nv (lD X b0) = 0 := lker_fact X _ hX hll hlm
  have hck : nv c0 ⬝ᵥ nv (kC X c0) = 1 := by
    rw [dot_par c0 _ hc, Nat.and_comm]; exact (bf_one_iff _).mpr hpk
  have hbl : nv b0 ⬝ᵥ nv (lD X b0) = 1 := by
    rw [dot_par b0 _ hb, Nat.and_comm]; exact (bf_one_iff _).mpr hpl
  obtain ⟨hinv, hcol, hrow, hrk⟩ := Rank1.caseE (inv_root X hX) hMk hck hMl hbl
  have hb1 : nv (b1E X b0 c0) = Xm (rootP X) *ᵥ nv b0 + (1 + ((Xm (rootP X))ᵀ *ᵥ nv c0) ⬝ᵥ nv b0) • nv (kC X c0) := by
    rw [b1E, show Nat.xor (xof (rootP X) b0) (cond (par (Nat.land (gof (rootP X) c0) b0)) 0 (kC X c0)) =
      xof (rootP X) b0 ^^^ cond (par (Nat.land (gof (rootP X) c0) b0)) 0 (kC X c0) from rfl, nv_xor, nv_xof_mat (rootP X) b0 hb, ← nv_gof_mat (rootP X) c0 hc]
    have hgb : nv (gof (rootP X) c0) ⬝ᵥ nv b0 = bf (par (Nat.land (gof (rootP X) c0) b0)) := dot_par _ _ (gof_lt _ _)
    rw [hgb]
    congr 1
    cases par (Nat.land (gof (rootP X) c0) b0)
    · rw [cond_false, bf_false, add_zero, one_smul]
    · rw [cond_true, nv_zero, bf_true, CharTwo.add_self_eq_zero, zero_smul]
  have hb1lt : b1E X b0 c0 < 512 := by
    show xof (rootP X) b0 ^^^ cond (par (Nat.land (gof (rootP X) c0) b0)) 0 (kC X c0) < 512
    apply xor_lt _ _ (xof_lt _ _)
    cases par (Nat.land (gof (rootP X) c0) b0)
    · rw [cond_false]; exact hk
    · rw [cond_true]; norm_num
  refine facts_of ?_ ?_ ?_ ?_
  · show Nat.succ (rootRk X) ≤ _
    rw [hrk, root_rank X hX h0]
  · intro v hv hvm
    change nv v ∈ Rank1.colSp _ at hvm
    rw [hcol] at hvm
    exact sup_mask hb hv _ (fun v hv h => (root_col_iff X v hX hv).2 h) hvm
  · intro w hw hwm
    change nv w ∈ Rank1.colSp _ at hwm
    rw [hrow] at hwm
    exact sup_mask hc hw _ (fun w hw h => (root_row_iff X w hX hw).2 h) hwm
  · show Rank1.Inv _ (Xm (corrP (corrP (rootP X) (lD X b0) (b1E X b0 c0)) (gof (rootP X) c0) (kC X c0)))
    rw [Xm_corrP _ _ _ (gof_lt _ _) hk, Xm_corrP _ _ _ hll hb1lt, hb1, nv_gof_mat (rootP X) c0 hc]
    exact hinv

end cases

/-- **The rank-1 claim's facts.** -/
theorem rank1_facts (X b0 c0 : Nat) (hX : X < 512) (h0 : X ≠ 0) (hb : b0 < 512) (hc : c0 < 512)
    (hok : (rank1 X b0 c0).ok = true) : R1Facts (TX (toM3 X) + vecMulVec (nv b0) (nv c0)) (rank1 X b0 c0) := by
  rw [rank1_eq] at hok ⊢
  revert hok
  cases hl : bit (rlm X) b0
  · rw [cond_false]
    cases hr : bit (rrm X) c0
    · rw [cond_false]
      exact factsE hX h0 hb hc hl hr
    · rw [cond_true]
      exact factsD hX h0 hb hc hl hr
  · rw [cond_true]
    cases hr : bit (rrm X) c0
    · rw [cond_false]
      exact factsC hX h0 hb hc hl hr
    · rw [cond_true]
      cases hp : par (Nat.land c0 (xof (rootP X) b0))
      · rw [cond_false]
        exact fun _ => factsB hX h0 hb hc hl hr hp
      · rw [cond_true]
        exact fun _ => factsA hX h0 hb hc hl hr hp

/-! ## The claims -/

section claims
variable {T n dom ACT : Nat} {asg : Asg} {b c : Nat → Nat}

theorem recOK_of_r1 (hn : n ≤ 32) {SS : Nat} (hSS : SSok T n SS) (hact : ∀ t, ACT.testBit t = true → t < n)
    (hbc : BC n b c) (hd : HD T n dom b c ACT asg) (X : Nat) (hX : X < 512) (hdom : dom.testBit X = true)
    (q : R1) (hf : R1Facts (resM X asg) q) (hle : ucnt SS ACT X ≤ q.rk) :
    RecOK T n b c ACT (mkR X q.P 0 q.lm q.rm) := by
  have hR := hd X hX hdom
  have hcard : (hitS T n ACT X).card ≤ q.rk := by rw [← ucnt_eq' T n ACT X SS hSS hn hX hact]; exact hle
  have hrk := hf.rk
  rw [hR] at hrk
  have htight : (∑ t ∈ hitS T n ACT X, vecMulVec (nv (b t)) (nv (c t))).rank = (hitS T n ACT X).card :=
    le_antisymm (rank_sum_le _ _ _) (by omega)
  have hbt : ∀ t ∈ hitS T n ACT X, t < n := fun t ht => (mem_hitS.mp ht).1
  rw [RecOK, mkR_X, mkR_P, mkR_lm, mkR_rm]
  refine ⟨hX, ?_, ?_⟩
  · intro s' t hs' ht
    have hδ := delta_of_tight (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t)) htight
      (fun v => nv (xof q.P (natOf v))) (by
        intro v hv
        rw [← hR] at hv ⊢
        have := hf.inv (natOf v) (natOf_lt v) (by rw [nv_natOf]; exact hv)
        rw [nv_natOf] at this; exact this) s' t hs' ht
    simp only [natOf_nv _ (hbc t (hbt t ht)).2.1] at hδ
    rw [dot_nv _ _ (hbc s' (hbt s' hs')).2.2.2] at hδ
    apply bf_inj
    rw [hδ]
    by_cases e : s' = t <;> simp [e, bf]
  · intro t ht
    have h3 := tight_fs (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t)) htight t ht
    rw [← hR] at h3
    exact ⟨hf.col _ (hbc t (hbt t ht)).2.1 h3.1, hf.row _ (hbc t (hbt t ht)).2.2.2 h3.2.1⟩

theorem mkRec6_sound (hn : n ≤ 32) {SS : Nat} (hSS : SSok T n SS) (hact : ∀ t, ACT.testBit t = true → t < n)
    (hbc : BC n b c) (hasg : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) (hd : HD T n dom b c ACT asg) (X : Nat) (hX : X < 512)
    (hdom : dom.testBit X = true) (hok : (mkRec6 SS ACT asg X).1 = true) :
    RecOK T n b c ACT (mkRec6 SS ACT asg X).2 := by
  have e : mkRec6 SS ACT asg X = cond (Nat.beq (thru1 X asg).1 1)
      ((rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).ok &&
        Nat.ble (ucnt SS ACT X) (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).rk,
       mkR X (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).P 0 (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).lm
         (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).rm)
      (mkRec SS ACT asg X) := rfl
  rw [e] at hok ⊢
  revert hok
  cases h1 : Nat.beq (thru1 X asg).1 1
  · rw [cond_false]
    exact fun hok => mkRec_sound hn hSS hact hbc hasg hd X hX hdom hok
  · rw [cond_true]
    intro hok
    simp only [Bool.and_eq_true, Nat.ble_eq] at hok
    have h1' : (thru1 X asg).1 = 1 := Nat.eq_of_beq_eq_true h1
    obtain ⟨hres, hb0, hc0⟩ := thru1_one X asg hasg h1'
    have hf := rank1_facts X _ _ hX (thru1_one_ne X asg h1') hb0 hc0 hok.1
    rw [← hres] at hf
    exact recOK_of_r1 hn hSS hact hbc hd X hX hdom _ hf hok.2

theorem mkSl6_sound (hn : n ≤ 32) {SS : Nat} (hSS : SSok T n SS) (hact : ∀ t, ACT.testBit t = true → t < n)
    (hbc : BC n b c) (hasg : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) (hd : HD T n dom b c ACT asg) (X : Nat) (hX : X < 512)
    (hdom : dom.testBit X = true) (hok : (mkSl6 SS ACT asg X).1 = true) (t : Nat) (ht : t ∈ hitS T n ACT X) :
    (mkSl6 SS ACT asg X).2.1.testBit (b t) = true ∨ (mkSl6 SS ACT asg X).2.2.testBit (c t) = true := by
  have e : mkSl6 SS ACT asg X = cond (Nat.beq (thru1 X asg).1 1)
      ((rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).ok &&
        Nat.ble (ucnt SS ACT X) (Nat.succ (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).rk),
       (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).lm, (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).rm)
      (mkSl SS ACT asg X) := rfl
  rw [e] at hok ⊢
  revert hok
  cases h1 : Nat.beq (thru1 X asg).1 1
  · rw [cond_false]
    exact fun hok => mkSl_sound hn hSS hact hbc hasg hd X hX hdom hok t ht
  · rw [cond_true]
    intro hok
    simp only [Bool.and_eq_true, Nat.ble_eq] at hok
    have h1' : (thru1 X asg).1 = 1 := Nat.eq_of_beq_eq_true h1
    obtain ⟨hres, hb0, hc0⟩ := thru1_one X asg hasg h1'
    have hf := rank1_facts X _ _ hX (thru1_one_ne X asg h1') hb0 hc0 hok.1
    rw [← hres] at hf
    have htn := (mem_hitS.mp ht).1
    obtain ⟨_, hb, _, hc⟩ := hbc t htn
    have hR := hd X hX hdom
    have hu := hok.2
    rw [ucnt_eq' T n ACT X SS hSS hn hX hact] at hu
    have hrk := hf.rk
    rw [hR] at hrk
    have hc' : (hitS T n ACT X).card ≤ (∑ t ∈ hitS T n ACT X, vecMulVec (nv (b t)) (nv (c t))).rank + 1 := by
      omega
    rcases tight_or_slack (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t)) hc' t ht with h | h
    · rw [← hR] at h; exact Or.inl (hf.col _ hb h)
    · rw [← hR] at h; exact Or.inr (hf.row _ hc h)

theorem over6_false (hn : n ≤ 32) {SS : Nat} (hSS : SSok T n SS) (hact : ∀ t, ACT.testBit t = true → t < n)
    (hasg : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) (hd : HD T n dom b c ACT asg) (X : Nat) (hX : X < 512)
    (hdom : dom.testBit X = true) (h : over6 SS ACT asg X = true) : False := by
  have e : over6 SS ACT asg X = cond (Nat.beq (thru1 X asg).1 1)
      ((rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).ok &&
        Nat.blt (ucnt SS ACT X) (rank1 X (thru1 X asg).2.1 (thru1 X asg).2.2).rk)
      (elimOk (elim (resC X asg)) && Nat.blt (ucnt SS ACT X) (elim (resC X asg)).rk) := rfl
  rw [e] at h
  have hle := rank_sum_le (hitS T n ACT X) (fun t => nv (b t)) (fun t => nv (c t))
  revert h
  cases h1 : Nat.beq (thru1 X asg).1 1
  · rw [cond_false]
    intro h
    simp only [Bool.and_eq_true, Nat.blt_eq] at h
    obtain ⟨hok, hlt⟩ := h
    obtain ⟨hA, hRI⟩ := resC_sem _ hX asg hasg
    have hf := elim_facts _ hRI hok
    rw [hA] at hf
    have hrk := rank_ge_elim hf
    rw [hd _ hX hdom] at hrk
    rw [ucnt_eq' T n ACT _ SS hSS hn hX hact] at hlt
    omega
  · rw [cond_true]
    intro h
    simp only [Bool.and_eq_true, Nat.blt_eq] at h
    have h1' : (thru1 X asg).1 = 1 := Nat.eq_of_beq_eq_true h1
    obtain ⟨hres, hb0, hc0⟩ := thru1_one X asg hasg h1'
    have hf := rank1_facts X _ _ hX (thru1_one_ne X asg h1') hb0 hc0 h.1
    rw [← hres] at hf
    have hrk := hf.rk
    rw [hd _ hX hdom] at hrk
    have hlt := h.2
    rw [ucnt_eq' T n ACT _ SS hSS hn hX hact] at hlt
    omega

end claims

end S6
