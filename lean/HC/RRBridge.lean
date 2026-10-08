module
public import R22Port.U_d41d8cd98f00
public import RT.Sound
public import RootSound.FromRR
public import aux_FullTable_03_bridge
/-! # The bridge from Rudich-Rousseau's class bounds to `RT.Fact` (flag 1 of `leaf2/HCLS.md`, generic part)

RR state a class bound as `TableAtLeast C N` (FullTable_02_Defs): every integer decomposition whose program, run on bits,
returns `A * B` for all `B` and all `A` meeting the conditions `C`, has at least `N` columns.  Their own proof goes from
a "ladder" statement on F2 rank-1 sums to `TableAtLeast` (`FullTable.Bridge.table_at_least_of_ladder`).  Here is the
converse, then the step to `RT.Fact`:

1. `rank1sum_of_isDecomp`: the converse of `RootSound.isDecomp_of_rank1sum` (an `IsDecomp` with 9-bit codes gives an RR
   rank-1 sum list equal to `matmulT`).
2. `count_of_tableAtLeast`: `TableAtLeast C N` bounds, for every rank-1 sum list equal to `matmulT`, the number of terms
   whose first factor is not killed by `C` (`inS`, any predicate whose points annihilate every allowed `A`).  The terms
   with killed first factors vanish on allowed `A`; the others, lifted to integer columns, form a valid table
   decomposition (`Bounds.valid_iff`, `Bridge.sum_rank1sum`, `Bridge.sum_matmulT`, linearity in `B`).
3. `fact_of_tableAtLeast`: for `C = rows.map mask_matrix` and a point mask `m` inside `span rows` (`spanL`, by doubling),
   `TableAtLeast C N → RT.Fact m N`. -/
@[expose] public section
open Matrix FullTable FullTable.WangLadder RootSound

namespace HC

/-! ## 1. `IsDecomp` → rank-1 sum list -/

theorem b2f_inj {x y : Bool} (h : b2f x = b2f y) : x = y := by
  cases x <;> cases y
  · rfl
  · exact absurd h (by simp [b2f])
  · exact absurd h (by simp [b2f])
  · rfl

theorem rank1sum_ofFn_f2 (x y z : ℕ) {n : ℕ} (av bv cv : Fin n → ℕ) :
    b2f (rank1sum (List.ofFn fun s => (av s, bv s, cv s)) x y z) =
      ∑ s, bitF (av s) x * bitF (bv s) y * bitF (cv s) z := by
  rw [RootSound.rank1sum_f2, List.map_ofFn, List.sum_ofFn]
  rfl

theorem cell9 {x : ℕ} (hx : x < 9) : ∃ i j : Fin 3, x = 3 * i.val + j.val :=
  ⟨⟨x / 3, by omega⟩, ⟨x % 3, by omega⟩, by simp only; omega⟩

/-- **The converse of `isDecomp_of_rank1sum`.** -/
theorem rank1sum_of_isDecomp {n : ℕ} (av bv cv : Fin n → ℕ) (ha : ∀ s, av s < 512) (hb : ∀ s, bv s < 512)
    (hc : ∀ s, cv s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) (fun s => toM3 (bv s)) (fun s => toM3 (cv s))) :
    rank1sum (List.ofFn fun s => (av s, bv s, cv s)) = matmulT := by
  funext x y z
  by_cases hbox : x < 9 ∧ y < 9 ∧ z < 9
  · obtain ⟨hx, hy, hz⟩ := hbox
    obtain ⟨i, j, rfl⟩ := cell9 hx
    obtain ⟨j', k, rfl⟩ := cell9 hy
    obtain ⟨k', i', rfl⟩ := cell9 hz
    apply b2f_inj
    rw [rank1sum_ofFn_f2, RootSound.matmulT_val, ← hd i j j' k k' i']
    rfl
  · have hsm : ∀ t ∈ (List.ofFn fun s => (av s, bv s, cv s)), t.1 < 512 ∧ t.2.1 < 512 ∧ t.2.2 < 512 := by
      intro t ht
      obtain ⟨s, rfl⟩ := List.mem_ofFn.mp ht
      exact ⟨ha s, hb s, hc s⟩
    rw [FullTable.Bridge.rank1sum_off hsm (by omega)]
    cases h : matmulT x y z
    · rfl
    · exact absurd (FullTable.Bridge.matmulT_box h) hbox

/-! ### 9-bit codes of `M3` matrices -/

/-- bits, least significant first -/
def encL : List Bool → ℕ
  | [] => 0
  | b :: bs => b.toNat + 2 * encL bs

theorem encL_testBit : ∀ (l : List Bool) (k : ℕ), (encL l).testBit k = l.getD k false
  | [], k => by simp [encL]
  | b :: bs, 0 => by
    rw [encL, Nat.testBit_zero]
    cases b <;> simp
  | b :: bs, k + 1 => by
    have : (b.toNat + 2 * encL bs) / 2 = encL bs := by cases b <;> simp <;> omega
    rw [encL, Nat.testBit_succ, this, encL_testBit bs k]
    simp

theorem encL_lt : ∀ l : List Bool, encL l < 2 ^ l.length
  | [] => by simp [encL]
  | b :: bs => by
    have := encL_lt bs
    have hb : b.toNat ≤ 1 := by cases b <;> simp
    rw [encL, List.length_cons, pow_succ]
    omega

/-- the 9-bit code of a matrix over `F2` (bit `3i+j` = entry `(i, j)`) -/
def encM (M : M3) : ℕ :=
  encL [decide (M 0 0 = 1), decide (M 0 1 = 1), decide (M 0 2 = 1), decide (M 1 0 = 1), decide (M 1 1 = 1),
    decide (M 1 2 = 1), decide (M 2 0 = 1), decide (M 2 1 = 1), decide (M 2 2 = 1)]

theorem encM_lt (M : M3) : encM M < 512 := lt_of_lt_of_le (encL_lt _) (by simp)

theorem f2_cases (x : F2) : (if decide (x = 1) = true then (1 : F2) else 0) = x := by
  revert x; decide

theorem toM3_encM (M : M3) : toM3 (encM M) = M := by
  ext i j
  simp only [toM3, bitF, encM, encL_testBit]
  fin_cases i <;> fin_cases j <;> exact f2_cases _

/-! ## 2. `TableAtLeast` → a count on rank-1 sum lists -/

open FullTable.Bounds in
theorem comp2_lin (L : Decomposition) (A B : Bit3x3Matrix) :
    comp2 L A B = ∑ j' : Fin 3, ∑ k : Fin 3, B j' k • comp2 L A (single j' k 1) := by
  induction L with
  | nil => simp [comp2]
  | cons col rest ih =>
    obtain ⟨a, b, c⟩ := col
    simp only [comp2]
    rw [ih]
    simp only [smul_add, Finset.sum_add_distrib, ip_single]
    congr 1
    rw [FullTable.Bridge.ip_eq_sum (red b) B, Finset.mul_sum, Finset.sum_smul]
    refine Finset.sum_congr rfl fun j' _ => ?_
    rw [Finset.mul_sum, Finset.sum_smul]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [smul_smul]
    congr 1
    ring

theorem mul_lin (A B : Bit3x3Matrix) : A * B = ∑ j' : Fin 3, ∑ k : Fin 3, B j' k • (A * single j' k 1) := by
  conv_lhs => rw [Matrix.matrix_eq_sum_single B]
  rw [Matrix.mul_sum]
  refine Finset.sum_congr rfl fun j' _ => ?_
  rw [Matrix.mul_sum]
  refine Finset.sum_congr rfl fun k _ => ?_
  rw [show single j' k (B j' k) = B j' k • (single j' k 1 : Bit3x3Matrix) by
    rw [smul_single, smul_eq_mul, mul_one], Matrix.mul_smul]

theorem rank1sum_split (p : ℕ × ℕ × ℕ → Bool) (x y z : ℕ) :
    ∀ L : List (ℕ × ℕ × ℕ),
      rank1sum L x y z = (rank1sum (L.filter (fun t => !p t)) x y z ^^ rank1sum (L.filter p) x y z)
  | [] => rfl
  | t :: L => by
    have ih := rank1sum_split p x y z L
    cases hp : p t
    · rw [List.filter_cons_of_pos (by simp [hp]), List.filter_cons_of_neg (by simp [hp])]
      show (rank1 t.1 t.2.1 t.2.2 x y z ^^ rank1sum L x y z) =
        ((rank1 t.1 t.2.1 t.2.2 x y z ^^ rank1sum (L.filter (fun t => !p t)) x y z) ^^ rank1sum (L.filter p) x y z)
      rw [ih, Bool.xor_assoc]
    · rw [List.filter_cons_of_neg (by simp [hp]), List.filter_cons_of_pos (by simp [hp])]
      show (rank1 t.1 t.2.1 t.2.2 x y z ^^ rank1sum L x y z) =
        (rank1sum (L.filter (fun t => !p t)) x y z ^^ (rank1 t.1 t.2.1 t.2.2 x y z ^^ rank1sum (L.filter p) x y z))
      rw [ih]
      cases rank1 t.1 t.2.1 t.2.2 x y z <;> cases rank1sum (L.filter (fun t => !p t)) x y z <;>
        cases rank1sum (L.filter p) x y z <;> rfl

open FullTable.Bounds FullTable.Bridge in
theorem sum_bz_mask (m : ℕ) (A : Bit3x3Matrix) :
    ∑ i : Fin 3, ∑ j : Fin 3, bz (m.testBit (3 * i + j)) * A i j = ip (mask_matrix m) A := by
  rw [ip_eq_sum]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  simp only [mask_matrix, of_apply, bz]

open FullTable.Bounds FullTable.Bridge in
/-- the terms of `M` whose first factor annihilates `A` contribute nothing to the contraction with `A` -/
theorem sum_rank1sum_zero (A : Bit3x3Matrix) (y z : ℕ) :
    ∀ M : List (ℕ × ℕ × ℕ), (∀ t ∈ M, ip (mask_matrix t.1) A = 0) →
      ∑ i : Fin 3, ∑ j : Fin 3, bz (rank1sum M (3 * i + j) y z) * A i j = 0
  | [], _ => by simp [rank1sum, bz]
  | t :: M, hM => by
    have ih := sum_rank1sum_zero A y z M (fun t' ht' => hM t' (List.mem_cons_of_mem _ ht'))
    have ht := hM t List.mem_cons_self
    show ∑ i : Fin 3, ∑ j : Fin 3, bz (rank1 t.1 t.2.1 t.2.2 (3 * i + j) y z ^^ rank1sum M (3 * i + j) y z) * A i j = 0
    simp only [bz_xor, add_mul, Finset.sum_add_distrib, ih, add_zero]
    simp only [rank1, bz_and]
    have e : ∀ i j : Fin 3, bz (t.1.testBit (3 * ↑i + ↑j)) * bz (t.2.1.testBit y) * bz (t.2.2.testBit z) * A i j =
        (bz (t.1.testBit (3 * ↑i + ↑j)) * A i j) * (bz (t.2.1.testBit y) * bz (t.2.2.testBit z)) := by
      intro i j; ring
    simp only [e, ← Finset.sum_mul, sum_bz_mask, ht, zero_mul]

open FullTable.Bounds FullTable.Bridge in
/-- **`TableAtLeast` bounds the terms outside the killed set, on every rank-1 sum list equal to `matmulT`.** -/
theorem count_of_tableAtLeast {C : List Bit3x3Matrix} {N : ℕ} (h : TableAtLeast C N) (inS : ℕ → Bool)
    (hinS : ∀ x, inS x = true → ∀ A, Allowed C A → ip (mask_matrix x) A = 0)
    (L : List (ℕ × ℕ × ℕ)) (hL : ∀ t ∈ L, t.1 < 512 ∧ t.2.1 < 512 ∧ t.2.2 < 512) (hsum : rank1sum L = matmulT) :
    N ≤ (L.filter (fun t => !inS t.1)).length := by
  let col : ℕ × ℕ × ℕ → Integer3x3Matrix × Integer3x3Matrix × Integer3x3Matrix :=
    fun t => (lift (mask_matrix t.1), lift (mask_matrix t.2.1), lift (mask_matrix t.2.2)ᵀ)
  let Lf := L.filter (fun t => !inS t.1)
  let Li := L.filter (fun t => inS t.1)
  have hLf : ∀ t ∈ Lf, t.1 < 512 ∧ t.2.1 < 512 ∧ t.2.2 < 512 := fun t ht => hL t (List.mem_of_mem_filter ht)
  have hterm : (Lf.map col).map term = Lf := by
    rw [List.map_map]
    conv_rhs => rw [← List.map_id Lf]
    apply List.map_congr_left
    intro t ht
    obtain ⟨h1, h2, h3⟩ := hLf t ht
    simp only [Function.comp, col, term, red_lift, transpose_transpose, enc_mask h1, enc_mask h2, enc_mask h3, id]
  have hvalid : IsValidTableDecomposition C (Lf.map col) := by
    rw [valid_iff]
    intro A B hA
    rw [comp2_lin, mul_lin]
    refine Finset.sum_congr rfl fun j' _ => Finset.sum_congr rfl fun k _ => congrArg _ ?_
    ext p q
    rw [← sum_rank1sum, hterm, ← sum_matmulT]
    have hsplit : ∀ x y z, rank1sum Lf x y z = (matmulT x y z ^^ rank1sum Li x y z) := by
      intro x y z
      rw [← hsum, rank1sum_split (fun t => inS t.1) x y z L]
      cases rank1sum Lf x y z <;> cases rank1sum Li x y z <;> rfl
    simp only [hsplit, bz_xor, add_mul, Finset.sum_add_distrib]
    have hi : ∀ t ∈ Li, inS t.1 = true := fun t ht => (List.mem_filter.mp ht).2
    rw [sum_rank1sum_zero A _ _ Li (fun t ht => hinS t.1 (hi t ht) A hA), add_zero]
  have := h _ hvalid
  rwa [List.length_map] at this

/-! ## 3. `TableAtLeast` for a row list → `RT.Fact` -/

/-- the point mask of `span rows` (by doubling, as `RT.spanM`) -/
def spanL : List ℕ → ℕ
  | [] => 1
  | r :: rs => spanL rs ||| TransBits.trans (spanL rs) r

theorem spanL_ind (Pr : ℕ → Prop) (h0 : Pr 0) (hxor : ∀ x y, x < 512 → y < 512 → Pr x → Pr y → Pr (x ^^^ y)) :
    ∀ rows : List ℕ, (∀ r ∈ rows, r < 512 ∧ Pr r) → ∀ w < 512, (spanL rows).testBit w = true → Pr w
  | [], _, w, _, h => by
    have hw0 : w = 0 := by
      by_contra hne
      rw [spanL, Nat.testBit_one_eq_true_iff_self_eq_zero] at h; exact hne h
    rw [hw0]; exact h0
  | r :: rs, hr, w, hw, h => by
    have ih := spanL_ind Pr h0 hxor rs (fun r' hr' => hr r' (List.mem_cons_of_mem _ hr'))
    obtain ⟨hr1, hr2⟩ := hr r List.mem_cons_self
    rw [spanL, Nat.testBit_or, Bool.or_eq_true, TransBits.trans_testBit _ _ _ hr1 hw] at h
    rcases h with h1 | h2
    · exact ih w hw h1
    · have hx : w ^^^ r < 512 := TransBits.xor_lt _ _ hw hr1
      have := hxor _ _ hx hr1 (ih _ hx h2) hr2
      rwa [Nat.xor_assoc, Nat.xor_self, Nat.xor_zero] at this

theorem mask_matrix_xor (x y : ℕ) : mask_matrix (x ^^^ y) = mask_matrix x + mask_matrix y := by
  ext i j
  simp only [mask_matrix, of_apply, Matrix.add_apply, Nat.testBit_xor]
  cases x.testBit (3 * ↑i + ↑j) <;> cases y.testBit (3 * ↑i + ↑j) <;> decide

theorem mask_matrix_zero : mask_matrix 0 = 0 := by
  ext i j; simp [mask_matrix]

open FullTable.Bounds in
/-- points of `span rows` annihilate every `A` allowed by `rows.map mask_matrix` -/
theorem ip_span (rows : List ℕ) (hrows : ∀ r ∈ rows, r < 512) (w : ℕ) (hw : w < 512)
    (h : (spanL rows).testBit w = true) (A : Bit3x3Matrix) (hA : Allowed (rows.map mask_matrix) A) :
    ip (mask_matrix w) A = 0 := by
  have h0 : ip (mask_matrix 0) A = 0 := by rw [mask_matrix_zero]; exact ip_zero_left A
  have hx : ∀ x y, x < 512 → y < 512 → ip (mask_matrix x) A = 0 → ip (mask_matrix y) A = 0 →
      ip (mask_matrix (x ^^^ y)) A = 0 := by
    intro x y _ _ hx hy; rw [mask_matrix_xor, ip_add_left, hx, hy, add_zero]
  exact spanL_ind (fun x => ip (mask_matrix x) A = 0) h0 hx rows
    (fun r hr => ⟨hrows r hr, hA _ (List.mem_map_of_mem hr)⟩) w hw h

theorem length_filter_ofFn {α : Type*} : ∀ {n : ℕ} (f : Fin n → α) (p : α → Bool),
    ((List.ofFn f).filter p).length = (Finset.univ.filter (fun s => p (f s) = true)).card
  | 0, f, p => by simp
  | n + 1, f, p => by
    rw [List.ofFn_succ, List.filter_cons, Finset.card_filter, Fin.sum_univ_succ, ← Finset.card_filter,
      ← length_filter_ofFn (fun i => f i.succ) p]
    cases h : p (f 0) <;> simp [Nat.add_comm]

/-- **RR's bound for a row list gives `RT.Fact` for every point mask inside the rows' span.** -/
theorem fact_of_tableAtLeast (rows : List ℕ) (hrows : ∀ r ∈ rows, r < 512) (m : ℕ)
    (hsub : ∀ w < 512, m.testBit w = true → (spanL rows).testBit w = true)
    {N : ℕ} (h : TableAtLeast (rows.map mask_matrix) N) : RT.Fact m N := by
  intro n av b c hav hd
  have hd' : IsDecomp (fun s => toM3 (av s)) (fun s => toM3 (encM (b s))) (fun s => toM3 (encM (c s))) := by
    simpa only [toM3_encM] using hd
  have hsum := rank1sum_of_isDecomp av (fun s => encM (b s)) (fun s => encM (c s)) hav (fun s => encM_lt _)
    (fun s => encM_lt _) hd'
  have hL : ∀ t ∈ (List.ofFn fun s => (av s, encM (b s), encM (c s))), t.1 < 512 ∧ t.2.1 < 512 ∧ t.2.2 < 512 := by
    intro t ht
    obtain ⟨s, rfl⟩ := List.mem_ofFn.mp ht
    exact ⟨hav s, encM_lt _, encM_lt _⟩
  have hc := count_of_tableAtLeast h (fun x => decide (x < 512) && m.testBit x)
    (fun x hx A hA => by
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hx
      exact ip_span rows hrows x hx.1 (hsub x hx.1 hx.2) A hA) _ hL hsum
  rw [length_filter_ofFn] at hc
  refine le_trans hc (le_of_eq (congrArg Finset.card (Finset.filter_congr fun s _ => ?_)))
  simp only [hav s, decide_true, Bool.true_and, Bool.not_eq_true']

/-! ## 4. The subspace check, as one `Nat` operation -/

/-- `m ⊆ span rows` (below 512): `m &&& ¬ spanL rows` has no bit below 512 -/
def subSpan (m : ℕ) (rows : List ℕ) : Bool := Nat.land (Nat.land m (Nat.xor BC4.M512 (spanL rows))) BC4.M512 == 0

theorem subSpan_spec {m : ℕ} {rows : List ℕ} (h : subSpan m rows = true) :
    ∀ w < 512, m.testBit w = true → (spanL rows).testBit w = true := by
  intro w hw hm
  have h0 : Nat.land (Nat.land m (Nat.xor BC4.M512 (spanL rows))) BC4.M512 = 0 := by
    simpa only [subSpan, beq_iff_eq] using h
  have hb := congrArg (fun x => Nat.testBit x w) h0
  simp only [Nat.zero_testBit] at hb
  have hM : BC4.M512.testBit w = true := by rw [RT.m512_bit]; simp [hw]
  change ((m &&& (BC4.M512 ^^^ spanL rows)) &&& BC4.M512).testBit w = false at hb
  rw [Nat.testBit_and, Nat.testBit_and, Nat.testBit_xor, hM, hm] at hb
  cases e : (spanL rows).testBit w
  · rw [e] at hb; exact absurd hb (by decide)
  · rfl

end HC
