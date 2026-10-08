module
public import R22Port.U_d41d8cd98f00
public import RG.Loops
/-! # Relations between the native data and the kernel checker's data (E1G widths)

* `IPRel D C sl UB UBR`: the native IP data `D` describes the kernel's `C`, `sl`, `UB`, `UBR` (E1G widths).
* `BlkRel D sl K RTb H`: the native block context `K` describes the kernel's block row table `RTb` and header `H`.
* `cnt labs l`: multiplicity of `l` in `labs`; the kernel's `MV` is `V (cnt labs)`.
* The kernel's packed prefix is `pk 7 (af labs) labs.size`. -/
@[expose] public section
namespace E1NRG
open E1N Finset E1GS

/-- multiplicity of `l` among the labels of `labs` -/
def cnt (labs : Array ℕ) (l : ℕ) : ℕ := ∑ r ∈ range labs.size, (if af labs r = l then 1 else 0)

/-- per-IP relation (E1G) -/
structure IPRel (D : IPD) (C : E1G.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) : Prop where
  lb : D.lb = 7
  nl : D.nl = 127
  sib : D.sib = 15
  satb : D.satb = 6
  gb : D.gb = 11
  mw : D.mw = 4
  R : D.R = C.R
  N : D.N = C.N
  N_le : C.N ≤ 127
  sl_lt : ∀ i, sl i < 2 ^ 264
  sbit : ∀ i < 2 ^ 15, ∀ x < 127, E1N.sbit D i x = (smask (sl i)).testBit x
  sbit_ns : ∀ x, E1N.sbit D D.ns x = false
  scap : ∀ i < 2 ^ 15, E1N.scap D i = E1GS.scap (sl i)
  scap_ns : E1N.scap D D.ns = 0
  gp : ∀ g < 2048, ∀ x < 127, D.gp.getD (127 * g + x) 0 = gpf (C.GP g) x
  ub : ∀ x < 127, af D.ub x = E1G.fld UB x
  ub_le : ∀ x < 127, E1G.fld UB x ≤ 2 ^ 32
  UB_eq : UB = V (fun l => E1G.fld UB l)
  UBR_eq : UBR = VR (fun l => E1G.fld UB l)
  leaf : ∀ labs B q e, D.leaf labs B q e = true → labs.size = C.R → (∀ t < labs.size, af labs t < 127) →
    E1G.leafOK C (pk 7 (af labs) labs.size) (win B q e) = true

/-- per-block relation: block row `j` is slot `ix[j]` (empty past the table); header record `idx` is the window of the
native header -/
structure BlkRel (D : IPD) (sl : ℕ → ℕ) (K : Blk) (RTb H : ℕ) : Prop where
  ix_lt : ∀ j < K.ix.size, K.ix.getD j 0 < 2 ^ 15
  slot : ∀ j, RTb / 2 ^ (264 * j) % 2 ^ 264 = if j < K.ix.size then sl (K.ix.getD j 0) else 0
  recd : ∀ idx, E1G.rd 540 (E1G.sk (Nat.mul 540 idx) H) =
    if idx < K.nd then win K.B (K.hs + 540 * idx) (K.hs + 540 * idx + 540) else 0

section rel
variable {D : IPD} {C : E1G.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ} {K : Blk} {RTb H : ℕ}

theorem gix_lt (hK : BlkRel D sl K RTb H) (j : ℕ) (hj : j < K.ix.size) : E1N.gix D K j < 2 ^ 15 := by
  unfold E1N.gix; rw [dif_pos hj]; have := hK.ix_lt j hj; simpa [Array.getD, hj] using this

theorem gix_of_lt (j : ℕ) (hj : j < K.ix.size) : E1N.gix D K j = K.ix.getD j 0 := by
  unfold E1N.gix; rw [dif_pos hj]; simp [Array.getD, hj]

theorem gix_of_ge (j : ℕ) (hj : ¬ j < K.ix.size) : E1N.gix D K j = D.ns := by
  unfold E1N.gix; rw [dif_neg hj]

/-- the kernel's row mask of block row `j` is the native slot's mask -/
theorem rmask_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (j x : ℕ) (hx : x < 127) :
    (E1G.rmask RTb j).testBit x = E1N.sbit D (E1N.gix D K j) x := by
  rw [rmask_eq, hK.slot]
  by_cases hj : j < K.ix.size
  · rw [if_pos hj, gix_of_lt j hj, hD.sbit _ (hK.ix_lt j hj) x hx]
  · rw [if_neg hj, gix_of_ge j hj, hD.sbit_ns]; simp [smask]

theorem rcap_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (j : ℕ) :
    E1G.rcap RTb j = E1N.scap D (E1N.gix D K j) := by
  rw [E1GS.rcap_eq, hK.slot]
  by_cases hj : j < K.ix.size
  · rw [if_pos hj, gix_of_lt j hj, hD.scap _ (hK.ix_lt j hj)]
  · rw [if_neg hj, gix_of_ge j hj, hD.scap_ns]; simp [E1GS.scap]

theorem rmask_lt (j : ℕ) : E1G.rmask RTb j < 2 ^ 127 := by rw [rmask_eq]; exact smask_lt _

theorem rmaskr_lt (j : ℕ) : E1G.rmaskr RTb j < 2 ^ 127 := by rw [rmaskr_eq]; exact smr_lt _

/-- the reversed masks are reversals, given that every slot's are -/
theorem rmaskr_rev (hK : BlkRel D sl K RTb H) (hrev : ∀ i < 2 ^ 15, ∀ t < 127, (smr (sl i)).testBit t = (smask (sl i)).testBit (126 - t))
    (j t : ℕ) (ht : t < 127) : (E1G.rmaskr RTb j).testBit t = (E1G.rmask RTb j).testBit (126 - t) := by
  rw [rmaskr_eq, rmask_eq, hK.slot]
  by_cases hj : j < K.ix.size
  · rw [if_pos hj]; exact hrev _ (hK.ix_lt j hj) t ht
  · rw [if_neg hj]; simp [smr, smask]

end rel

/-! ## Multiplicities -/

theorem cnt_le (labs : Array ℕ) (l : ℕ) : cnt labs l ≤ labs.size := by
  unfold cnt
  calc ∑ r ∈ range labs.size, (if af labs r = l then 1 else 0) ≤ ∑ r ∈ range labs.size, 1 :=
        Finset.sum_le_sum (fun r _ => by split <;> omega)
    _ = labs.size := by simp

theorem af_push_lt (u : Array ℕ) (v r : ℕ) (hr : r < u.size) : af (u.push v) r = af u r := by
  rw [af_push, if_pos hr]

theorem af_push_size (u : Array ℕ) (v : ℕ) : af (u.push v) u.size = v := by
  rw [af_push, if_neg (lt_irrefl _), if_pos rfl]

theorem cnt_push (labs : Array ℕ) (l x : ℕ) : cnt (labs.push l) x = cnt labs x + (if l = x then 1 else 0) := by
  unfold cnt
  rw [Array.size_push, sum_range_succ, af_push_size]
  congr 1
  apply Finset.sum_congr rfl; intro r hr; rw [Finset.mem_range] at hr; rw [af_push_lt _ _ _ hr]

/-- double counting: `∑_l [P l] cnt l = ∑_r [P labs[r]]` when the labels are below `n` -/
theorem sum_cnt (labs : Array ℕ) (n : ℕ) (hl : ∀ r < labs.size, af labs r < n) (f : ℕ → ℕ) :
    ∑ l ∈ range n, f l * cnt labs l = ∑ r ∈ range labs.size, f (af labs r) := by
  unfold cnt
  simp only [Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl; intro r hr; rw [Finset.mem_range] at hr
  rw [Finset.sum_eq_single (af labs r)]
  · simp
  · intro b _ hb; rw [if_neg (Ne.symm hb), mul_zero]
  · intro h; exact absurd (Finset.mem_range.mpr (hl r hr)) h

/-- the kernel's `msum` of `cnt` -/
theorem msum_cnt (labs : Array ℕ) (hl : ∀ r < labs.size, af labs r < 127) (M : ℕ) :
    msum (cnt labs) M = ∑ r ∈ range labs.size, (if M.testBit (af labs r) then 1 else 0) := by
  unfold msum
  have := sum_cnt labs 127 hl (fun l => if M.testBit l then 1 else 0)
  rw [← this]
  apply Finset.sum_congr rfl; intro l _; split <;> simp

end E1NRG
