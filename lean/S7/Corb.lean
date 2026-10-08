module
public import R22Port.U_d41d8cd98f00
public import S6.LG
public import BC7Tables
/-! # The GL3 pair step (v7)

`(a, b, c) ↦ (a, b S, S⁻¹ c)` maps decompositions to decompositions (`S5.sym_sum`) and keeps ranks (`sym_move`).
v6's `sym` step moves `b_t` into `ORBM` (`S6.sym_transform_rk`).  A second move by an element of `Stab(b_t)` keeps `b_t`
and moves `c_t` into `CORB[b_t]` (`corb_exists`, from the kernel-checked tables `stb_fact`, `orb15_fact`).
**`sym_transform7`**: at the root, any decomposition can be moved so that `b_t ∈ ORBM` and `c_t ∈ CORB[b_t]`, with the
ranks of all factors unchanged (so the Lemma G masks still hold). -/
@[expose] public section
namespace S7
open BC4 BC5 BC6 BC6s S5 S6 RootSound Matrix BC7T

def allQ (l : List (Nat × List (Nat × Nat))) (f : Nat × List (Nat × Nat) → Bool) : Bool :=
  @List.rec (Nat × List (Nat × Nat)) (fun _ => Bool) true (fun q _ ih => f q && ih) l
def anyQ (l : List (Nat × List (Nat × Nat))) (f : Nat × List (Nat × Nat) → Bool) : Bool :=
  @List.rec (Nat × List (Nat × Nat)) (fun _ => Bool) false (fun q _ ih => f q || ih) l

theorem allQ_spec {l : List (Nat × List (Nat × Nat))} {f : Nat × List (Nat × Nat) → Bool} (h : allQ l f = true) :
    ∀ q ∈ l, f q = true := by
  induction l with
  | nil => intro q hq; exact absurd hq List.not_mem_nil
  | cons q0 l ih =>
    have h' : (f q0 && allQ l f) = true := h
    rw [Bool.and_eq_true] at h'
    intro q hq
    rcases List.mem_cons.mp hq with e | e
    · rw [e]; exact h'.1
    · exact ih h'.2 q e

theorem anyQ_spec {l : List (Nat × List (Nat × Nat))} {f : Nat × List (Nat × Nat) → Bool} (h : anyQ l f = true) :
    ∃ q ∈ l, f q = true := by
  induction l with
  | nil => have e : anyQ [] f = false := rfl; rw [e] at h; exact absurd h (by decide)
  | cons q0 l ih =>
    have h' : (f q0 || anyQ l f) = true := h
    rw [Bool.or_eq_true] at h'
    rcases h' with e | e
    · exact ⟨q0, List.mem_cons_self, e⟩
    · obtain ⟨q, hq, hf⟩ := ih e; exact ⟨q, List.mem_cons_of_mem _ hq, hf⟩

/-- the listed stabilizer of `q.1`: every element fixes `q.1` and comes with its inverse, and every nonzero `c` is moved
into `CORB[q.1]` by some listed element -/
def stbOK (q : Nat × List (Nat × Nat)) : Bool :=
  allL q.2 (fun p => mul3 q.1 p.1 == q.1 && mul3 p.1 p.2 == 273) &&
    allLT 512 (fun w => w == 0 || anyL q.2 (fun p => (corbM q.1).testBit (mul3 p.2 w)))

theorem stb_fact : allQ STB stbOK = true := by decide +kernel
theorem orb15_fact : allLT 512 (fun v => !(ORBM.testBit v) || v == 0 || anyQ STB (fun q => q.1 == v)) = true := by
  decide +kernel

theorem corb_exists (v w : Nat) (hv : ORBM.testBit v = true) (hv0 : v ≠ 0) (hvl : v < 512) (hw : w < 512) (hw0 : w ≠ 0) :
    ∃ p : Nat × Nat, mul3 v p.1 = v ∧ mul3 p.1 p.2 = 273 ∧ (corbM v).testBit (mul3 p.2 w) = true := by
  have h1 := allLT_spec orb15_fact v hvl
  have hv0' : (v == 0) = false := by simpa using hv0
  rw [hv, hv0'] at h1
  simp only [Bool.not_true, Bool.false_or] at h1
  obtain ⟨q, hq, hqv⟩ := anyQ_spec h1
  rw [beq_iff_eq] at hqv
  have h2 := allQ_spec stb_fact q hq
  unfold stbOK at h2
  rw [Bool.and_eq_true] at h2
  have h3 := allLT_spec h2.2 w hw
  have hw0' : (w == 0) = false := by simpa using hw0
  rw [hw0', Bool.false_or] at h3
  obtain ⟨p, hp, hpc⟩ := anyL_spec h3
  have h4 := allL_spec h2.1 p hp
  rw [Bool.and_eq_true, beq_iff_eq, beq_iff_eq] at h4
  rw [hqv] at h4 hpc
  exact ⟨p, h4.1, h4.2, hpc⟩

/-- one GL3 move `(b, c) ↦ (b S, S⁻¹ c)` keeps the root state and the ranks -/
theorem sym_move {T n dom ACT : Nat} {b c : Nat → Nat} (hbc : BC n b c) (hd : HD T n dom b c ACT []) (p : Nat × Nat)
    (hinv : mul3 p.1 p.2 = 273) :
    BC n (fun u => mul3 (b u) p.1) (fun u => mul3 p.2 (c u)) ∧
      HD T n dom (fun u => mul3 (b u) p.1) (fun u => mul3 p.2 (c u)) ACT [] ∧
      ∀ u, u < n → rk3 (mul3 (b u) p.1) = rk3 (b u) ∧ rk3 (mul3 p.2 (c u)) = rk3 (c u) := by
  have hSS : toM3 p.1 * toM3 p.2 = 1 := by rw [← toM3_mul3, hinv, toM3_273]
  have hSS' : toM3 p.2 * toM3 p.1 = 1 := mul_eq_one_comm.mp hSS
  have hlt : ∀ x y, mul3 x y < 512 := fun x y => lt_of_lt_of_eq (mkB_lt _ 9) (by norm_num)
  refine ⟨?_, ?_, ?_⟩
  · intro u hu
    obtain ⟨h1, h2, h3, h4⟩ := hbc u hu
    refine ⟨Nat.pos_of_ne_zero (fun e => ?_), hlt _ _, Nat.pos_of_ne_zero (fun e => ?_), hlt _ _⟩
    · have h0 : toM3 (b u) * toM3 p.1 = 0 := by rw [← toM3_mul3]; simp only at e; rw [e, toM3_zero]
      have : toM3 (b u) = 0 := by
        rw [← Matrix.mul_one (toM3 (b u)), ← hSS, ← Matrix.mul_assoc, h0, Matrix.zero_mul]
      have := eq_zero_of_toM3 _ h2 this; omega
    · have h0 : toM3 p.2 * toM3 (c u) = 0 := by rw [← toM3_mul3]; simp only at e; rw [e, toM3_zero]
      have : toM3 (c u) = 0 := by
        rw [← Matrix.one_mul (toM3 (c u)), ← hSS, Matrix.mul_assoc, h0, Matrix.mul_zero]
      have := eq_zero_of_toM3 _ h4 this; omega
  · intro X hX hdom
    have h := hd X hX hdom
    have e0 : resM X [] = TX (toM3 X) := by simp [resM]
    rw [e0] at h ⊢
    exact sym_sum (toM3 X) _ b c p.1 p.2 hSS' h
  · intro u hu
    obtain ⟨_, h2, _, h4⟩ := hbc u hu
    constructor
    · rw [rk3_rank _ (hlt _ _), rk3_rank _ h2, toM3_mul3,
        Matrix.rank_mul_eq_left_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hSS)]
    · rw [rk3_rank _ (hlt _ _), rk3_rank _ h4, toM3_mul3,
        Matrix.rank_mul_eq_right_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hSS')]

/-- **GL3 pair step.** At the root, any decomposition can be moved so that `b_t ∈ ORBM` and `c_t ∈ CORB[b_t]`, with every
factor's rank unchanged. -/
theorem sym_transform7 {T n dom ACT : Nat} {b c : Nat → Nat} (hbc : BC n b c) (hd : HD T n dom b c ACT []) (t : Nat)
    (ht : t < n) : ∃ b' c' : Nat → Nat, BC n b' c' ∧ HD T n dom b' c' ACT [] ∧ ORBM.testBit (b' t) = true ∧
      (corbM (b' t)).testBit (c' t) = true ∧ ∀ u, u < n → rk3 (b' u) = rk3 (b u) ∧ rk3 (c' u) = rk3 (c u) := by
  obtain ⟨b1, c1, hbc1, hd1, ho1, hrk1⟩ := sym_transform_rk hbc hd t ht
  obtain ⟨hb10, hb1l, hc10, hc1l⟩ := hbc1 t ht
  obtain ⟨p, hfix, hinv, hcorb⟩ := corb_exists (b1 t) (c1 t) ho1 (by omega) hb1l hc1l (by omega)
  obtain ⟨hbc2, hd2, hrk2⟩ := sym_move hbc1 hd1 p hinv
  refine ⟨_, _, hbc2, hd2, ?_, ?_, ?_⟩
  · show ORBM.testBit (mul3 (b1 t) p.1) = true
    rw [hfix]; exact ho1
  · show (corbM (mul3 (b1 t) p.1)).testBit (mul3 p.2 (c1 t)) = true
    rw [hfix]; exact hcorb
  · intro u hu
    obtain ⟨e1, e2⟩ := hrk2 u hu
    obtain ⟨f1, f2⟩ := hrk1 u hu
    exact ⟨e1.trans f1, e2.trans f2⟩

end S7
