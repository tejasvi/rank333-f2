module
public import R22Port.U_d41d8cd98f00
public import RG.Rel
/-! # Agreement: each kernel primitive on related inputs computes the native value

`fsum_rel` (row sums of the prefix multiset), `wout_rel`, `rdual_rel` (duals: `(∑ Y cap, V T)`), `deficit_rel`, `dot_rel`. -/
@[expose] public section
namespace E1NRG
open E1N Finset E1GS

variable {D : IPD} {C : E1G.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ} {K : Blk} {RTb H : ℕ}

/-- labels of a multiset below 127 -/
def LabOK (labs : Array ℕ) : Prop := ∀ r < labs.size, af labs r < 127

theorem fsum_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (labs : Array ℕ) (hl : LabOK labs)
    (hs : labs.size ≤ 2 ^ 40) (j : ℕ) :
    E1G.fsum (Nat.land (V (cnt labs)) (E1G.fmask (E1G.rmask RTb j))) = E1N.msumL D labs (E1N.gix D K j) := by
  rw [show Nat.land (V (cnt labs)) (E1G.fmask (E1G.rmask RTb j)) = V (cnt labs) &&& E1G.fmask (E1G.rmask RTb j) from rfl,
    fsum_and_fmask (cnt labs) (fun l _ => le_trans (cnt_le labs l) hs) _ (rmask_lt j), msum_cnt labs hl, msumL_eq]
  apply Finset.sum_congr rfl; intro r hr
  rw [rmask_rel hD hK j _ (hl r (mem_range.mp hr))]

theorem wout_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (u : Array ℕ) (hu : ∀ x < 127, af u x ≤ 2 ^ 32)
    (j lo : ℕ) : E1G.wout (V (af u)) (E1G.rmask RTb j) lo = E1N.wout D u true (E1N.gix D K j) lo := by
  rw [E1GS.wout_eq (af u) hu _ lo (rmask_lt j), wout_eq, hD.nl]
  apply Finset.sum_congr rfl; intro x hx
  rw [rmask_rel hD hK j x (mem_range.mp hx), Bool.true_and]

theorem wout0_rel (hD : IPRel D C sl UB UBR) (u : Array ℕ) (hu : ∀ x < 127, af u x ≤ 2 ^ 32) (lo : ℕ) :
    E1G.wout (V (af u)) 0 lo = E1N.wout D u false 0 lo := by
  rw [E1GS.wout_eq (af u) hu 0 lo (by norm_num), wout_eq, hD.nl]
  apply Finset.sum_congr rfl; intro x _
  simp

/-! ## Duals -/

/-- the native dual's invariant -/
def DuOK (du : Dual) : Prop := du.is.size = du.ys.size ∧ ∀ r, af du.ys r < 2 ^ 36

theorem getD_push (a : Array ℕ) (v r dflt : ℕ) :
    (a.push v).getD r dflt = if r < a.size then a.getD r dflt else if r = a.size then v else dflt := by
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_push]
  by_cases h1 : r < a.size
  · have : r ≠ a.size := by omega
    simp [h1, this]
  · by_cases h2 : r = a.size
    · subst h2; simp
    · simp [h2, Array.getElem?_eq_none (by omega : a.size ≤ r)]

/-- one more dual row: `T + Y [x ∈ slot i]` -/
theorem tf_push (du : Dual) (hdu : du.is.size = du.ys.size) (BC i Y x : ℕ) :
    tf D ⟨BC, du.is.push i, du.ys.push Y⟩ x = tf D du x + (if E1N.sbit D i x then Y else 0) := by
  unfold tf
  dsimp only
  have e1 : (du.is.push i).getD du.is.size D.ns = i := by rw [getD_push, if_neg (lt_irrefl _), if_pos rfl]
  have e2 : af (du.ys.push Y) du.is.size = Y := by rw [hdu, af_push_size]
  rw [Array.size_push, sum_range_succ, e1, e2]
  congr 1
  apply Finset.sum_congr rfl; intro r hr; rw [Finset.mem_range] at hr
  rw [getD_push, if_pos hr, af_push_lt _ _ _ (show r < du.ys.size by omega)]

theorem tf_le (du : Dual) (hdu : DuOK du) (x : ℕ) : tf D du x ≤ du.is.size * 2 ^ 36 := by
  unfold tf
  calc ∑ r ∈ range du.is.size, (if E1N.sbit D (du.is.getD r D.ns) x then af du.ys r else 0)
      ≤ ∑ r ∈ range du.is.size, 2 ^ 36 := Finset.sum_le_sum (fun r _ => by
        split
        · exact le_of_lt (hdu.2 r)
        · exact Nat.zero_le _)
    _ = du.is.size * 2 ^ 36 := by simp

theorem rdual_rel (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (e : ℕ) : ∀ k q (du : Dual), DuOK du →
    rdualF RTb k du.BC (V (tf D du)) (win K.B q e) =
      ((E1N.rdual D K e k q du).BC, V (tf D (E1N.rdual D K e k q du)), win K.B (q + 48 * k) e) ∧
    DuOK (E1N.rdual D K e k q du) ∧ (E1N.rdual D K e k q du).is.size = du.is.size + k := by
  intro k
  induction k with
  | zero => intro q du hdu; exact ⟨rfl, hdu, rfl⟩
  | succ k ih =>
    intro q du hdu
    rw [rdualF_succ]
    have hj : E1G.rd 12 (win K.B q e) = E1N.rdE K.B q e 12 := rd_win K.B q e 12 (by norm_num)
    have hY : E1G.rd 36 (E1G.sk 12 (win K.B q e)) = E1N.rdE K.B (q + 12) e 36 := by
      rw [sk_win]; exact rd_win K.B (q + 12) e 36 (by norm_num)
    have hS : E1G.sk 48 (win K.B q e) = win K.B (q + 48) e := sk_win K.B q e 48
    rw [hj, hY, hS]
    generalize hjv : E1N.rdE K.B q e 12 = j
    generalize hYv : E1N.rdE K.B (q + 12) e 36 = Y
    have hYlt : Y < 2 ^ 36 := by
      rw [← hYv, rdE_eq K.B (q + 12) e 36 (by norm_num)]
      exact lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (Nat.pow_le_pow_right (by norm_num) (min_le_left _ _))
    set du' : Dual := ⟨du.BC + Y * E1N.scap D (E1N.gix D K j), du.is.push (E1N.gix D K j), du.ys.push Y⟩ with hdu'
    have hdu'ok : DuOK du' := by
      refine ⟨by simp [hdu', hdu.1], fun r => ?_⟩
      simp only [hdu']
      rw [af_push]; split
      · exact hdu.2 r
      · split
        · exact hYlt
        · norm_num
    have eT : V (tf D du) + Y * E1G.spread (E1G.rmask RTb j) = V (tf D du') := by
      rw [spread_V _ (rmask_lt j), mul_comm, V_mul, V_add]
      apply V_congr; intro x hx
      simp only [hdu']
      rw [tf_push du hdu.1, rmask_rel hD hK j x hx]
      split <;> simp
    have eBC : du.BC + Y * E1G.rcap RTb j = du'.BC := by simp only [hdu']; rw [rcap_rel hD hK j]
    have hnat : E1N.rdual D K e (k + 1) q du = E1N.rdual D K e k (q + 48) du' := by
      rw [E1N.rdual, hjv, hYv]
    rw [eT, eBC, hnat]
    obtain ⟨h1, h2, h3⟩ := ih (q + 48) du' hdu'ok
    refine ⟨by rw [h1, show q + 48 + 48 * k = q + 48 * (k + 1) by ring], h2, ?_⟩
    rw [h3]; simp [hdu']; ring

theorem rdual_rel0 (hD : IPRel D C sl UB UBR) (hK : BlkRel D sl K RTb H) (e k q : ℕ) :
    E1G.rdual RTb k (win K.B q e) =
      ((E1N.rdual D K e k q Dual.empty).BC, V (tf D (E1N.rdual D K e k q Dual.empty)), win K.B (q + 48 * k) e) ∧
    DuOK (E1N.rdual D K e k q Dual.empty) ∧ (E1N.rdual D K e k q Dual.empty).is.size = k := by
  have h0 : tf D Dual.empty = fun _ => 0 := by funext x; simp [tf, Dual.empty]
  have hok : DuOK Dual.empty := ⟨rfl, fun r => by simp [af, Dual.empty]⟩
  obtain ⟨h1, h2, h3⟩ := rdual_rel hD hK e k q Dual.empty hok
  rw [h0, V_zero] at h1
  refine ⟨?_, h2, by rw [h3]; simp [Dual.empty]⟩
  rw [rdual_eq]; exact h1

theorem deficit_rel (hD : IPRel D C sl UB UBR) (u : Array ℕ) (hu : ∀ x < 127, af u x ≤ 2 ^ 32) (du : Dual)
    (hdu : DuOK du) (hk : du.is.size ≤ 64) (lo : ℕ) :
    E1G.deficit (V (tf D du)) (VR (af u)) lo = E1N.deficit D u du lo := by
  rw [E1GS.deficit_eq (tf D du) (af u) (2 ^ 32) (fun l _ => lt_of_le_of_lt (tf_le du hdu l) (by
      calc du.is.size * 2 ^ 36 ≤ 64 * 2 ^ 36 := Nat.mul_le_mul_right _ hk
        _ < 2 ^ 64 := by norm_num)) hu (by norm_num) lo, E1NRG.deficit_eq, hD.nl]

theorem dot_rel (labs : Array ℕ) (hl : LabOK labs) (hs : labs.size ≤ 64) (du : Dual) (hdu : DuOK du)
    (hk : du.is.size ≤ 64) : E1G.dot (VR (cnt labs)) (V (tf D du)) = E1N.dotD D labs du := by
  rw [dot_VR_V (cnt labs) (tf D du) 64 (64 * 2 ^ 36) (fun l _ => le_trans (cnt_le labs l) hs)
      (fun l _ => le_trans (tf_le du hdu l) (Nat.mul_le_mul_right _ hk)) (by norm_num), dotD_eq]
  rw [show ∑ l ∈ range 127, cnt labs l * tf D du l = ∑ l ∈ range 127, tf D du l * cnt labs l from
    Finset.sum_congr rfl (fun _ _ => mul_comm _ _)]
  exact sum_cnt labs 127 hl (tf D du)

end E1NRG
