module
public import R22Port.U_d41d8cd98f00
public import E1.Sem
/-! # Semantics of E1's steps: saturations, fixings, weak duality, the multiplicity order

* `sats_sem`: accepted saturation events keep every completion within the new (zeroed) budgets.
* `fixes_sem`: accepted budget fixings keep every completion within the new budgets, given the dual's bound (`FixOK`).
* `wd_bound`: the weak-duality inequality behind kills, cuts and fixings.
* `VR_lt_iff`: comparing reversed packings is the multiplicity order (first differing label).
* `prefix_lex`: a non-canonical prefix makes the whole multiset non-canonical. -/
@[expose] public section
namespace E1S
open Finset
set_option exponentiation.threshold 600

/-! ## Saturations -/

def satsF (RTb MV : ℕ) (n : ℕ) : Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ :=
  Nat.rec (motive := fun _ => Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      ih (@Bool.rec (fun _ => Bool) false (Nat.beq (E1.fsum (Nat.land MV (E1.fmask (E1.rmask RTb (E1.rd 12 S))))) (E1.rcap RTb (E1.rd 12 S))) ok)
        (Nat.land UF (Nat.xor ECT.FMALL (E1.fmask (E1.rmask RTb (E1.rd 12 S)))))
        (Nat.land UFR (Nat.xor ECT.FMALL (E1.fmask (E1.rmaskr RTb (E1.rd 12 S))))) (E1.sk 12 S)) n

theorem sats_eq (RTb n MV UF UFR S : ℕ) : E1.sats RTb n MV UF UFR S = satsF RTb MV n true UF UFR S := rfl
theorem satsF_succ (RTb MV n : ℕ) (ok : Bool) (UF UFR S : ℕ) : satsF RTb MV (n + 1) ok UF UFR S =
    satsF RTb MV n (@Bool.rec (fun _ => Bool) false (Nat.beq (E1.fsum (MV &&& E1.fmask (E1.rmask RTb (E1.rd 12 S))))
      (E1.rcap RTb (E1.rd 12 S))) ok)
      (UF &&& (ECT.FMALL ^^^ E1.fmask (E1.rmask RTb (E1.rd 12 S))))
      (UFR &&& (ECT.FMALL ^^^ E1.fmask (E1.rmaskr RTb (E1.rd 12 S)))) (E1.sk 12 S) := rfl

theorem satsF_false (RTb MV n UF UFR S : ℕ) : (satsF RTb MV n false UF UFR S).1 = false := by
  induction n generalizing UF UFR S with
  | zero => rfl
  | succ n ih => rw [satsF_succ]; exact ih _ _ _

/-- a full row (`m(U) = cap`) with `x ≥ m` satisfying it has `x = m` on `U` -/
theorem full_row (x m : ℕ → ℕ) (M : ℕ) (hmx : ∀ l, m l ≤ x l) (hrow : msum x M ≤ msum m M) :
    ∀ l < 127, M.testBit l = true → x l = m l := by
  intro l hl hb
  have hle : ∀ i ∈ range 127, (if M.testBit i then m i else 0) ≤ (if M.testBit i then x i else 0) := by
    intro i _; split
    · exact hmx i
    · exact le_rfl
  have heq := (Finset.sum_eq_sum_iff_of_le hle).mp (le_antisymm (Finset.sum_le_sum hle) hrow)
  have := heq l (Finset.mem_range.mpr hl)
  rw [if_pos hb, if_pos hb] at this
  exact this.symm

theorem msum_le (x : ℕ → ℕ) (M K : ℕ) (hx : ∀ l < 127, x l ≤ K) : msum x M ≤ 127 * K := by
  unfold msum
  calc ∑ l ∈ range 127, (if M.testBit l then x l else 0) ≤ ∑ l ∈ range 127, K := by
        apply Finset.sum_le_sum; intro l hl; rw [Finset.mem_range] at hl; split
        · exact hx l hl
        · exact Nat.zero_le _
    _ = 127 * K := by rw [Finset.sum_const, Finset.card_range, smul_eq_mul]

theorem fsum_and_fmask (m : ℕ → ℕ) (hm : ∀ l < 127, m l ≤ 2 ^ 40) (M : ℕ) (hM : M < 2 ^ 127) :
    E1.fsum (V m &&& E1.fmask M) = msum m M := by
  rw [and_fmask m (fun l hl => lt_of_le_of_lt (hm l hl) (by norm_num)) M hM, fsum_V _ (2 ^ 40) (fun l hl => by
    show (if M.testBit l then m l else 0) ≤ 2 ^ 40
    split
    · exact hm l hl
    · exact Nat.zero_le _) (by norm_num)]
  rfl

/-- **Saturations.** If the events are accepted, every completion within the budgets `u` is within the zeroed budgets. -/
theorem sats_sem (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (m : ℕ → ℕ) (hm : ∀ l < 127, m l ≤ 2 ^ 40)
    (hmx : ∀ l, m l ≤ x l) (n : ℕ) : ∀ ok u S, (∀ l < 127, u l < 2 ^ 128) →
    (satsF RTb (V m) n ok (V u) (VR u) S).1 = true →
    ok = true ∧ ∃ u', (satsF RTb (V m) n ok (V u) (VR u) S).2.1 = V u' ∧ (satsF RTb (V m) n ok (V u) (VR u) S).2.2.1 = VR u' ∧
      (∀ l < 127, u' l ≤ u l) ∧ ((∀ l < 127, x l ≤ m l + u l) → ∀ l < 127, x l ≤ m l + u' l) := by
  induction n with
  | zero => intro ok u S _ h; exact ⟨h, u, rfl, rfl, fun _ _ => le_rfl, id⟩
  | succ n ih =>
    intro ok u S hu h
    rw [satsF_succ] at h ⊢
    generalize hj : E1.rd 12 S = j at h ⊢
    have hv := hT j
    generalize hvd : RTb / 2 ^ (264 * j) % 2 ^ 264 = v at hv
    have eM : E1.rmask RTb j = smask v := by rw [rmask_eq, hvd]
    have eMR : E1.rmaskr RTb j = smr v := by rw [rmaskr_eq, hvd]
    have eC : E1.rcap RTb j = scap v := by rw [rcap_eq, hvd]
    rw [eM, eMR, eC] at h ⊢
    have eU : V u &&& (ECT.FMALL ^^^ E1.fmask (smask v)) = V (fun l => if (smask v).testBit l then 0 else u l) :=
      and_nfmask u hu _ (smask_lt v)
    have eUR : VR u &&& (ECT.FMALL ^^^ E1.fmask (smr v)) = VR (fun l => if (smask v).testBit l then 0 else u l) :=
      and_nfmask_R u hu _ _ (smask_lt v) (smr_lt v) hv.2.1
    rw [eU, eUR] at h ⊢
    have hu' : ∀ l < 127, (fun l => if (smask v).testBit l then 0 else u l) l < 2 ^ 128 := by
      intro l hl; dsimp only; split
      · norm_num
      · exact hu l hl
    generalize hok : @Bool.rec (fun _ => Bool) false (Nat.beq (E1.fsum (V m &&& E1.fmask (smask v))) (scap v)) ok = X at h ⊢
    cases X
    · rw [satsF_false] at h; exact absurd h (by simp)
    · obtain ⟨-, u', h1, h2, h3, h4⟩ := ih true _ (E1.sk 12 S) hu' h
      obtain ⟨hok1, hok2⟩ := band_true hok
      have hfull : msum m (smask v) = scap v := by
        have := Nat.eq_of_beq_eq_true hok2
        rwa [fsum_and_fmask m hm _ (smask_lt v)] at this
      refine ⟨hok1, u', h1, h2, fun l hl => ?_, fun hx l hl => ?_⟩
      · have := h3 l hl; split at this <;> omega
      · apply h4 _ l hl
        intro l' hl'
        show x l' ≤ m l' + (if (smask v).testBit l' then 0 else u l')
        split
        · next hb =>
          have := full_row x m (smask v) hmx (by rw [hfull]; exact hv.1) l' hl' hb
          omega
        · exact hx l' hl'

theorem satsF_rest (RTb MV n : ℕ) (ok : Bool) (UF UFR S : ℕ) : (satsF RTb MV n ok UF UFR S).2.2.2 = S / 2 ^ (12 * n) := by
  induction n generalizing ok UF UFR S with
  | zero => simp [satsF]
  | succ n ih => rw [satsF_succ, ih, sk_eq, Nat.div_div_eq_div_mul, ← pow_add]; ring_nf

/-! ## Budget fixings -/

def fixesF (T gap : ℕ) (n : ℕ) : Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ :=
  Nat.rec (motive := fun _ => Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      ih (@Bool.rec (fun _ => Bool) false
            (@Bool.rec (fun _ => Bool) false
              (@Bool.rec (fun _ => Bool) false
                (Nat.ble (Nat.succ gap) (Nat.mul (Nat.succ (E1.rd 3 (E1.sk 7 S))) (Nat.sub (E1.fld T (E1.rd 7 S)) E1.SC)))
                (Nat.ble (Nat.succ (E1.rd 3 (E1.sk 7 S))) (E1.fld UF (E1.rd 7 S))))
              (Nat.ble (Nat.succ E1.SC) (E1.fld T (E1.rd 7 S))))
            ok)
        (Nat.sub UF (Nat.mul (Nat.sub (E1.fld UF (E1.rd 7 S)) (E1.rd 3 (E1.sk 7 S))) (E1.one (E1.rd 7 S))))
        (Nat.sub UFR (Nat.mul (Nat.sub (E1.fld UF (E1.rd 7 S)) (E1.rd 3 (E1.sk 7 S))) (E1.oner (E1.rd 7 S)))) (E1.sk 10 S)) n

theorem fixes_eq (n T gap UF UFR S : ℕ) : E1.fixes n T gap UF UFR S = fixesF T gap n true UF UFR S := rfl

theorem fixesF_false (T gap n UF UFR S : ℕ) : (fixesF T gap n false UF UFR S).1 = false := by
  induction n generalizing UF UFR S with
  | zero => rfl
  | succ n ih => exact ih _ _ _

/-- the dual's bound on single labels: more than `ν` new copies of `l` would exceed the gap -/
def FixOK (x m t : ℕ → ℕ) (gap : ℕ) : Prop :=
  ∀ l < 127, ∀ ν, 2 ^ 30 < t l → gap < (ν + 1) * (t l - 2 ^ 30) → x l ≤ m l + ν

theorem fixesF_succ (T gap n : ℕ) (ok : Bool) (UF UFR S : ℕ) : fixesF T gap (n + 1) ok UF UFR S =
    fixesF T gap n (@Bool.rec (fun _ => Bool) false
            (@Bool.rec (fun _ => Bool) false
              (@Bool.rec (fun _ => Bool) false
                (Nat.ble (gap + 1) ((E1.rd 3 (E1.sk 7 S) + 1) * (E1.fld T (E1.rd 7 S) - 2 ^ 30)))
                (Nat.ble (E1.rd 3 (E1.sk 7 S) + 1) (E1.fld UF (E1.rd 7 S))))
              (Nat.ble (2 ^ 30 + 1) (E1.fld T (E1.rd 7 S))))
            ok)
        (UF - (E1.fld UF (E1.rd 7 S) - E1.rd 3 (E1.sk 7 S)) * E1.one (E1.rd 7 S))
        (UFR - (E1.fld UF (E1.rd 7 S) - E1.rd 3 (E1.sk 7 S)) * E1.oner (E1.rd 7 S)) (E1.sk 10 S) := rfl

theorem fld_V_ge (a : ℕ → ℕ) (h : ∀ l < 127, a l < 2 ^ 128) (l : ℕ) (hl : 127 ≤ l) : E1.fld (V a) l = 0 := by
  rw [dig_eq_fld]; exact dig_ge 128 (by norm_num) a 127 h l hl

theorem fixes_sem (x m t : ℕ → ℕ) (gap : ℕ) (hfix : FixOK x m t gap) (ht : ∀ l < 127, t l < 2 ^ 128) (n : ℕ) :
    ∀ ok u S, (∀ l < 127, u l < 2 ^ 128) → (fixesF (V t) gap n ok (V u) (VR u) S).1 = true →
    ok = true ∧ ∃ u', (fixesF (V t) gap n ok (V u) (VR u) S).2.1 = V u' ∧ (fixesF (V t) gap n ok (V u) (VR u) S).2.2.1 = VR u' ∧
      (∀ l < 127, u' l ≤ u l) ∧ ((∀ l < 127, x l ≤ m l + u l) → ∀ l < 127, x l ≤ m l + u' l) := by
  induction n with
  | zero => intro ok u S _ h; exact ⟨h, u, rfl, rfl, fun _ _ => le_rfl, id⟩
  | succ n ih =>
    intro ok u S hu h
    rw [fixesF_succ] at h ⊢
    generalize hl0 : E1.rd 7 S = l0 at h ⊢
    have hnu8 : E1.rd 3 (E1.sk 7 S) < 8 := by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)
    generalize hnu : E1.rd 3 (E1.sk 7 S) = nu at h hnu8 ⊢
    generalize hok : @Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false
            (Nat.ble (gap + 1) ((nu + 1) * (E1.fld (V t) l0 - 2 ^ 30)))
            (Nat.ble (nu + 1) (E1.fld (V u) l0))) (Nat.ble (2 ^ 30 + 1) (E1.fld (V t) l0))) ok = X at h ⊢
    cases X
    · rw [fixesF_false] at h; exact absurd h (by simp)
    · obtain ⟨hok0, hc⟩ := band_true hok
      obtain ⟨c1, hc⟩ := band_true hc
      obtain ⟨c2, c3⟩ := band_true hc
      rw [Nat.ble_eq] at c1 c2 c3
      have hl0 : l0 < 127 := by
        by_contra hge
        rw [fld_V_ge t ht l0 (by omega)] at c1; omega
      rw [fld_V t ht l0 hl0] at c1 c3
      rw [fld_V u hu l0 hl0] at c2 h ⊢
      set u2 : ℕ → ℕ := fun l => if l = l0 then nu else u l with hu2
      have eU : V u - (u l0 - nu) * E1.one l0 = V u2 := by
        rw [one_V l0 hl0, mul_comm, V_mul, V_sub _ _ (fun l _ => by
          show (if l = l0 then 1 else 0) * (u l0 - nu) ≤ u l
          split <;> simp_all)]
        apply V_congr; intro l _; simp only [hu2]; split
        · next h' => subst h'; simp; omega
        · next h' => simp [h']
      have eUR : VR u - (u l0 - nu) * E1.oner l0 = VR u2 := by
        rw [oner_VR l0 hl0, mul_comm, VR_mul, VR_sub _ _ (fun l _ => by
          show (if l = l0 then 1 else 0) * (u l0 - nu) ≤ u l
          split <;> simp_all)]
        apply VR_congr; intro l _; simp only [hu2]; split
        · next h' => subst h'; simp; omega
        · next h' => simp [h']
      rw [eU, eUR] at h ⊢
      have hu2b : ∀ l < 127, u2 l < 2 ^ 128 := by
        intro l hl; simp only [hu2]; split
        · omega
        · exact hu l hl
      obtain ⟨-, u', h1, h2, h3, h4⟩ := ih true u2 (E1.sk 10 S) hu2b h
      refine ⟨hok0, u', h1, h2, fun l hl => le_trans (h3 l hl) (by
        simp only [hu2]; split
        · next h' => subst h'; omega
        · exact le_rfl), fun hx l hl => ?_⟩
      apply h4 _ l hl
      intro l' hl'
      simp only [hu2]; split
      · next h' => subst h'; exact hfix l' hl' nu (by omega) (by omega)
      · exact hx l' hl'

theorem fixesF_rest (T gap n : ℕ) (ok : Bool) (UF UFR S : ℕ) : (fixesF T gap n ok UF UFR S).2.2.2 = S / 2 ^ (10 * n) := by
  induction n generalizing ok UF UFR S with
  | zero => simp [fixesF]
  | succ n ih => rw [fixesF_succ, ih, sk_eq, Nat.div_div_eq_div_mul, ← pow_add]; ring_nf

end E1S
