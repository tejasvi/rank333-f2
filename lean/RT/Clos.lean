module
public import R22Port.U_d41d8cd98f00
public import RT.SoundN
/-! # Closure classes: kept-row caps from the caps of a row's subspaces (distinct points)

The kept-row closure (`clos`) bounds a subspace `K` (dim `d ≤ 4`, basis `kb`) by the caps of its proper subspaces: if every set
of `k + 1` points of `K \ 0` overfills some listed subspace `W` (`|X ∩ W| > cap W`), then a decomposition with distinct nonzero
first factors has at most `k` terms in `K`.  Points of `K` are indexed by `j < 2^d` (`ptK kb d j` = XOR of the basis vectors
selected by `j`); subsets of `K \ 0` are masks over `j`.  `clos_sound`: the kernel check `closOK` plus `FactN` for every listed
`W` gives `FactN R m (R - k)` for any point mask `m` contained in the span of `kb`. -/
@[expose] public section
namespace RT
open BC4 BC5 RootSound Matrix

/-- point `j` of `K`: XOR of the basis vectors (9-bit fields of `kb`) selected by the bits of `j` -/
def ptK (kb : Nat) : Nat → Nat → Nat
  | 0, _ => 0
  | d + 1, j => ptK kb d j ^^^ (if j.testBit d then (kb >>> (9 * d)) % 512 else 0)

/-- the index mask of the point mask `m` on `K` (bits `0 .. 2^d - 1`) -/
def idxM (kb d m : Nat) : Nat := Nat.rec (motive := fun _ => Nat) 0
  (fun j acc => if m.testBit (ptK kb d j) then acc ||| (1 <<< j) else acc) (2 ^ d)

def pc16 (x : Nat) : Nat := ((List.range 16).filter (fun i => x.testBit i)).length

/-- every `X ⊆ [1, 2^d)` with `k + 1` elements overfills some `(cap, index mask)` of `ws` -/
def bruteOK (d k : Nat) (ws : List (Nat × Nat)) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun X b => b && (X % 2 == 1 || pc16 X != k + 1 || ws.any (fun w => Nat.blt w.1 (pc16 (X &&& w.2))))) (2 ^ (2 ^ d))

/-- the closure check for the span of `kb` (dim `d ≤ 4`) and bound `k`, with the subspace entries `ws` -/
def closOK (kb d k : Nat) (ws : List Nat) : Bool :=
  Nat.ble d 4 && (List.range (2 ^ d)).all (fun j => j == 0 || ptK kb d j != 0) &&
    bruteOK d k (ws.map (fun w => (eCap w, idxM kb d (dualM w))))

/-! ## Lemmas -/

theorem ptK_lt (kb : Nat) : ∀ d j, ptK kb d j < 512
  | 0, _ => by simp [ptK]
  | d + 1, j => by
    unfold ptK
    refine RootSound.TransBits.xor_lt _ _ (ptK_lt kb d j) ?_
    split
    · exact Nat.mod_lt _ (by norm_num)
    · norm_num

theorem ptK_xor (kb : Nat) : ∀ d j j', ptK kb d (j ^^^ j') = ptK kb d j ^^^ ptK kb d j'
  | 0, _, _ => by simp [ptK]
  | d + 1, j, j' => by
    unfold ptK
    rw [ptK_xor kb d j j', Nat.testBit_xor]
    cases j.testBit d <;> cases j'.testBit d <;> simp [Nat.xor_assoc, Nat.xor_comm, Nat.xor_left_comm]

theorem ptK_zero (kb d : Nat) : ptK kb d 0 = 0 := by
  induction d with
  | zero => rfl
  | succ d ih => unfold ptK; rw [ih]; simp

theorem idxM_testBit (kb d m j : Nat) (hj : j < 2 ^ d) : (idxM kb d m).testBit j = m.testBit (ptK kb d j) := by
  unfold idxM
  have key : ∀ n, (Nat.rec (motive := fun _ => Nat) 0
      (fun j acc => if m.testBit (ptK kb d j) then acc ||| (1 <<< j) else acc) n).testBit j =
      (decide (j < n) && m.testBit (ptK kb d j)) := by
    intro n
    induction n with
    | zero => simp
    | succ n ih =>
      show (if m.testBit (ptK kb d n) then (Nat.rec (motive := fun _ => Nat) 0
          (fun j acc => if m.testBit (ptK kb d j) then acc ||| (1 <<< j) else acc) n) ||| (1 <<< n) else
          (Nat.rec (motive := fun _ => Nat) 0
          (fun j acc => if m.testBit (ptK kb d j) then acc ||| (1 <<< j) else acc) n)).testBit j = _
      split
      · rename_i hm
        rw [Nat.testBit_or, ih, Nat.one_shiftLeft, Nat.testBit_two_pow]
        by_cases hjn : j = n
        · subst hjn; simp [hm]
        · have : n ≠ j := fun h => hjn h.symm
          simp only [this, decide_false, Bool.or_false]
          rcases Nat.lt_or_ge j n with h | h
          · simp [h, Nat.lt_succ_of_lt h]
          · have : ¬ j < n + 1 := by omega
            simp [this, show ¬ j < n by omega]
      · rename_i hm
        rw [ih]
        by_cases hjn : j = n
        · subst hjn; simp [hm]
        · rcases Nat.lt_or_ge j n with h | h
          · simp [h, Nat.lt_succ_of_lt h]
          · simp [show ¬ j < n + 1 by omega, show ¬ j < n by omega]
  rw [key]; simp [hj]

theorem pc16_eq (x : Nat) : pc16 x = ((Finset.range 16).filter (fun i => x.testBit i = true)).card := by
  unfold pc16
  rw [← List.toFinset_range, ← List.toFinset_filter, List.toFinset_card_of_nodup (List.Nodup.filter _ List.nodup_range)]

theorem bruteOK_spec (d k : Nat) (ws : List (Nat × Nat)) (h : bruteOK d k ws = true) :
    ∀ X < 2 ^ (2 ^ d), X % 2 = 0 → pc16 X = k + 1 → ∃ w ∈ ws, w.1 < pc16 (X &&& w.2) := by
  unfold bruteOK at h
  revert h
  generalize 2 ^ (2 ^ d) = n
  induction n with
  | zero => intro _ X hX; exact absurd hX (Nat.not_lt_zero X)
  | succ n ih =>
    intro h X hX h0 hpc
    have h' : (Nat.rec (motive := fun _ => Bool) true
        (fun X b => b && (X % 2 == 1 || pc16 X != k + 1 || ws.any (fun w => Nat.blt w.1 (pc16 (X &&& w.2))))) n &&
        (n % 2 == 1 || pc16 n != k + 1 || ws.any (fun w => Nat.blt w.1 (pc16 (n &&& w.2))))) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hX with hlt | heq
    · exact ih h'.1 X hlt h0 hpc
    · subst heq
      have h2 := h'.2
      simp only [Bool.or_eq_true, beq_iff_eq, bne_iff_ne, ne_eq, h0, hpc, List.any_eq_true, Nat.blt_eq] at h2
      rcases h2 with (h2 | h2) | ⟨w, hw, hlt⟩
      · omega
      · exact (h2 trivial).elim
      · exact ⟨w, hw, hlt⟩


/-- the span of `kb` as a point mask -/
def spanK (kb d : Nat) : Nat := Nat.rec (motive := fun _ => Nat) 0 (fun j acc => acc ||| (1 <<< ptK kb d j)) (2 ^ d)

theorem spanK_mem (kb d v : Nat) (h : (spanK kb d).testBit v = true) : ∃ j < 2 ^ d, ptK kb d j = v := by
  unfold spanK at h
  revert h
  generalize 2 ^ d = n
  induction n with
  | zero => intro h; simp at h
  | succ n ih =>
    intro h
    have h' : (Nat.rec (motive := fun _ => Nat) 0 (fun j acc => acc ||| (1 <<< ptK kb d j)) n |||
        (1 <<< ptK kb d n)).testBit v = true := h
    rw [Nat.testBit_or, Bool.or_eq_true, Nat.one_shiftLeft, Nat.testBit_two_pow] at h'
    rcases h' with h1 | h2
    · obtain ⟨j, hj, e⟩ := ih h1; exact ⟨j, Nat.lt_succ_of_lt hj, e⟩
    · exact ⟨n, Nat.lt_succ_self n, by simpa using h2⟩

theorem testBit_sum_two_pow (s : Finset ℕ) (i : ℕ) : (∑ x ∈ s, 2 ^ x).testBit i = decide (i ∈ s) := by
  have h := congrArg (fun t : Finset ℕ => i ∈ t) (Finset.toFinset_bitIndices_sum_two_pow s)
  simp only [List.mem_toFinset, Nat.mem_bitIndices] at h
  by_cases hi : i ∈ s
  · simp only [hi, decide_true]; exact h.mpr hi
  · simp only [hi, decide_false]; cases e : (∑ x ∈ s, 2 ^ x).testBit i
    · rfl
    · exact absurd (h.mp e) hi

/-- **Closure theorem.** -/
theorem clos_sound (R m kb d k : Nat) (ws : List Nat) (hm : ∀ v, m.testBit v = true → ∃ j < 2 ^ d, ptK kb d j = v)
    (hok : closOK kb d k ws = true) (hW : ∀ w ∈ ws, FactN R (dualM w) (R - eCap w)) : FactN R m (R - k) := by
  unfold closOK at hok
  simp only [Bool.and_eq_true, Nat.ble_eq, List.all_eq_true, List.mem_range, Bool.or_eq_true, beq_iff_eq, bne_iff_ne,
    ne_eq] at hok
  obtain ⟨⟨hd4, hnz0⟩, hbr⟩ := hok
  have hpt0 : ∀ j < 2 ^ d, j ≠ 0 → ptK kb d j ≠ 0 := by
    intro j hj hj0; rcases hnz0 j hj with h | h
    · exact absurd h hj0
    · exact h
  have hpow : 2 ^ d ≤ 16 := by
    calc 2 ^ d ≤ 2 ^ 4 := Nat.pow_le_pow_right (by norm_num) hd4
      _ = 16 := by norm_num
  intro av b c hav hnz hinj hd
  classical
  set A := (Finset.univ : Finset (Fin R)).filter (fun s => m.testBit (av s) = true) with hA
  -- terms outside m are the complement of A
  have hcompl : (Finset.univ.filter (fun s => m.testBit (av s) = false)).card = R - A.card := by
    have := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset (Fin R)))
      (p := fun s => m.testBit (av s) = true)
    simp only [Finset.card_univ, Fintype.card_fin, Bool.not_eq_true] at this
    rw [← hA] at this
    omega
  rw [hcompl]
  suffices hAk : A.card ≤ k by omega
  by_contra hlt
  push_neg at hlt
  -- coordinates of the terms in A
  have hcoord : ∀ s ∈ A, ∃ j < 2 ^ d, ptK kb d j = av s := by
    intro s hs; rw [hA, Finset.mem_filter] at hs; exact hm _ hs.2
  choose! jf hjf using hcoord
  have hjinj : Set.InjOn jf (A : Set (Fin R)) := by
    intro s hs s' hs' e
    apply hinj
    rw [← (hjf s hs).2, ← (hjf s' hs').2, e]
  set J := A.image jf with hJ
  have hJcard : J.card = A.card := Finset.card_image_of_injOn hjinj
  obtain ⟨J', hJ'J, hJ'card⟩ := Finset.exists_subset_card_eq (show k + 1 ≤ J.card by omega)
  have hJ'lt : ∀ i ∈ J', i < 2 ^ d := by
    intro i hi
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp (hJ'J hi)
    exact (hjf s hs).1
  have hJ'0 : 0 ∉ J' := by
    intro h0
    obtain ⟨s, hs, e⟩ := Finset.mem_image.mp (hJ'J h0)
    have := (hjf s hs).2
    rw [e, ptK_zero] at this
    exact hnz s this.symm
  set X := ∑ i ∈ J', 2 ^ i with hX
  have hXbit : ∀ i, X.testBit i = decide (i ∈ J') := testBit_sum_two_pow J'
  have hXlt : X < 2 ^ (2 ^ d) := by
    apply Nat.lt_pow_two_of_testBit
    intro i hi
    rw [hXbit]
    simp only [decide_eq_false_iff_not]
    intro hm'; have := hJ'lt i hm'; omega
  have hX0 : X % 2 = 0 := by
    have := hXbit 0
    rw [Nat.testBit_zero] at this
    simp only [hJ'0, decide_false, decide_eq_false_iff_not] at this
    omega
  have hpcX : pc16 X = k + 1 := by
    rw [pc16_eq, ← hJ'card]
    congr 1
    ext i
    simp only [Finset.mem_filter, Finset.mem_range, hXbit, decide_eq_true_eq]
    constructor
    · exact fun h => h.2
    · intro h; exact ⟨lt_of_lt_of_le (hJ'lt i h) hpow, h⟩
  obtain ⟨w', hw'mem, hcap⟩ := bruteOK_spec d k _ hbr X hXlt hX0 hpcX
  obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hw'mem
  simp only at hcap
  -- count: the points of J' in W come from distinct terms in W
  have hle : pc16 (X &&& idxM kb d (dualM w)) ≤
      (Finset.univ.filter (fun s => (dualM w).testBit (av s) = true)).card := by
    rw [pc16_eq]
    have hsub : (Finset.range 16).filter (fun i => (X &&& idxM kb d (dualM w)).testBit i = true) ⊆
        (A.filter (fun s => (dualM w).testBit (av s) = true)).image jf := by
      intro i hi
      rw [Finset.mem_filter, Nat.testBit_and, Bool.and_eq_true, hXbit, decide_eq_true_eq] at hi
      obtain ⟨_, hiJ, hiW⟩ := hi
      obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp (hJ'J hiJ)
      refine Finset.mem_image.mpr ⟨s, Finset.mem_filter.mpr ⟨hs, ?_⟩, rfl⟩
      rw [idxM_testBit _ _ _ _ (hjf s hs).1, (hjf s hs).2] at hiW
      exact hiW
    refine le_trans (Finset.card_le_card hsub) (le_trans Finset.card_image_le (Finset.card_le_card ?_))
    intro s hs
    rw [Finset.mem_filter] at hs ⊢
    exact ⟨Finset.mem_univ _, hs.2⟩
  have hfw := hW w hw av b c hav hnz hinj hd
  have hsplit := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset (Fin R)))
    (p := fun s => (dualM w).testBit (av s) = true)
  simp only [Finset.card_univ, Fintype.card_fin, Bool.not_eq_true] at hsplit
  omega

end RT
