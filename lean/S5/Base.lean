module
public import R22Port.U_bc442e055dce
public import BranchCheck5
public import Mathlib.Tactic
/-! # Soundness of BranchCheck v5: basic kernel-loop helpers -/
@[expose] public section
namespace S5
open BC4 BC5

theorem ndiv (x y : Nat) : Nat.div x y = x / y := rfl
theorem nmod (x y : Nat) : Nat.mod x y = x % y := rfl

theorem bit_eq (n i : Nat) : bit n i = n.testBit i := by
  unfold bit
  have h1 : Nat.land (Nat.shiftRight n i) 1 = n / 2 ^ i % 2 := by
    show (n >>> i) &&& 1 = _
    rw [Nat.shiftRight_eq_div_pow, Nat.and_one_is_mod]
  rw [h1, Nat.testBit_eq_decide_div_mod_eq]
  rcases Nat.mod_two_eq_zero_or_one (n / 2 ^ i) with h | h <;> rw [h] <;> rfl

/-- `f i` for all `i < n`, as one recursor loop (cheap for the kernel) -/
def allLT (n : Nat) (f : Nat → Bool) : Bool := @Nat.rec (fun _ => Bool) true (fun k ih => f k && ih) n

theorem allLT_spec {n : Nat} {f : Nat → Bool} (h : allLT n f = true) : ∀ i < n, f i = true := by
  induction n with
  | zero => intro i hi; exact absurd hi (Nat.not_lt_zero _)
  | succ k ih =>
    intro i hi
    have h' : (f k && allLT k f) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | heq
    · exact ih h'.2 i hlt
    · subst heq; exact h'.1

/-- parity of bits `0 … k-1` -/
def xorBits (v k : Nat) : Bool := @Nat.rec (fun _ => Bool) false (fun i ih => xor ih (v.testBit i)) k
/-- number of set bits among `0 … k-1` -/
def cntB (x k : Nat) : Nat := @Nat.rec (fun _ => Nat) 0 (fun i ih => ih + (x.testBit i).toNat) k

/-- the number with bits `f 0, …, f (k-1)` -/
def mkB (f : Nat → Bool) (k : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun i ih => ih ||| (bif f i then 2 ^ i else 0)) k

/-- `gather` without the shift: `gather P j = gcore ((P >>> j) &&& REP18)` -/
def gcore (x : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.mul x MAGIC) 144) 511

theorem gather_eq (P j : Nat) : gather P j = gcore ((P >>> j) &&& REP18) := rfl

end S5
