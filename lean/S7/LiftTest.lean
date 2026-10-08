module
public import R22Port.U_d41d8cd98f00
public import S7.SatCheck
/-! # The rank-1 test of SAT leaves: `S7L.liftTest` and `S7L.liftTest_sound : LiftTest liftTest`

The certificate `w` of a SAT leaf is 7 bits `nH`, then `nH` functionals `h` of 81 bits each: entry `(y, z)` of `h` is bit
`9y + z`, and `⟨h, M⟩ = Σ_{y,z} h_{yz} M_{yz}`.  The generator gives a basis of the annihilator of
`span{b_e c_eᵀ : e ∈ asg}`; the test checks only what soundness needs:
* `orthOK H asg`: every `h` kills every `b_e c_eᵀ` (`⟨h, b cᵀ⟩ = par (gh h b ∧ c)` with `gh h b = bᵀ h`, `ip_vmv`);
* `noR1 H Y`: for all nonzero `u, v` some `h` has `⟨h, u vᵀ⟩ ≠ ⟨h, T(Y)⟩`; for each `u` all `v` are handled at once as a
  512-bit mask cut by `nperp (uᵀ h)` or its complement (`maskEmpty`), which stops when the mask is empty.
A lift `T(Y) + Σ_{e ∈ l} b_e c_eᵀ = u vᵀ` (`l` a sublist of `asg`) has `⟨h, u vᵀ⟩ = ⟨h, T(Y)⟩` for every `h` of an orthogonal
`H`, so `noR1` excludes it (`noR1_sound`).  `liftTest` accepts when `H` is orthogonal and `noR1` holds for two of the
classes `1, 2, 3` (`X0, X1, X0 ^^^ X1`).  An `H` smaller than the annihilator can only make the test fail. -/
@[expose] public section
namespace S7L
open BC4 BC5 S5 RootSound Matrix

/-- row `y` (bits `9y .. 9y+8`) of an 81-bit matrix code -/
def row81 (h y : Nat) : Nat := Nat.land (Nat.shiftRight h (Nat.mul 9 y)) 511

/-- the XOR of the rows `y < k` of `h` with `b_y = 1` -/
def ghK (h b k : Nat) : Nat :=
  @Nat.rec (fun _ => Nat) 0 (fun y acc => cond (BC5.bit b y) (Nat.xor acc (row81 h y)) acc) k

/-- `bᵀ h` as a 9-bit vector -/
def gh (h b : Nat) : Nat := ghK h b 9

/-- row `y` of `T(Y)` as a 9-bit vector -/
def txrow (Y y : Nat) : Nat := mkB (fun z => decide (y % 3 = z / 3) && Y.testBit (3 * (z % 3) + y / 3)) 9

/-- `⟨h, T(Y)⟩` over the rows `y < k` -/
def sTXK (h Y k : Nat) : Bool :=
  @Nat.rec (fun _ => Bool) false (fun y acc => xor acc (par (Nat.land (row81 h y) (txrow Y y)))) k

def sTX (h Y : Nat) : Bool := sTXK h Y 9

/-- every functional of `H` kills every `b cᵀ` of `asg` -/
def orthOK (H : List Nat) (asg : Asg) : Bool :=
  @List.rec Nat (fun _ => Bool) true
    (fun h _ ih => (@List.rec (Nat × Nat × Nat) (fun _ => Bool) true
      (fun e _ ih2 => !par (Nat.land (gh h e.2.1) e.2.2) && ih2) asg) && ih) H

/-- the equations of the vector `u`: `(uᵀ h, ⟨h, T(Y)⟩)` for `h ∈ H` -/
def eqsU (H : List Nat) (u Y : Nat) : List (Nat × Bool) :=
  @List.rec Nat (fun _ => List (Nat × Bool)) [] (fun h _ ih => (gh h u, sTX h Y) :: ih) H

/-- the equations `G` leave no `v` of the 512-bit mask `acc`: `acc` is cut by `{v : par (g ∧ v) = s}` (`nperp g` or
`perp g`) equation by equation, stopping as soon as it is empty -/
def maskEmpty (G : List (Nat × Bool)) (acc : Nat) : Bool :=
  @List.rec (Nat × Bool) (fun _ => Nat → Bool) (fun acc => Nat.beq acc 0)
    (fun p _ ih acc => Nat.beq acc 0 || ih (Nat.land acc (cond p.2 (nperp p.1) (perp p.1)))) G acc

/-- no nonzero `u vᵀ` satisfies all equations `⟨h, u vᵀ⟩ = ⟨h, T(Y)⟩` (for each `u ≠ 0`, all `v ≠ 0` at once) -/
def noR1 (H : List Nat) (Y : Nat) : Bool :=
  allLT 512 (fun u => Nat.beq u 0 || maskEmpty (eqsU H u Y) (Nat.xor M512 1))

/-- `n` values of `k` bits -/
def rdLst (k n S : Nat) : List Nat :=
  @Nat.rec (fun _ => Nat → List Nat) (fun _ => []) (fun _ ih S => rd k S :: ih (sk k S)) n S

/-- **the rank-1 test**: `w` = 7 bits `nH`, then `nH` functionals of 81 bits -/
def liftTest (asg : Asg) (w : Nat) : Bool :=
  orthOK (rdLst 81 (rd 7 w) (sk 7 w)) asg &&
    cond (noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 1)
      (noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 2 || noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 3)
      (noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 2 && noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 3)

/-! ## Semantics -/

theorem row81_lt (h y : Nat) : row81 h y < 512 := by
  show Nat.land _ 511 < 512
  rw [Nat.land_eq]; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)

theorem ghK_succ (h b k : Nat) :
    ghK h b (k + 1) = cond (BC5.bit b k) (Nat.xor (ghK h b k) (row81 h k)) (ghK h b k) := rfl

theorem ghK_lt (h b : Nat) : ∀ k, ghK h b k < 512 := by
  intro k
  induction k with
  | zero => show (0 : Nat) < 512; norm_num
  | succ k ih =>
    rw [ghK_succ]
    cases BC5.bit b k
    · exact ih
    · rw [cond_true, Nat.xor_eq]
      have e : (512 : Nat) = 2 ^ 9 := by norm_num
      rw [e] at ih ⊢
      exact Nat.xor_lt_two_pow ih (lt_of_lt_of_eq (row81_lt h k) e)

theorem nv_zero' : nv 0 = 0 := by
  funext i; simp [nv, bitF]

theorem nv_xor (x y : Nat) : nv (Nat.xor x y) = nv x + nv y := by
  funext i
  simp only [nv, Pi.add_apply, bitF_bf, Nat.xor_eq, Nat.testBit_xor, bf_xor]

theorem nv_ghK (h b : Nat) : ∀ k, nv (ghK h b k) = ∑ y ∈ Finset.range k, bf (b.testBit y) • nv (row81 h y) := by
  intro k
  induction k with
  | zero => simp only [Finset.range_zero, Finset.sum_empty]; exact nv_zero'
  | succ k ih =>
    rw [ghK_succ, Finset.sum_range_succ, ← ih, bit_eq]
    cases b.testBit k
    · simp [bf]
    · rw [cond_true, nv_xor]; simp [bf]

/-- `⟨h, M⟩` -/
def ip (h : Nat) (M : Matrix (Fin 9) (Fin 9) F2) : F2 := ∑ y : Fin 9, nv (row81 h y.val) ⬝ᵥ M y

theorem ip_add (h : Nat) (M N : Matrix (Fin 9) (Fin 9) F2) : ip h (M + N) = ip h M + ip h N := by
  unfold ip
  rw [← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl (fun y _ => ?_)
  rw [show (M + N) y = M y + N y from rfl, dotProduct_add]

theorem ip_zero (h : Nat) : ip h 0 = 0 := by
  unfold ip
  refine Finset.sum_eq_zero (fun y _ => ?_)
  rw [show (0 : Matrix (Fin 9) (Fin 9) F2) y = 0 from rfl, dotProduct_zero]

theorem ip_list (h : Nat) (l : Asg) :
    ip h ((l.map (fun e => vecMulVec (nv e.2.1) (nv e.2.2))).sum) =
      (l.map (fun e => ip h (vecMulVec (nv e.2.1) (nv e.2.2)))).sum := by
  induction l with
  | nil => simp only [List.map_nil, List.sum_nil, ip_zero]
  | cons e l ih => simp only [List.map_cons, List.sum_cons, ip_add, ih]

theorem ip_vmv (h b c : Nat) : ip h (vecMulVec (nv b) (nv c)) = bf (par (gh h b &&& c)) := by
  rw [← dot_nv (gh h b) c (ghK_lt h b 9)]
  have hg : ∀ z : Fin 9, nv (gh h b) z = ∑ y : Fin 9, nv b y * nv (row81 h y.val) z := by
    intro z
    unfold gh
    rw [nv_ghK, Finset.sum_apply, Finset.sum_range]
    simp only [Pi.smul_apply, smul_eq_mul]
    rfl
  unfold ip dotProduct
  simp only [vecMulVec_apply, hg, Finset.sum_mul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun z _ => Finset.sum_congr rfl (fun y _ => ?_))
  ring

theorem nv_txrow (Y : Nat) (y : Fin 9) : nv (txrow Y y.val) = TX (toM3 Y) y := by
  funext z
  show bf ((txrow Y y.val).testBit z.val) = _
  rw [txrow, mkB_bit, decide_eq_true z.isLt, Bool.true_and]
  exact tx_entry Y y.val z.val y.isLt z.isLt

theorem sTXK_bf (h Y : Nat) : ∀ k, bf (sTXK h Y k) = ∑ y ∈ Finset.range k, bf (par (row81 h y &&& txrow Y y)) := by
  intro k
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [Finset.sum_range_succ, ← ih]
    show bf (xor (sTXK h Y k) (par (Nat.land (row81 h k) (txrow Y k)))) = _
    rw [bf_xor, Nat.land_eq]

theorem ip_TX (h Y : Nat) : ip h (TX (toM3 Y)) = bf (sTX h Y) := by
  unfold ip sTX
  rw [sTXK_bf, Finset.sum_range]
  refine Finset.sum_congr rfl (fun y _ => ?_)
  rw [← nv_txrow Y y, dot_nv _ _ (row81_lt h y)]

/-! ## The checks -/

theorem orthOK_spec (H : List Nat) (asg : Asg) (hok : orthOK H asg = true) :
    ∀ h ∈ H, ∀ e ∈ asg, par (gh h e.2.1 &&& e.2.2) = false := by
  induction H with
  | nil => intro h hh; exact absurd hh List.not_mem_nil
  | cons h0 H ih =>
    have e1 : orthOK (h0 :: H) asg = ((@List.rec (Nat × Nat × Nat) (fun _ => Bool) true
        (fun e _ ih2 => !par (Nat.land (gh h0 e.2.1) e.2.2) && ih2) asg) && orthOK H asg) := rfl
    rw [e1, Bool.and_eq_true] at hok
    intro h hh e he
    rcases List.mem_cons.mp hh with rfl | hh'
    · have inner : ∀ l : Asg, (@List.rec (Nat × Nat × Nat) (fun _ => Bool) true
          (fun e _ ih2 => !par (Nat.land (gh h e.2.1) e.2.2) && ih2) l) = true →
          ∀ e ∈ l, par (gh h e.2.1 &&& e.2.2) = false := by
        intro l
        induction l with
        | nil => intro _ e he; exact absurd he List.not_mem_nil
        | cons e0 l ihl =>
          intro hl e he
          have e2 : (@List.rec (Nat × Nat × Nat) (fun _ => Bool) true
              (fun e _ ih2 => !par (Nat.land (gh h e.2.1) e.2.2) && ih2) (e0 :: l)) =
              (!par (Nat.land (gh h e0.2.1) e0.2.2) && (@List.rec (Nat × Nat × Nat) (fun _ => Bool) true
              (fun e _ ih2 => !par (Nat.land (gh h e.2.1) e.2.2) && ih2) l)) := rfl
          rw [e2, Bool.and_eq_true, Bool.not_eq_true'] at hl
          rcases List.mem_cons.mp he with rfl | he'
          · rw [← Nat.land_eq]; exact hl.1
          · exact ihl hl.2 e he'
      exact inner asg hok.1 e he
    · exact ih hok.2 h hh' e he

theorem eqsU_mem (H : List Nat) (u Y : Nat) : ∀ p ∈ eqsU H u Y, ∃ h ∈ H, p = (gh h u, sTX h Y) := by
  induction H with
  | nil => intro p hp; exact absurd hp List.not_mem_nil
  | cons h0 H ih =>
    intro p hp
    have e1 : eqsU (h0 :: H) u Y = (gh h0 u, sTX h0 Y) :: eqsU H u Y := rfl
    rw [e1] at hp
    rcases List.mem_cons.mp hp with rfl | hp'
    · exact ⟨h0, List.mem_cons_self, rfl⟩
    · obtain ⟨h1, hh1, e⟩ := ih p hp'
      exact ⟨h1, List.mem_cons_of_mem _ hh1, e⟩

theorem maskEmpty_spec : ∀ (G : List (Nat × Bool)) (acc : Nat), (∀ p ∈ G, p.1 < 512) → maskEmpty G acc = true →
    ∀ v, v < 512 → acc.testBit v = true → ∃ p ∈ G, xor (par (p.1 &&& v)) p.2 = true := by
  intro G
  induction G with
  | nil =>
    intro acc _ h v _ hacc
    have h0 : acc = 0 := Nat.eq_of_beq_eq_true h
    rw [h0, Nat.zero_testBit] at hacc; exact absurd hacc Bool.false_ne_true
  | cons p G ih =>
    intro acc hlt h v hv hacc
    have e1 : maskEmpty (p :: G) acc =
        (Nat.beq acc 0 || maskEmpty G (Nat.land acc (cond p.2 (nperp p.1) (perp p.1)))) := rfl
    rw [e1, Bool.or_eq_true] at h
    rcases h with h0 | h1
    · rw [Nat.eq_of_beq_eq_true h0, Nat.zero_testBit] at hacc; exact absurd hacc Bool.false_ne_true
    · by_cases hp : xor (par (p.1 &&& v)) p.2 = true
      · exact ⟨p, List.mem_cons_self, hp⟩
      · have hpe : par (p.1 &&& v) = p.2 := by
          revert hp; cases par (p.1 &&& v) <;> cases p.2 <;> simp
        have hp1 := hlt p List.mem_cons_self
        have hbit : (Nat.land acc (cond p.2 (nperp p.1) (perp p.1))).testBit v = true := by
          rw [Nat.land_eq, Nat.testBit_and, hacc, Bool.true_and]
          have hc : par (v &&& p.1) = p.2 := by rw [Nat.and_comm]; exact hpe
          cases hs : p.2
          · rw [cond_false, perp_bit _ _ hp1 hv, hc, hs]; rfl
          · rw [cond_true, nperp_bit _ _ hp1 hv, hc, hs]
        obtain ⟨q, hq, hx⟩ := ih _ (fun q hq => hlt q (List.mem_cons_of_mem _ hq)) h1 v hv hbit
        exact ⟨q, List.mem_cons_of_mem _ hq, hx⟩

/-- **`noR1` excludes every lift in `Y`** (given an orthogonal `H`). -/
theorem noR1_sound (H : List Nat) (asg : Asg) (Y : Nat) (horth : orthOK H asg = true) (hn : noR1 H Y = true) :
    ¬ LiftL asg Y := by
  rintro ⟨l, hl, u, v, hu, hv, hsum⟩
  have ho := orthOK_spec H asg horth
  have huc : nv (natOf u) = u := nv_natOf u
  have hvc : nv (natOf v) = v := nv_natOf v
  have huc0 : natOf u ≠ 0 := fun e => hu (by rw [← huc, e, nv_zero'])
  have hvc0 : natOf v ≠ 0 := fun e => hv (by rw [← hvc, e, nv_zero'])
  -- every functional gives the same value on `u vᵀ` and on `T(Y)`
  have key : ∀ h ∈ H, par (gh h (natOf u) &&& natOf v) = sTX h Y := by
    intro h hh
    apply bf_inj
    rw [← ip_vmv, huc, hvc, ← hsum, ip_add, ip_TX, ip_list]
    have hz : (l.map (fun e => ip h (vecMulVec (nv e.2.1) (nv e.2.2)))).sum = 0 := by
      apply List.sum_eq_zero
      intro x hx
      obtain ⟨e, he, rfl⟩ := List.mem_map.mp hx
      rw [ip_vmv, ho h hh e (hl.subset he)]; rfl
    rw [hz, add_zero]
  have hb0 : ∀ x : Nat, x ≠ 0 → Nat.beq x 0 = false := by
    intro x hx; cases e : Nat.beq x 0
    · rfl
    · exact absurd (Nat.eq_of_beq_eq_true e) hx
  have h1 := allLT_spec hn (natOf u) (natOf_lt u)
  rw [hb0 _ huc0, Bool.false_or] at h1
  have hstart : (Nat.xor M512 1).testBit (natOf v) = true := by
    rw [Nat.xor_eq, Nat.testBit_xor, m512_eq, Nat.testBit_two_pow_sub_one, show (1 : Nat) = 2 ^ 0 from rfl,
      Nat.testBit_two_pow, decide_eq_true (natOf_lt v)]
    have : ¬ (0 = natOf v) := fun e => hvc0 e.symm
    simp [this]
  obtain ⟨p, hp, hx⟩ := maskEmpty_spec _ _ (fun p hp => by
      obtain ⟨h, _, rfl⟩ := eqsU_mem H _ Y p hp; exact ghK_lt h _ 9) h1 (natOf v) (natOf_lt v) hstart
  obtain ⟨h, hh, rfl⟩ := eqsU_mem H _ Y p hp
  rw [key h hh] at hx
  simp at hx

/-- **The rank-1 test meets the SAT-leaf contract.** -/
theorem liftTest_sound : LiftTest liftTest := by
  intro asg w hw
  have hw' : (orthOK (rdLst 81 (rd 7 w) (sk 7 w)) asg &&
      cond (noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 1)
        (noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 2 || noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 3)
        (noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 2 && noR1 (rdLst 81 (rd 7 w) (sk 7 w)) 3)) = true := hw
  generalize rdLst 81 (rd 7 w) (sk 7 w) = H at hw'
  rw [Bool.and_eq_true] at hw'
  obtain ⟨ho, hc⟩ := hw'
  have e0 : L479.X0 = 1 := rfl
  have e1 : L479.X1 = 2 := rfl
  have e3 : L479.X0 ^^^ L479.X1 = 3 := by decide
  rw [e3, e0, e1]
  cases h1 : noR1 H 1
  · rw [h1, cond_false, Bool.and_eq_true] at hc
    have n2 := noR1_sound H asg 2 ho hc.1
    have n3 := noR1_sound H asg 3 ho hc.2
    exact ⟨fun h => n2 h.2, fun h => n3 h.2, fun h => n2 h.1⟩
  · rw [h1, cond_true, Bool.or_eq_true] at hc
    have n1 := noR1_sound H asg 1 ho h1
    rcases hc with h2 | h3
    · have n2 := noR1_sound H asg 2 ho h2
      exact ⟨fun h => n1 h.1, fun h => n1 h.1, fun h => n2 h.1⟩
    · have n3 := noR1_sound H asg 3 ho h3
      exact ⟨fun h => n1 h.1, fun h => n1 h.1, fun h => n3 h.2⟩

/-- **SAT leaves with the rank-1 test.** -/
theorem leafSL_lift (R : Nat) (h : BC7L.leafSL liftTest R = true) : L479.NoLift3 (leafT R) (leafN R) (S6.leafDom6 R) :=
  leafSL_sound liftTest liftTest_sound R h

end S7L

#print axioms S7L.leafSL_lift
