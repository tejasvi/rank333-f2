module
public import R22Port.U_d41d8cd98f00
public import RootSound.Leaf
public import aux_FullTable_03_ladder_core
/-! # Bridge from Rudich-Rousseau's decompositions to `IsDecomp`

RR states a decomposition as `L : List (Nat × Nat × Nat)` (9-bit masks `(a, b, c)`) with
`FullTable.WangLadder.rank1sum L = FullTable.WangLadder.matmulT`; the bit conventions are the same as ours
(`a` bit `3i+j`, `b` bit `3j+k`, `c` bit `3k+i`).  `isDecomp_of_rank1sum` turns it into `IsDecomp`, so `core_sound`,
`checkLeaf_sound` apply to RR's `L` directly. -/
@[expose] public section
open Matrix FullTable.WangLadder

set_option linter.unusedSectionVars false

namespace RootSound

theorem sum_get {β : Type*} [AddCommMonoid β] (g : Nat × Nat × Nat → β) :
    ∀ L : List (Nat × Nat × Nat), (∑ s : Fin L.length, g (L.get s)) = (L.map g).sum
  | [] => by simp
  | x :: xs => by
    show (∑ s : Fin (xs.length + 1), g ((x :: xs).get s)) = _
    rw [Fin.sum_univ_succ, List.map_cons, List.sum_cons, ← sum_get g xs]
    rfl

theorem b2f_and (x y : Bool) : b2f (x && y) = b2f x * b2f y := by
  cases x <;> cases y <;> decide

theorem rank1sum_f2 (a b c : Nat) : ∀ L : List (Nat × Nat × Nat),
    b2f (rank1sum L a b c) = (L.map fun t => bitF t.1 a * bitF t.2.1 b * bitF t.2.2 c).sum
  | [] => by simp [rank1sum, b2f]
  | t :: L => by
    rw [List.map_cons, List.sum_cons, ← rank1sum_f2 a b c L]
    show b2f (rank1 t.1 t.2.1 t.2.2 a b c ^^ rank1sum L a b c) = _
    rw [b2f_xor]
    congr 1
    simp only [rank1, b2f_and, bitF_eq]

theorem matmulT_val (i j j' k k' i' : Fin 3) :
    b2f (matmulT (3 * i.val + j.val) (3 * j'.val + k.val) (3 * k'.val + i'.val)) =
      if j = j' ∧ k = k' ∧ i = i' then 1 else 0 := by
  revert i j j' k k' i'; decide

/-- **RR decomposition → `IsDecomp`.** -/
theorem isDecomp_of_rank1sum (L : List (Nat × Nat × Nat)) (hL : rank1sum L = matmulT) :
    IsDecomp (fun s => toM3 (L.get s).1) (fun s => toM3 (L.get s).2.1) (fun s => toM3 (L.get s).2.2) := by
  intro i j j' k k' i'
  have h := rank1sum_f2 (3 * i.val + j.val) (3 * j'.val + k.val) (3 * k'.val + i'.val) L
  rw [hL, matmulT_val] at h
  rw [h, ← sum_get]
  rfl

/-- RR's hit test: `X(a) = 1` is the parity of `X &&& a`, i.e. the checker's `hitsOne` (for 9-bit `X`, `a`). -/
theorem pair_eq_one_iff_hitsOne (X x : Nat) (hX : X < 512) (hx : x < 512) :
    pair (toM3 X) (toM3 x) = 1 ↔ RootCheck.hitsOne X x = true := pair_eq_one_iff X x hX hx

/-- `checkLeaf_sound` for an RR decomposition whose first factors are the profile, all `b`, `c` nonzero. -/
theorem checkLeaf_sound_rr (L : List (Nat × Nat × Nat)) (hL : rank1sum L = matmulT)
    (ha : ∀ t ∈ L, t.1 < 512) (hbc : ∀ t ∈ L, t.2.1 % 512 ≠ 0 ∧ t.2.2 % 512 ≠ 0) (h : Nat)
    (hchk : RootCheck.checkLeaf (L.map Prod.fst) h = true) : False := by
  have hd := isDecomp_of_rank1sum L hL
  have hnz : ∀ v : Nat, v % 512 ≠ 0 → toM3 v ≠ 0 := by
    intro v hv h0
    apply hv
    have hbits : ∀ m : Fin 9, v.testBit m.val = false := by
      intro m
      have := congrFun (congrFun h0 ⟨m.val / 3, by omega⟩) ⟨m.val % 3, by omega⟩
      simp only [toM3, bitF, Matrix.zero_apply] at this
      have e : 3 * (m.val / 3) + m.val % 3 = m.val := by omega
      rw [e] at this
      cases hb : v.testBit m.val
      · rfl
      · rw [hb] at this; exact absurd this (by decide)
    apply Nat.eq_of_testBit_eq
    intro m
    show (v % 2 ^ 9).testBit m = Nat.testBit 0 m
    rw [Nat.testBit_mod_two_pow, Nat.zero_testBit]
    by_cases hm : m < 9
    · simp [hm, hbits ⟨m, hm⟩]
    · simp [hm]
  have e : List.ofFn (fun s : Fin L.length => (L.get s).1) = L.map Prod.fst := by
    apply List.ext_get <;> simp
  refine checkLeaf_sound (fun s : Fin L.length => (L.get s).1) (fun s => ha _ (List.get_mem L s)) h
    (by rw [e]; exact hchk) _ _ (fun s => ⟨hnz _ (hbc _ (List.get_mem L s)).1, hnz _ (hbc _ (List.get_mem L s)).2⟩) hd

end RootSound
