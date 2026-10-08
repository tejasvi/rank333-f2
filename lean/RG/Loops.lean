module
public import R22Port.U_d41d8cd98f00
public import RG.Bits
/-! # The native loops as sums and pointwise updates

Every loop of `E1N` is a structural recursion with a counter.  Here each gets its closed form:
* sums: `msumGo`, `woutGo`, `tGo`, `defGo`, `dotGo` are `a + ∑` over their range;
* updates: `orRowGo`, `zeroGo`, `Array.set!` pointwise (`af u x = u.getD x 0` is the array as a function);
* searches: `countGo`, `lexLt`, `recLabsGo`, `recBudGo`. -/
@[expose] public section
namespace E1NRG
open E1N Finset

/-- an array as a function (`0` past its end) -/
def af (u : Array ℕ) (x : ℕ) : ℕ := u.getD x 0

theorem af_set (u : Array ℕ) (i v x : ℕ) : af (u.set! i v) x = if i = x ∧ i < u.size then v else af u x := by
  unfold af
  rw [Array.set!_eq_setIfInBounds]
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_setIfInBounds]
  by_cases h1 : i = x
  · subst h1
    by_cases h2 : i < u.size
    · simp [h2]
    · simp [h2, Array.getElem?_eq_none (by omega : u.size ≤ i)]
  · simp [h1]

theorem size_set (u : Array ℕ) (i v : ℕ) : (u.set! i v).size = u.size := by
  rw [Array.set!_eq_setIfInBounds, Array.size_setIfInBounds]

theorem af_replicate (n x : ℕ) : af (Array.replicate n 0) x = 0 := by
  unfold af
  rw [Array.getD_eq_getD_getElem?]
  by_cases h : x < n
  · simp [h]
  · simp [Array.getElem?_eq_none (by simpa using h : (Array.replicate n 0).size ≤ x)]

theorem af_push (u : Array ℕ) (v x : ℕ) : af (u.push v) x = if x < u.size then af u x else if x = u.size then v else 0 := by
  unfold af
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_push]
  by_cases h1 : x < u.size
  · have : x ≠ u.size := by omega
    simp [h1, this]
  · by_cases h2 : x = u.size
    · subst h2; simp
    · have h3 : u.size < x := by omega
      simp [h2, Array.getElem?_eq_none (by omega : u.size ≤ x)]

/-! ## Sums -/

theorem msumGo_eq (D : IPD) (labs : Array ℕ) (i : ℕ) : ∀ n t a,
    E1N.msumGo D labs i n t a = a + ∑ r ∈ range n, (if E1N.sbit D i (af labs (t + r)) then 1 else 0) := by
  intro n
  induction n with
  | zero => intro t a; simp [E1N.msumGo]
  | succ n ih =>
    intro t a
    rw [E1N.msumGo, ih, sum_range_succ', af, show t + 0 = t by rfl]
    simp only [show ∀ r, t + 1 + r = t + (r + 1) from fun r => by ring]
    split <;> simp [af] <;> ring

theorem msumL_eq (D : IPD) (labs : Array ℕ) (i : ℕ) :
    E1N.msumL D labs i = ∑ r ∈ range labs.size, (if E1N.sbit D i (af labs r) then 1 else 0) := by
  unfold E1N.msumL; rw [msumGo_eq]; simp

theorem woutGo_eq (D : IPD) (u : Array ℕ) (useRow : Bool) (i : ℕ) : ∀ n x a,
    E1N.woutGo D u useRow i n x a = a + ∑ r ∈ range n, (if (useRow && E1N.sbit D i (x + r)) = true then 0 else af u (x + r)) := by
  intro n
  induction n with
  | zero => intro x a; simp [E1N.woutGo]
  | succ n ih =>
    intro x a
    rw [E1N.woutGo, ih, sum_range_succ']
    simp only [show ∀ r, x + 1 + r = x + (r + 1) from fun r => by ring, show x + 0 = x by rfl]
    split <;> simp_all [af] <;> ring

/-- `∑_{lo ≤ x < n} f x` over `range n` -/
theorem sum_Ico_range (f : ℕ → ℕ) (lo n : ℕ) :
    ∑ r ∈ range (n - lo), f (lo + r) = ∑ x ∈ range n, (if lo ≤ x then f x else 0) := by
  by_cases h : lo ≤ n
  · rw [← Finset.sum_range_add_sum_Ico _ h]
    have h0 : ∑ x ∈ range lo, (if lo ≤ x then f x else 0) = 0 :=
      Finset.sum_eq_zero (fun x hx => by rw [Finset.mem_range] at hx; rw [if_neg (by omega)])
    rw [h0, Nat.zero_add, Finset.sum_Ico_eq_sum_range]
    apply Finset.sum_congr rfl; intro r _; rw [if_pos (by omega)]
  · rw [show n - lo = 0 by omega, Finset.sum_range_zero]
    exact (Finset.sum_eq_zero (fun x hx => by rw [Finset.mem_range] at hx; rw [if_neg (by omega)])).symm

theorem wout_eq (D : IPD) (u : Array ℕ) (useRow : Bool) (i lo : ℕ) :
    E1N.wout D u useRow i lo =
      ∑ x ∈ range D.nl, (if lo ≤ x then (if (useRow && E1N.sbit D i x) = true then 0 else af u x) else 0) := by
  unfold E1N.wout; rw [woutGo_eq, Nat.zero_add]
  exact sum_Ico_range (fun x => if (useRow && E1N.sbit D i x) = true then 0 else af u x) lo D.nl

/-- the dual's weight of label `x`: `∑_r ys[r] [x ∈ is[r]]` -/
def tf (D : IPD) (du : Dual) (x : ℕ) : ℕ :=
  ∑ r ∈ range du.is.size, (if E1N.sbit D (du.is.getD r D.ns) x then af du.ys r else 0)

theorem tGo_eq (D : IPD) (du : Dual) (x : ℕ) : ∀ n r a,
    E1N.tGo D du x n r a = a + ∑ s ∈ range n, (if E1N.sbit D (du.is.getD (r + s) D.ns) x then af du.ys (r + s) else 0) := by
  intro n
  induction n with
  | zero => intro r a; simp [E1N.tGo]
  | succ n ih =>
    intro r a
    rw [E1N.tGo, ih, sum_range_succ']
    simp only [show ∀ s, r + 1 + s = r + (s + 1) from fun s => by ring, show r + 0 = r by rfl]
    split <;> simp_all [af] <;> ring

theorem tAt_eq (D : IPD) (du : Dual) (x : ℕ) : E1N.tAt D du x = tf D du x := by
  unfold E1N.tAt tf; rw [tGo_eq]; simp

theorem defGo_eq (D : IPD) (u : Array ℕ) (du : Dual) : ∀ n x a,
    E1N.defGo D u du n x a = a + ∑ r ∈ range n, af u (x + r) * (E1N.SC - tf D du (x + r)) := by
  intro n
  induction n with
  | zero => intro x a; simp [E1N.defGo]
  | succ n ih =>
    intro x a
    rw [E1N.defGo, ih, sum_range_succ']
    simp only [show ∀ r, x + 1 + r = x + (r + 1) from fun r => by ring, show x + 0 = x by rfl]
    change (if af u x == 0 then _ else _) + _ = _
    by_cases h : af u x = 0
    · rw [if_pos (by simp [h]), h]; ring
    · rw [if_neg (by simp [h]), tAt_eq]; simp only [show u.getD x 0 = af u x from rfl]; ring

theorem deficit_eq (D : IPD) (u : Array ℕ) (du : Dual) (lo : ℕ) :
    E1N.deficit D u du lo = ∑ x ∈ range D.nl, (if lo ≤ x then af u x * (2 ^ 30 - tf D du x) else 0) := by
  unfold E1N.deficit; rw [defGo_eq, Nat.zero_add]
  exact sum_Ico_range (fun x => af u x * (E1N.SC - tf D du x)) lo D.nl

theorem dotGo_eq (D : IPD) (labs : Array ℕ) (du : Dual) : ∀ n r a,
    E1N.dotGo D labs du n r a = a + ∑ s ∈ range n, af du.ys (r + s) * E1N.msumL D labs (du.is.getD (r + s) D.ns) := by
  intro n
  induction n with
  | zero => intro r a; simp [E1N.dotGo]
  | succ n ih =>
    intro r a
    rw [E1N.dotGo, ih, sum_range_succ']
    simp only [show ∀ s, r + 1 + s = r + (s + 1) from fun s => by ring, show r + 0 = r by rfl, af]
    ring

/-- `dotD = ∑_{t < |labs|} T labs[t]` -/
theorem dotD_eq (D : IPD) (labs : Array ℕ) (du : Dual) :
    E1N.dotD D labs du = ∑ t ∈ range labs.size, tf D du (af labs t) := by
  unfold E1N.dotD; rw [dotGo_eq, Nat.zero_add]
  simp only [Nat.zero_add, msumL_eq, Finset.mul_sum, tf]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl; intro t _
  apply Finset.sum_congr rfl; intro r _
  split <;> simp

/-! ## Unions and zeroing -/

/-- bit `x` of a 32-bit word array -/
def wbit (U : Array ℕ) (x : ℕ) : Bool := (af U (x >>> 5) >>> (x &&& 31)) &&& 1 == 1

theorem orRowGo_size (D : IPD) (i : ℕ) : ∀ n w U, (E1N.orRowGo D i n w U).size = U.size := by
  intro n; induction n with
  | zero => intro w U; rfl
  | succ n ih => intro w U; rw [E1N.orRowGo, ih, size_set]

theorem orRowGo_af (D : IPD) (i : ℕ) : ∀ n w U t,
    af (E1N.orRowGo D i n w U) t =
      if w ≤ t ∧ t < w + n ∧ t < U.size then af U t ||| D.sm.getD (D.mw * i + t) 0 else af U t := by
  intro n; induction n with
  | zero => intro w U t; rw [if_neg (by omega)]; rfl
  | succ n ih =>
    intro w U t
    rw [E1N.orRowGo, ih, size_set]
    change (if w + 1 ≤ t ∧ t < w + 1 + n ∧ t < U.size then af (U.set! w (af U w ||| D.sm.getD (D.mw * i + w) 0)) t ||| _
      else af (U.set! w (af U w ||| D.sm.getD (D.mw * i + w) 0)) t) = _
    rw [af_set]
    by_cases h1 : w = t
    · subst h1
      rw [if_neg (show ¬(w + 1 ≤ w ∧ w < w + 1 + n ∧ w < U.size) by omega)]
      by_cases h2 : w < U.size
      · rw [if_pos ⟨rfl, h2⟩, if_pos ⟨le_rfl, by omega, h2⟩]
      · rw [if_neg (fun hc => h2 hc.2), if_neg (fun hc => h2 hc.2.2)]
    · rw [if_neg (show ¬(w = t ∧ w < U.size) from fun hc => h1 hc.1)]
      by_cases h3 : w + 1 ≤ t ∧ t < w + 1 + n ∧ t < U.size
      · rw [if_pos h3, if_pos ⟨by omega, by omega, h3.2.2⟩]
      · rw [if_neg h3]
        by_cases h4 : w ≤ t ∧ t < w + (n + 1) ∧ t < U.size
        · exfalso; apply h3; exact ⟨by omega, by omega, h4.2.2⟩
        · rw [if_neg h4]

theorem zeroGo_size (U : Array ℕ) : ∀ n x u, (E1N.zeroGo U n x u).size = u.size := by
  intro n; induction n with
  | zero => intro x u; rfl
  | succ n ih => intro x u; rw [E1N.zeroGo, ih]; split <;> simp [size_set]

theorem zeroGo_af (U : Array ℕ) : ∀ n x u t,
    af (E1N.zeroGo U n x u) t = if x ≤ t ∧ t < x + n ∧ t < u.size ∧ wbit U t = true then 0 else af u t := by
  intro n; induction n with
  | zero => intro x u t; rw [if_neg (by omega)]; rfl
  | succ n ih =>
    intro x u t
    rw [E1N.zeroGo]
    change af (E1N.zeroGo U n (x + 1) (if wbit U x = true then u.set! x 0 else u)) t = _
    by_cases hb : wbit U x = true
    · rw [if_pos hb, ih, af_set, size_set]
      by_cases h1 : x = t
      · subst h1
        rw [if_neg (show ¬(x + 1 ≤ x ∧ x < x + 1 + n ∧ x < u.size ∧ wbit U x = true) by omega)]
        by_cases h2 : x < u.size
        · rw [if_pos ⟨rfl, h2⟩, if_pos ⟨le_rfl, by omega, h2, hb⟩]
        · rw [if_neg (fun hc => h2 hc.2), if_neg (fun hc => h2 hc.2.2.1)]
      · rw [if_neg (show ¬(x = t ∧ x < u.size) from fun hc => h1 hc.1)]
        by_cases h3 : x + 1 ≤ t ∧ t < x + 1 + n ∧ t < u.size ∧ wbit U t = true
        · rw [if_pos h3, if_pos ⟨by omega, by omega, h3.2.2⟩]
        · rw [if_neg h3]
          by_cases h4 : x ≤ t ∧ t < x + (n + 1) ∧ t < u.size ∧ wbit U t = true
          · exfalso; apply h3; exact ⟨by omega, by omega, h4.2.2⟩
          · rw [if_neg h4]
    · rw [if_neg hb, ih]
      by_cases h1 : x = t
      · subst h1
        rw [if_neg (show ¬(x + 1 ≤ x ∧ x < x + 1 + n ∧ x < u.size ∧ wbit U x = true) by omega),
          if_neg (fun hc => hb hc.2.2.2)]
      · by_cases h3 : x + 1 ≤ t ∧ t < x + 1 + n ∧ t < u.size ∧ wbit U t = true
        · rw [if_pos h3, if_pos ⟨by omega, by omega, h3.2.2⟩]
        · rw [if_neg h3]
          by_cases h4 : x ≤ t ∧ t < x + (n + 1) ∧ t < u.size ∧ wbit U t = true
          · exfalso; apply h3; exact ⟨by omega, by omega, h4.2.2⟩
          · rw [if_neg h4]

theorem zeroU_af (D : IPD) (u U : Array ℕ) (t : ℕ) (ht : t < D.nl) (hu : u.size = D.nl) :
    af (E1N.zeroU D u U) t = if wbit U t = true then 0 else af u t := by
  unfold E1N.zeroU; rw [zeroGo_af]
  by_cases h : wbit U t = true
  · rw [if_pos ⟨Nat.zero_le _, by omega, by omega, h⟩, if_pos h]
  · rw [if_neg (by simp [h]), if_neg h]

theorem zeroU_size (D : IPD) (u U : Array ℕ) : (E1N.zeroU D u U).size = u.size := zeroGo_size U _ _ _

/-! ## Searches -/

theorem countGo_spec (nl : ℕ) (f : ℕ → ℕ) (labs : Array ℕ) : ∀ n r c c', E1N.countGo nl f labs n r c = some c' →
    c'.size = c.size ∧ (∀ s < n, f (af labs (r + s)) < nl) ∧
    ∀ x < c.size, af c' x = af c x + ∑ s ∈ range n, (if f (af labs (r + s)) = x then 1 else 0) := by
  intro n; induction n with
  | zero => intro r c c' h; simp only [E1N.countGo, Option.some.injEq] at h; subst h; simp
  | succ n ih =>
    intro r c c' h
    rw [E1N.countGo] at h
    change (if f (af labs r) < nl then E1N.countGo nl f labs n (r + 1) (c.set! (f (af labs r)) (af c (f (af labs r)) + 1))
      else none) = some c' at h
    by_cases hx : f (af labs r) < nl
    · rw [if_pos hx] at h
      obtain ⟨h1, h2, h3⟩ := ih (r + 1) _ c' h
      rw [size_set] at h1 h3
      refine ⟨h1, fun s hs => ?_, fun x hx' => ?_⟩
      · rcases s with _ | s
        · exact hx
        · have := h2 s (by omega); rwa [show r + 1 + s = r + (s + 1) by ring] at this
      · rw [h3 x hx', af_set, sum_range_succ']
        simp only [show ∀ s, r + 1 + s = r + (s + 1) from fun s => by ring, show r + 0 = r by rfl]
        by_cases hfx : f (af labs r) = x
        · rw [if_pos ⟨hfx, by rw [hfx]; exact hx'⟩, if_pos hfx, hfx]; ring
        · rw [if_neg (by intro hc; exact hfx hc.1), if_neg hfx]; ring
    · rw [if_neg hx] at h; exact absurd h (by simp)

theorem lexLt_spec (a b : Array ℕ) : ∀ n x, E1N.lexLt a b n x = true →
    ∃ j0, x ≤ j0 ∧ j0 < x + n ∧ (∀ j, x ≤ j → j < j0 → af a j = af b j) ∧ af a j0 < af b j0 := by
  intro n; induction n with
  | zero => intro x h; simp [E1N.lexLt] at h
  | succ n ih =>
    intro x h
    rw [E1N.lexLt] at h
    split at h
    · next he =>
      obtain ⟨j0, h1, h2, h3, h4⟩ := ih (x + 1) h
      refine ⟨j0, by omega, by omega, fun j hj1 hj2 => ?_, h4⟩
      rcases (by omega : j = x ∨ x + 1 ≤ j) with rfl | hj
      · exact beq_iff_eq.mp he
      · exact h3 j hj hj2
    · exact ⟨x, le_rfl, by omega, fun j h1 h2 => by omega, of_decide_eq_true h⟩

theorem recLabsGo_spec (D : IPD) (K : Blk) (rs re : ℕ) (labs : Array ℕ) : ∀ n i, E1N.recLabsGo D K rs re labs n i = true →
    ∀ s < n, E1N.rdE K.B (rs + 5 + D.lb + D.lb * (i + s)) re D.lb = af labs (i + s) := by
  intro n; induction n with
  | zero => intro i _ s hs; omega
  | succ n ih =>
    intro i h s hs
    rw [E1N.recLabsGo, Bool.and_eq_true, beq_iff_eq] at h
    rcases s with _ | s
    · exact h.1
    · have := ih (i + 1) h.2 s (by omega); rwa [show i + 1 + s = i + (s + 1) by ring] at this

theorem recBudGo_spec (K : Blk) (b re : ℕ) (u : Array ℕ) : ∀ n x, E1N.recBudGo K b re u n x = true →
    ∀ s < n, E1N.rdE K.B (b + 3 * (x + s)) re 3 = af u (x + s) := by
  intro n; induction n with
  | zero => intro x _ s hs; omega
  | succ n ih =>
    intro x h s hs
    rw [E1N.recBudGo, Bool.and_eq_true, beq_iff_eq] at h
    rcases s with _ | s
    · exact h.1
    · have := ih (x + 1) h.2 s (by omega); rwa [show x + 1 + s = x + (s + 1) by ring] at this

end E1NRG
