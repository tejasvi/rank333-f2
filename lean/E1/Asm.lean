module
public import R22Port.U_d41d8cd98f00
public import E1.Block
/-! # Assembling a chain of E1 blocks from decide-checked pieces

* `blkChk C sl UB UBR Ss a m`: blocks `a .. a+m-1` of the list `Ss` are accepted.  Checked by `decide` in chunks and
  joined (`blkChk_join`); `blkChk_spec` gives the chain hypothesis.
* `glueChk Ss W`: every header record `j` of every block `i` is glued (`E1.glue` or `E1.glue0`) to the later block
  `W[i][j]`; `glueChk_spec` gives the chain hypothesis. -/
@[expose] public section
namespace E1S

/-- blocks `a .. a + m - 1` of `Ss` are accepted -/
noncomputable def blkChk (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (Ss : List ℕ) (a m : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b && E1.block C sl UB UBR (Ss.getD (a + i) 0)) m

theorem blkChk_join (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (Ss : List ℕ) (a m k : ℕ)
    (h1 : blkChk C sl UB UBR Ss a m = true) (h2 : blkChk C sl UB UBR Ss (a + m) k = true) :
    blkChk C sl UB UBR Ss a (m + k) = true := by
  induction k with
  | zero => exact h1
  | succ k ih =>
    have h2' : (blkChk C sl UB UBR Ss (a + m) k && E1.block C sl UB UBR (Ss.getD (a + m + k) 0)) = true := h2
    rw [Bool.and_eq_true] at h2'
    show (blkChk C sl UB UBR Ss a (m + k) && E1.block C sl UB UBR (Ss.getD (a + (m + k)) 0)) = true
    rw [Bool.and_eq_true, ← Nat.add_assoc]; exact ⟨ih h2'.1, h2'.2⟩

theorem blkChk_spec (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (Ss : List ℕ) (m : ℕ) (h : blkChk C sl UB UBR Ss 0 m = true) :
    ∀ i < m, E1.block C sl UB UBR (Ss.getD i 0) = true := by
  induction m with
  | zero => intro i hi; omega
  | succ m ih =>
    intro i hi
    have h' : (blkChk C sl UB UBR Ss 0 m && E1.block C sl UB UBR (Ss.getD (0 + m) 0)) = true := h
    rw [Bool.and_eq_true, Nat.zero_add] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
    · exact ih h'.1 i hlt
    · exact h'.2

/-- header record `j` of block `S` -/
noncomputable def recOf (S j : ℕ) : ℕ := (E1.hdr (E1.bS2 S)).2.1 / 2 ^ (540 * j) % 2 ^ 540

/-- record `j` of block `i` is glued to block `i'` -/
noncomputable def glue1 (Ss : List ℕ) (i j i' : ℕ) : Bool :=
  Nat.blt i i' && Nat.blt i' Ss.length &&
    (E1.glue (recOf (Ss.getD i 0) j) (Ss.getD i' 0) || E1.glue0 (recOf (Ss.getD i 0) j) (Ss.getD i' 0))

/-- every header record of every block is glued to the later block named by the witness table `W` -/
noncomputable def glueChk (Ss : List ℕ) (W : List (List ℕ)) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b &&
    Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1 Ss i j ((W.getD i []).getD j 0))
      (E1.rd 8 (E1.bS2 (Ss.getD i 0)))) Ss.length

theorem glue1_spec (Ss : List ℕ) (i j i' : ℕ) (h : glue1 Ss i j i' = true) :
    i < i' ∧ i' < Ss.length ∧ (E1.glue (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true ∨
      E1.glue0 (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true) := by
  unfold glue1 at h
  simp only [Bool.and_eq_true, Bool.or_eq_true, Nat.blt_eq] at h
  exact ⟨h.1.1, h.1.2, h.2⟩

theorem glueChk_spec (Ss : List ℕ) (W : List (List ℕ)) (h : glueChk Ss W = true) :
    ∀ i < Ss.length, ∀ j < E1.rd 8 (E1.bS2 (Ss.getD i 0)), ∃ i', i < i' ∧ i' < Ss.length ∧
      (E1.glue ((E1.hdr (E1.bS2 (Ss.getD i 0))).2.1 / 2 ^ (540 * j) % 2 ^ 540) (Ss.getD i' 0) = true ∨
       E1.glue0 ((E1.hdr (E1.bS2 (Ss.getD i 0))).2.1 / 2 ^ (540 * j) % 2 ^ 540) (Ss.getD i' 0) = true) := by
  have hrows : ∀ i < Ss.length, Nat.rec (motive := fun _ => Bool) true
      (fun j c => c && glue1 Ss i j ((W.getD i []).getD j 0)) (E1.rd 8 (E1.bS2 (Ss.getD i 0))) = true := by
    unfold glueChk at h
    generalize Ss.length = L at h
    intro i hi
    induction L with
    | zero => omega
    | succ L ih =>
      have h' := h
      simp only [Bool.and_eq_true] at h'
      rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
      · exact ih h'.1 hlt
      · exact h'.2
  intro i hi j hj
  have hr := hrows i hi
  generalize E1.rd 8 (E1.bS2 (Ss.getD i 0)) = K at hr hj
  induction K with
  | zero => omega
  | succ K ih =>
    have h' := hr
    simp only [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hj with hlt | rfl
    · exact ih h'.1 hlt
    · exact ⟨_, glue1_spec Ss i j _ h'.2⟩

end E1S
