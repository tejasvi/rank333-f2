module
public import R22Port.U_d41d8cd98f00
public import L5.Batch5O
public import RT.K3eD_Final
public import RT.K3eD_Lab
public import L5.RTClosOmega
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # `TableSpec` and `BindQSpec`: the per-job row table and the static exclusion tables

* `rowOK_K3eDL`: RT's stored label mask and cap of a kept row is a valid row (`R3RT.SpecO.RowOK O Ω`), from `RT.K3eD.row_valid`.
* `rowE_ok`: every value of the guarded `R3RT.rowE3eD` is a valid row with cap `< 32` (0 past the table).
* `table_spec`: a table that passes `tabOKQ` has valid rows (`R3RT.SpecO.TabOK O Ω`).
* `bindQ_spec`: a stored cap-2 (cap-1) table that passes `bindQ` satisfies `R3RT.SpecO.C2OK O Ω` (`R3RT.SpecO.Conf1OK O Ω`). -/
noncomputable section
namespace L5W
open E1S Finset R3RT.Spec RootSound BC4 BC5 Classical L5 L5O
variable {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop}

/-! ## RT's rows -/

/-- the capacity table in the distinct-factor form (`RT.K3eD.row_valid`'s hypothesis; R3's `ClassFacts` since revision 4) -/
def ClassFactsN : Prop := ∀ c, c < 496 → _root_.RT.FactN 22 (_root_.RT.kM _root_.RT.K3eD_Cls.CL c) (_root_.RT.cLB _root_.RT.K3eD_Cls.CL c)

theorem classFactsN_of (h : ClassFacts) : ClassFactsN := h

theorem rowOK_zero : R3RT.SpecO.RowOK O Ω 0 0 := by
  intro A; simp [R3RT.SpecO.inMask]

/-- an order whose labels are prof7's `--rord 123` labels (RT's `vecL`) -/
def Is123 (O : R3RT.SpecO.LabelOrder) : Prop := ∀ l, l < 511 → O.vec l = _root_.RT.vecL l

/-- the table classes' facts over the universe -/
def HclsΩ (Ω : Dec22 → Prop) : Prop :=
  ∀ c, c < 496 → ∀ A, Ω A → RT.Om.FactD (_root_.RT.kM _root_.RT.K3eD_Cls.CL c) (_root_.RT.cLB _root_.RT.K3eD_Cls.CL c) A

theorem rowOK_K3eDL (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (hcls : HclsΩ Ω) (i : ℕ) (hi : i < 3781613) :
    R3RT.SpecO.RowOK O Ω (RT.K3eDL.entry i % 2 ^ 511) ((RT.K3eDL.entry i >>> 511) % 512) := by
  have hN : _root_.RT.K3eD.N = 3781613 := by decide +kernel
  rw [_root_.RT.K3eDL.capL_spec i hi]
  have hcap : RT.eCap (RT.K3eD.entry i) < 512 := lt_trans (Nat.mod_lt _ (by norm_num)) (by norm_num)
  rw [Nat.mod_eq_of_lt hcap]
  intro A hA
  have hf : 22 - RT.eCap (RT.K3eD.entry i) ≤
      (Finset.univ.filter (fun s => (RT.dualM (RT.K3eD.entry i)).testBit (A.av s) = false)).card :=
    RT.Om.row_factΩ Ω hΩ hcls i (by rw [hN]; exact hi) A hA
  have hsplit := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset (Fin 22)))
    (p := fun s => (RT.dualM (RT.K3eD.entry i)).testBit (A.av s) = true)
  simp only [Finset.card_univ, Fintype.card_fin, Bool.not_eq_true] at hsplit
  have hPc : (Finset.univ.filter (fun s : Fin 22 => (RT.dualM (RT.K3eD.entry i)).testBit (A.av s) = true)).card ≤
      RT.eCap (RT.K3eD.entry i) := by
    omega
  refine le_trans ?_ hPc
  apply Finset.card_le_card_of_injOn (fun l => if h : R3RT.SpecO.Has O A l then Classical.choose h.2 else 0)
  · intro l hl
    beta_reduce
    simp only [R3RT.SpecO.inMask, Finset.coe_filter, mem_filter, mem_range] at hl
    obtain ⟨hl1, hbit, hH⟩ := hl
    rw [dif_pos hH]
    have hs := Classical.choose_spec hH.2
    simp only [Finset.coe_filter, Finset.mem_coe, mem_filter, Finset.mem_univ, true_and, Set.mem_setOf_eq]
    rw [hs, hO l hl1, ← _root_.RT.K3eDL.labMask_spec i hi l hl1]
    rw [Nat.testBit_mod_two_pow] at hbit; simpa [hl1] using hbit
  · intro l hl l' hl' heq
    simp only [R3RT.SpecO.inMask, Finset.coe_filter, Finset.mem_coe, mem_filter, mem_range] at hl hl'
    beta_reduce at heq
    simp only [dif_pos hl.2.2, dif_pos hl'.2.2] at heq
    have h1 := Classical.choose_spec hl.2.2.2
    have h2 := Classical.choose_spec hl'.2.2.2
    rw [heq] at h1
    exact O.vec_inj l l' hl.1 hl'.1 (h1.symm.trans h2)

theorem rowE3eD_eq (i : ℕ) : R3RT.rowE3eD i = if i < 3781613 then RT.K3eDL.entry i else 0 := by
  unfold R3RT.rowE3eD
  cases h : Nat.blt i 3781613
  · rw [if_neg (fun h' => by rw [Nat.blt_eq.mpr h'] at h; exact absurd h (by decide))]
  · rw [if_pos (Nat.blt_eq.mp h)]

theorem K3eDL_cap (i : ℕ) (hi : i < 3781613) : RT.K3eDL.entry i >>> 511 < 32 := by
  rw [_root_.RT.K3eDL.capL_spec i hi]; exact Nat.mod_lt _ (by norm_num)

/-- every value of the guarded row lookup is a valid row (mask = bits `< 511`, cap = bits `511..519`), cap `< 32` -/
theorem rowE_ok (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (hcls : HclsΩ Ω) (i : ℕ) :
    (R3RT.rowE3eD i >>> 511) % 512 < 32 ∧ R3RT.SpecO.RowOK O Ω (R3RT.rowE3eD i % 2 ^ 511) ((R3RT.rowE3eD i >>> 511) % 512) := by
  rw [rowE3eD_eq]
  split
  · rename_i hi
    exact ⟨lt_of_le_of_lt (Nat.mod_le _ _) (K3eDL_cap i hi), rowOK_K3eDL hO hΩ hcls i hi⟩
  · simp only [Nat.zero_shiftRight, Nat.zero_mod]; exact ⟨by norm_num, rowOK_zero⟩

theorem rowE_lt (i : ℕ) : R3RT.rowE3eD i < 2 ^ 516 := by
  rw [rowE3eD_eq]
  split
  · rename_i hi
    have hc := K3eDL_cap i hi
    have : RT.K3eDL.entry i = RT.K3eDL.entry i % 2 ^ 511 + (RT.K3eDL.entry i >>> 511) * 2 ^ 511 := by
      rw [Nat.shiftRight_eq_div_pow]; exact (Nat.mod_add_div' _ _).symm
    rw [this]
    have h1 := Nat.mod_lt (RT.K3eDL.entry i) (show 0 < 2 ^ 511 by positivity)
    calc _ < 2 ^ 511 + (RT.K3eDL.entry i >>> 511) * 2 ^ 511 := by omega
      _ = ((RT.K3eDL.entry i >>> 511) + 1) * 2 ^ 511 := by ring
      _ ≤ 32 * 2 ^ 511 := Nat.mul_le_mul_right _ (by omega)
      _ = 2 ^ 516 := by norm_num
  · positivity

/-! ## The per-job table -/

theorem rec_all (f : ℕ → Bool) : ∀ n, Nat.rec (motive := fun _ => Bool) true (fun j b => b && f j) n = true →
    ∀ j < n, f j = true := by
  intro n
  induction n with
  | zero => intro _ j hj; omega
  | succ n ih =>
    intro h j hj
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun j b => b && f j) n && f n) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hj with hlt | rfl
    · exact ih h'.1 j hlt
    · exact h'.2

theorem tabOKQ_spec (rowE chunk : ℕ → ℕ) (CH N nch : ℕ) (h : R3RT.tabOKQ rowE chunk CH N nch = true) :
    ∀ q < nch, ∀ j < CH, Nat.ble N (Nat.add (Nat.mul CH q) j) = true ∨
      Nat.beq (rowE (Nat.shiftRight (Nat.land (Nat.shiftRight (chunk q) (Nat.mul 552 j)) R3RT.M552Q) 520))
        (Nat.land (Nat.land (Nat.shiftRight (chunk q) (Nat.mul 552 j)) R3RT.M552Q) R3RT.M520) = true := by
  intro q hq j hj
  have h1 := rec_all _ nch h q hq
  have h2 := rec_all _ CH h1 j hj
  simpa only [Bool.or_eq_true] using h2

/-- **The per-job table check**, capacity table in the distinct-factor form. -/
theorem table_specN (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (hcls : HclsΩ Ω) (chunk entry : ℕ → ℕ) (N nch : ℕ)
    (hent : ∀ i, entry i = (chunk (i / 64) >>> (552 * (i % 64))) % 2 ^ 552) (hch : ∀ q, nch ≤ q → chunk q = 0)
    (hN : ∀ i, N ≤ i → entry i = 0) (hok : R3RT.tabOKQ R3RT.rowE3eD chunk 64 N nch = true) :
    R3RT.SpecO.TabOK O Ω entry := by
  have hM552 : R3RT.M552Q = 2 ^ 552 - 1 := by decide +kernel
  have hM520 : R3RT.M520 = 2 ^ 520 - 1 := by decide +kernel
  have hspec := tabOKQ_spec _ _ _ _ _ hok
  intro i
  have hz : entry i = 0 → (entry i >>> 511) % 512 < 256 ∧ R3RT.SpecO.RowOK O Ω (entry i % 2 ^ 511) ((entry i >>> 511) % 512) := by
    intro h0; rw [h0]; simp only [Nat.zero_shiftRight, Nat.zero_mod]; exact ⟨by norm_num, rowOK_zero⟩
  by_cases hiN : N ≤ i
  · exact hz (hN i hiN)
  by_cases hq : nch ≤ i / 64
  · apply hz; rw [hent i, hch _ hq]; simp
  have hi64 : i = 64 * (i / 64) + i % 64 := (Nat.div_add_mod i 64).symm
  have h1 := hspec (i / 64) (by omega) (i % 64) (Nat.mod_lt _ (by norm_num))
  rcases h1 with h1 | h1
  · exfalso; rw [Nat.ble_eq, nadd_eq, nmul_eq] at h1; omega
  · have ht : Nat.land (Nat.shiftRight (chunk (i / 64)) (Nat.mul 552 (i % 64))) R3RT.M552Q = entry i := by
      rw [hent i, land_eq, shr_eq, nmul_eq, hM552, Nat.and_two_pow_sub_one_eq_mod]
    rw [ht, Nat.beq_eq, land_eq, shr_eq, hM520, Nat.and_two_pow_sub_one_eq_mod] at h1
    obtain ⟨hcap, hrow⟩ := rowE_ok hO hΩ hcls (entry i >>> 520)
    rw [h1] at hcap hrow
    have e1 : entry i % 2 ^ 520 % 2 ^ 511 = entry i % 2 ^ 511 := by
      rw [show (2 : ℕ) ^ 520 = 2 ^ 511 * 2 ^ 9 by norm_num, Nat.mod_mul_right_mod]
    have e2 : ((entry i % 2 ^ 520) >>> 511) % 512 = (entry i >>> 511) % 512 := by
      apply Nat.eq_of_testBit_eq; intro j
      rw [show (512 : ℕ) = 2 ^ 9 by norm_num, Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight,
        Nat.testBit_shiftRight, Nat.testBit_mod_two_pow]
      by_cases hj : j < 9
      · simp [hj, show 511 + j < 520 by omega]
      · simp [hj]
    rw [e1, e2] at hrow; rw [e2] at hcap
    exact ⟨by omega, hrow⟩

/-! ## The static exclusion tables -/

theorem ptsMask_testBit (L : List ℕ) (l : ℕ) : (R3RT.ptsMask L).testBit l = true ↔ l ∈ L := by
  induction L with
  | nil => simp [R3RT.ptsMask]
  | cons a L ih =>
    show (Nat.lor (Nat.shiftLeft 1 a) (R3RT.ptsMask L)).testBit l = true ↔ l ∈ a :: L
    rw [lor_eq, shl_eq, Nat.testBit_or, Bool.or_eq_true, ih, Nat.shiftLeft_eq, Nat.one_mul, Nat.testBit_two_pow,
      decide_eq_true_eq, List.mem_cons]
    exact ⟨fun h => h.elim (fun h => Or.inl h.symm) Or.inr, fun h => h.elim (fun h => Or.inl h.symm) Or.inr⟩

theorem slotsOr_testBit (m q : ℕ) : ∀ (us : List ℕ) (T p : ℕ), (R3RT.slotsOr m q us T).testBit p = true →
    T.testBit p = true ∨ ∃ u ∈ us, u ≠ q ∧ (m <<< (512 * u)).testBit p = true := by
  intro us
  induction us with
  | nil => intro T p h; exact Or.inl h
  | cons u us ih =>
    intro T p h
    have h' : (R3RT.slotsOr m q us (Bool.rec (Nat.lor T (Nat.shiftLeft m (Nat.mul 512 u))) T (Nat.beq u q))).testBit p = true := h
    rcases ih _ p h' with h2 | ⟨u', hu', hq', hb⟩
    · cases hb : Nat.beq u q
      · rw [hb] at h2
        simp only [lor_eq, shl_eq, nmul_eq, Nat.testBit_or, Bool.or_eq_true] at h2
        rcases h2 with h2 | h2
        · exact Or.inl h2
        · refine Or.inr ⟨u, by simp, fun he => ?_, h2⟩
          rw [he] at hb; simp at hb
      · rw [hb] at h2; exact Or.inl h2
    · exact Or.inr ⟨u', by simp [hu'], hq', hb⟩

theorem rowsFold_sem (rowE : ℕ → ℕ) (q cap : ℕ) (k : ℕ → Bool) : ∀ (rows : List (ℕ × List ℕ)) (T : ℕ),
    R3RT.rowsFold rowE q cap rows T k = true →
    ∃ Tf, k Tf = true ∧
      (∀ r ∈ rows, R3RT.ptsMask r.2 >>> 511 = 0 ∧ rowE r.1 = R3RT.ptsMask r.2 ||| (cap <<< 511) ∧
        (q = 511 ∨ (R3RT.ptsMask r.2).testBit q = true)) ∧
      (∀ p, Tf.testBit p = true → T.testBit p = true ∨
        ∃ r ∈ rows, ∃ u ∈ r.2, u ≠ q ∧ (R3RT.ptsMask r.2 <<< (512 * u)).testBit p = true) := by
  intro rows
  induction rows with
  | nil => intro T h; exact ⟨T, h, fun r hr => absurd hr (by simp), fun p hp => Or.inl hp⟩
  | cons r rows ih =>
    intro T h
    have h' : (Nat.beq (Nat.shiftRight (R3RT.ptsMask r.2) 511) 0 &&
        Nat.beq (rowE r.1) (Nat.lor (R3RT.ptsMask r.2) (Nat.shiftLeft cap 511)) &&
        (Nat.beq q 511 || Nat.beq (Nat.land (Nat.shiftRight (R3RT.ptsMask r.2) q) 1) 1) &&
        R3RT.rowsFold rowE q cap rows (R3RT.slotsOr (R3RT.ptsMask r.2) q r.2 T) k) = true := h
    simp only [Bool.and_eq_true, Bool.or_eq_true, Nat.beq_eq] at h'
    obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := h'
    obtain ⟨Tf, hk, hrows, hbits⟩ := ih _ h4
    refine ⟨Tf, hk, fun r' hr' => ?_, fun p hp => ?_⟩
    · rw [List.mem_cons] at hr'
      rcases hr' with rfl | hr'
      · refine ⟨by rw [shr_eq] at h1; exact h1, by rw [lor_eq, shl_eq] at h2; exact h2, ?_⟩
        rcases h3 with h3 | h3
        · exact Or.inl h3
        · right; rw [bit_test] at h3; cases hb : (R3RT.ptsMask r'.2).testBit q <;> simp_all
      · exact hrows r' hr'
    · rcases hbits p hp with h5 | ⟨r', hr', u, hu, hq', hb⟩
      · rcases slotsOr_testBit _ _ _ _ _ h5 with h6 | ⟨u, hu, hq', hb⟩
        · exact Or.inl h6
        · exact Or.inr ⟨r, by simp, u, hu, hq', hb⟩
      · exact Or.inr ⟨r', by simp [hr'], u, hu, hq', hb⟩

/-- a bit of a slot-shifted mask `m < 2^511`: slot `u` only -/
theorem slot_bit (m u v w : ℕ) (hm : m < 2 ^ 511) (hw : w < 511) (h : (m <<< (512 * u)).testBit (512 * v + w) = true) :
    u = v ∧ m.testBit w = true := by
  rw [Nat.testBit_shiftLeft, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨h1, h2⟩ := h
  have huv : u ≤ v := by
    by_contra hc
    have : 512 * v + w < 512 * u := by nlinarith
    omega
  by_cases he : u = v
  · subst he; refine ⟨rfl, ?_⟩; rw [show 512 * u + w - 512 * u = w by omega] at h2; exact h2
  · exfalso
    have hlt : u < v := lt_of_le_of_ne huv he
    have : 511 ≤ 512 * v + w - 512 * u := by
      have : 512 * u + 512 ≤ 512 * v := by nlinarith
      omega
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) this))] at h2
    exact absurd h2 (by decide)

theorem row_of_bind (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (hcls : HclsΩ Ω) (cap : ℕ) (hcap : cap < 32) (id : ℕ) (m : ℕ) (hm : m >>> 511 = 0)
    (hrow : R3RT.rowE3eD id = m ||| (cap <<< 511)) (hc0 : 0 < cap) : R3RT.SpecO.RowOK O Ω m cap := by
  have hm' : m < 2 ^ 511 := by
    rw [Nat.shiftRight_eq_div_pow] at hm
    by_contra hc
    have := Nat.div_pos (by omega : 2 ^ 511 ≤ m) (by positivity : 0 < 2 ^ 511)
    omega
  have hsum : m ||| (cap <<< 511) = cap * 2 ^ 511 + m := by
    rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hm', Nat.shiftLeft_eq]
  obtain ⟨_, hR⟩ := rowE_ok hO hΩ hcls id
  rw [hrow, hsum] at hR
  have e1 : (cap * 2 ^ 511 + m) % 2 ^ 511 = m := by rw [Nat.add_comm, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hm']
  have e2 : ((cap * 2 ^ 511 + m) >>> 511) % 512 = cap := by
    rw [Nat.shiftRight_eq_div_pow, Nat.add_comm, Nat.add_mul_div_right _ _ (by positivity), Nat.div_eq_of_lt hm',
      Nat.zero_add, Nat.mod_eq_of_lt (by omega)]
  rw [e1, e2] at hR
  exact hR

/-- **The static-table binding**, capacity table in the distinct-factor form. -/
theorem bindQ_specN (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (hcls : HclsΩ Ω) (q : ℕ) (rows : List (ℕ × List ℕ)) (stored DC : ℕ) :
    (q < 511 → R3RT.bindQ R3RT.rowE3eD q 2 rows stored DC = true → R3RT.SpecO.C2OK O Ω q stored) ∧
    (R3RT.bindQ R3RT.rowE3eD 511 1 rows stored DC = true → R3RT.SpecO.Conf1OK O Ω stored) := by
  have core : ∀ (q' cap : ℕ), 0 < cap → cap < 32 → R3RT.bindQ R3RT.rowE3eD q' cap rows stored DC = true →
      ∀ v w, v < 511 → w < 511 → (stored >>> (512 * v)).testBit w = true →
        ∃ r ∈ rows, v ∈ r.2 ∧ v ≠ q' ∧ R3RT.SpecO.RowOK O Ω (R3RT.ptsMask r.2) cap ∧ (R3RT.ptsMask r.2).testBit w = true ∧
          (q' = 511 ∨ (R3RT.ptsMask r.2).testBit q' = true) := by
    intro q' cap hc0 hc32 hb v w hv hw hbit
    unfold R3RT.bindQ at hb
    obtain ⟨Tf, hk, hrows, hbits⟩ := rowsFold_sem _ _ _ _ rows 0 hb
    rw [Nat.beq_eq, land_eq] at hk
    rw [Nat.testBit_shiftRight, ← hk, Nat.testBit_and, Bool.and_eq_true] at hbit
    rcases hbits _ hbit.1 with h0 | ⟨r, hr, u, hu, huq, hb'⟩
    · simp at h0
    · obtain ⟨hm, hrowE, hq⟩ := hrows r hr
      have hm' : R3RT.ptsMask r.2 < 2 ^ 511 := by
        rw [Nat.shiftRight_eq_div_pow] at hm
        by_contra hc
        have := Nat.div_pos (by omega : 2 ^ 511 ≤ R3RT.ptsMask r.2) (by positivity : 0 < 2 ^ 511)
        omega
      obtain ⟨rfl, hwb⟩ := slot_bit _ _ _ _ hm' hw hb'
      exact ⟨r, hr, hu, huq, row_of_bind hO hΩ hcls cap hc32 r.1 _ hm hrowE hc0, hwb, hq⟩
  constructor
  · intro hq hb v w hv hw hwq hwv hbit
    obtain ⟨r, _, hvr, hvq, hR, hwb, hqb⟩ := core q 2 (by norm_num) (by norm_num) hb v w hv hw hbit
    refine ⟨R3RT.ptsMask r.2, hR, ?_, (ptsMask_testBit _ _).mpr hvr, hwb⟩
    rcases hqb with h | h
    · omega
    · exact h
  · intro hb v w hv hw hwv hbit
    obtain ⟨r, _, hvr, _, hR, hwb, _⟩ := core 511 1 (by norm_num) (by norm_num) hb v w hv hw hbit
    exact ⟨R3RT.ptsMask r.2, hR, (ptsMask_testBit _ _).mpr hvr, hwb⟩

/-- **`TableSpec` over a universe** (rank-invariant `Ω`, class bounds `lb ≥ cLB`), the `--rord 123` row interface -/
theorem table_spec (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (lb : ℕ → ℕ)
    (hlb : ∀ c, c < 496 → _root_.RT.cLB _root_.RT.K3eD_Cls.CL c ≤ lb c) : R3RT.SpecO.TableSpec O Ω R3RT.rowE3eD lb :=
  fun chunk entry N nch hent hch hN hcls hok =>
    table_specN hO hΩ (RT.Om.hcls_of_classFactsC Ω lb hlb hcls) chunk entry N nch hent hch hN hok

/-- **`BindQSpec` over a universe**, the `--rord 123` row interface -/
theorem bindQ_spec (hO : Is123 O) (hΩ : RT.Om.RankInv Ω) (lb : ℕ → ℕ)
    (hlb : ∀ c, c < 496 → _root_.RT.cLB _root_.RT.K3eD_Cls.CL c ≤ lb c) : R3RT.SpecO.BindQSpec O Ω R3RT.rowE3eD lb :=
  fun q rows stored DC hcls => bindQ_specN hO hΩ (RT.Om.hcls_of_classFactsC Ω lb hlb hcls) q rows stored DC

end L5W
