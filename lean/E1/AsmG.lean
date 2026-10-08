module
public import R22Port.U_d41d8cd98f00
public import E1.Asm
/-! # The glue check in chunks

`glueChk Ss W` (`E1.Asm`) checks every block's header records in one `decide`; for a chain of thousands of blocks that one
declaration kept 56 GB of kernel terms (class 185).  `glueChkR Ss W a m` checks blocks `a .. a+m-1`; chunks are joined
(`glueChkR_join`) and the full range gives `glueChk` (`glueChkR_full`). -/
@[expose] public section
namespace E1S

/-- every header record of block `i` is glued to the later block named by `W[i]` -/
noncomputable def glueRow (Ss : List ℕ) (W : List (List ℕ)) (i : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1 Ss i j ((W.getD i []).getD j 0)) (E1.rd 8 (E1.bS2 (Ss.getD i 0)))

/-- blocks `a .. a + m - 1` -/
noncomputable def glueChkR (Ss : List ℕ) (W : List (List ℕ)) (a m : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b && glueRow Ss W (a + i)) m

theorem glueChkR_join (Ss : List ℕ) (W : List (List ℕ)) (a m k : ℕ)
    (h1 : glueChkR Ss W a m = true) (h2 : glueChkR Ss W (a + m) k = true) : glueChkR Ss W a (m + k) = true := by
  induction k with
  | zero => exact h1
  | succ k ih =>
    have h2' : (glueChkR Ss W (a + m) k && glueRow Ss W (a + m + k)) = true := h2
    rw [Bool.and_eq_true] at h2'
    show (glueChkR Ss W a (m + k) && glueRow Ss W (a + (m + k))) = true
    rw [Bool.and_eq_true, ← Nat.add_assoc]; exact ⟨ih h2'.1, h2'.2⟩

theorem glueChkR_full (Ss : List ℕ) (W : List (List ℕ)) (h : glueChkR Ss W 0 Ss.length = true) : glueChk Ss W = true := by
  have key : ∀ n, glueChkR Ss W 0 n = Nat.rec (motive := fun _ => Bool) true (fun i b => b && glueRow Ss W i) n := by
    intro n
    induction n with
    | zero => rfl
    | succ n ih =>
      show (glueChkR Ss W 0 n && glueRow Ss W (0 + n)) = (Nat.rec (motive := fun _ => Bool) true (fun i b => b && glueRow Ss W i) n
        && glueRow Ss W n)
      rw [ih, Nat.zero_add]
  rw [key] at h
  exact h

end E1S
