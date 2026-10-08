module
public import R22Port.U_6d73af0793e7
public import Mathlib
/-! # Bit-level semantics of `trans` (BranchCheck v6, rank-1 fast path)

`trans S v = {s ⊕ v | s ∈ S}` on 512-bit sets: bit `u` of the result is bit `u ^^^ v` of `S` (`trans_testBit`).
`hsw`, `KM`, `bit`, `trans` below are the checker's definitions (BranchCheck6.lean writes `sel c a b`, i.e. `Bool.rec b a c`,
which is `cond c a b` by `rfl`; its `KM0 ... KM8` are the literals of `KM 0 ... KM 8`, `KM_eq` style facts by `decide`).
The column/row masks of the rank-1 cases (`RootSound.Rank1`) are unions of translates `trans (lm & H) b0` of hyperplane
sections, so with this lemma they enumerate exactly the subspaces described there. -/
@[expose] public section
namespace RootSound.TransBits

/-- half swap at distance `d` under mask `K` -/
def hsw (S d K : Nat) : Nat := Nat.lor (Nat.land (Nat.shiftRight S d) K) (Nat.shiftLeft (Nat.land S K) d)

/-- the mask of the `v < 512` with bit `i` clear -/
def KM (i : Nat) : Nat := ((List.range 512).filter (fun v => !v.testBit i)).foldl (fun acc v => acc ||| (1 <<< v)) 0

def bit (n i : Nat) : Bool := Nat.beq (Nat.land (Nat.shiftRight n i) 1) 1

/-- translate a 512-bit set by `v` (the checker's 9 conditional half swaps) -/
def trans (S v : Nat) : Nat :=
  let S := cond (bit v 0) (hsw S 1 (KM 0)) S
  let S := cond (bit v 1) (hsw S 2 (KM 1)) S
  let S := cond (bit v 2) (hsw S 4 (KM 2)) S
  let S := cond (bit v 3) (hsw S 8 (KM 3)) S
  let S := cond (bit v 4) (hsw S 16 (KM 4)) S
  let S := cond (bit v 5) (hsw S 32 (KM 5)) S
  let S := cond (bit v 6) (hsw S 64 (KM 6)) S
  let S := cond (bit v 7) (hsw S 128 (KM 7)) S
  cond (bit v 8) (hsw S 256 (KM 8)) S

theorem hsw_testBit (S d K u : Nat) : (hsw S d K).testBit u =
    ((S.testBit (d + u) && K.testBit u) || (decide (u ≥ d) && (S.testBit (u - d) && K.testBit (u - d)))) := by
  show (((S >>> d) &&& K) ||| ((S &&& K) <<< d)).testBit u = _
  rw [Nat.testBit_lor, Nat.testBit_land, Nat.testBit_shiftRight, Nat.testBit_shiftLeft, Nat.testBit_land]

/-- the concrete facts behind one half swap at `(i, u)`, as a `Bool` -/
def swapOk (i u : Nat) : Bool :=
  bif u.testBit i then
    !(KM i).testBit u && decide (u ≥ 2 ^ i) && decide (u - 2 ^ i = u ^^^ 2 ^ i) && (KM i).testBit (u - 2 ^ i)
  else
    (KM i).testBit u && decide (2 ^ i + u = u ^^^ 2 ^ i) && (!decide (u ≥ 2 ^ i) || !(KM i).testBit (u - 2 ^ i))

theorem swapOk_all : ((List.range 9).all fun i => (List.range 512).all fun u => swapOk i u) = true := by
  decide +kernel

theorem swapOk_of (i u : Nat) (hi : i < 9) (hu : u < 512) : swapOk i u = true := by
  have h := swapOk_all
  rw [List.all_eq_true] at h
  have h2 := h i (List.mem_range.2 hi)
  rw [List.all_eq_true] at h2
  exact h2 u (List.mem_range.2 hu)

theorem hsw_KM (S i u : Nat) (hi : i < 9) (hu : u < 512) :
    (hsw S (2 ^ i) (KM i)).testBit u = S.testBit (u ^^^ 2 ^ i) := by
  rw [hsw_testBit]
  have h := swapOk_of i u hi hu
  unfold swapOk at h
  cases hb : u.testBit i
  · simp only [hb, cond_false, Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true, Bool.not_eq_true',
      decide_eq_false_iff_not] at h
    obtain ⟨⟨hk, he⟩, hl⟩ := h
    rw [hk, he]
    rcases hl with hl | hl
    · simp [hl]
    · simp [hl]
  · simp only [hb, cond_true, Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true'] at h
    obtain ⟨⟨⟨hk, hge⟩, he⟩, hk'⟩ := h
    rw [hk, hk', he]
    simp [hge]

theorem step_testBit (S i u : Nat) (b : Bool) (hi : i < 9) (hu : u < 512) :
    (cond b (hsw S (2 ^ i) (KM i)) S).testBit u = S.testBit (u ^^^ cond b (2 ^ i) 0) := by
  cases b
  · simp
  · simpa using hsw_KM S i u hi hu

theorem xor_lt (u c : Nat) (hu : u < 512) (hc : c < 512) : u ^^^ c < 512 :=
  Nat.xor_lt_two_pow (n := 9) hu hc

theorem cond_lt (b : Bool) (i : Nat) (hi : i < 9) : cond b (2 ^ i) 0 < 512 := by
  cases b
  · simp
  · simp only [cond_true]
    calc 2 ^ i < 2 ^ 9 := Nat.pow_lt_pow_right (by norm_num) hi
      _ = 512 := by norm_num

/-- `v` is the xor of its 9 bit contributions -/
theorem bits_xor : ∀ v < 512,
    cond (bit v 8) (2 ^ 8) 0 ^^^ (cond (bit v 7) (2 ^ 7) 0 ^^^ (cond (bit v 6) (2 ^ 6) 0 ^^^ (cond (bit v 5) (2 ^ 5) 0 ^^^
      (cond (bit v 4) (2 ^ 4) 0 ^^^ (cond (bit v 3) (2 ^ 3) 0 ^^^ (cond (bit v 2) (2 ^ 2) 0 ^^^ (cond (bit v 1) (2 ^ 1) 0 ^^^
        cond (bit v 0) (2 ^ 0) 0))))))) = v := by
  decide +kernel

/-- one step of `trans` -/
def stepT (S : Nat) (b : Bool) (i : Nat) : Nat := cond b (hsw S (2 ^ i) (KM i)) S

theorem trans_eq (S v : Nat) : trans S v = stepT (stepT (stepT (stepT (stepT (stepT (stepT (stepT (stepT S
    (bit v 0) 0) (bit v 1) 1) (bit v 2) 2) (bit v 3) 3) (bit v 4) 4) (bit v 5) 5) (bit v 6) 6) (bit v 7) 7) (bit v 8) 8 :=
  rfl

theorem stepT_testBit (S i u : Nat) (b : Bool) (hi : i < 9) (hu : u < 512) :
    (stepT S b i).testBit u = S.testBit (u ^^^ cond b (2 ^ i) 0) := step_testBit S i u b hi hu

/-- **`trans` is the translate**: bit `u` of `trans S v` is bit `u ^^^ v` of `S` (`u, v < 512`). -/
theorem trans_testBit (S v u : Nat) (hv : v < 512) (hu : u < 512) : (trans S v).testBit u = S.testBit (u ^^^ v) := by
  have c : ∀ j, j < 9 → cond (bit v j) (2 ^ j) 0 < 512 := fun j hj => cond_lt _ j hj
  have h8 := xor_lt u _ hu (c 8 (by norm_num))
  have h7 := xor_lt _ _ h8 (c 7 (by norm_num))
  have h6 := xor_lt _ _ h7 (c 6 (by norm_num))
  have h5 := xor_lt _ _ h6 (c 5 (by norm_num))
  have h4 := xor_lt _ _ h5 (c 4 (by norm_num))
  have h3 := xor_lt _ _ h4 (c 3 (by norm_num))
  have h2 := xor_lt _ _ h3 (c 2 (by norm_num))
  have h1 := xor_lt _ _ h2 (c 1 (by norm_num))
  rw [trans_eq, stepT_testBit _ 8 _ _ (by norm_num) hu, stepT_testBit _ 7 _ _ (by norm_num) h8,
    stepT_testBit _ 6 _ _ (by norm_num) h7, stepT_testBit _ 5 _ _ (by norm_num) h6,
    stepT_testBit _ 4 _ _ (by norm_num) h5, stepT_testBit _ 3 _ _ (by norm_num) h4,
    stepT_testBit _ 2 _ _ (by norm_num) h3, stepT_testBit _ 1 _ _ (by norm_num) h2,
    stepT_testBit _ 0 _ _ (by norm_num) h1]
  congr 1
  conv_rhs => rw [← bits_xor v hv]
  simp only [Nat.xor_assoc]

end RootSound.TransBits
