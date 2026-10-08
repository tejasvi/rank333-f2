module
public import R22Port.U_d41d8cd98f00
public import RootSound.Core
/-! # The point-profile root checker is sound

`checkLeaf_sound`: if `RootCheck.checkLeaf (List.ofFn f) h = true` for 9-bit first factors `f`, there is no
decomposition `T = ∑_s toM3 (f s) ⊗ b s ⊗ c s` with all `b s`, `c s` nonzero. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

theorem par_table : ∀ v : Fin 512, b2f (RootCheck.PAR.testBit v.val) = ∑ i : Fin 3, ∑ j : Fin 3, bitF v.val (3 * i.val + j.val) := by
  decide +kernel

theorem bitF_and (x y k : Nat) : bitF (x &&& y) k = bitF x k * bitF y k := by
  unfold bitF; rw [Nat.testBit_and]; cases x.testBit k <;> cases y.testBit k <;> simp

theorem pair_toM3 (X x : Nat) (hX : X < 512) (hx : x < 512) :
    pair (toM3 X) (toM3 x) = b2f (RootCheck.hitsOne X x) := by
  have hlt : X &&& x < 512 := lt_of_le_of_lt Nat.and_le_left hX
  unfold RootCheck.hitsOne
  rw [bit_eq]
  have := par_table ⟨X &&& x, hlt⟩
  simp only at this
  rw [show Nat.land X x = X &&& x from rfl, this]
  unfold pair toM3
  refine Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => ?_))
  rw [bitF_and]

theorem pair_eq_one_iff (X x : Nat) (hX : X < 512) (hx : x < 512) :
    pair (toM3 X) (toM3 x) = 1 ↔ RootCheck.hitsOne X x = true := by
  rw [pair_toM3 X x hX hx]; cases RootCheck.hitsOne X x <;> simp [b2f]

theorem hits_ofFn (X : Nat) : ∀ (n : Nat) (f : Fin n → Nat),
    RootCheck.hits X (List.ofFn f) = (Finset.univ.filter (fun s => RootCheck.hitsOne X (f s) = true)).card := by
  intro n
  induction n with
  | zero => intro f; simp [RootCheck.hits]
  | succ n ih =>
    intro f
    rw [List.ofFn_succ, Finset.card_filter, Fin.sum_univ_succ, ← Finset.card_filter, ← ih]
    simp only [RootCheck.hits]
    cases RootCheck.hitsOne X (f 0) <;> simp <;> omega

theorem fields_lt : ∀ (k h : Nat), ∀ X ∈ RootCheck.fields k h, X < 512
  | 0, _, X, hX => by simp [RootCheck.fields] at hX
  | k+1, h, X, hX => by
    simp only [RootCheck.fields, List.mem_cons] at hX
    rcases hX with rfl | hX
    · show h &&& 511 < 512
      exact lt_of_le_of_lt Nat.and_le_right (by norm_num)
    · exact fields_lt k _ X hX

theorem hitsOne_zero (a : Nat) : RootCheck.hitsOne 0 a = false := by
  unfold RootCheck.hitsOne; rw [bit_eq]; simp [show Nat.land 0 a = 0 from Nat.zero_and a]; decide

theorem getD_ofFn {n : Nat} (f : Fin n → Nat) (t : Nat) (ht : t < n) : RootCheck.getD (List.ofFn f) t = f ⟨t, ht⟩ := by
  induction n generalizing t with
  | zero => omega
  | succ n ih =>
    rw [List.ofFn_succ]
    cases t with
    | zero => rfl
    | succ t => simp only [RootCheck.getD]; rw [ih (fun i => f i.succ) t (by omega)]; rfl

theorem getD_ofFn_ge {n : Nat} (f : Fin n → Nat) (t : Nat) (ht : n ≤ t) : RootCheck.getD (List.ofFn f) t = 0 := by
  induction n generalizing t with
  | zero => cases t <;> rfl
  | succ n ih =>
    rw [List.ofFn_succ]
    cases t with
    | zero => omega
    | succ t => simp only [RootCheck.getD]; exact ih _ t (by omega)

/-- **The point-profile root checker is sound.** -/
theorem checkLeaf_sound {n : Nat} (f : Fin n → Nat) (hf : ∀ s, f s < 512) (h : Nat)
    (hchk : RootCheck.checkLeaf (List.ofFn f) h = true)
    (b c : Fin n → M3) (hbc : ∀ s, b s ≠ 0 ∧ c s ≠ 0)
    (hd : IsDecomp (fun s => toM3 (f s)) b c) : False := by
  unfold RootCheck.checkLeaf at hchk
  simp only [Bool.and_eq_true] at hchk
  obtain ⟨⟨hT, hS⟩, hw⟩ := hchk
  set t := Nat.land h 31
  set nT := Nat.land (Nat.shiftRight h 5) 15
  set TL := RootCheck.fields nT (Nat.shiftRight h 9)
  set h1 := Nat.shiftRight h (Nat.add 9 (Nat.mul 9 nT))
  set SL := RootCheck.fields (Nat.land h1 7) (Nat.shiftRight h1 3)
  set a0 := RootCheck.getD (List.ofFn f) t
  -- the claims, item by item
  have allT : ∀ L : List Nat, RootCheck.allTight (List.ofFn f) a0 L = true → ∀ X ∈ L,
      RootCheck.hitsOne X a0 = true ∧ RootCheck.hits X (List.ofFn f) = 3 * RootCheck.rk X := by
    intro L; induction L with
    | nil => intro _ X hX; simp at hX
    | cons Y Ys ih =>
      intro hL X hX
      simp only [RootCheck.allTight, Bool.and_eq_true, Nat.beq_eq] at hL
      rcases List.mem_cons.mp hX with rfl | hX
      · exact ⟨hL.1.1, hL.1.2⟩
      · exact ih hL.2 X hX
  have allS : ∀ L : List Nat, RootCheck.allSlack (List.ofFn f) a0 L = true → ∀ X ∈ L,
      RootCheck.hitsOne X a0 = true ∧ RootCheck.hits X (List.ofFn f) = 3 * RootCheck.rk X + 1 := by
    intro L; induction L with
    | nil => intro _ X hX; simp at hX
    | cons Y Ys ih =>
      intro hL X hX
      simp only [RootCheck.allSlack, Bool.and_eq_true, Nat.beq_eq] at hL
      rcases List.mem_cons.mp hX with rfl | hX
      · exact ⟨hL.1.1.1, hL.1.2⟩
      · exact ih hL.2 X hX
  have hTc := allT TL hT
  have hSc := allS SL hS
  have hX0 : ∀ X, RootCheck.hitsOne X a0 = true → X ≠ 0 := by
    intro X hX hX0; rw [hX0, hitsOne_zero] at hX; exact absurd hX (by decide)
  have hTv : ∀ X ∈ TL, X < 512 ∧ X ≠ 0 := fun X hX => ⟨fields_lt _ _ X hX, hX0 X (hTc X hX).1⟩
  have hSv : ∀ X ∈ SL, X < 512 ∧ X ≠ 0 := fun X hX => ⟨fields_lt _ _ X hX, hX0 X (hSc X hX).1⟩
  by_cases htn : t < n
  · have ha0 : a0 = f ⟨t, htn⟩ := getD_ofFn f t htn
    have hcardEq : ∀ X, X < 512 → (hitSet (fun s => toM3 (f s)) (toM3 X)).card = RootCheck.hits X (List.ofFn f) := by
      intro X hX
      rw [hits_ofFn]
      congr 1; ext s
      simp only [hitSet, Finset.mem_filter, Finset.mem_univ, true_and]
      exact pair_eq_one_iff X (f s) hX (hf s)
    refine core_sound hd ⟨t, htn⟩ (hbc _).1 (hbc _).2 nT TL SL _ hTv hSv ?_ ?_ hw
    · intro X hX
      refine ⟨(pair_eq_one_iff X _ (hTv X hX).1 (hf _)).2 (ha0 ▸ (hTc X hX).1), ?_⟩
      rw [hcardEq X (hTv X hX).1, (hTc X hX).2, rk_eq]
    · intro X hX
      refine ⟨(pair_eq_one_iff X _ (hSv X hX).1 (hf _)).2 (ha0 ▸ (hSc X hX).1), ?_⟩
      rw [hcardEq X (hSv X hX).1, (hSc X hX).2, rk_eq]
  · -- the dead-term index is out of range: `a0 = 0`, so no claim holds and the walk cannot accept
    have ha0 : a0 = 0 := getD_ofFn_ge f t (by omega)
    have hTn : TL = [] := by
      cases hTL : TL with
      | nil => rfl
      | cons X Xs =>
        have := (hTc X (by rw [hTL]; exact List.mem_cons_self ..)).1
        rw [ha0] at this
        unfold RootCheck.hitsOne at this; rw [bit_eq] at this
        simp [show Nat.land X 0 = 0 from Nat.and_zero X] at this
        exact absurd this (by decide)
    have hSn : SL = [] := by
      cases hSL : SL with
      | nil => rfl
      | cons X Xs =>
        have := (hSc X (by rw [hSL]; exact List.mem_cons_self ..)).1
        rw [ha0] at this
        unfold RootCheck.hitsOne at this; rw [bit_eq] at this
        simp [show Nat.land X 0 = 0 from Nat.and_zero X] at this
        exact absurd this (by decide)
    rw [hTn, hSn] at hw
    -- any nonzero b, c contradict the accepting walk with no conditions
    refine walk_sound nT [] [] (by simp) (by simp) 1 1 (by decide) (by decide) (by simp) 64 _ 255 255 0
      (by decide) (by decide) hw (fun k => memM_255 _) (fun k => memM_255 _) (by simp)

end RootSound

namespace RootSound

/-- `checkLeaf_sound` for a profile given as a list -/
theorem checkLeaf_sound_list (prof : List Nat) (hp : ∀ x ∈ prof, x < 512) (h : Nat)
    (hchk : RootCheck.checkLeaf prof h = true)
    (b c : Fin prof.length → M3) (hbc : ∀ s, b s ≠ 0 ∧ c s ≠ 0)
    (hd : IsDecomp (fun s => toM3 (prof.get s)) b c) : False := by
  have e : List.ofFn (fun s : Fin prof.length => prof.get s) = prof := List.ofFn_get prof
  exact checkLeaf_sound (fun s => prof.get s) (fun s => hp _ (List.get_mem prof s)) h (by rw [e]; exact hchk) b c hbc hd

theorem checkAll_mem : ∀ (L : List (List Nat × Nat)), RootCheck.checkAll L = true →
    ∀ q ∈ L, RootCheck.checkLeaf q.1 q.2 = true
  | [], _, q, hq => by simp at hq
  | (p, h) :: rest, hL, q, hq => by
    simp only [RootCheck.checkAll, Bool.and_eq_true] at hL
    rcases List.mem_cons.mp hq with rfl | hq
    · exact hL.1
    · exact checkAll_mem rest hL.2 q hq

end RootSound
