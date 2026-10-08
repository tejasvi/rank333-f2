module
public import R22Port.U_d41d8cd98f00
public import GS.Spec
/-! # Track A, part 1: the list walks of phase A (`group`, `groupsW`, `groups`)

A stride-32 mask `M` (bit `32 X` for the value `X`) is enumerated by `group a W` in increasing order: `group_spec` says the
consumed block lists exactly the values of `M`, the `i`-th one having rank `i` in `M` (`rankM`), and that `M` has no other
bits.  `groupsW_spec`: the blocks of `W, W+1, …` follow each other, so the entry `(a, W + i, X)` sits at
`Σ_{i' < i} cntM (mask a (W + i')) + rankM (mask a (W + i)) X`.  `groups_spec`: the per-first-factor runs. -/
@[expose] public section
namespace GS
open G G.A2 Finset

/-- the number of values below `X` in the stride-32 mask `M` -/
def rankM (M X : ℕ) : ℕ := ((range X).filter (fun k => M.testBit (32 * k) = true)).card

/-- the number of values in `M` -/
def cntM (M : ℕ) : ℕ := rankM M (M + 1)

theorem getD_mem {l : List ℕ} {i : ℕ} (h : i < l.length) : l.getD i 0 ∈ l := by
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem h, Option.getD_some]; exact List.getElem_mem h

theorem testBit_le_self {M p : ℕ} (h : M.testBit p = true) : 2 ^ p ≤ M := Nat.ge_two_pow_of_testBit h

theorem lt_of_testBit32 {M X : ℕ} (h : M.testBit (32 * X) = true) : X < M + 1 := by
  have h1 := testBit_le_self h
  have h2 : X < 2 ^ (32 * X) := by
    calc X < 2 ^ X := Nat.lt_two_pow_self
      _ ≤ 2 ^ (32 * X) := Nat.pow_le_pow_right (by norm_num) (by omega)
  omega

theorem land_low_zero {M n : ℕ} (h : Nat.land M (Nat.sub (Nat.shiftLeft 1 n) 1) = 0) : ∀ p < n, M.testBit p = false := by
  intro p hp
  have h' : M &&& (2 ^ n - 1) = 0 := by rw [← shiftLeft_one]; exact h
  have := congrArg (fun x => x.testBit p) h'
  simp only [Nat.testBit_and, Nat.zero_testBit] at this
  rw [Nat.testBit_two_pow_sub_one] at this
  simpa [hp] using this

theorem testBit_xor_shl (M k j : ℕ) :
    (Nat.xor M (Nat.shiftLeft 1 k)).testBit j = xor (M.testBit j) (decide (j = k)) := by
  rw [shiftLeft_one]; exact testBit_xor_two_pow M k j

/-- **one group**: the consumed block enumerates the mask, in increasing order; the mask has no other bits -/
theorem group_spec (a W : ℕ) : ∀ (es : List ℕ) (M : ℕ) (rest : List ℕ), group a W es M = some rest →
    ∃ blk : List ℕ, es = blk ++ rest ∧ (∀ e ∈ blk, eA e = a ∧ eW e = W) ∧
      (∀ i < blk.length, M.testBit (32 * eX (blk.getD i 0)) = true ∧ rankM M (eX (blk.getD i 0)) = i) ∧
      (∀ X, M.testBit (32 * X) = true → ∃ i < blk.length, eX (blk.getD i 0) = X) ∧
      (∀ p, M.testBit p = true → ∃ X, p = 32 * X)
  | [], M, rest, h => by
    have h' : cond (Nat.beq M 0) (some []) none = some rest := h
    cases hM : Nat.beq M 0
    · rw [hM] at h'; simp at h'
    · rw [hM] at h'; simp only [cond_true, Option.some.injEq] at h'
      have : M = 0 := Nat.eq_of_beq_eq_true hM
      subst this; subst h'
      refine ⟨[], by simp, by simp, by simp, ?_, ?_⟩ <;> intro _ hb <;> simp at hb
  | e :: es, M, rest, h => by
    have h' : cond (Nat.beq (eA e) a && Nat.beq (eW e) W)
        (cond (Nat.beq (bit M (Nat.mul 32 (eX e))) 1 && Nat.beq (Nat.land M (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 (eX e))) 1)) 0)
          (group a W es (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 (eX e))))) none)
        (cond (Nat.beq M 0) (some (e :: es)) none) = some rest := h
    cases hm : (Nat.beq (eA e) a && Nat.beq (eW e) W)
    · -- not this group: the mask is empty, nothing consumed
      rw [hm] at h'; simp only [cond_false] at h'
      cases hM : Nat.beq M 0
      · rw [hM] at h'; simp at h'
      · rw [hM] at h'; simp only [cond_true, Option.some.injEq] at h'
        have : M = 0 := Nat.eq_of_beq_eq_true hM
        subst this; subst h'
        refine ⟨[], by simp, by simp, by simp, ?_, ?_⟩ <;> intro _ hb <;> simp at hb
    · rw [hm] at h'; simp only [cond_true] at h'
      rw [Bool.and_eq_true] at hm
      have hA : eA e = a := Nat.eq_of_beq_eq_true hm.1
      have hW : eW e = W := Nat.eq_of_beq_eq_true hm.2
      cases hb : (Nat.beq (bit M (Nat.mul 32 (eX e))) 1 && Nat.beq (Nat.land M (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 (eX e))) 1)) 0)
      · rw [hb] at h'; simp at h'
      · rw [hb] at h'; simp only [cond_true] at h'
        rw [Bool.and_eq_true] at hb
        set X := eX e with hX
        have hset : M.testBit (32 * X) = true := bit_eq_one.mp hb.1
        have hlow : ∀ p < 32 * X, M.testBit p = false := land_low_zero (Nat.eq_of_beq_eq_true hb.2)
        obtain ⟨blk, hes, hent, hrank, hsurj, hbits⟩ := group_spec a W es _ rest h'
        set M' := Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 X)) with hM'
        have hM'b : ∀ j, M'.testBit j = xor (M.testBit j) (decide (j = 32 * X)) := fun j => testBit_xor_shl M (32 * X) j
        -- the other values of `M` are the values of `M'`, all above `X`
        have hother : ∀ X', X' ≠ X → M.testBit (32 * X') = M'.testBit (32 * X') := by
          intro X' hne; rw [hM'b]; have : 32 * X' ≠ 32 * X := by omega
          simp [this]
        have habove : ∀ X', M.testBit (32 * X') = true → X ≤ X' := by
          intro X' hX'; by_contra hlt; push Not at hlt
          rw [hlow (32 * X') (by omega)] at hX'; exact absurd hX' (by simp)
        have hrk : ∀ X', X < X' → rankM M X' = rankM M' X' + 1 := by
          intro X' hlt
          unfold rankM
          have hs : (range X').filter (fun k => M.testBit (32 * k) = true) =
              insert X ((range X').filter (fun k => M'.testBit (32 * k) = true)) := by
            ext k; simp only [mem_filter, mem_range, mem_insert]
            constructor
            · rintro ⟨hk, hb⟩
              by_cases hkX : k = X
              · exact Or.inl hkX
              · exact Or.inr ⟨hk, by rw [← hother k hkX]; exact hb⟩
            · rintro (rfl | ⟨hk, hb⟩)
              · exact ⟨hlt, hset⟩
              · refine ⟨hk, ?_⟩
                by_cases hkX : k = X
                · subst hkX; rw [hM'b, hset] at hb; simp at hb
                · rw [hother k hkX]; exact hb
          rw [hs, card_insert_of_notMem]
          simp only [mem_filter, mem_range, not_and]
          intro _; rw [hM'b, hset]; simp
        have hrk0 : rankM M X = 0 := by
          unfold rankM; rw [card_eq_zero, filter_eq_empty_iff]
          intro k hk; rw [mem_range] at hk; rw [hlow (32 * k) (by omega)]; simp
        refine ⟨e :: blk, by rw [hes]; rfl, ?_, ?_, ?_, ?_⟩
        · intro e' he'
          rcases List.mem_cons.mp he' with rfl | h2
          · exact ⟨hA, hW⟩
          · exact hent e' h2
        · intro i hi
          rcases i with _ | i
          · simp only [List.getD_cons_zero]; exact ⟨hset, hrk0⟩
          · simp only [List.getD_cons_succ]
            simp only [List.length_cons] at hi
            obtain ⟨h1, h2⟩ := hrank i (by omega)
            set X' := eX (blk.getD i 0)
            have hne : X' ≠ X := by intro heq; rw [heq, hM'b] at h1; simp [hset] at h1
            have hMX' : M.testBit (32 * X') = true := by rw [hother X' hne]; exact h1
            have hlt : X < X' := lt_of_le_of_ne (habove X' hMX') (Ne.symm hne)
            exact ⟨hMX', by rw [hrk X' hlt, h2]⟩
        · intro X' hX'
          by_cases hne : X' = X
          · exact ⟨0, by simp, by simp only [List.getD_cons_zero]; rw [hne, hX]⟩
          · have : M'.testBit (32 * X') = true := by rw [← hother X' hne]; exact hX'
            obtain ⟨i, hi, hiX⟩ := hsurj X' this
            exact ⟨i + 1, by simp; omega, by simpa using hiX⟩
        · intro p hp
          by_cases hpX : p = 32 * X
          · exact ⟨X, hpX⟩
          · have : M'.testBit p = true := by rw [hM'b]; simp [hpX, hp]
            exact hbits p this

/-- the length of a group block is the number of values of the mask -/
theorem blk_length {M : ℕ} {blk : List ℕ}
    (hrank : ∀ i < blk.length, M.testBit (32 * eX (blk.getD i 0)) = true ∧ rankM M (eX (blk.getD i 0)) = i)
    (hsurj : ∀ X, M.testBit (32 * X) = true → ∃ i < blk.length, eX (blk.getD i 0) = X) :
    blk.length = cntM M := by
  unfold cntM rankM
  have himg : (range (M + 1)).filter (fun k => M.testBit (32 * k) = true) =
      (range blk.length).image (fun i => eX (blk.getD i 0)) := by
    ext X; simp only [mem_filter, mem_range, mem_image]
    constructor
    · rintro ⟨_, hX⟩; obtain ⟨i, hi, e⟩ := hsurj X hX; exact ⟨i, hi, e⟩
    · rintro ⟨i, hi, rfl⟩; exact ⟨lt_of_testBit32 (hrank i hi).1, (hrank i hi).1⟩
  rw [himg, card_image_of_injOn]
  · simp
  · intro i hi j hj hij
    simp only [coe_range, Set.mem_Iio] at hi hj
    have h1 := (hrank i hi).2; have h2 := (hrank j hj).2
    simp only at hij
    rw [hij] at h1; omega

/-- **the groups of one first factor**: consecutive blocks for `W, W+1, …, W+n-1` -/
theorem groupsW_spec (mask : ℕ → ℕ → ℕ) (a : ℕ) : ∀ (n W : ℕ) (es rest : List ℕ), groupsW mask a n W es = some rest →
    ∃ pre : List ℕ, es = pre ++ rest ∧
      pre.length = ∑ i ∈ range n, cntM (mask a (W + i)) ∧
      (∀ e ∈ pre, eA e = a ∧ ∃ i < n, eW e = W + i ∧ (mask a (W + i)).testBit (32 * eX e) = true) ∧
      (∀ i < n, ∀ X, (mask a (W + i)).testBit (32 * X) = true →
        ∃ e, pre.getD (∑ i' ∈ range i, cntM (mask a (W + i')) + rankM (mask a (W + i)) X) 0 = e ∧
          eA e = a ∧ eW e = W + i ∧ eX e = X ∧
          ∑ i' ∈ range i, cntM (mask a (W + i')) + rankM (mask a (W + i)) X < pre.length) ∧
      (∀ i < n, ∀ p, (mask a (W + i)).testBit p = true → ∃ X, p = 32 * X)
  | 0, W, es, rest, h => by
    have : es = rest := by simpa [groupsW] using h
    subst this
    exact ⟨[], by simp, by simp, by simp, by intro i hi; omega, by intro i hi; omega⟩
  | n + 1, W, es, rest, h => by
    have h' : (match group a W es (mask a W) with
      | none => none
      | some es' => groupsW mask a n (Nat.succ W) es') = some rest := h
    cases hg : group a W es (mask a W) with
    | none => rw [hg] at h'; simp at h'
    | some es' =>
      rw [hg] at h'; simp only at h'
      obtain ⟨blk, hes, hent, hrank, hsurj, hbits⟩ := group_spec a W es (mask a W) es' hg
      obtain ⟨pre, hes', hlen, hpre, hpos, hbits'⟩ := groupsW_spec mask a n (Nat.succ W) es' rest h'
      have hbl := blk_length hrank hsurj
      have hsh : ∀ i, W + (i + 1) = Nat.succ W + i := fun i => by omega
      refine ⟨blk ++ pre, by rw [hes, hes', List.append_assoc], ?_, ?_, ?_, ?_⟩
      · rw [List.length_append, hlen, hbl, Finset.sum_range_succ']
        simp only [Nat.add_zero, hsh]; ring
      · intro e he
        rcases List.mem_append.mp he with h1 | h1
        · obtain ⟨i, hi, hiX⟩ : ∃ i < blk.length, blk.getD i 0 = e := by
            obtain ⟨i, hi, hget⟩ := List.getElem_of_mem h1
            exact ⟨i, hi, by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]; simpa using hget⟩
          refine ⟨(hent e h1).1, 0, by omega, by rw [(hent e h1).2]; rfl, ?_⟩
          rw [Nat.add_zero, ← hiX]; exact (hrank i hi).1
        · obtain ⟨hA, i, hi, hW, hm⟩ := hpre e h1
          exact ⟨hA, i + 1, by omega, by rw [hW]; omega, by rw [hsh]; exact hm⟩
      · intro i hi X hX
        rcases i with _ | i
        · -- the first block
          simp only [Finset.range_zero, Finset.sum_empty, Nat.zero_add, Nat.add_zero] at hX ⊢
          obtain ⟨j, hj, hjX⟩ := hsurj X hX
          have hjr := (hrank j hj).2
          rw [hjX] at hjr
          refine ⟨blk.getD j 0, ?_, (hent _ ?_).1, (hent _ ?_).2, hjX, ?_⟩
          · rw [hjr, List.getD_append _ _ _ _ (by omega)]
          · exact getD_mem hj
          · exact getD_mem hj
          · rw [List.length_append]; omega
        · -- a later block: shift by the first block's length
          have hX' : (mask a (Nat.succ W + i)).testBit (32 * X) = true := by rw [← hsh]; exact hX
          obtain ⟨e, he, hA, hW, hXe, hlt⟩ := hpos i (by omega) X hX'
          have hsum : ∑ i' ∈ range (i + 1), cntM (mask a (W + i')) =
              blk.length + ∑ i' ∈ range i, cntM (mask a (Nat.succ W + i')) := by
            rw [Finset.sum_range_succ', hbl]; simp only [Nat.add_zero, hsh]; ring
          refine ⟨e, ?_, hA, by rw [hW]; omega, hXe, ?_⟩
          · rw [hsum, show W + (i + 1) = Nat.succ W + i by omega, Nat.add_assoc, List.getD_append_right _ _ _ _ (by omega)]
            simpa using he
          · rw [hsum, List.length_append, show W + (i + 1) = Nat.succ W + i by omega]; omega
      · intro i hi p hp
        rcases i with _ | i
        · exact hbits p (by simpa using hp)
        · exact hbits' i (by omega) p (by rw [← hsh]; exact hp)

/-- **the groups of all first factors** (rank 1): every value of every mask is an entry -/
theorem groups_spec (mask : ℕ → ℕ → ℕ) (nW : ℕ) : ∀ (as es rest : List ℕ), groups mask nW as es = some rest →
    ∃ pre : List ℕ, es = pre ++ rest ∧
      (∀ e ∈ pre, eA e ∈ as ∧ ∃ i < nW, eW e = i ∧ (mask (eA e) i).testBit (32 * eX e) = true) ∧
      (∀ a ∈ as, ∀ i < nW, ∀ X, (mask a i).testBit (32 * X) = true → ∃ e ∈ pre, eA e = a ∧ eW e = i ∧ eX e = X)
  | [], es, rest, h => by
    have : es = rest := by simpa [groups] using h
    subst this
    exact ⟨[], by simp, by simp, by simp⟩
  | a :: as, es, rest, h => by
    have h' : (match groupsW mask a nW 0 es with
      | none => none
      | some es' => groups mask nW as es') = some rest := h
    cases hg : groupsW mask a nW 0 es with
    | none => rw [hg] at h'; simp at h'
    | some es' =>
      rw [hg] at h'; simp only at h'
      obtain ⟨pre1, hes, _, hent1, hpos1, _⟩ := groupsW_spec mask a nW 0 es es' hg
      obtain ⟨pre2, hes', hent2, hmem2⟩ := groups_spec mask nW as es' rest h'
      refine ⟨pre1 ++ pre2, by rw [hes, hes', List.append_assoc], ?_, ?_⟩
      · intro e he
        rcases List.mem_append.mp he with h1 | h1
        · obtain ⟨hA, i, hi, hW, hm⟩ := hent1 e h1
          refine ⟨by rw [hA]; exact List.mem_cons_self, i, hi, by rw [hW]; omega, ?_⟩
          rw [hA]; simpa using hm
        · obtain ⟨hA, i, hi, hW, hm⟩ := hent2 e h1
          exact ⟨List.mem_cons_of_mem _ hA, i, hi, hW, hm⟩
      · intro a' ha' i hi X hX
        rcases List.mem_cons.mp ha' with rfl | h2
        · obtain ⟨e, he, hA, hW, hXe, hlt⟩ := hpos1 i hi X (by simpa using hX)
          refine ⟨e, ?_, hA, by rw [hW]; omega, hXe⟩
          rw [← he]; exact List.mem_append_left _ (getD_mem hlt)
        · obtain ⟨e, he, hA, hW, hXe⟩ := hmem2 a' h2 i hi X hX
          exact ⟨e, List.mem_append_right _ he, hA, hW, hXe⟩

end GS

#print axioms GS.group_spec
#print axioms GS.groupsW_spec
#print axioms GS.groups_spec
