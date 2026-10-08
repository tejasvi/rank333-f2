module
public import R22Port.U_d41d8cd98f00
public import HC.RRData
public import HC.Transport
public import RT.K3eD_Cls
/-! # `rr_fact`: RR's class bounds as `RT.Fact` on a class table (flag 1 of `leaf2/HCLS.md`)

RR's element `c` and the class table's class `c` are the same subspace: the class tables (`RT.K3eD_Cls`, `RT.Cls_e490x`,
`RT.Cls_e150`) take each class's representative from `mm3_table.npz`, whose orbit `c` is RR's element `c`
(`FullTable_02_Wang`: "Element `i` is the file's orbit `i`").  The kernel checks this per table, as `K_c ⊆ span
wang_table[c]` (`subAll`, one `Nat` operation per class), so no symmetry is needed.

* `rr_fact_of CL (hsub : subAll CL = true) (hrr : RRAll) : ∀ c < 496, Fact (kM CL c) (rrLB c)`.
* `rr_fact_K3eD hrr`: the main search's table (`subAll_K3eD` by `decide +kernel`).
* `RRAll` itself (RR's claims, from `FullTable_03_Theorems`) is `HC.rr_all` in `HC.RRTable`. -/
@[expose] public section
namespace HC
open FullTable RT

def smallN (n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun c b => b && (wang_table[c]!).all (fun r => decide (r < 512))) n

theorem small_rec (n : Nat) (h : smallN n = true) : ∀ c < n, ∀ r ∈ wang_table[c]!, r < 512 := by
  unfold smallN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true
        (fun c b => b && (wang_table[c]!).all (fun r => decide (r < 512))) n &&
        (wang_table[n]!).all (fun r => decide (r < 512))) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hlt | heq
    · exact ih h'.1 c hlt
    · subst heq
      intro r hr
      have := List.all_eq_true.mp h'.2 r hr
      simpa using this

theorem smallN_496 : smallN 496 = true := by decide +kernel

theorem wang_small : ∀ c < 496, ∀ r ∈ wang_table[c]!, r < 512 := small_rec 496 smallN_496

/-- class `c`'s subspace lies in the span of RR's element `c`, for every `c < n` -/
def subN (CL n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun c b => b && subSpan (kM CL c) (wang_table[c]!)) n

def subAll (CL : Nat) : Bool := subN CL 496

theorem sub_rec (CL n : Nat) (h : subN CL n = true) : ∀ c < n, subSpan (kM CL c) (wang_table[c]!) = true := by
  unfold subN at h
  induction n with
  | zero => intro c hc; exact absurd hc (Nat.not_lt_zero c)
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Bool) true (fun c b => b && subSpan (kM CL c) (wang_table[c]!)) n &&
        subSpan (kM CL n) (wang_table[n]!)) = true := h
    rw [Bool.and_eq_true] at h'
    intro c hc
    rcases Nat.lt_succ_iff_lt_or_eq.mp hc with hlt | heq
    · exact ih h'.1 c hlt
    · subst heq; exact h'.2

/-- one class: RR's claim for element `c` gives `Fact` for any point mask inside `span wang_table[c]` -/
theorem rr_fact_one (m c : Nat) (hc : c < 496) (hsub : subSpan m (wang_table[c]!) = true) {N : Nat}
    (hal : TableAtLeast (conditions_of_element c) N) : Fact m N := by
  rw [conditions_of_element, table_is_the_campaign_table] at hal
  exact fact_of_tableAtLeast (wang_table[c]!) (wang_small c hc) m (subSpan_spec hsub) hal

/-- **`rr_fact`, generic in the class table.** -/
theorem rr_fact_of (CL : Nat) (hsub : subAll CL = true) (hrr : RRAll) : ∀ c < 496, Fact (kM CL c) (rrLB c) :=
  fun c hc => rr_fact_one (kM CL c) c hc (sub_rec CL 496 hsub c hc) (hrr c hc)

theorem subAll_K3eD : subAll K3eD_Cls.CL = true := by decide +kernel

/-- **`rr_fact` for the main search's class table `K3eD`.** -/
theorem rr_fact_K3eD (hrr : RRAll) : ∀ c < 496, Fact (kM K3eD_Cls.CL c) (rrLB c) :=
  rr_fact_of _ subAll_K3eD hrr

end HC
