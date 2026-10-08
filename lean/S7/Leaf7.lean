module
public import R22Port.U_d41d8cd98f00
public import S7.Check7
public import S6.Leaf6
/-! # Leaf and batch theorems for BranchCheck v7s (stream format v6)

`leafS7_sound`: an accepted v6 leaf record has no decomposition on its domain.  A Lemma G leaf (flag set, which the
checker allows only with `dom = ALLNZ`) is refuted outright when `∑ rank a_s < 27` (`split_flattening`), and otherwise
its tree is checked with the Lemma G masks (`lg_root` gives the root state).  `batch7_sound`: every leaf of an
accepted batch.  S5's `leaves` (the batch tree format is v5's) and `noDecomp_full` apply unchanged. -/
@[expose] public section
namespace S7
open BC4 BC5 BC6 BC6s S5 S6 RootSound Matrix

theorem leafS7_eq (R : Nat) : BC7s.leafS R =
    (Nat.ble (rd 6 R) 31 &&
      ((Nat.beq (rd 1 (sk 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R))) 1 &&
          Nat.beq (rd 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) 0) && Nat.blt (rkSum (leafT R) (leafN R)) 27 ||
       (BC7s.checkS 64 (leafT R) (mkSSP (leafT R) (leafN R)) (Nat.pred (Nat.shiftLeft 1 (leafN R)))
          (cond (Nat.beq (rd 1 (sk 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R))) 1 &&
              Nat.beq (rd 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) 0)
            (needP (leafT R) (leafN R) (Nat.sub (rkSum (leafT R) (leafN R)) 27)) 0) [] [] (leafDom6 R)
          (cond (Nat.beq (rd 1 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) 0)
            (sk 2 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)) (sk 514 (sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R)))).1)) := rfl

/-- **Leaf theorem (v6 stream format).** -/
theorem leafS7_sound (R : Nat) (h : BC7s.leafS R = true) : NoDecomp (leafT R) (leafN R) (leafDom6 R) := by
  rintro ⟨b, c, hbc, hd⟩
  rw [leafS7_eq] at h
  set R1 := sk (Nat.add 6 (Nat.mul 9 (rd 6 R))) R with hR1
  set dm := Nat.beq (rd 1 R1) 0 with hdm
  set lg := Nat.beq (rd 1 (sk 1 R1)) 1 && dm with hlg
  set RS := rkSum (leafT R) (leafN R) with hRS
  have epred : Nat.pred (Nat.shiftLeft 1 (leafN R)) = 2 ^ leafN R - 1 := by
    show 1 <<< leafN R - 1 = _; rw [Nat.one_shiftLeft]
  rw [epred] at h
  rw [Bool.and_eq_true, Nat.ble_eq, Bool.or_eq_true] at h
  obtain ⟨hn, h⟩ := h
  -- a Lemma G leaf has the full domain
  have hfull : lg = true → leafDom6 R = ALLNZ := by
    intro hl
    have hd' : dm = true := by rw [hlg, Bool.and_eq_true] at hl; exact hl.2
    show cond dm ALLNZ _ = ALLNZ
    rw [hd', cond_true]
  have hdfull : lg = true → ∀ X, X < 512 → ALLNZ.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (Finset.range (leafN R)).filter (fun t => par (aT (leafT R) t &&& X) = true),
        vecMulVec (nv (b t)) (nv (c t)) := by
    intro hl X hX hX'
    exact hd X hX (by rw [hfull hl]; exact hX')
  rcases h with h | h
  · -- refuted outright: the split flattening has rank 27
    rw [Bool.and_eq_true, Nat.blt_eq] at h
    obtain ⟨hl, hlt⟩ := h
    have := (lg_root (leafT R) (leafN R) b c hbc (hdfull hl)).1
    omega
  · have hlgok : LGok (leafN R) (cond lg (needP (leafT R) (leafN R) (Nat.sub RS 27)) 0) b c := by
      cases hl : lg
      · rw [cond_false]; exact lgok_zero _ b c hbc
      · rw [cond_true]
        exact (lg_root (leafT R) (leafN R) b c hbc (hdfull hl)).2
    exact checkS7_sound (leafT R) (leafN R) (leafDom6 R) _ hn 64 _ [] [] _ h b c (S5.inv_root _ _ _ b c hbc hd) hlgok

theorem batch7_leaves : ∀ fuel D, BC7s.batch fuel D = true → ∀ R ∈ leaves fuel D, BC7s.leafS R = true := by
  intro fuel
  induction fuel with
  | zero => intro D h; exact absurd h Bool.false_ne_true
  | succ fuel ih =>
    intro D h R hR
    have hb : BC7s.batch (fuel + 1) D = cond (Nat.beq (rd 1 D) 1) (BC7s.leafS (sk 1 D))
        (BC7s.batch fuel (rd (rd 24 (sk 1 D)) (sk 25 D)) && BC7s.batch fuel (sk (Nat.add 25 (rd 24 (sk 1 D))) D)) := rfl
    have hl : leaves (fuel + 1) D = cond (Nat.beq (rd 1 D) 1) [sk 1 D]
        (leaves fuel (rd (rd 24 (sk 1 D)) (sk 25 D)) ++ leaves fuel (sk (Nat.add 25 (rd 24 (sk 1 D))) D)) := rfl
    rw [hb] at h; rw [hl] at hR
    revert h hR
    cases e : Nat.beq (rd 1 D) 1
    · rw [cond_false, cond_false]
      intro h hR
      rw [Bool.and_eq_true] at h
      rcases List.mem_append.mp hR with h1 | h1
      · exact ih _ h.1 R h1
      · exact ih _ h.2 R h1
    · rw [cond_true, cond_true]
      intro h hR
      rw [List.mem_singleton.mp hR]; exact h

/-- **Batch theorem (v7).** Every leaf of an accepted batch has no decomposition. -/
theorem batch7_sound (fuel D : Nat) (h : BC7s.batch fuel D = true) :
    ∀ R ∈ leaves fuel D, NoDecomp (leafT R) (leafN R) (leafDom6 R) :=
  fun R hR => leafS7_sound R (batch7_leaves fuel D h R hR)

end S7
