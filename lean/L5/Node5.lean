module
public import R22Port.U_d41d8cd98f00
public import L5.Sem5
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # `Node5Spec`: soundness of one `R3RT.node5` call

`node5_eq` restates `node5` with named record fields (definitional).  The proof of `node5_spec` checks the child frame
(`FrameOK`): prefix, count, counters (`packU_or`), the dead mask (`dead_ok`: parent dead mask, slot `last` of the
conflict table, or-fold of the full V rows) and the conflict table (`conf_ok`: parent table, the node's `c2`); then the
kills (`KillsOK`) with `kills5_sem` and `kill_dead`. -/
noncomputable section
namespace L5
open E1S Finset R3RT.Spec RootSound BC4 BC5 Classical

/-! ## Record fields -/

def n5last (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 8) 511
def n5d (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 17) 31
def n5nV (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 22) 1023
def n5n1 (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 32) 1023
def n5n2 (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 52) 1023
def n5m (rec : ℕ) : ℕ := Nat.add (n5nV rec) (Nat.add (n5n1 rec) (n5n2 rec))
def n5MB (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 64) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft (n5m rec) 9)) 1)
def n5E (rec : ℕ) : ℕ :=
  Nat.land (Nat.shiftRight (Nat.shiftRight rec 64) (Nat.shiftLeft (n5m rec) 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft (n5m rec) 3)) 1)
def n5D' (D N rec : ℕ) : ℕ :=
  Nat.lor (Nat.lor D (Nat.land (Nat.shiftRight N (Nat.shiftLeft (n5last rec) 9)) L1.M512))
    (L1.orFold 10 (Nat.land (n5MB rec) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft (n5nV rec) 9)) 1)) (n5nV rec))
def n5MC (rec : ℕ) : ℕ := Nat.shiftRight (n5MB rec) (Nat.shiftLeft (n5nV rec) 9)
def n5ME (rec : ℕ) : ℕ := Nat.land (n5MC rec) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft (n5n1 rec) 9)) 1)

theorem node5_eq (S D N U dP c2 h suf rec : ℕ) (ks : List ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool) :
    R3RT.node5 S D N U dP c2 h suf rec ks k =
      (Nat.blt (n5last rec) 511 && Nat.beq (Nat.shiftRight S (n5last rec)) 0 && Nat.beq (n5d rec) (Nat.succ dP) &&
        Nat.beq (Nat.land (Nat.shiftRight rec 42) 1023) 0 &&
        Nat.beq (Nat.land (Nat.add (Nat.add (Nat.add U h) (Nat.mul (Nat.sub 22 (n5d rec)) L1.ONES7)) L1.OFFN7) L1.G7) L1.G7 &&
        Nat.beq (Nat.land (Nat.add (Nat.add (Nat.add U h) suf) L1.OFFN7) L1.G7) L1.G7 &&
        L1.blocks (n5MB rec) (n5E rec) (Nat.mul (Nat.lor S (Nat.shiftLeft 1 (n5last rec))) L1.REP63)
          (Nat.div (Nat.add (n5m rec) 62) 63) &&
        R3RT.kills5 (winXS (n5last rec) (n5D' D N rec) (Nat.lor N c2)) (Nat.succ (n5last rec)) (n5ME rec) (n5MC rec)
          (n5n1 rec) (Nat.sub 21 (n5d rec)) ks &&
        k (Nat.lor S (Nat.shiftLeft 1 (n5last rec))) (n5D' D N rec) (Nat.lor N c2) (Nat.add U h)) := rfl

theorem fieldW (rec a w : ℕ) : Nat.land (Nat.shiftRight rec a) (2 ^ w - 1) = (rec >>> a) % 2 ^ w := by
  rw [land_eq, shr_eq, Nat.and_two_pow_sub_one_eq_mod]

theorem n5last_eq (rec : ℕ) : n5last rec = (rec >>> 8) % 512 := fieldW rec 8 9
theorem n5d_eq (rec : ℕ) : n5d rec = (rec >>> 17) % 32 := fieldW rec 17 5
theorem n5nV_eq (rec : ℕ) : n5nV rec = (rec >>> 22) % 1024 := fieldW rec 22 10
theorem n5n1_eq (rec : ℕ) : n5n1 rec = (rec >>> 32) % 1024 := fieldW rec 32 10
theorem n5n2_eq (rec : ℕ) : n5n2 rec = (rec >>> 52) % 1024 := fieldW rec 52 10

theorem hdr_field (rec a : ℕ) (ha : a + 10 ≤ 64) : ((rec % 2 ^ 64) >>> a) % 1024 = (rec >>> a) % 1024 := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [show (1024 : ℕ) = 2 ^ 10 by norm_num, Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight,
    Nat.testBit_shiftRight, Nat.testBit_mod_two_pow]
  by_cases hj : j < 10
  · simp [hj, show a + j < 64 by omega]
  · simp [hj]

theorem n5MB_eq (rec : ℕ) : n5MB rec = (rec >>> 64) % 2 ^ (512 * n5m rec) := by
  unfold n5MB; rw [mask_ops, shr_eq]

theorem n5E_eq (rec : ℕ) : n5E rec = ((rec >>> 64) >>> (512 * n5m rec)) % 2 ^ (8 * n5m rec) := by
  unfold n5E
  rw [land_eq, shr_eq, shr_eq, nsub_eq, shl_eq, shl_eq, shl_eq, Nat.shiftLeft_eq, Nat.shiftLeft_eq, Nat.shiftLeft_eq,
    Nat.one_mul, Nat.and_two_pow_sub_one_eq_mod, mul_comm (n5m rec) (2 ^ 9), mul_comm (n5m rec) (2 ^ 3)]

theorem dig_mod_pow (x B n i : ℕ) : dig B (x % 2 ^ (B * n)) i = if i < n then dig B x i else 0 := by
  split
  · rename_i hi; rw [← pk_dig_mod B x n]; exact dig_pk B _ n (fun j _ => dig_lt B x j) i hi
  · rename_i hi
    rcases Nat.eq_zero_or_pos B with hB | hB
    · subst hB; simp [dig, Nat.mod_one]
    · rw [← pk_dig_mod B x n]; exact dig_ge B hB _ n (fun j _ => dig_lt B x j) i (by omega)

theorem fld_eq_dig (x w i : ℕ) : fld x w i = dig w x i := by
  unfold fld dig; rw [Nat.shiftRight_eq_div_pow]

/-! ## The record's rows -/

/-- every row `i < m` of a record that passes `blocks` and has valid rows (`RecRowsOK`): cap = `|row ∩ S'|` + residual -/
theorem rows_ok (rec S' : ℕ) (hS : S' < 2 ^ 511) (hc : pcnt 512 S' ≤ 127) (hR : RecRowsOK rec)
    (hblk : L1.blocks (n5MB rec) (n5E rec) (Nat.mul S' L1.REP63) (Nat.div (Nat.add (n5m rec) 62) 63) = true) :
    ∀ i < n5m rec, RowOK (dig 512 (n5MB rec) i % 2 ^ 511)
      (pcnt 512 (dig 512 (n5MB rec) i &&& S') +
        (if i < n5nV rec then 0 else if i < n5nV rec + n5n1 rec then 1 else 2)) := by
  intro i hi
  have hb := blocks_sound S' hS hc _ _ _ hblk i (by rw [ndiv_eq, nadd_eq]; omega)
  have hR' := hR
  simp only [RecRowsOK] at hR'
  rw [hdr_field rec 22 (by norm_num), hdr_field rec 32 (by norm_num), hdr_field rec 52 (by norm_num)] at hR'
  have hm : n5m rec = (rec >>> 22) % 1024 + (rec >>> 32) % 1024 + (rec >>> 52) % 1024 := by
    unfold n5m; rw [n5nV_eq, n5n1_eq, n5n2_eq, nadd_eq, nadd_eq]; ring
  rw [← hm, ← n5nV_eq, ← n5n1_eq] at hR'
  have h1 := hR' i hi
  rw [fld_eq_dig, fld_eq_dig] at h1
  have e1 : dig 512 (n5MB rec) i = dig 512 (rec >>> 64) i := by rw [n5MB_eq, dig_mod_pow, if_pos hi]
  have e2 : dig 8 (n5E rec) i = dig 8 ((rec >>> 64) >>> (512 * n5m rec)) i := by rw [n5E_eq, dig_mod_pow, if_pos hi]
  rw [e1] at hb ⊢
  rw [← e2, hb] at h1
  exact h1

/-! ## The child frame -/

theorem pcnt_eq_card511 (S' : ℕ) (hS : S' < 2 ^ 511) :
    pcnt 512 S' = ((range 511).filter (fun l => S'.testBit l = true)).card := by
  rw [show S' = S' &&& S' from (Nat.and_self S').symm, pcnt_and_eq S' S' hS]
  congr 1; ext l; simp [Nat.and_self]

/-- **The dead mask** of the child frame. -/
theorem dead_ok (S D N rec : ℕ) (A : Dec22) (hlast : n5last rec < 511) (hSlt : S < 2 ^ n5last rec) (hS0 : 0 < S)
    (hFA : ∀ A : Dec22, Below A S (lastOf S) →
      (∀ l, lastOf S < l → l < 511 → D.testBit l = true → ¬ A.Has l) ∧
      (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
        (N >>> (512 * v)).testBit w = true → A.Has v → ¬ A.Has w))
    (hrows : ∀ i < n5m rec, RowOK (dig 512 (n5MB rec) i % 2 ^ 511)
      (pcnt 512 (dig 512 (n5MB rec) i &&& (S ||| 2 ^ n5last rec)) +
        (if i < n5nV rec then 0 else if i < n5nV rec + n5n1 rec then 1 else 2)))
    (hB : Below A (S ||| 2 ^ n5last rec) (n5last rec)) :
    ∀ l, n5last rec < l → l < 511 → (n5D' D N rec).testBit l = true → ¬ A.Has l := by
  intro l hl1 hl2 hD hA
  have hBp := below_parent A S (n5last rec) hB hS0 hSlt
  have hlS : lastOf S < n5last rec := lastOf_lt S _ hS0 hSlt
  have hS'lt : S ||| 2 ^ n5last rec < 2 ^ 511 := by
    rw [or_pow_eq S _ hSlt]
    calc 2 ^ n5last rec + S < 2 ^ n5last rec + 2 ^ n5last rec := by omega
      _ = 2 ^ (n5last rec + 1) := by rw [pow_succ]; ring
      _ ≤ 2 ^ 511 := Nat.pow_le_pow_right (by norm_num) (by omega)
  have hbits : ∀ l', (S ||| 2 ^ n5last rec).testBit l' = true → l' ≤ n5last rec := by
    intro l' h'
    rw [testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq] at h'
    rcases h' with h' | h'
    · have := bits_le_lastOf S l' h'; omega
    · omega
  unfold n5D' at hD
  rw [lor_eq, lor_eq, Nat.testBit_or, Nat.testBit_or, Bool.or_eq_true, Bool.or_eq_true] at hD
  rcases hD with (hD | hD) | hD
  · exact (hFA A hBp).1 l (by omega) hl2 hD hA
  · rw [dig_eq_ops, dig_testBit] at hD
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hD
    have hSl : S.testBit (n5last rec) = false := Nat.testBit_lt_two_pow hSlt
    have hSw : S.testBit l = false := Nat.testBit_lt_two_pow
      (lt_of_lt_of_le hSlt (Nat.pow_le_pow_right (by norm_num) (by omega)))
    have := (hFA A hBp).2 (n5last rec) l hlast hl2 hSl hSw (by omega)
      (by rw [Nat.testBit_shiftRight]; exact hD.2) (below_has_last A S _ hB hlast)
    exact this hA
  · have hnV : n5nV rec ≤ 1024 := by
      rw [n5nV_eq]; have := Nat.mod_lt (rec >>> 22) (show 0 < 1024 by norm_num); omega
    obtain ⟨i, hi, hbit⟩ := orFold_bit (n5MB rec) (n5nV rec) hnV l hD
    have him : i < n5m rec := by unfold n5m; rw [nadd_eq, nadd_eq]; omega
    have hR := hrows i him
    rw [if_pos hi, Nat.add_zero] at hR
    have := row_count A _ (n5last rec) _ _ hS'lt hbits hB hR {l} (by
      intro x hx; rw [mem_singleton] at hx; subst hx
      refine ⟨hA, hbit, ?_⟩
      cases h' : (S ||| 2 ^ n5last rec).testBit x
      · rfl
      · have := hbits x h'; omega)
    simp at this

/-- **The conflict table** of the child frame. -/
theorem conf_ok (S N c2 last : ℕ) (A : Dec22) (hlast : last < 511) (hSlt : S < 2 ^ last) (hS0 : 0 < S)
    (hFA : ∀ A : Dec22, Below A S (lastOf S) →
      (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
        (N >>> (512 * v)).testBit w = true → A.Has v → ¬ A.Has w))
    (hC2 : C2OK last c2) (hB : Below A (S ||| 2 ^ last) last) :
    ∀ v w, v < 511 → w < 511 → (S ||| 2 ^ last).testBit v = false → (S ||| 2 ^ last).testBit w = false → v ≠ w →
      ((N ||| c2) >>> (512 * v)).testBit w = true → A.Has v → ¬ A.Has w := by
  intro v w hv hw hSv hSw hvw hbit hAv hAw
  rw [testBit_or_pow, Bool.or_eq_false_iff] at hSv hSw
  rw [Nat.testBit_shiftRight, Nat.testBit_or, Bool.or_eq_true] at hbit
  rcases hbit with hb | hb
  · exact (hFA A (below_parent A S last hB hS0 hSlt)) v w hv hw hSv.1 hSw.1 hvw (by rw [Nat.testBit_shiftRight]; exact hb)
      hAv hAw
  · have hwl : w ≠ last := by intro h; rw [h] at hSw; simp at hSw
    have hvl : v ≠ last := by intro h; rw [h] at hSv; simp at hSv
    obtain ⟨m, hm, hml, hmv, hmw⟩ := hC2 v w hv hw hwl (Ne.symm hvw) (by rw [Nat.testBit_shiftRight]; exact hb)
    have hAl := below_has_last A S last hB hlast
    have hsub : ({last, v, w} : Finset ℕ) ⊆ inMask A m := by
      intro x hx
      simp only [mem_insert, mem_singleton] at hx
      simp only [inMask, mem_filter, mem_range]
      rcases hx with rfl | rfl | rfl
      · exact ⟨hlast, hml, hAl⟩
      · exact ⟨hv, hmv, hAv⟩
      · exact ⟨hw, hmw, hAw⟩
    have hc := le_trans (card_le_card hsub) (hm A)
    rw [card_insert_of_notMem (by simp [Ne.symm hvl, Ne.symm hwl]), card_pair hvw] at hc
    omega

/-! ## The node -/

/-- **`node5`'s contract.** -/
theorem node5_spec : Node5Spec := by
  intro S D N U dP c2 h suf rec ks k hF hC2 hH hR hn
  intro last
  rw [node5_eq] at hn
  simp only [Bool.and_eq_true] at hn
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨hl1, hpre⟩, hd⟩, _⟩, _⟩, _⟩, hblk⟩, hkill⟩, hk⟩ := hn
  have hlast_eq : n5last rec = last := n5last_eq rec
  have hl : last < 511 := by rw [← hlast_eq]; exact Nat.blt_eq.mp hl1
  have hSlt : S < 2 ^ last := by
    rw [← hlast_eq]; apply lt_of_shr_zero; rw [Nat.beq_eq] at hpre; exact hpre
  have hd' : n5d rec = dP + 1 := by rw [Nat.beq_eq] at hd; exact hd
  have hS'eq : Nat.lor S (Nat.shiftLeft 1 (n5last rec)) = S ||| 2 ^ last := by
    rw [lor_eq, shl_eq, Nat.shiftLeft_eq, Nat.one_mul, hlast_eq]
  obtain ⟨hS0, hS511, hScard, hU, hFA⟩ := hF
  have hS'lt : S ||| 2 ^ last < 2 ^ 511 := by
    rw [or_pow_eq S _ hSlt]
    calc 2 ^ last + S < 2 ^ last + 2 ^ last := by omega
      _ = 2 ^ (last + 1) := by rw [pow_succ]; ring
      _ ≤ 2 ^ 511 := Nat.pow_le_pow_right (by norm_num) (by omega)
  have hbits : ∀ l', (S ||| 2 ^ last).testBit l' = true → l' ≤ last := by
    intro l' h'
    rw [testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq] at h'
    rcases h' with h' | h'
    · have := bits_le_lastOf S l' h'; have := lastOf_lt S last hS0 hSlt; omega
    · omega
  have hcard : ((range 511).filter (fun l => (S ||| 2 ^ last).testBit l = true)).card = dP + 1 := by
    rw [card_or_pow S last hSlt hl, hScard]
  have hd31 : dP + 1 ≤ 31 := by rw [← hd', n5d_eq]; have := Nat.mod_lt (rec >>> 17) (show 0 < 32 by norm_num); omega
  have hpc : pcnt 512 (S ||| 2 ^ last) ≤ 127 := by rw [pcnt_eq_card511 _ hS'lt, hcard]; omega
  rw [hS'eq] at hblk hk
  have hrows := rows_ok rec (S ||| 2 ^ last) hS'lt hpc hR hblk
  have hSl : S.testBit last = false := Nat.testBit_lt_two_pow hSlt
  have hlastOf : lastOf (S ||| 2 ^ last) = last := lastOf_or S last hSlt
  have hdead : ∀ A : Dec22, Below A (S ||| 2 ^ last) last →
      ∀ l, last < l → l < 511 → (n5D' D N rec).testBit l = true → ¬ A.Has l := by
    intro A hB
    have := dead_ok S D N rec A (by rw [hlast_eq]; exact hl) (by rw [hlast_eq]; exact hSlt) hS0 hFA
      (by rw [hlast_eq]; exact hrows) (by rw [hlast_eq]; exact hB)
    rw [hlast_eq] at this; exact this
  have hconf : ∀ A : Dec22, Below A (S ||| 2 ^ last) last →
      ∀ v w, v < 511 → w < 511 → (S ||| 2 ^ last).testBit v = false → (S ||| 2 ^ last).testBit w = false → v ≠ w →
        ((N ||| c2) >>> (512 * v)).testBit w = true → A.Has v → ¬ A.Has w :=
    fun A hB => conf_ok S N c2 last A hl hSlt hS0 (fun A hB' => (hFA A hB').2) hC2 hB
  refine ⟨n5D' D N rec, ⟨by rw [or_pow_eq S _ hSlt]; positivity, hS'lt, hcard,
    by rw [hU, packU_or S last h hSl hl hH], fun A hB => ?_⟩, ?_, ?_⟩
  · rw [hlastOf] at hB ⊢
    exact ⟨hdead A hB, hconf A hB⟩
  · -- the kills
    intro kr hkr A hCont
    have hnu : Nat.sub 21 (n5d rec) ≤ 32768 := by rw [nsub_eq]; omega
    obtain ⟨Y, hKF, hcnt⟩ := kills5_sem _ _ _ _ _ _ ks hnu hkill kr hkr
    obtain ⟨hw0, hu511, hexu, hcvu, hY⟩ := hKF
    set u := kr % 512 with hu
    have hBl := cont_below A _ _ _ hCont
    have hlu : last < u := hCont.1
    rw [hlast_eq] at hw0
    -- window slot of `u`
    set X1 := dig 512 (winXS (n5last rec) (n5D' D N rec) (Nat.lor N c2)) (u - Nat.succ (n5last rec)) with hX1
    have hX1b : ∀ l, u < l → A.Has l → X1.testBit l = true := by
      intro l hul hAl
      rw [hX1, winXS_bit _ _ _ (by rw [hlast_eq]; exact hl) _ (by rw [hlast_eq]; omega), hlast_eq]
      rw [show last + 1 + (u - Nat.succ last) = u by omega]
      have h1 : decide (u < l ∧ l < 511) = true := decide_eq_true ⟨hul, hAl.1⟩
      have h2 : (n5D' D N rec).testBit l = false := by
        cases hb : (n5D' D N rec).testBit l
        · rfl
        · exact absurd hAl (hdead A hBl l (by omega) hAl.1 hb)
      have h3 : (dig 512 (Nat.lor N c2) u).testBit l = false := by
        cases hb : (dig 512 (Nat.lor N c2) u).testBit l
        · rfl
        · exfalso
          rw [dig_testBit, Bool.and_eq_true] at hb
          have hSu : (S ||| 2 ^ last).testBit u = false := by
            cases h' : (S ||| 2 ^ last).testBit u
            · rfl
            · have := hbits u h'; omega
          have hSw : (S ||| 2 ^ last).testBit l = false := by
            cases h' : (S ||| 2 ^ last).testBit l
            · rfl
            · have := hbits l h'; omega
          exact hconf A hBl u l hu511 hAl.1 hSu hSw (by omega)
            (by rw [Nat.testBit_shiftRight, ← lor_eq]; exact hb.2) (cont_has A _ _ _ hCont) hAl
      rw [h1, h2, h3]; rfl
    -- the rows of the record seen from the kill
    have hMC : ∀ i, dig 512 (n5MC rec) i = dig 512 (n5MB rec) (n5nV rec + i) := by
      intro i; unfold n5MC; rw [shr_eq, shl_eq, Nat.shiftLeft_eq, show n5nV rec * 2 ^ 9 = 512 * n5nV rec by ring, dig_shr]
    have hME : ∀ i, dig 512 (n5ME rec) i = if i < n5n1 rec then dig 512 (n5MC rec) i else 0 := by
      intro i; unfold n5ME; rw [mask_ops, dig_mod_pow]
    have hMBz : ∀ j, n5m rec ≤ j → dig 512 (n5MB rec) j = 0 := by
      intro j hj; rw [n5MB_eq, dig_mod_pow, if_neg (by omega)]
    have hmsum : n5m rec = n5nV rec + n5n1 rec + n5n2 rec := by unfold n5m; rw [nadd_eq, nadd_eq]; ring
    apply kill_dead A (S ||| 2 ^ last) last u (dP + 1) hS'lt hbits hcard hCont X1 Y
      ((kr >>> 9) % 32) ((kr >>> 14) % 32)
      (fun i => dig 512 (n5ME rec) ((kr >>> 19 >>> (10 * i)) % 1024))
      (fun i => dig 512 (n5MC rec) ((kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i))) % 1024)) hX1b
    · intro i hi
      have hb := hexu i hi
      refine ⟨hb, ?_⟩
      rw [hME] at hb ⊢
      split at hb
      · rename_i hlt
        rw [if_pos hlt, hMC]
        rw [hMC] at hb
        have := hrows (n5nV rec + (kr >>> 19 >>> (10 * i)) % 1024) (by omega)
        rw [if_neg (by omega), if_pos (by omega)] at this
        exact this
      · simp at hb
    · intro i hi
      have hb := hcvu i hi
      rw [hMC] at hb ⊢
      set c := (kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i))) % 1024 with hc
      by_cases hc1 : c < n5n1 rec
      · rw [decide_eq_true hc1] at hb
        have := hrows (n5nV rec + c) (by omega)
        rw [if_neg (by omega), if_pos (by omega)] at this
        simp only [Bool.not_true] at hb
        rw [hb]; simpa using this
      · rw [decide_eq_false hc1] at hb
        simp only [Bool.not_false] at hb
        by_cases hcm : n5nV rec + c < n5m rec
        · have := hrows (n5nV rec + c) hcm
          rw [if_neg (by omega), if_neg (by omega)] at this
          rw [hb]; simpa [Nat.add_assoc] using this
        · rw [hMBz _ (by omega)] at hb; simp at hb
    · intro l
      rw [hY l]
    · rw [← hd']; exact hcnt
  · rw [lor_eq, nadd_eq] at hk; exact hk

end L5
