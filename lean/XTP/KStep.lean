module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import L5.Pk5
public import K2.XStep
public import K2.XNode
/-! # XTP.KStep: kill2's X-step, exactly

`K2.xstep_keep` gives one direction (a candidate with at least `d` compatible points survives).  `xstep_bit` is the exact bit: a
candidate `v` survives iff at least `max d 1` points of `cand ∩ H` are outside row `v` of the matrix.  Same proof route
(`remR_spec`, `guard_pk`, `gather`, `testBit_pk1`, `card_bits_remB`). -/
@[expose] public section
namespace XTP
open MisF

theorem bitsB_card_eq_pcnt (B x : ℕ) : (K2.bitsB B x).card = L5.pcnt B x := by
  rw [L5.pcnt_eq_card]; rfl

/-- `remB x j ≠ 0` iff `x` has more than `j` bits -/
theorem remB_ne_zero_iff (B x j : ℕ) (hB : x < 2 ^ B) : K2.remB x j ≠ 0 ↔ j < (K2.bitsB B x).card := by
  have hc := K2.card_bits_remB B x j hB
  constructor
  · intro h
    have := K2.card_bits_pos B _ h (K2.remB_lt B x j hB)
    omega
  · intro h h0
    rw [h0, K2.bitsB_zero] at hc
    simp at hc; omega

/-- **the X-step, exactly**: candidate `v < n` survives iff `max d 1 ≤ |(cand ∩ H) \ row v|` -/
theorem xstep_bit (A REP GRD LOWS MODM S n cand H d v : ℕ) (hS : n + 2 ≤ S) (hc : cand < 2 ^ n)
    (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1) (hv : v < n) :
    (K2.xstep A REP GRD LOWS MODM S cand H d).testBit v =
      (cand.testBit v && decide (max d 1 ≤ L5.pcnt S ((cand &&& H) ^^^ ((cand &&& H) &&& dig S A v)))) := by
  have hS1 : 1 ≤ S := by omega
  set Y := cand &&& H with hYdef
  have hY : Y < 2 ^ n := lt_of_le_of_lt Nat.and_le_left hc
  have hYS : Y < 2 ^ (S - 1) := lt_of_lt_of_le hY (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hYS2 : Y < 2 ^ S := lt_of_lt_of_le hYS (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hR0 : Y * REP = pk S (fun _ => Y) n := by rw [hREP, ← pk_mul]; apply pk_congr; intro i _; ring
  have hR0lt : Y * REP < 2 ^ (S * n) := by rw [hR0]; exact pk_lt _ _ _ (fun _ _ => hYS2)
  have hR0d : ∀ i < n, dig S (Y * REP) i = Y := fun i hi => by rw [hR0]; exact dig_pk _ _ _ (fun _ _ => hYS2) i hi
  set R := (Y * REP) ^^^ ((Y * REP) &&& A) with hRdef
  have hRd : ∀ i < n, dig S R i = Y ^^^ (Y &&& dig S A i) := by
    intro i hi; rw [hRdef, K2.dig_xor, K2.dig_land, hR0d i hi]
  have hRlt : R < 2 ^ (S * n) := K2.xor_and_lt _ _ _ hR0lt
  have hRdl : ∀ i < n, dig S R i < 2 ^ (S - 1) := fun i hi => by rw [hRd i hi]; exact K2.xor_and_lt _ _ _ hYS
  obtain ⟨h1, h2, h3⟩ := K2.remR_spec S n R REP GRD hS1 hREP hGRD hRlt hRdl (d - 1)
  have hG := K2.guard_pk S n _ LOWS GRD hS1 hL hGRD h1 h3
  set g := fun i => if dig S (K2.remR R GRD REP (d - 1)) i = 0 then 0 else 1 with hgdef
  have hg : ∀ i < n, g i ≤ 1 := fun i _ => by simp only [hgdef]; split <;> omega
  have hgat := K2.gather S n g hg hS
  unfold K2.xstep
  rw [show Nat.land cand H = Y from rfl]
  change (cand &&& ((((K2.remR R GRD REP (d - 1) + LOWS) &&& GRD) >>> (S - 1)) % MODM)).testBit v = _
  rw [hG, hM, hgat, Nat.testBit_and, K2.testBit_pk1 g n v hg hv]
  congr 1
  have hRv : dig S R v < 2 ^ S := lt_of_lt_of_le (hRdl v hv) (Nat.pow_le_pow_right (by norm_num) (by omega))
  have key : g v = 1 ↔ max d 1 ≤ L5.pcnt S (Y ^^^ (Y &&& dig S A v)) := by
    simp only [hgdef]
    rw [h2 v hv]
    have := remB_ne_zero_iff S (dig S R v) (d - 1) hRv
    rw [hRd v hv, bitsB_card_eq_pcnt] at this
    split
    · rename_i h0
      constructor
      · intro h; exact absurd h (by omega)
      · intro h; exfalso; apply (this.mpr (by omega)); rw [← hRd v hv]; exact h0
    · rename_i h0
      constructor
      · intro _; have := this.mp (by rw [← hRd v hv]; exact h0); omega
      · intro _; rfl
  exact decide_eq_decide.mpr key

/-- the popcount of a difference -/
theorem pcnt_diff (S Y a : ℕ) : L5.pcnt S (Y ^^^ (Y &&& a)) + L5.pcnt S (Y &&& a) = L5.pcnt S Y := by
  induction S with
  | zero => rfl
  | succ S ih =>
    rw [L5.pcnt_succ, L5.pcnt_succ, L5.pcnt_succ, ← ih]
    simp only [Nat.testBit_xor, Nat.testBit_and]
    cases Y.testBit S <;> cases a.testBit S <;> simp <;> ring

end XTP
