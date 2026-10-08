module
public import R22Port.U_d41d8cd98f00
public import RT.Defs
public import S5.Masks
public import C3.Decomp
/-! # Soundness of the verified row table: `entry_sound`

`Fact m k`: every decomposition of `<3,3,3>` (first factors given by 9-bit codes) has at least `k` terms whose code is outside
the 512-bit point mask `m`.  `entry_sound`: if the class subspace `K_c` has `Fact (kM CL c) (lb c)` and the entry passes
`entryOK`, then its row has `Fact (dualM e) (R - cap)`.  Proof: the group element `h` of the entry maps every decomposition to
a decomposition (`C3.isDecomp_actN`); `h` is linear and maps the primal basis into `K_c`, so it maps the whole span, which is
the row's point set, into `K_c`; hence a term outside `K_c` after `h` was outside the row before. -/
@[expose] public section
set_option exponentiation.threshold 1024
namespace RT
open BC4 BC5 RootSound Matrix

theorem m512_bit (w : Nat) : M512.testBit w = decide (w < 512) := by
  rw [S5.m512_eq]; exact Nat.testBit_two_pow_sub_one 512 w

/-- `m` has bound `k` -/
def Fact (m k : Nat) : Prop := ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) →
  IsDecomp (fun s => toM3 (av s)) b c → k ≤ (Finset.univ.filter (fun s => m.testBit (av s) = false)).card

theorem fact_mono {m m' k k' : Nat} (hk : k' ≤ k)
    (hm : ∀ w, w < 512 → m'.testBit w = true → m.testBit w = true) (h : Fact m k) : Fact m' k' := by
  intro n av b c hav hd
  refine le_trans hk (le_trans (h n av b c hav hd) (Finset.card_le_card ?_))
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e : m'.testBit (av s)
  · rfl
  · rw [hm _ (hav s) e] at hs; exact absurd hs (by decide)

/-! ## Linearity of the group action and of parities -/

theorem toM3_xor (x y : Nat) : toM3 (x ^^^ y) = toM3 x + toM3 y := by
  ext i j
  simp only [toM3, Matrix.add_apply, S5.bitF_bf, Nat.testBit_xor, S5.bf_xor]

theorem actN_xor (t : Bool) (P Q x y : Nat) (hx : x < 512) (hy : y < 512) :
    C3.actN t P Q (x ^^^ y) = C3.actN t P Q x ^^^ C3.actN t P Q y := by
  apply C3.toM3_inj (C3.actN_lt _ _ _ _) (RootSound.TransBits.xor_lt _ _ (C3.actN_lt _ _ _ _) (C3.actN_lt _ _ _ _))
  rw [toM3_xor, C3.toM3_actN, C3.toM3_actN, C3.toM3_actN, toM3_xor]
  cases t
  · simp only [cond_false]; rw [Matrix.mul_add, Matrix.add_mul]
  · simp only [cond_true]; rw [Matrix.transpose_add, Matrix.mul_add, Matrix.add_mul]

theorem actN_zero (t : Bool) (P Q : Nat) : C3.actN t P Q 0 = 0 := by
  apply C3.toM3_inj (C3.actN_lt _ _ _ _) (by norm_num)
  rw [C3.toM3_actN]
  have h0 : toM3 0 = 0 := by ext i j; simp [toM3, bitF]
  cases t <;> simp [h0]

theorem par_xor (x y v : Nat) (hx : x < 512) (hy : y < 512) :
    par ((x ^^^ y) &&& v) = xor (par (x &&& v)) (par (y &&& v)) := by
  have hxy : x ^^^ y < 512 := RootSound.TransBits.xor_lt _ _ hx hy
  apply S5.bf_inj
  rw [S5.bf_xor, ← S5.dot_nv _ _ hxy, ← S5.dot_nv _ _ hx, ← S5.dot_nv _ _ hy]
  have : S5.nv (x ^^^ y) = S5.nv x + S5.nv y := by
    funext i; simp only [S5.nv, Pi.add_apply, S5.bitF_bf, Nat.testBit_xor, S5.bf_xor]
  rw [this, add_dotProduct]

theorem par_zero_and (v : Nat) : par (0 &&& v) = false := by
  rw [Nat.zero_and]; decide

/-! ## Class subspaces -/

theorem inK_spec (CL c w : Nat) : inK CL c w = true ↔ ∀ j < cN CL c, par (w &&& cV CL c j) = false := by
  unfold inK
  generalize cN CL c = n
  induction n with
  | zero => simp
  | succ n ih =>
    show (Nat.rec (motive := fun _ => Bool) true (fun j b => b && !par (w &&& cV CL c j)) n &&
      !par (w &&& cV CL c n)) = true ↔ _
    rw [Bool.and_eq_true, ih, Bool.not_eq_true']
    constructor
    · rintro ⟨h1, h2⟩ j hj
      rcases Nat.lt_succ_iff_lt_or_eq.mp hj with h | h
      · exact h1 j h
      · rw [h]; exact h2
    · intro h; exact ⟨fun j hj => h j (Nat.lt_succ_of_lt hj), h n (Nat.lt_succ_self n)⟩

theorem inK_xor {CL c x y : Nat} (hx : x < 512) (hy : y < 512) (h1 : inK CL c x = true) (h2 : inK CL c y = true) :
    inK CL c (x ^^^ y) = true := by
  rw [inK_spec] at h1 h2 ⊢
  intro j hj
  rw [par_xor x y _ hx hy, h1 j hj, h2 j hj]; rfl

theorem inK_zero (CL c : Nat) : inK CL c 0 = true := by
  rw [inK_spec]; intro j _; exact par_zero_and _

theorem kerM_testBit (f : Nat → Nat) (hf : ∀ j, f j < 512) (n w : Nat) (hw : w < 512) :
    (kerM f n).testBit w = true ↔ ∀ j < n, par (w &&& f j) = false := by
  unfold kerM
  induction n with
  | zero =>
    simp only [Nat.rec_zero]
    rw [m512_bit]; simp only [hw, decide_true, true_iff]; intro j hj; exact absurd hj (Nat.not_lt_zero j)
  | succ n ih =>
    show (Nat.rec (motive := fun _ => Nat) M512 (fun j S => S &&& perp (f j)) n &&& perp (f n)).testBit w = true ↔ _
    rw [Nat.testBit_and, Bool.and_eq_true, ih, S5.perp_bit _ _ (hf n) hw, Bool.not_eq_true']
    constructor
    · rintro ⟨h1, h2⟩ j hj
      rcases Nat.lt_succ_iff_lt_or_eq.mp hj with h | h
      · exact h1 j h
      · rw [h]; exact h2
    · intro h; exact ⟨fun j hj => h j (Nat.lt_succ_of_lt hj), h n (Nat.lt_succ_self n)⟩

theorem kerM_lt (f : Nat → Nat) (n w : Nat) (h : (kerM f n).testBit w = true) : w < 512 := by
  unfold kerM at h
  induction n with
  | zero =>
    simp only [Nat.rec_zero] at h
    rw [m512_bit, decide_eq_true_eq] at h; exact h
  | succ n ih =>
    have h' : (Nat.rec (motive := fun _ => Nat) M512 (fun j S => S &&& perp (f j)) n &&& perp (f n)).testBit w = true := h
    rw [Nat.testBit_and, Bool.and_eq_true] at h'
    exact ih h'.1

theorem cV_lt (CL c j : Nat) : cV CL c j < 512 := Nat.mod_lt _ (by norm_num)
theorem eV_lt (e i : Nat) : eV e i < 512 := Nat.mod_lt _ (by norm_num)

theorem kM_testBit (CL c w : Nat) (hw : w < 512) : (kM CL c).testBit w = inK CL c w := by
  have h := kerM_testBit (cV CL c) (cV_lt CL c) (cN CL c) w hw
  cases e : inK CL c w
  · cases e2 : (kM CL c).testBit w
    · rfl
    · exact absurd ((inK_spec CL c w).mpr (h.mp e2)) (by rw [e]; exact Bool.false_ne_true)
  · exact h.mpr ((inK_spec CL c w).mp e)

/-! ## Span induction -/

theorem spanRec_ind (e : Nat) (Pr : Nat → Prop) (h0 : Pr 0) (hgen : ∀ i < eD e, Pr (eV e i))
    (hxor : ∀ x y, x < 512 → y < 512 → Pr x → Pr y → Pr (x ^^^ y)) :
    ∀ k ≤ eD e, ∀ w < 512,
      (Nat.rec (motive := fun _ => Nat) 1 (fun i S => S ||| RootSound.TransBits.trans S (eV e i)) k).testBit w = true →
      Pr w := by
  intro k
  induction k with
  | zero =>
    intro _ w _ h
    simp only [Nat.rec_zero] at h
    have hw0 : w = 0 := by
      by_contra hne
      rw [Nat.testBit_one_eq_true_iff_self_eq_zero] at h; exact hne h
    rw [hw0]; exact h0
  | succ k ih =>
    intro hk w hw h
    have h' : (Nat.rec (motive := fun _ => Nat) 1 (fun i S => S ||| RootSound.TransBits.trans S (eV e i)) k |||
        RootSound.TransBits.trans (Nat.rec (motive := fun _ => Nat) 1
          (fun i S => S ||| RootSound.TransBits.trans S (eV e i)) k) (eV e k)).testBit w = true := h
    rw [Nat.testBit_or, Bool.or_eq_true, RootSound.TransBits.trans_testBit _ _ _ (eV_lt e k) hw] at h'
    have hk' : k ≤ eD e := Nat.le_of_succ_le hk
    rcases h' with h1 | h2
    · exact ih hk' w hw h1
    · have hx : w ^^^ eV e k < 512 := RootSound.TransBits.xor_lt _ _ hw (eV_lt e k)
      have := hxor _ _ hx (eV_lt e k) (ih hk' _ hx h2) (hgen k (Nat.lt_of_succ_le hk))
      rwa [Nat.xor_assoc, Nat.xor_self, Nat.xor_zero] at this

theorem spanM_ind (e : Nat) (Pr : Nat → Prop) (h0 : Pr 0) (hgen : ∀ i < eD e, Pr (eV e i))
    (hxor : ∀ x y, x < 512 → y < 512 → Pr x → Pr y → Pr (x ^^^ y)) (w : Nat) (h : (spanM e).testBit w = true) :
    w < 512 ∧ Pr w := by
  have h' : (M512 &&& Nat.rec (motive := fun _ => Nat) 1
      (fun i S => S ||| RootSound.TransBits.trans S (eV e i)) (eD e)).testBit w = true := h
  rw [Nat.testBit_and, Bool.and_eq_true, m512_bit, decide_eq_true_eq] at h'
  exact ⟨h'.1, spanRec_ind e Pr h0 hgen hxor (eD e) le_rfl w h'.1 h'.2⟩

/-! ## The entry theorem -/

theorem mapsIn_spec (CL e : Nat) (h : mapsIn CL e = true) :
    ∀ i < eD e, inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (eV e i)) = true := by
  unfold mapsIn at h
  revert h
  generalize eD e = n
  induction n with
  | zero => intro _ i hi; exact absurd hi (Nat.not_lt_zero _)
  | succ n ih =>
    intro h i hi
    have h' : (Nat.rec (motive := fun _ => Bool) true
        (fun i b => b && inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (eV e i))) n &&
        inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (eV e n))) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | heq
    · exact ih h'.1 i hlt
    · rw [heq]; exact h'.2

/-- **Entry theorem.** -/
theorem entry_sound (R CL e : Nat) (hcls : Fact (kM CL (eCls e)) (cLB CL (eCls e))) (h : entryOK R CL e = true) :
    Fact (dualM e) (R - eCap e) := by
  unfold entryOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, Nat.ble_eq] at h
  obtain ⟨⟨⟨⟨⟨_, hsd⟩, hP⟩, hQ⟩, hmap⟩, hR⟩ := h
  have hgen := mapsIn_spec CL e hmap
  intro n av b c hav hd
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN (t := eT e) hd hP hQ
  have hk := hcls n (fun s => C3.actN (eT e) (eP e) (eQ e) (av s)) b' c' (fun s => C3.actN_lt _ _ _ _) hd'
  refine le_trans (by omega) (le_trans hk (Finset.card_le_card ?_))
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e2 : (dualM e).testBit (av s)
  · rfl
  · exfalso
    rw [← hsd] at e2
    obtain ⟨_, hin⟩ := spanM_ind e (fun w => inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) w) = true)
      (by show inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) 0) = true
          rw [actN_zero]; exact inK_zero _ _) hgen
      (fun x y hx hy h1 h2 => by
        show inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (x ^^^ y)) = true
        rw [actN_xor _ _ _ _ _ hx hy]; exact inK_xor (C3.actN_lt _ _ _ _) (C3.actN_lt _ _ _ _) h1 h2)
      (av s) e2
    have hin' : inK CL (eCls e) (C3.actN (eT e) (eP e) (eQ e) (av s)) = true := hin
    rw [kM_testBit _ _ _ (C3.actN_lt _ _ _ _), hin'] at hs
    exact absurd hs (by decide)

end RT
