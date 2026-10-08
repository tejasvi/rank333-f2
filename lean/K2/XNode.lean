module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import MisF.Packed
public import K2.XStep
/-! # Peel B&B on a packed conflict matrix, with in-branch cliques; the child matrix from rows (label windows)

Layout: `n` slots of stride `S` (`n + 2 ≤ S`); slot `v` of a matrix is `dig S A v`, the points conflicting with `v`.
Data arrive in label coordinates (bit `l` = label `l`; matrices with slot `l` at bits `S l ..`, as L1's `N`) and are read
in the window of a child: `o` = first label of the window, a mask is shifted by `o`, a matrix by `S o + o`.

* `outer m` = the clique of `m` (slot `i` holds `m` when `i ∈ m`): `m · spread m`, where `spread m = (m · REPm) ∧ REP` puts
  one bit per slot (`REPm` holds copies of `m` at stride `S - 1`, which do not overlap; `spread_eq`, `outer_eq`).
* `checkXT`: a B&B tree.  A leaf runs X-steps and a final count (as `xrun`).  A node runs X-steps, then branches on `v`:
  the in-branch keeps `v` and drops its conflicts, and adds the cliques `U ∖ {v}` of listed rows (`|C ∩ U| ≤ 2`, `v ∈ U`)
  and a static matrix `C2` without row and column `v`; the out-branch drops `v`.  **`checkXT_sound`**.
* `childL`: the child matrix (node matrix and static slice shifted into the window, plus cliques of residual-1 rows, diagonal
  cleared), then `checkXT`.  **`childL_sound`**. -/
@[expose] public section
namespace K2
open MisF Finset

/-! ## Masks -/

/-- `x ∧ ¬y` (kernel form) -/
def andn (x y : ℕ) : ℕ := Nat.xor x (Nat.land x y)

theorem testBit_andn (x y j : ℕ) : (andn x y).testBit j = (x.testBit j && !(y.testBit j)) := by
  unfold andn
  change (x ^^^ (x &&& y)).testBit j = _
  rw [Nat.testBit_xor, Nat.testBit_and]
  cases x.testBit j <;> cases y.testBit j <;> rfl

theorem testBit_lor (a b i : ℕ) : (Nat.lor a b).testBit i = (a.testBit i || b.testBit i) := Nat.testBit_or a b i

theorem testBit_land (a b i : ℕ) : (Nat.land a b).testBit i = (a.testBit i && b.testBit i) := Nat.testBit_and a b i

theorem lt_of_blt {a b : ℕ} (h : Nat.blt a b = true) : a < b := by simpa using h

theorem andn_lt {x k : ℕ} (y : ℕ) (h : x < 2 ^ k) : andn x y < 2 ^ k := xor_and_lt x y k h

theorem testBit_one_shiftLeft (v j : ℕ) : (Nat.shiftLeft 1 v).testBit j = decide (j = v) := by
  change (1 <<< v).testBit j = _
  rw [Nat.one_shiftLeft, Nat.testBit_two_pow]
  by_cases h : j = v
  · subst h; simp
  · simp [h, Ne.symm h]

/-! ## Spread and outer product -/

theorem testBit_pk (S n : ℕ) (a : ℕ → ℕ) (ha : ∀ i < n, a i < 2 ^ S) (hS : 0 < S) (p : ℕ) :
    (pk S a n).testBit p = (decide (p / S < n) && (a (p / S)).testBit (p % S)) := by
  by_cases hlt : p / S < n
  · have h := testBit_dig S (pk S a n) (p / S) (p % S) (Nat.mod_lt _ hS)
    rw [Nat.div_add_mod, dig_pk S a n ha _ hlt] at h
    rw [← h]; simp [hlt]
  · have hle : 2 ^ (S * n) ≤ 2 ^ p := Nat.pow_le_pow_right (by norm_num)
      (le_trans (Nat.mul_le_mul_left S (by omega : n ≤ p / S)) (Nat.mul_div_le p S))
    rw [testBit_false_of_lt (lt_of_lt_of_le (pk_lt S a n ha) hle)]; simp [hlt]

theorem testBit_one' (r : ℕ) : (1 : ℕ).testBit r = decide (r = 0) := by
  rw [show (1 : ℕ) = 2 ^ 0 from rfl, Nat.testBit_two_pow]; simp [eq_comm]

/-- one bit per slot: bit `S i` set iff `i ∈ m` (`REPm` = copies at stride `S - 1`, which do not overlap) -/
def spread (m REPm REP : ℕ) : ℕ := Nat.land (Nat.mul m REPm) REP

/-- the clique of `m`: slot `i` holds `m` when `i ∈ m` -/
def outer (m REPm REP : ℕ) : ℕ := Nat.mul m (spread m REPm REP)

theorem two_pow_lt_half {i n S : ℕ} (hi : i < n) (hS : n + 1 ≤ S) : 2 ^ i < 2 ^ (S - 1) :=
  Nat.pow_lt_pow_right (by norm_num) (by omega)

theorem spread_eq (S n m REPm REP : ℕ) (hS : n + 1 ≤ S) (hm : m < 2 ^ n)
    (hREPm : REPm = pk (S - 1) (fun _ => 1) n) (hREP : REP = pk S (fun _ => 1) n) :
    spread m REPm REP = pk S (fun i => if m.testBit i then 1 else 0) n := by
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · have hm0 : m = 0 := by simpa using hm
    subst hm0; simp [spread, pk]
  have hmS1 : m < 2 ^ (S - 1) := lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hT : m * REPm = pk (S - 1) (fun _ => m) n := by rw [hREPm, ← pk_mul]; apply pk_congr; intro i _; ring
  have h1 : ∀ i < n, (1 : ℕ) < 2 ^ S := fun _ _ => Nat.one_lt_two_pow (by omega)
  have hg : ∀ i < n, (if m.testBit i then 1 else 0) < 2 ^ S := by
    intro i _; split
    · exact Nat.one_lt_two_pow (by omega)
    · exact Nat.two_pow_pos _
  unfold spread
  change (m * REPm) &&& REP = _
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_and, hT, hREP, testBit_pk S n _ h1 (by omega) p, testBit_pk S n _ hg (by omega) p,
    testBit_pk (S - 1) n _ (fun _ _ => hmS1) (by omega) p]
  by_cases hr : p % S = 0
  · set i := p / S with hi
    have hp : p = S * i := by have := Nat.div_add_mod p S; rw [← hi] at this; omega
    by_cases hlt : i < n
    · have hp' : p = i + (S - 1) * i := by
        rw [hp]; have : S = (S - 1) + 1 := by omega
        conv_lhs => rw [this]
        ring
      have hq : p / (S - 1) = i := by
        rw [hp', Nat.add_mul_div_left _ _ (by omega : 0 < S - 1), Nat.div_eq_of_lt (by omega : i < S - 1)]; simp
      have hm' : p % (S - 1) = i := by
        rw [hp', Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (by omega : i < S - 1)]
      rw [hq, hm', hr, testBit_one']
      by_cases hb : m.testBit i
      · simp [hlt, hb]
      · simp [hlt, hb]
    · simp [hlt]
  · have h1r : (1 : ℕ).testBit (p % S) = false := by
      rw [testBit_one']; simp [hr]
    rw [h1r]
    have : ∀ x : ℕ, x ≤ 1 → x.testBit (p % S) = false := by
      intro x hx; interval_cases x
      · exact Nat.zero_testBit _
      · exact h1r
    rw [this _ (by split <;> omega)]; simp

theorem outer_eq (S n m REPm REP : ℕ) (hS : n + 1 ≤ S) (hm : m < 2 ^ n)
    (hREPm : REPm = pk (S - 1) (fun _ => 1) n) (hREP : REP = pk S (fun _ => 1) n) :
    outer m REPm REP = pk S (fun i => if m.testBit i then m else 0) n := by
  unfold outer
  change m * spread m REPm REP = _
  rw [spread_eq S n m REPm REP hS hm hREPm hREP, ← pk_mul]
  apply pk_congr; intro i _; split <;> simp

theorem testBit_outer (S n m REPm REP : ℕ) (hS : n + 1 ≤ S) (hm : m < 2 ^ n)
    (hREPm : REPm = pk (S - 1) (fun _ => 1) n) (hREP : REP = pk S (fun _ => 1) n)
    (i j : ℕ) (hi : i < n) (hj : j < S) :
    (outer m REPm REP).testBit (S * i + j) = (m.testBit i && m.testBit j) := by
  have hmS : m < 2 ^ S := lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega))
  rw [← testBit_dig S _ i j hj, outer_eq S n m REPm REP hS hm hREPm hREP,
    dig_pk _ _ _ (fun k _ => by split; exact hmS; exact Nat.two_pow_pos _) i hi]
  by_cases hb : m.testBit i
  · simp [hb]
  · simp [hb]

/-! ## Layout bits -/

theorem testBit_DIAG (S n DIAG : ℕ) (hS : n + 1 ≤ S) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n)
    (i j : ℕ) (hi : i < n) (hj : j < S) : DIAG.testBit (S * i + j) = decide (i = j) := by
  have hhalf : ∀ k < n, 2 ^ k < 2 ^ S := fun k hk =>
    lt_of_lt_of_le (two_pow_lt_half hk hS) (Nat.pow_le_pow_right (by norm_num) (by omega))
  rw [← testBit_dig S _ i j hj, hDIAG, dig_pk _ _ _ hhalf i hi, Nat.testBit_two_pow]

theorem testBit_REP (S n REP : ℕ) (hS : n + 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (i : ℕ) (hi : i < n) :
    REP.testBit (S * i) = true := by
  have h := testBit_dig S REP i 0 (by omega)
  rw [Nat.add_zero] at h
  rw [← h, hREP, dig_pk _ _ _ (fun _ _ => Nat.one_lt_two_pow (by omega)) i hi]; rfl

/-- clear the diagonal -/
def clrD (A DIAG : ℕ) : ℕ := andn A DIAG

theorem testBit_clrD (S n A DIAG : ℕ) (hS : n + 1 ≤ S) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n)
    (i j : ℕ) (hi : i < n) (hj : j < S) :
    (dig S (clrD A DIAG) i).testBit j = ((dig S A i).testBit j && !(decide (i = j))) := by
  rw [testBit_dig S _ i j hj, testBit_dig S _ i j hj]
  unfold clrD; rw [testBit_andn, testBit_DIAG S n DIAG hS hDIAG i j hi hj]

/-- a matrix without row `v` and column `v` -/
def clrV (C2 REP S v : ℕ) : ℕ :=
  andn C2 (Nat.lor (Nat.shiftLeft REP v) (Nat.shiftLeft (Nat.sub (Nat.shiftLeft 1 S) 1) (Nat.mul S v)))

theorem testBit_clrV (S n C2 REP v : ℕ) (hS : n + 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (w1 w2 : ℕ) (h1 : w1 < n) (h2 : w2 < n)
    (h : (dig S (clrV C2 REP S v) w1).testBit w2 = true) :
    (dig S C2 w1).testBit w2 = true ∧ w1 ≠ v ∧ w2 ≠ v := by
  have hw2S : w2 < S := by omega
  rw [testBit_dig S _ w1 w2 hw2S] at h
  rw [testBit_dig S _ w1 w2 hw2S]
  unfold clrV at h
  rw [testBit_andn] at h
  simp only [Bool.and_eq_true, Bool.not_eq_true'] at h
  obtain ⟨hc, hm⟩ := h
  refine ⟨hc, ?_, ?_⟩
  · rintro rfl
    have : (Nat.shiftLeft (Nat.sub (Nat.shiftLeft 1 S) 1) (Nat.mul S w1)).testBit (S * w1 + w2) = true := by
      change ((((1 <<< S) - 1)) <<< (S * w1)).testBit (S * w1 + w2) = true
      rw [Nat.testBit_shiftLeft, Nat.one_shiftLeft]
      simp only [ge_iff_le, Nat.le_add_right, decide_true, Bool.true_and]
      rw [Nat.add_sub_cancel_left, Nat.testBit_two_pow_sub_one]; simp [hw2S]
    rw [testBit_lor, this, Bool.or_true] at hm; exact absurd hm (by decide)
  · rintro rfl
    have : (Nat.shiftLeft REP w2).testBit (S * w1 + w2) = true := by
      change (REP <<< w2).testBit (S * w1 + w2) = true
      rw [Nat.testBit_shiftLeft]
      simp only [ge_iff_le, Nat.le_add_left, decide_true, Bool.true_and, Nat.add_sub_cancel]
      exact testBit_REP S n REP hS hREP w1 h1
    rw [testBit_lor, this, Bool.true_or] at hm; exact absurd hm (by decide)

/-! ## OR of cliques -/

/-- `A` with the cliques of `rows` -/
def addCl (A REPm REP : ℕ) (rows : List ℕ) : ℕ :=
  List.rec (motive := fun _ => ℕ) A (fun m _ ih => Nat.lor ih (outer m REPm REP)) rows

/-- `A` with the cliques of `rows`, each without `v` -/
def addClV (A REPm REP v : ℕ) (rows : List ℕ) : ℕ :=
  List.rec (motive := fun _ => ℕ) A
    (fun m _ ih => Nat.lor ih (outer (andn m (Nat.shiftLeft 1 v)) REPm REP)) rows

theorem testBit_addCl_imp (A REPm REP k : ℕ) (rows : List ℕ)
    (h : (addCl A REPm REP rows).testBit k = true) :
    A.testBit k = true ∨ ∃ m ∈ rows, (outer m REPm REP).testBit k = true := by
  induction rows with
  | nil => exact Or.inl h
  | cons m rows ih =>
    change (Nat.lor (addCl A REPm REP rows) (outer m REPm REP)).testBit k = true at h
    rw [testBit_lor, Bool.or_eq_true] at h
    rcases h with h | h
    · rcases ih h with h' | ⟨m', hm', h'⟩
      · exact Or.inl h'
      · exact Or.inr ⟨m', List.mem_cons_of_mem _ hm', h'⟩
    · exact Or.inr ⟨m, List.mem_cons_self .., h⟩

theorem testBit_addClV_imp (A REPm REP v k : ℕ) (rows : List ℕ)
    (h : (addClV A REPm REP v rows).testBit k = true) :
    A.testBit k = true ∨ ∃ m ∈ rows, (outer (andn m (Nat.shiftLeft 1 v)) REPm REP).testBit k = true := by
  induction rows with
  | nil => exact Or.inl h
  | cons m rows ih =>
    change (Nat.lor (addClV A REPm REP v rows) (outer (andn m (Nat.shiftLeft 1 v)) REPm REP)).testBit k = true at h
    rw [testBit_lor, Bool.or_eq_true] at h
    rcases h with h | h
    · rcases ih h with h' | ⟨m', hm', h'⟩
      · exact Or.inl h'
      · exact Or.inr ⟨m', List.mem_cons_of_mem _ hm', h'⟩
    · exact Or.inr ⟨m, List.mem_cons_self .., h⟩

/-- every row is below `TOP` -/
def allLt (TOP : ℕ) (rows : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun m _ ih => Nat.blt m TOP && ih) rows

/-- every row is below `TOP` and holds `v` -/
def rowsOK (TOP v : ℕ) (rows : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun m _ ih => Nat.blt m TOP && Nat.beq (Nat.land (Nat.shiftRight m v) 1) 1 && ih) rows

theorem allLt_mem (TOP : ℕ) (rows : List ℕ) (h : allLt TOP rows = true) : ∀ m ∈ rows, m < TOP := by
  induction rows with
  | nil => intro m hm; cases hm
  | cons a rows ih =>
    change (Nat.blt a TOP && allLt TOP rows) = true at h
    rw [Bool.and_eq_true] at h
    intro m hm
    rcases List.mem_cons.mp hm with rfl | hm
    · exact lt_of_blt h.1
    · exact ih h.2 m hm

theorem rowsOK_mem (TOP v : ℕ) (rows : List ℕ) (h : rowsOK TOP v rows = true) :
    ∀ m ∈ rows, m < TOP ∧ m.testBit v = true := by
  induction rows with
  | nil => intro m hm; cases hm
  | cons a rows ih =>
    change (Nat.blt a TOP && Nat.beq (Nat.land (Nat.shiftRight a v) 1) 1 && rowsOK TOP v rows) = true at h
    simp only [Bool.and_eq_true] at h
    intro m hm
    rcases List.mem_cons.mp hm with rfl | hm
    · refine ⟨lt_of_blt h.1.1, ?_⟩
      have h2 := Nat.eq_of_beq_eq_true h.1.2
      change (m >>> v) &&& 1 = 1 at h2
      rw [Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow] at h2
      rw [Nat.testBit_eq_decide_div_mod_eq, h2]; rfl
    · exact ih h.2 m hm

/-- every row shifted by `o` (kernel form) -/
def shiftL (o : ℕ) (rows : List ℕ) : List ℕ :=
  List.rec (motive := fun _ => List ℕ) [] (fun m _ ih => Nat.shiftRight m o :: ih) rows

theorem mem_shiftL (o : ℕ) (rows : List ℕ) (m' : ℕ) (h : m' ∈ shiftL o rows) : ∃ m ∈ rows, m' = m >>> o := by
  induction rows with
  | nil => cases h
  | cons a rows ih =>
    change m' ∈ (Nat.shiftRight a o :: shiftL o rows) at h
    rcases List.mem_cons.mp h with rfl | h
    · exact ⟨a, List.mem_cons_self .., rfl⟩
    · obtain ⟨m, hm, e⟩ := ih h
      exact ⟨m, List.mem_cons_of_mem _ hm, e⟩

/-! ## X-steps with shifted demands, and the tree -/

/-- X-steps; each demand mask is read in the window (`>>> o`) -/
def runSo (A REP GRD LOWS MODM S o : ℕ) (sts : List (ℕ × ℕ)) (c : ℕ) : ℕ :=
  List.rec (motive := fun _ => ℕ → ℕ) (fun c => c)
    (fun st _ ih c => ih (xstep A REP GRD LOWS MODM S c (Nat.shiftRight st.1 o) st.2)) sts c

inductive XT where
  /-- X-steps, then the final count `|cand ∩ H| < d` -/
  | leaf : List (ℕ × ℕ) → ℕ × ℕ → XT
  /-- X-steps, then a branch on `v` (window index): static matrix `C2` and rows for the in-branch cliques -/
  | node : List (ℕ × ℕ) → ℕ → ℕ → List ℕ → XT → XT → XT

/-- the in-branch matrix: `A`, the cliques `U ∖ {v}` of `rows`, and `C2` without row and column `v`; diagonal cleared -/
def inA (A REPm REP DIAG S v C2 : ℕ) (rows : List ℕ) : ℕ :=
  clrD (Nat.lor (addClV A REPm REP v rows) (clrV C2 REP S v)) DIAG

/-- slot `v` of a matrix with shifts (the kernel's `Nat.div` by a power of two is a general division) -/
def rowA (S A v : ℕ) : ℕ := Nat.land (Nat.shiftRight A (Nat.mul S v)) (Nat.sub (Nat.shiftLeft 1 S) 1)

theorem rowA_eq (S A v : ℕ) : rowA S A v = dig S A v := by
  unfold rowA dig
  change (A >>> (S * v)) &&& ((1 <<< S) - 1) = _
  rw [Nat.shiftRight_eq_div_pow, Nat.one_shiftLeft, Nat.and_two_pow_sub_one_eq_mod]

/-- one branch, given the candidates after the node's X-steps -/
def brk (kl kr : ℕ → ℕ → Bool) (A A1 v S c : ℕ) : Bool :=
  kl A1 (andn c (rowA S A v)) && kr A (andn c (Nat.shiftLeft 1 v))

/-- the tree check: demands and rows are label masks (shifted by `o`), `C2` a label-layout matrix (shifted by `S o + o`) -/
noncomputable def checkXT (REPm REP GRD LOWS MODM DIAG S TOP o : ℕ) (t : XT) : ℕ → ℕ → Bool :=
  XT.rec (motive := fun _ => ℕ → ℕ → Bool)
    (fun sts fin A c => fewerB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (Nat.shiftRight fin.1 o)) fin.2)
    (fun sts v C2 rows _ _ ihl ihr A c =>
      rowsOK (Nat.shiftLeft TOP o) (Nat.add o v) rows &&
      brk ihl ihr A (inA A REPm REP DIAG S v (Nat.shiftRight C2 (Nat.add (Nat.mul S o) o))
          (shiftL o rows)) v S
        (runSo A REP GRD LOWS MODM S o sts c))
    t

/-- validity of a demand for a window set `C` -/
def demOK (C : Finset ℕ) (o : ℕ) (st : ℕ × ℕ) : Prop :=
  1 ≤ st.2 ∧ st.2 ≤ (C.filter (fun v => (st.1 >>> o).testBit v = true)).card

/-- validity of a tree's data for a completion `C` (window coordinates) -/
def XTValid (S o : ℕ) (C : Finset ℕ) : XT → Prop
  | .leaf sts fin => (∀ st ∈ sts, demOK C o st) ∧ demOK C o fin
  | .node sts v C2 rows l r => (∀ st ∈ sts, demOK C o st) ∧
      (v ∈ C → ∀ w1 ∈ C, ∀ w2 ∈ C, w1 ≠ v → w2 ≠ v → w1 ≠ w2 →
        (dig S (C2 >>> (S * o + o)) w1).testBit w2 = false) ∧
      (∀ m ∈ rows, (C.filter (fun w => (m >>> o).testBit w = true)).card ≤ 2) ∧
      XTValid S o C l ∧ XTValid S o C r

section sound
variable (REPm REP GRD LOWS MODM DIAG S TOP n o : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
  (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
  (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
  (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
include hS hREP hGRD hL hM

theorem runSo_keep (A : ℕ) (C : Finset ℕ) (hind : ∀ v ∈ C, ∀ w ∈ C, (dig S A v).testBit w = false) :
    ∀ sts c, c < 2 ^ n → (∀ v ∈ C, v < n ∧ c.testBit v = true) → (∀ st ∈ sts, demOK C o st) →
      runSo A REP GRD LOWS MODM S o sts c < 2 ^ n ∧ ∀ v ∈ C, (runSo A REP GRD LOWS MODM S o sts c).testBit v = true := by
  intro sts
  induction sts with
  | nil => intro c hc hC _; exact ⟨hc, fun v hv => (hC v hv).2⟩
  | cons st sts ih =>
    intro c hc hC hdem
    obtain ⟨H, d⟩ := st
    change runSo A REP GRD LOWS MODM S o sts (xstep A REP GRD LOWS MODM S c (H >>> o) d) < 2 ^ n ∧
      ∀ v ∈ C, (runSo A REP GRD LOWS MODM S o sts (xstep A REP GRD LOWS MODM S c (H >>> o) d)).testBit v = true
    have hd := hdem (H, d) (List.mem_cons_self ..)
    apply ih _ (lt_of_le_of_lt Nat.and_le_left hc) _ (fun st hst => hdem st (List.mem_cons_of_mem _ hst))
    intro v hv
    refine ⟨(hC v hv).1, ?_⟩
    apply xstep_keep A REP GRD LOWS MODM S n c (H >>> o) d v hS hc hREP hGRD hL hM (hC v hv).1 (hC v hv).2 hd.1
    exact le_trans hd.2 (sub_bits S n c (H >>> o) (dig S A v) C (by omega) hC (fun w hw => hind v hv w hw))

include hDIAG hTOP hREPm in
/-- **Soundness of the peel B&B tree.** -/
theorem checkXT_sound : ∀ (t : XT) (A c : ℕ), c < 2 ^ n → checkXT REPm REP GRD LOWS MODM DIAG S TOP o t A c = true →
    ∀ C : Finset ℕ, (∀ v ∈ C, v < n ∧ c.testBit v = true) → (∀ v ∈ C, ∀ w ∈ C, (dig S A v).testBit w = false) →
    XTValid S o C t → False := by
  intro t
  induction t with
  | leaf sts fin =>
    intro A c hc h C hC hind hval
    obtain ⟨hsts, hfin⟩ := hval
    obtain ⟨hc', hC'⟩ := runSo_keep REP GRD LOWS MODM S n o hS hREP hGRD hL hM A C hind sts c hc hC hsts
    change fewerB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (Nat.shiftRight fin.1 o)) fin.2 = true at h
    change Nat.beq (remB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o)) (Nat.sub fin.2 1)) 0 = true at h
    have h0 := Nat.eq_of_beq_eq_true h
    have hlt : (bitsB n (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o))).card < fin.2 :=
      card_lt_of_remB n _ fin.2 (lt_of_le_of_lt Nat.and_le_left hc') hfin.1 h0
    have hsub : (C.filter (fun v => (fin.1 >>> o).testBit v = true)).card ≤
        (bitsB n (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o))).card := by
      apply Finset.card_le_card; intro w hw
      rw [Finset.mem_filter] at hw
      rw [mem_bitsB]
      refine ⟨(hC w hw.1).1, ?_⟩
      rw [testBit_land, hC' w hw.1, hw.2]; rfl
    have := hfin.2; omega
  | node sts v C2 rows l r ihl ihr =>
    intro A c hc h C hC hind hval
    obtain ⟨hsts, hC2, hrows, hvl, hvr⟩ := hval
    obtain ⟨hc', hC'⟩ := runSo_keep REP GRD LOWS MODM S n o hS hREP hGRD hL hM A C hind sts c hc hC hsts
    set c' := runSo A REP GRD LOWS MODM S o sts c with hc'def
    set rows' := shiftL o rows with hrows'
    have hmap : ∀ m' ∈ rows', ∃ m ∈ rows, m' = m >>> o := fun m' hm' => mem_shiftL o rows m' hm'
    change (rowsOK (Nat.shiftLeft TOP o) (Nat.add o v) rows && brk _ _ A _ v S c') = true at h
    rw [Bool.and_eq_true] at h
    obtain ⟨hok, hb⟩ := h
    have hokm := rowsOK_mem (Nat.shiftLeft TOP o) (o + v) rows hok
    unfold brk at hb
    rw [Bool.and_eq_true] at hb
    obtain ⟨hl, hr⟩ := hb
    by_cases hvC : v ∈ C
    · -- in-branch
      have hvn : v < n := (hC v hvC).1
      refine ihl _ _ (andn_lt _ hc') hl C ?_ ?_ hvl
      · intro w hw
        refine ⟨(hC w hw).1, ?_⟩
        rw [testBit_andn, hC' w hw, rowA_eq, hind v hvC w hw]; rfl
      · intro w1 hw1 w2 hw2
        have h1n := (hC w1 hw1).1
        have h2n := (hC w2 hw2).1
        unfold inA
        rw [testBit_clrD S n _ DIAG (by omega) hDIAG w1 w2 h1n (by omega)]
        by_cases he : w1 = w2
        · simp [he]
        · simp only [he, decide_false, Bool.not_false, Bool.and_true]
          cases hX : (dig S (Nat.lor (addClV A REPm REP v rows')
              (clrV (C2 >>> (S * o + o)) REP S v)) w1).testBit w2 with
          | false => rfl
          | true =>
            exfalso
            rw [testBit_dig S _ w1 w2 (by omega), testBit_lor, Bool.or_eq_true] at hX
            rcases hX with hX | hX
            · rcases testBit_addClV_imp A REPm REP v _ rows' hX with hA | ⟨m', hm', hO⟩
              · rw [← testBit_dig S _ w1 w2 (by omega), hind w1 hw1 w2 hw2] at hA; exact absurd hA (by decide)
              · obtain ⟨m, hm, rfl⟩ := hmap m' hm'
                obtain ⟨hmlt, hmv⟩ := hokm m hm
                have hmlt' : andn (m >>> o) (Nat.shiftLeft 1 v) < 2 ^ n := by
                  apply andn_lt
                  apply Nat.lt_pow_two_of_testBit
                  intro j hj
                  rw [Nat.testBit_shiftRight]
                  apply testBit_false_of_lt
                  change m < TOP <<< o at hmlt
                  rw [hTOP, Nat.shiftLeft_eq, ← pow_add] at hmlt
                  exact lt_of_lt_of_le hmlt (Nat.pow_le_pow_right (by norm_num) (by omega))
                rw [testBit_outer S n _ REPm REP (by omega) hmlt' hREPm hREP w1 w2 h1n (by omega)] at hO
                rw [testBit_andn, testBit_andn, testBit_one_shiftLeft, testBit_one_shiftLeft] at hO
                simp only [Bool.and_eq_true, Bool.not_eq_true', decide_eq_false_iff_not] at hO
                obtain ⟨⟨hm1, hv1⟩, hm2, hv2⟩ := hO
                rw [Nat.testBit_shiftRight] at hm1 hm2
                have hcard := hrows m hm
                have hsub : ({v, w1, w2} : Finset ℕ) ⊆ C.filter (fun w => (m >>> o).testBit w = true) := by
                  intro x hx
                  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
                  rw [Finset.mem_filter, Nat.testBit_shiftRight]
                  rcases hx with rfl | rfl | rfl
                  · exact ⟨hvC, hmv⟩
                  · exact ⟨hw1, hm1⟩
                  · exact ⟨hw2, hm2⟩
                have h3 : ({v, w1, w2} : Finset ℕ).card = 3 := by
                  rw [Finset.card_insert_of_notMem, Finset.card_pair he]
                  simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
                  exact ⟨Ne.symm hv1, Ne.symm hv2⟩
                have := Finset.card_le_card hsub
                omega
            · rw [← testBit_dig S _ w1 w2 (by omega)] at hX
              obtain ⟨hc2, hv1, hv2⟩ := testBit_clrV S n _ REP v (by omega) hREP w1 w2 h1n h2n hX
              rw [hC2 hvC w1 hw1 w2 hw2 hv1 hv2 he] at hc2; exact absurd hc2 (by decide)
    · -- out-branch
      refine ihr _ _ (andn_lt _ hc') hr C ?_ hind hvr
      intro w hw
      refine ⟨(hC w hw).1, ?_⟩
      rw [testBit_andn, hC' w hw, testBit_one_shiftLeft]
      have : w ≠ v := fun e => hvC (e ▸ hw)
      simp [this]

end sound

/-! ## The child: matrix from the node matrix, a static slice and residual-1 rows; then the tree -/

/-- the child check: everything in label coordinates; `o = u + 1` is the window start -/
noncomputable def childL (REPm REP GRD LOWS MODM DIAG S TOP o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT) : Bool :=
  allLt (Nat.shiftLeft TOP o) crows &&
  checkXT REPm REP GRD LOWS MODM DIAG S TOP o t
    (clrD (addCl (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul S o) o)) (Nat.shiftRight C2u (Nat.add (Nat.mul S o) o)))
      REPm REP (shiftL o crows)) DIAG)
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1))

theorem dig_shift_testBit (S A o v w : ℕ) (hw : o + w < S) :
    (dig S (A >>> (S * o + o)) v).testBit w = (dig S A (o + v)).testBit (o + w) := by
  rw [testBit_dig S _ v w (by omega), testBit_dig S _ (o + v) (o + w) hw, Nat.testBit_shiftRight]
  congr 1; ring

/-- **Soundness of the child check.** Hypotheses in label coordinates for a completion `L` (labels `≥ o`, inside `Fu`):
the node matrix and the static slice hold only conflicts of `L`, every child row meets `L` at most once, and the tree's
demands, slices and rows are valid (`XTValid` on the window image of `L`). -/
theorem childL_sound (REPm REP GRD LOWS MODM DIAG S TOP n o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hon : o + n ≤ S)
    (h : childL REPm REP GRD LOWS MODM DIAG S TOP o Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hval : XTValid S o (L.image (fun a => a - o)) t) : False := by
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT REPm REP GRD LOWS MODM DIAG S TOP o t _ _) = true at h
  rw [Bool.and_eq_true] at h
  obtain ⟨hlt, hchk⟩ := h
  have hltm := allLt_mem _ crows hlt
  set C := L.image (fun a => a - o) with hCdef
  have hmemC : ∀ w, w ∈ C ↔ o + w ∈ L := by
    intro w; rw [hCdef, Finset.mem_image]
    constructor
    · rintro ⟨a, ha, rfl⟩; rw [Nat.add_sub_cancel' (hLo a ha).1]; exact ha
    · intro hw; exact ⟨o + w, hw, by omega⟩
  have hCn : ∀ w ∈ C, w < n := by
    intro w hw; have := (hLo _ ((hmemC w).mp hw)).2.1; omega
  set crows' := shiftL o crows with hcr
  have hmap : ∀ m' ∈ crows', ∃ m ∈ crows, m' = m >>> o := fun m' hm' => mem_shiftL o crows m' hm'
  refine checkXT_sound REPm REP GRD LOWS MODM DIAG S TOP n o hS hREP hGRD hL hM hDIAG hTOP hREPm t _ _ ?_ hchk C ?_ ?_ hval
  · apply lt_of_le_of_lt Nat.and_le_right
    rw [hTOP]; exact Nat.sub_lt (Nat.two_pow_pos n) (by norm_num)
  · intro w hw
    refine ⟨hCn w hw, ?_⟩
    change (Nat.land (Fu >>> o) (TOP - 1)).testBit w = true
    rw [testBit_land, Nat.testBit_shiftRight, (hLo _ ((hmemC w).mp hw)).2.2, hTOP, Nat.testBit_two_pow_sub_one]
    simp [hCn w hw]
  · intro w1 hw1 w2 hw2
    have h1n := hCn w1 hw1
    have h2n := hCn w2 hw2
    rw [testBit_clrD S n _ DIAG (by omega) hDIAG w1 w2 h1n (by omega)]
    by_cases he : w1 = w2
    · simp [he]
    · simp only [he, decide_false, Bool.not_false, Bool.and_true]
      cases hX : (dig S (addCl (Nat.lor (Anode >>> (S * o + o)) (C2u >>> (S * o + o))) REPm REP crows') w1).testBit w2 with
      | false => rfl
      | true =>
        exfalso
        rw [testBit_dig S _ w1 w2 (by omega)] at hX
        rcases testBit_addCl_imp _ REPm REP _ crows' hX with hA0 | ⟨m', hm', hO⟩
        · rw [testBit_lor, Bool.or_eq_true] at hA0
          have ha := (hmemC w1).mp hw1
          have hb := (hmemC w2).mp hw2
          have hne : o + w1 ≠ o + w2 := by omega
          rcases hA0 with hA0 | hA0
          · rw [← testBit_dig S _ w1 w2 (by omega), dig_shift_testBit S _ o w1 w2 (by omega), hA _ ha _ hb hne] at hA0
            exact absurd hA0 (by decide)
          · rw [← testBit_dig S _ w1 w2 (by omega), dig_shift_testBit S _ o w1 w2 (by omega), hC2 _ ha _ hb hne] at hA0
            exact absurd hA0 (by decide)
        · obtain ⟨m, hm, rfl⟩ := hmap m' hm'
          have hmlt : m >>> o < 2 ^ n := by
            apply Nat.lt_pow_two_of_testBit
            intro j hj
            rw [Nat.testBit_shiftRight]
            apply testBit_false_of_lt
            have := hltm m hm
            change m < TOP <<< o at this
            rw [hTOP, Nat.shiftLeft_eq, ← pow_add] at this
            exact lt_of_lt_of_le this (Nat.pow_le_pow_right (by norm_num) (by omega))
          rw [testBit_outer S n _ REPm REP (by omega) hmlt hREPm hREP w1 w2 h1n (by omega),
            Nat.testBit_shiftRight, Nat.testBit_shiftRight] at hO
          rw [Bool.and_eq_true] at hO
          have hsub : ({o + w1, o + w2} : Finset ℕ) ⊆ L.filter (fun a => m.testBit a = true) := by
            intro x hx
            simp only [Finset.mem_insert, Finset.mem_singleton] at hx
            rw [Finset.mem_filter]
            rcases hx with rfl | rfl
            · exact ⟨(hmemC w1).mp hw1, hO.1⟩
            · exact ⟨(hmemC w2).mp hw2, hO.2⟩
          have h2 : ({o + w1, o + w2} : Finset ℕ).card = 2 := Finset.card_pair (by omega)
          have := Finset.card_le_card hsub
          have := hrows m hm
          omega

end K2

namespace K2
open MisF Finset

/-! ## Validity in label coordinates -/

/-- validity of a tree's data for a completion `L` in label coordinates (the window starts at label `o`) -/
def XTValidL (S o : ℕ) (L : Finset ℕ) : XT → Prop
  | .leaf sts fin => (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) ∧
      (1 ≤ fin.2 ∧ fin.2 ≤ (L.filter (fun a => fin.1.testBit a = true)).card)
  | .node sts v C2 rows l r => (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) ∧
      (o + v ∈ L → ∀ a ∈ L, ∀ b ∈ L, a ≠ o + v → b ≠ o + v → a ≠ b → (dig S C2 a).testBit b = false) ∧
      (∀ m ∈ rows, (L.filter (fun a => m.testBit a = true)).card ≤ 2) ∧
      XTValidL S o L l ∧ XTValidL S o L r

theorem card_image_sub (L : Finset ℕ) (o : ℕ) (hL : ∀ a ∈ L, o ≤ a) (P : ℕ → Prop) [DecidablePred P] :
    ((L.image (fun a => a - o)).filter (fun w => P (o + w))).card = (L.filter P).card := by
  have hinj : Set.InjOn (fun a => a - o) (L.filter P : Set ℕ) := by
    intro x hx y hy hxy
    have hx' := hL x (Finset.mem_filter.mp hx).1
    have hy' := hL y (Finset.mem_filter.mp hy).1
    simp only at hxy; omega
  rw [← Finset.card_image_of_injOn hinj]
  congr 1
  ext w
  simp only [Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨⟨a, ha, rfl⟩, hp⟩
    refine ⟨a, ⟨ha, ?_⟩, rfl⟩
    rwa [Nat.add_sub_cancel' (hL a ha)] at hp
  · rintro ⟨a, ⟨ha, hp⟩, rfl⟩
    refine ⟨⟨a, ha, rfl⟩, ?_⟩
    rwa [Nat.add_sub_cancel' (hL a ha)]

theorem xtvalid_of_label (S o n : ℕ) (L : Finset ℕ) (hL : ∀ a ∈ L, o ≤ a ∧ a < o + n) (hon : o + n ≤ S) :
    ∀ t : XT, XTValidL S o L t → XTValid S o (L.image (fun a => a - o)) t := by
  have hLo : ∀ a ∈ L, o ≤ a := fun a ha => (hL a ha).1
  have hmem : ∀ w, w ∈ L.image (fun a => a - o) ↔ o + w ∈ L := by
    intro w; rw [Finset.mem_image]
    constructor
    · rintro ⟨a, ha, rfl⟩; rw [Nat.add_sub_cancel' (hLo a ha)]; exact ha
    · intro hw; exact ⟨o + w, hw, by omega⟩
  have hdem : ∀ st : ℕ × ℕ, (1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) →
      demOK (L.image (fun a => a - o)) o st := by
    intro st h
    refine ⟨h.1, ?_⟩
    have := card_image_sub L o hLo (fun a => st.1.testBit a = true)
    simp only at this
    have e : ((L.image (fun a => a - o)).filter (fun v => (st.1 >>> o).testBit v = true)) =
        ((L.image (fun a => a - o)).filter (fun w => st.1.testBit (o + w) = true)) := by
      congr 1; ext w; rw [Nat.testBit_shiftRight]
    rw [e, this]; exact h.2
  intro t
  induction t with
  | leaf sts fin =>
    rintro ⟨hs, hf⟩
    exact ⟨fun st hst => hdem st (hs st hst), hdem fin hf⟩
  | node sts v C2 rows l r ihl ihr =>
    rintro ⟨hs, hc, hr, hl, hrr⟩
    refine ⟨fun st hst => hdem st (hs st hst), ?_, ?_, ihl hl, ihr hrr⟩
    · intro hv w1 hw1 w2 hw2 h1 h2 h12
      have hw2n : o + w2 < S := by have := (hL _ ((hmem w2).mp hw2)).2; omega
      rw [dig_shift_testBit S C2 o w1 w2 hw2n]
      exact hc ((hmem v).mp hv) _ ((hmem w1).mp hw1) _ ((hmem w2).mp hw2) (by omega) (by omega) (by omega)
    · intro m hm
      have := card_image_sub L o hLo (fun a => m.testBit a = true)
      simp only at this
      have e : ((L.image (fun a => a - o)).filter (fun w => (m >>> o).testBit w = true)) =
          ((L.image (fun a => a - o)).filter (fun w => m.testBit (o + w) = true)) := by
        congr 1; ext w; rw [Nat.testBit_shiftRight]
      rw [e, this]; exact hr m hm

/-- **Soundness of the child check, in label coordinates.**  For a completion `L` of the child (labels in the window
`[o, o + n)`, inside `Fu`): if the node matrix and the static slice of `u` hold only conflicts of `L`, every child row meets
`L` at most once, and the tree's data are valid for `L` (demands met; at an in-branch on label `o + v`, the slice `C2` holds
only conflicts of `L` away from `o + v`, and every listed row meets `L` at most twice), then `childL` rejects. -/
theorem childL_sound_label (REPm REP GRD LOWS MODM DIAG S TOP n o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hon : o + n ≤ S)
    (h : childL REPm REP GRD LOWS MODM DIAG S TOP o Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hval : XTValidL S o L t) : False :=
  childL_sound REPm REP GRD LOWS MODM DIAG S TOP n o Anode C2u Fu crows t hS hREP hREPm hGRD hL hM hDIAG hTOP hon h L
    hLo hA hC2 hrows (xtvalid_of_label S o n L (fun a ha => ⟨(hLo a ha).1, (hLo a ha).2.1⟩) hon t hval)

end K2
