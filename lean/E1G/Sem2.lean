module
public import R22Port.U_d41d8cd98f00
public import E1G.Sem
/-! # Semantics of E1's steps: saturations, fixings, weak duality, the multiplicity order

* `sats_sem`: accepted saturation events keep every completion within the new (zeroed) budgets.
* `fixes_sem`: accepted budget fixings keep every completion within the new budgets, given the dual's bound (`FixOK`).
* `wd_bound`: the weak-duality inequality behind kills, cuts and fixings.
* `VR_lt_iff`: comparing reversed packings is the multiplicity order (first differing label).
* `prefix_lex`: a non-canonical prefix makes the whole multiset non-canonical. -/
@[expose] public section
set_option maxRecDepth 20000
namespace E1GS
open Finset
set_option exponentiation.threshold 600

/-! ## Saturations -/

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
    E1G.fsum (V m &&& E1G.fmask M) = msum m M := by
  rw [and_fmask m (fun l hl => lt_of_le_of_lt (hm l hl) (by norm_num)) M hM, fsum_V _ (2 ^ 40) (fun l hl => by
    show (if M.testBit l then m l else 0) ≤ 2 ^ 40
    split
    · exact hm l hl
    · exact Nat.zero_le _) (by norm_num)]
  rfl

/-- the saturation loop with explicit accumulators -/
def satsMF (RTb MV : ℕ) (n : ℕ) : Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ :=
  Nat.rec (motive := fun _ => Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ) (fun ok M MR S => (ok, M, MR, S))
    (fun _ ih ok M MR S =>
      ih (@Bool.rec (fun _ => Bool) false (Nat.beq (E1G.fsum (Nat.land MV (E1G.fmask (E1G.rmask RTb (E1G.rd 12 S)))))
        (E1G.rcap RTb (E1G.rd 12 S))) ok)
        (Nat.lor M (E1G.rmask RTb (E1G.rd 12 S))) (Nat.lor MR (E1G.rmaskr RTb (E1G.rd 12 S))) (E1G.sk 12 S)) n

theorem satsM_eq (RTb n MV S : ℕ) : E1G.satsM RTb n MV S = satsMF RTb MV n true 0 0 S := rfl
theorem satsMF_succ (RTb MV n : ℕ) (ok : Bool) (M MR S : ℕ) : satsMF RTb MV (n + 1) ok M MR S =
    satsMF RTb MV n (@Bool.rec (fun _ => Bool) false (Nat.beq (E1G.fsum (Nat.land MV (E1G.fmask (E1G.rmask RTb (E1G.rd 12 S)))))
      (E1G.rcap RTb (E1G.rd 12 S))) ok)
      (M ||| E1G.rmask RTb (E1G.rd 12 S)) (MR ||| E1G.rmaskr RTb (E1G.rd 12 S)) (E1G.sk 12 S) := rfl

theorem satsMF_false (RTb MV n M MR S : ℕ) : (satsMF RTb MV n false M MR S).1 = false := by
  induction n generalizing M MR S with
  | zero => rfl
  | succ n ih => rw [satsMF_succ]; exact ih _ _ _

/-- the union of accepted full rows: every label in it has `x = m`; the reversed union is its reversal -/
theorem satsMF_sem (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (m : ℕ → ℕ) (hm : ∀ l < 127, m l ≤ 2 ^ 40)
    (hmx : ∀ l, m l ≤ x l) (n : ℕ) : ∀ ok M MR S, M < 2 ^ 127 → MR < 2 ^ 127 →
    (∀ j < 127, MR.testBit j = M.testBit (126 - j)) → (∀ l < 127, M.testBit l = true → x l = m l) →
    (satsMF RTb (V m) n ok M MR S).1 = true →
    ok = true ∧ (satsMF RTb (V m) n ok M MR S).2.1 < 2 ^ 127 ∧ (satsMF RTb (V m) n ok M MR S).2.2.1 < 2 ^ 127 ∧
      (∀ j < 127, (satsMF RTb (V m) n ok M MR S).2.2.1.testBit j = (satsMF RTb (V m) n ok M MR S).2.1.testBit (126 - j)) ∧
      (∀ l < 127, (satsMF RTb (V m) n ok M MR S).2.1.testBit l = true → x l = m l) := by
  induction n with
  | zero => intro ok M MR S hM hMR hrev hx h; exact ⟨h, hM, hMR, hrev, hx⟩
  | succ n ih =>
    intro ok M MR S hM hMR hrev hx h
    rw [satsMF_succ] at h ⊢
    generalize hj : E1G.rd 12 S = j at h ⊢
    have hv := hT j
    generalize hvd : RTb / 2 ^ (264 * j) % 2 ^ 264 = v at hv
    have eM : E1G.rmask RTb j = smask v := by rw [rmask_eq, hvd]
    have eMR : E1G.rmaskr RTb j = smr v := by rw [rmaskr_eq, hvd]
    have eC : E1G.rcap RTb j = scap v := by rw [rcap_eq, hvd]
    rw [eM, eMR, eC] at h ⊢
    generalize hok : @Bool.rec (fun _ => Bool) false (Nat.beq (E1G.fsum (Nat.land (V m) (E1G.fmask (smask v)))) (scap v)) ok = X at h ⊢
    cases X
    · rw [satsMF_false] at h; exact absurd h (by simp)
    · obtain ⟨hok1, hok2⟩ := band_true hok
      have hfull : msum m (smask v) = scap v := by
        have := Nat.eq_of_beq_eq_true hok2
        rwa [show Nat.land (V m) (E1G.fmask (smask v)) = V m &&& E1G.fmask (smask v) from rfl,
          fsum_and_fmask m hm _ (smask_lt v)] at this
      have hM' : M ||| smask v < 2 ^ 127 := Nat.or_lt_two_pow hM (smask_lt v)
      have hMR' : MR ||| smr v < 2 ^ 127 := Nat.or_lt_two_pow hMR (smr_lt v)
      have hrev' : ∀ j' < 127, (MR ||| smr v).testBit j' = (M ||| smask v).testBit (126 - j') := by
        intro j' hj'; rw [Nat.testBit_or, Nat.testBit_or, hrev j' hj', hv.2.1 j' hj']
      have hx' : ∀ l < 127, (M ||| smask v).testBit l = true → x l = m l := by
        intro l hl hb
        rw [Nat.testBit_or, Bool.or_eq_true] at hb
        rcases hb with hb | hb
        · exact hx l hl hb
        · exact full_row x m (smask v) hmx (by rw [hfull]; exact hv.1) l hl hb
      obtain ⟨-, r1, r2, r3, r4⟩ := ih true _ _ (E1G.sk 12 S) hM' hMR' hrev' hx' h
      exact ⟨hok1, r1, r2, r3, r4⟩

/-- the saturation result as an explicit tuple (stated by `rfl` against the definitions; the kernel never compares two
different tuples whose components hold `Nat.land`/`Nat.xor` of the 16384-bit `FMALL`, which would recurse on its bits) -/
theorem sats_tuple (RTb n MV UF UFR S : ℕ) : E1G.sats RTb n MV UF UFR S =
    ((satsMF RTb MV n true 0 0 S).1, Nat.land UF (Nat.xor ECT.FMALL (E1G.fmask (satsMF RTb MV n true 0 0 S).2.1)),
     Nat.land UFR (Nat.xor ECT.FMALL (E1G.fmask (satsMF RTb MV n true 0 0 S).2.2.1)), (satsMF RTb MV n true 0 0 S).2.2.2) :=
  rfl

theorem land_nfmask (u : ℕ → ℕ) (M : ℕ) (hu : ∀ l < 127, u l < 2 ^ 128) (hM : M < 2 ^ 127) :
    Nat.land (V u) (Nat.xor ECT.FMALL (E1G.fmask M)) = V (fun l => if M.testBit l then 0 else u l) :=
  and_nfmask u hu M hM
theorem land_nfmask_R (u : ℕ → ℕ) (M MR : ℕ) (hu : ∀ l < 127, u l < 2 ^ 128) (hM : M < 2 ^ 127) (hMR : MR < 2 ^ 127)
    (hrev : ∀ j < 127, MR.testBit j = M.testBit (126 - j)) :
    Nat.land (VR u) (Nat.xor ECT.FMALL (E1G.fmask MR)) = VR (fun l => if M.testBit l then 0 else u l) :=
  and_nfmask_R u hu M MR hM hMR hrev

/-- **Saturations.** If the events are accepted, every completion within the budgets `u` is within the zeroed budgets. -/
theorem sats_sem (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (m : ℕ → ℕ) (hm : ∀ l < 127, m l ≤ 2 ^ 40)
    (hmx : ∀ l, m l ≤ x l) (n S : ℕ) (u : ℕ → ℕ) (hu : ∀ l < 127, u l < 2 ^ 128)
    (h : (E1G.sats RTb n (V m) (V u) (VR u) S).1 = true) :
    ∃ u', (E1G.sats RTb n (V m) (V u) (VR u) S).2.1 = V u' ∧ (E1G.sats RTb n (V m) (V u) (VR u) S).2.2.1 = VR u' ∧
      (∀ l < 127, u' l ≤ u l) ∧ ((∀ l < 127, x l ≤ m l + u l) → ∀ l < 127, x l ≤ m l + u' l) := by
  rw [sats_tuple] at h ⊢
  dsimp only at h
  obtain ⟨-, hM, hMR, hrev, hx⟩ := satsMF_sem x RTb hT m hm hmx n true 0 0 S (by norm_num) (by norm_num)
    (fun j _ => by simp) (fun l _ hb => by simp at hb) h
  generalize satsMF RTb (V m) n true 0 0 S = r at hM hMR hrev hx ⊢
  dsimp only
  refine ⟨fun l => if r.2.1.testBit l then 0 else u l, land_nfmask u r.2.1 hu hM, land_nfmask_R u r.2.1 r.2.2.1 hu hM hMR hrev,
    fun l hl => ?_, fun hxu l hl => ?_⟩
  · dsimp only; split <;> omega
  · dsimp only
    split
    · next hb => have := hx l hl hb; omega
    · exact hxu l hl

theorem sats_rest (RTb n MV UF UFR S : ℕ) : (E1G.sats RTb n MV UF UFR S).2.2.2 = S / 2 ^ (12 * n) := by
  show (satsMF RTb MV n true 0 0 S).2.2.2 = _
  suffices h : ∀ n ok M MR S, (satsMF RTb MV n ok M MR S).2.2.2 = S / 2 ^ (12 * n) from h n true 0 0 S
  intro n
  induction n with
  | zero => intro ok M MR S; simp [satsMF]
  | succ n ih => intro ok M MR S; rw [satsMF_succ, ih, sk_eq, Nat.div_div_eq_div_mul, ← pow_add]; ring_nf

/-! ## Budget fixings -/

def fixesF (T gap : ℕ) (n : ℕ) : Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ :=
  Nat.rec (motive := fun _ => Bool → ℕ → ℕ → ℕ → Bool × ℕ × ℕ × ℕ) (fun ok UF UFR S => (ok, UF, UFR, S))
    (fun _ ih ok UF UFR S =>
      ih (@Bool.rec (fun _ => Bool) false
            (@Bool.rec (fun _ => Bool) false
              (@Bool.rec (fun _ => Bool) false
                (Nat.ble (Nat.succ gap) (Nat.mul (Nat.succ (E1G.rd 3 (E1G.sk 7 S))) (Nat.sub (E1G.fld T (E1G.rd 7 S)) E1G.SC)))
                (Nat.ble (Nat.succ (E1G.rd 3 (E1G.sk 7 S))) (E1G.fld UF (E1G.rd 7 S))))
              (Nat.ble (Nat.succ E1G.SC) (E1G.fld T (E1G.rd 7 S))))
            ok)
        (Nat.sub UF (Nat.mul (Nat.sub (E1G.fld UF (E1G.rd 7 S)) (E1G.rd 3 (E1G.sk 7 S))) (E1G.one (E1G.rd 7 S))))
        (Nat.sub UFR (Nat.mul (Nat.sub (E1G.fld UF (E1G.rd 7 S)) (E1G.rd 3 (E1G.sk 7 S))) (E1G.oner (E1G.rd 7 S)))) (E1G.sk 10 S)) n

theorem fixes_eq (n T gap UF UFR S : ℕ) : E1G.fixes n T gap UF UFR S = fixesF T gap n true UF UFR S := rfl

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
                (Nat.ble (gap + 1) ((E1G.rd 3 (E1G.sk 7 S) + 1) * (E1G.fld T (E1G.rd 7 S) - 2 ^ 30)))
                (Nat.ble (E1G.rd 3 (E1G.sk 7 S) + 1) (E1G.fld UF (E1G.rd 7 S))))
              (Nat.ble (2 ^ 30 + 1) (E1G.fld T (E1G.rd 7 S))))
            ok)
        (UF - (E1G.fld UF (E1G.rd 7 S) - E1G.rd 3 (E1G.sk 7 S)) * E1G.one (E1G.rd 7 S))
        (UFR - (E1G.fld UF (E1G.rd 7 S) - E1G.rd 3 (E1G.sk 7 S)) * E1G.oner (E1G.rd 7 S)) (E1G.sk 10 S) := rfl

theorem fld_V_ge (a : ℕ → ℕ) (h : ∀ l < 127, a l < 2 ^ 128) (l : ℕ) (hl : 127 ≤ l) : E1G.fld (V a) l = 0 := by
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
    generalize hl0 : E1G.rd 7 S = l0 at h ⊢
    have hnu8 : E1G.rd 3 (E1G.sk 7 S) < 8 := by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)
    generalize hnu : E1G.rd 3 (E1G.sk 7 S) = nu at h hnu8 ⊢
    generalize hok : @Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false
            (Nat.ble (gap + 1) ((nu + 1) * (E1G.fld (V t) l0 - 2 ^ 30)))
            (Nat.ble (nu + 1) (E1G.fld (V u) l0))) (Nat.ble (2 ^ 30 + 1) (E1G.fld (V t) l0))) ok = X at h ⊢
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
      have eU : V u - (u l0 - nu) * E1G.one l0 = V u2 := by
        rw [one_V l0 hl0, mul_comm, V_mul, V_sub _ _ (fun l _ => by
          show (if l = l0 then 1 else 0) * (u l0 - nu) ≤ u l
          split <;> simp_all)]
        apply V_congr; intro l _; simp only [hu2]; split
        · next h' => subst h'; simp; omega
        · next h' => simp [h']
      have eUR : VR u - (u l0 - nu) * E1G.oner l0 = VR u2 := by
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
      obtain ⟨-, u', h1, h2, h3, h4⟩ := ih true u2 (E1G.sk 10 S) hu2b h
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

end E1GS
