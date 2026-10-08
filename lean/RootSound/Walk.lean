module
public import R22Port.U_d41d8cd98f00
public import RootSound.Sem2
/-! # Soundness of the tree walk of the root checker (`RootCheck.walk`) -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

/-! ## Bit-level facts about the checker's primitives -/

theorem bit_eq (n i : Nat) : RootCheck.bit n i = n.testBit i := by
  unfold RootCheck.bit
  rw [Nat.testBit_eq_decide_div_mod_eq]
  have h1 : Nat.land (Nat.shiftRight n i) 1 = n / 2 ^ i % 2 := by
    show (n >>> i) &&& 1 = _
    rw [Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow]
  rw [h1]
  rcases Nat.mod_two_eq_zero_or_one (n / 2 ^ i) with h | h <;> simp [h] <;> rfl

theorem land_mask (v k : Nat) : Nat.land v (2 ^ k - 1) = v % 2 ^ k := by
  show v &&& (2 ^ k - 1) = _
  exact Nat.and_two_pow_sub_one_eq_mod v k

theorem qx_eq (X : Nat) : RootCheck.qx X = qxOf X := by
  unfold RootCheck.qx qxOf
  rw [show (255 : Nat) = 2 ^ 8 - 1 by norm_num, land_mask]; rfl
theorem px_eq (X : Nat) : RootCheck.px X = pxOf X := by
  unfold RootCheck.px pxOf
  rw [show (255 : Nat) = 2 ^ 8 - 1 by norm_num, land_mask]; rfl
theorem rk_eq (X : Nat) : RootCheck.rk X = rkOf X := by
  unfold RootCheck.rk rkOf
  rw [show (3 : Nat) = 2 ^ 2 - 1 by norm_num, land_mask]; rfl
theorem fz_eq (X : Nat) : RootCheck.fz X = fzOf X := by
  unfold RootCheck.fz fzOf
  rw [show (18446744073709551615 : Nat) = 2 ^ 64 - 1 by norm_num, land_mask]; rfl

theorem qxOf_lt (X : Nat) : qxOf X < 256 := Nat.mod_lt _ (by norm_num)
theorem pxOf_lt (X : Nat) : pxOf X < 256 := Nat.mod_lt _ (by norm_num)

theorem land_lt {a b : Nat} (hb : b < 256) : Nat.land a b < 256 :=
  lt_of_le_of_lt (Nat.and_le_right) hb

/-! ## Masks -/

theorem memM_land (Q R : Nat) (w : Fin 3 → F2) : memM (Nat.land Q R) w ↔ memM Q w ∧ memM R w := by
  simp only [memM]
  show (Q &&& R).testBit _ = true ↔ _
  rw [Nat.testBit_and]; simp

theorem memM_255 (w : Fin 3 → F2) : memM 255 w := by
  revert w; decide

theorem memM_one (w : Fin 3 → F2) (h : memM 1 w) : w = 0 := by
  revert w; decide

theorem eq_zero_of_cols (b : M3) (h : ∀ k, memM 1 (colB b k)) : b = 0 := by
  funext j k
  have := memM_one _ (h k)
  exact congrFun this j
theorem eq_zero_of_rows (c : M3) (h : ∀ k, memM 1 (rowC c k)) : c = 0 := by
  funext k i
  have := memM_one _ (h k)
  exact congrFun this i

/-! ## `outer` -/

theorem mulM_bit : ∀ Q : Fin 256, ∀ p q : Fin 8,
    (Q.val * 72340172838076673).testBit (8 * p.val + q.val) = Q.val.testBit q.val := by
  decide +kernel
theorem spread_bit : ∀ P : Fin 256, ∀ p q : Fin 8,
    ((RootCheck.SPREAD >>> (64 * P.val)) % 2 ^ 64).testBit (8 * p.val + q.val) = P.val.testBit p.val := by
  decide +kernel

theorem outer_bit (P Q : Nat) (hP : P < 256) (hQ : Q < 256) (p q : Nat) (hp : p < 8) (hq : q < 8) :
    (RootCheck.outer P Q).testBit (8 * p + q) = (P.testBit p && Q.testBit q) := by
  unfold RootCheck.outer
  rw [show (18446744073709551615 : Nat) = 2 ^ 64 - 1 by norm_num, land_mask]
  show ((Q * 72340172838076673) &&& ((RootCheck.SPREAD >>> (64 * P)) % 2 ^ 64)).testBit _ = _
  have e1 := mulM_bit ⟨Q, hQ⟩ ⟨p, hp⟩ ⟨q, hq⟩
  have e2 := spread_bit ⟨P, hP⟩ ⟨p, hp⟩ ⟨q, hq⟩
  simp only at e1 e2
  rw [Nat.testBit_and, e1, e2, Bool.and_comm]

/-! ## Selections (the mask `S` over the tight list) -/

def b2f (x : Bool) : F2 := if x then 1 else 0

theorem b2f_xor (x y : Bool) : b2f (Bool.xor x y) = b2f x + b2f y := by
  cases x <;> cases y <;> decide

theorem bitF_eq (v i : Nat) : bitF v i = b2f (v.testBit i) := by
  unfold bitF b2f; cases v.testBit i <;> rfl

/-- the F2-sum of `g X` over the `X` of the list selected by `S`, as `zsum`/`oddSel` select them -/
def selSum (g : Nat → F2) : List Nat → Nat → F2
  | [], _ => 0
  | X :: Xs, S => (if RootCheck.bit S 0 then g X else 0) + selSum g Xs (Nat.shiftRight S 1)

theorem selSum_const (g : Nat → F2) : ∀ (L : List Nat) (S : Nat),
    (∀ X ∈ L, g X = 1) → selSum g L S = b2f (RootCheck.oddSel L S) := by
  intro L
  induction L with
  | nil => intro S _; simp [selSum, RootCheck.oddSel, b2f]
  | cons X Xs ih =>
    intro S hg
    simp only [selSum, RootCheck.oddSel, b2f_xor]
    rw [ih _ (fun Y hY => hg Y (List.mem_cons_of_mem _ hY)), hg X (List.mem_cons_self ..)]
    cases RootCheck.bit S 0 <;> rfl

theorem selSum_zsum (m : Nat) : ∀ (L : List Nat) (S : Nat),
    bitF (RootCheck.zsum L S) m = selSum (fun X => bitF (RootCheck.fz X) m) L S := by
  intro L
  induction L with
  | nil => intro S; simp [RootCheck.zsum, selSum, bitF]
  | cons X Xs ih =>
    intro S
    simp only [RootCheck.zsum, selSum]
    rw [← ih]
    show bitF ((cond (RootCheck.bit S 0) (RootCheck.fz X) 0) ^^^ RootCheck.zsum Xs (Nat.shiftRight S 1)) m = _
    rw [bitF_eq, Nat.testBit_xor, b2f_xor, ← bitF_eq, ← bitF_eq]
    cases RootCheck.bit S 0 <;> simp [bitF]

theorem selSum_sum (g : Nat → Fin 3 → F2) : ∀ (L : List Nat) (S : Nat),
    selSum (fun X => ∑ k, g X k) L S = ∑ k, selSum (fun X => g X k) L S := by
  intro L
  induction L with
  | nil => intro S; simp [selSum]
  | cons X Xs ih =>
    intro S
    simp only [selSum]
    rw [ih, Finset.sum_add_distrib]
    congr 1
    split_ifs <;> simp

theorem selSum_congr (g g' : Nat → F2) : ∀ (L : List Nat) (S : Nat), (∀ X ∈ L, g X = g' X) →
    selSum g L S = selSum g' L S := by
  intro L
  induction L with
  | nil => intro S _; rfl
  | cons X Xs ih =>
    intro S h
    simp only [selSum]
    rw [h X (List.mem_cons_self ..), ih _ (fun Y hY => h Y (List.mem_cons_of_mem _ hY))]

/-! ## `tr(Z b c)` through the form masks -/

theorem trZ_eq_sum_bil (Z b c : M3) : trZ Z b c = ∑ k, bil Z (rowC c k) (colB b k) := by
  simp only [trZ, Matrix.trace, Matrix.diag, Matrix.mul_apply, bil, rowC, colB, Finset.sum_mul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  refine Finset.sum_congr rfl (fun r _ => ?_)
  refine Finset.sum_congr rfl (fun s _ => ?_)
  ring

theorem dec3_enc3 (w : Fin 3 → F2) : dec3 (enc3 w) = w := by
  revert w; decide

theorem bil_eq_fz (X : Nat) (hX : X < 512) (h0 : X ≠ 0) (p q : Fin 3 → F2) :
    bil (toM3 (zxOf X)) p q = bitF (fzOf X) (8 * enc3 p + enc3 q) := by
  have F := perX_all X hX h0
  have h := F.fz_form ⟨enc3 p, enc3_lt p⟩ ⟨enc3 q, enc3_lt q⟩
  simp only [dec3_enc3] at h
  rw [bitF_eq, h]
  rcases zmod2_cases (bil (toM3 (zxOf X)) p q) with e | e <;> simp [e, b2f]

/-! ## The walk -/

/-- **Soundness of the tree walk.**  If the walk accepts, no nonzero `b`, `c` meet: columns of `b` in `Q`, rows of `c`
in `P`, the side condition of every remaining slack-1 functional, and `tr(Z_X b c) = 1` for every tight `X`. -/
theorem walk_sound (nT : Nat) (tight slack : List Nat)
    (hTv : ∀ X ∈ tight, X < 512 ∧ X ≠ 0) (hSv : ∀ X ∈ slack, X < 512 ∧ X ≠ 0)
    (b c : M3) (hb : b ≠ 0) (hc : c ≠ 0) (htr : ∀ X ∈ tight, trZ (toM3 (zxOf X)) b c = 1) :
    ∀ (fuel h Q P i : Nat), Q < 256 → P < 256 →
    RootCheck.walk nT tight slack fuel h Q P i = true →
    (∀ k, memM Q (colB b k)) → (∀ k, memM P (rowC c k)) →
    (∀ j, i ≤ j → j < slack.length →
      (∀ k, memM (qxOf (RootCheck.getD slack j)) (colB b k)) ∨ (∀ k, memM (pxOf (RootCheck.getD slack j)) (rowC c k))) →
    False := by
  intro fuel
  induction fuel with
  | zero => intro h Q P i _ _ hw; simp [RootCheck.walk] at hw
  | succ fuel ih =>
    intro h Q P i hQ8 hP8 hw hQ hP hsl
    simp only [RootCheck.walk] at hw
    cases hb0 : RootCheck.bit h 0 <;> simp only [hb0, cond_true, cond_false] at hw
    · -- leaf
      cases hb1 : RootCheck.bit h 1 <;> simp only [hb1, cond_true, cond_false] at hw
      · -- zero leaf
        simp only [Bool.or_eq_true, Nat.beq_eq] at hw
        rcases hw with rfl | rfl
        · exact hb (eq_zero_of_cols b hQ)
        · exact hc (eq_zero_of_rows c hP)
      · -- odd-set leaf
        simp only [Bool.and_eq_true, Nat.beq_eq] at hw
        obtain ⟨hodd, hzero⟩ := hw
        set S := Nat.land (Nat.shiftRight h 2) (Nat.sub (Nat.shiftLeft 1 nT) 1)
        have h1 : selSum (fun X => trZ (toM3 (zxOf X)) b c) tight S = 1 := by
          rw [selSum_const _ _ _ htr, hodd]; rfl
        have h2 : selSum (fun X => trZ (toM3 (zxOf X)) b c) tight S = 0 := by
          rw [selSum_congr _ (fun X => ∑ k, bil (toM3 (zxOf X)) (rowC c k) (colB b k)) _ _
            (fun X _ => trZ_eq_sum_bil _ _ _), selSum_sum]
          apply Finset.sum_eq_zero
          intro k _
          rw [selSum_congr _ (fun X => bitF (RootCheck.fz X) (8 * enc3 (rowC c k) + enc3 (colB b k))) _ _
            (fun X hX => by rw [bil_eq_fz X (hTv X hX).1 (hTv X hX).2]; simp only [fz_eq]), ← selSum_zsum]
          have ho := outer_bit P Q hP8 hQ8 _ _ (enc3_lt (rowC c k)) (enc3_lt (colB b k))
          have hPk := hP k
          have hQk := hQ k
          simp only [memM] at hPk hQk
          rw [hPk, hQk, Bool.and_self] at ho
          have hz : (Nat.land (RootCheck.outer P Q) (RootCheck.zsum tight S)).testBit
              (8 * enc3 (rowC c k) + enc3 (colB b k)) = false := by rw [hzero]; simp
          show bitF _ _ = 0
          change (RootCheck.outer P Q &&& RootCheck.zsum tight S).testBit _ = false at hz
          rw [Nat.testBit_and, ho, Bool.true_and] at hz
          simp [bitF, hz]
        rw [h1] at h2; exact absurd h2 (by decide)
    · -- split on slack functional `i`
      simp only [Bool.and_eq_true, Nat.blt_eq] at hw
      obtain ⟨⟨hi, hl⟩, hr⟩ := hw
      rcases hsl i le_rfl hi with hq | hp
      · refine ih _ _ P (i + 1) (land_lt (by rw [qx_eq]; exact qxOf_lt _)) hP8 hl ?_ hP ?_
        · intro k; rw [memM_land, qx_eq]; exact ⟨hQ k, hq k⟩
        · intro j hj hjl; exact hsl j (by omega) hjl
      · refine ih _ Q _ (i + 1) hQ8 (land_lt (by rw [px_eq]; exact pxOf_lt _)) hr hQ ?_ ?_
        · intro k; rw [memM_land, px_eq]; exact ⟨hP k, hp k⟩
        · intro j hj hjl; exact hsl j (by omega) hjl

end RootSound
