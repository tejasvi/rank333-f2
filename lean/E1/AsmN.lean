module
public import R22Port.U_d41d8cd98f00
public import E1.AsmG
/-! # The block and glue checks with recursor walks (long chains)

`blkChk` and `glueChkR` reach block `i` of the chain through `List.getD` and test `i' < Ss.length`.  The kernel unfolds
`getD` through its structural-recursion compilation, so every step of the walk builds `brecOn` terms; on a chain of 146,626
blocks (class 321) a block module of 5 blocks took 120-200 s and 20-35 GB.  Here the walk is one `List.rec` with a
`Nat.casesOn` per step (`nthD`), and the length is a parameter `N` with `N = Ss.length` proved once (`lenR`).
`blkChkN_eq` and `glueChkRN_eq` give back the original statements, so the chain modules are unchanged. -/
@[expose] public section
namespace E1S

/-- `l.getD i d`, by one recursor walk -/
def nthD {α : Type} (d : α) : List α → ℕ → α :=
  @List.rec α (fun _ => ℕ → α) (fun _ => d) (fun a _ ih i => Nat.casesOn (motive := fun _ => α) i a (fun j => ih j))

theorem nthD_eq {α : Type} (d : α) : ∀ (l : List α) (i : ℕ), nthD d l i = l.getD i d := by
  intro l
  induction l with
  | nil => intro i; rfl
  | cons a l ih =>
    intro i
    cases i with
    | zero => rfl
    | succ j => show nthD d l j = (a :: l).getD (j + 1) d; rw [ih]; rfl

/-- `l.length`, by one recursor walk -/
def lenR {α : Type} : List α → ℕ := @List.rec α (fun _ => ℕ) 0 (fun _ _ ih => Nat.succ ih)

theorem lenR_eq {α : Type} : ∀ l : List α, lenR l = l.length := by
  intro l
  induction l with
  | nil => rfl
  | cons a l ih => show Nat.succ (lenR l) = l.length + 1; rw [ih]

/-- `blkChk` with `nthD` -/
noncomputable def blkChkN (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (Ss : List ℕ) (a m : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b && E1.block C sl UB UBR (nthD 0 Ss (a + i))) m

theorem blkChkN_eq (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (Ss : List ℕ) (a : ℕ) :
    ∀ m, blkChkN C sl UB UBR Ss a m = blkChk C sl UB UBR Ss a m := by
  intro m
  induction m with
  | zero => rfl
  | succ m ih =>
    show (blkChkN C sl UB UBR Ss a m && E1.block C sl UB UBR (nthD 0 Ss (a + m))) =
      (blkChk C sl UB UBR Ss a m && E1.block C sl UB UBR (Ss.getD (a + m) 0))
    rw [ih, nthD_eq]

/-- `glue1` with `nthD` and the length `N` -/
noncomputable def glue1N (Ss : List ℕ) (N i j i' : ℕ) : Bool :=
  Nat.blt i i' && Nat.blt i' N &&
    (E1.glue (recOf (nthD 0 Ss i) j) (nthD 0 Ss i') || E1.glue0 (recOf (nthD 0 Ss i) j) (nthD 0 Ss i'))

theorem glue1N_eq (Ss : List ℕ) (N i j i' : ℕ) (hN : N = Ss.length) : glue1N Ss N i j i' = glue1 Ss i j i' := by
  unfold glue1N glue1; rw [hN, nthD_eq, nthD_eq]

/-- `glueRow` with `nthD` -/
noncomputable def glueRowN (Ss : List ℕ) (W : List (List ℕ)) (N i : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1N Ss N i j (nthD 0 (nthD [] W i) j))
    (E1.rd 8 (E1.bS2 (nthD 0 Ss i)))

theorem glueRowN_eq (Ss : List ℕ) (W : List (List ℕ)) (N i : ℕ) (hN : N = Ss.length) :
    glueRowN Ss W N i = glueRow Ss W i := by
  unfold glueRowN glueRow
  rw [nthD_eq 0 Ss i]
  generalize E1.rd 8 (E1.bS2 (Ss.getD i 0)) = K
  induction K with
  | zero => rfl
  | succ K ih =>
    show (Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1N Ss N i j (nthD 0 (nthD [] W i) j)) K &&
        glue1N Ss N i K (nthD 0 (nthD [] W i) K)) =
      (Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1 Ss i j ((W.getD i []).getD j 0)) K &&
        glue1 Ss i K ((W.getD i []).getD K 0))
    rw [ih, glue1N_eq Ss N i K _ hN, nthD_eq, nthD_eq]

/-- `glueChkR` with `nthD` -/
noncomputable def glueChkRN (Ss : List ℕ) (W : List (List ℕ)) (N a m : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b && glueRowN Ss W N (a + i)) m

theorem glueChkRN_eq (Ss : List ℕ) (W : List (List ℕ)) (N a : ℕ) (hN : N = Ss.length) :
    ∀ m, glueChkRN Ss W N a m = glueChkR Ss W a m := by
  intro m
  induction m with
  | zero => rfl
  | succ m ih =>
    show (glueChkRN Ss W N a m && glueRowN Ss W N (a + m)) = (glueChkR Ss W a m && glueRow Ss W (a + m))
    rw [ih, glueRowN_eq Ss W N _ hN]

/-- the length of a chain, by `lenR` (one recursor walk) -/
theorem len_of_lenR (Ss : List ℕ) (N : ℕ) (h : Nat.beq (lenR Ss) N = true) : N = Ss.length := by
  rw [← lenR_eq]; exact (Nat.eq_of_beq_eq_true h).symm

end E1S
