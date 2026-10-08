module
public import R22Port.U_d41d8cd98f00
public import L5.Node5O
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # `R3RT.SpecO.Frame5Spec O Ω`: the frame of a cut node or leaf (`R3RT.frame5`)

`frame5` is `node5` without kills, R1/R2 rows and hyperplane tests: the record has V rows only (`(rec >>> 32) % 2^30 = 0`), so
`node5`'s row count `m` is `nV`, its masks and counts are `frame5`'s, and its dead mask is `frame5`'s.  The child frame is
then proved with `node5`'s lemmas (`rows_ok`, `dead_ok`, `conf_ok`). -/
noncomputable section
namespace L5O
open E1S Finset R3RT.Spec RootSound BC4 BC5 Classical L5
variable {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop}

def f5MB (rec : ℕ) : ℕ := Nat.land (Nat.shiftRight rec 64) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft (n5nV rec) 9)) 1)
def f5E (rec : ℕ) : ℕ :=
  Nat.land (Nat.shiftRight (Nat.shiftRight rec 64) (Nat.shiftLeft (n5nV rec) 9)) (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft (n5nV rec) 3)) 1)
def f5D' (D N rec : ℕ) : ℕ :=
  Nat.lor (Nat.lor D (Nat.land (Nat.shiftRight N (Nat.shiftLeft (n5last rec) 9)) L1.M512)) (L1.orFold 10 (f5MB rec) (n5nV rec))

theorem frame5_eq (S D N U dP c2 h rec : ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool) :
    R3RT.frame5 S D N U dP c2 h rec k =
      (Nat.blt (n5last rec) 511 && Nat.beq (Nat.shiftRight S (n5last rec)) 0 && Nat.beq (n5d rec) (Nat.succ dP) &&
        Nat.beq (Nat.land (Nat.shiftRight rec 32) 1073741823) 0 &&
        L1.blocks (f5MB rec) (f5E rec) (Nat.mul (Nat.lor S (Nat.shiftLeft 1 (n5last rec))) L1.REP63)
          (Nat.div (Nat.add (n5nV rec) 62) 63) &&
        k (Nat.lor S (Nat.shiftLeft 1 (n5last rec))) (f5D' D N rec) (Nat.lor N c2) (Nat.add U h)) := rfl

/-- **`frame5`'s contract.** -/
theorem frame5_spec : R3RT.SpecO.Frame5Spec O Ω := by
  intro S D N U dP c2 h rec k hF hC2 hH hR hn
  intro last
  rw [frame5_eq] at hn
  simp only [Bool.and_eq_true] at hn
  obtain ⟨⟨⟨⟨⟨hl1, hpre⟩, hd⟩, h30⟩, hblk⟩, hk⟩ := hn
  -- only V rows
  have h30' : (rec >>> 32) % 2 ^ 30 = 0 := by
    rw [Nat.beq_eq, land_eq, shr_eq, show (1073741823 : ℕ) = 2 ^ 30 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod] at h30
    exact h30
  have hn1 : n5n1 rec = 0 := by
    rw [n5n1_eq]
    have : (rec >>> 32) % 1024 = ((rec >>> 32) % 2 ^ 30) % 1024 := by
      rw [show (1024 : ℕ) = 2 ^ 10 by norm_num, Nat.mod_mod_of_dvd _ (pow_dvd_pow 2 (by norm_num))]
    rw [this, h30', Nat.zero_mod]
  have hn2 : n5n2 rec = 0 := by
    rw [n5n2_eq]
    have e : rec >>> 52 = (rec >>> 32) >>> 20 := by rw [← Nat.shiftRight_add]
    have : (rec >>> 32 >>> 20) % 1024 = ((rec >>> 32) % 2 ^ 30) >>> 20 % 1024 := by
      apply Nat.eq_of_testBit_eq; intro j
      simp only [show (1024 : ℕ) = 2 ^ 10 by norm_num, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]
      by_cases hj : j < 10
      · simp [hj, show 20 + j < 30 by omega]
      · simp [hj]
    rw [e, this, h30', Nat.zero_shiftRight, Nat.zero_mod]
  have hm : n5m rec = n5nV rec := by unfold n5m; rw [hn1, hn2]; rfl
  have hMB : f5MB rec = n5MB rec := by
    unfold f5MB; rw [mask_ops, n5MB_eq, hm, shr_eq]
  have hE : f5E rec = n5E rec := by
    rw [n5E_eq, hm]; unfold f5E
    rw [land_eq, shr_eq, shr_eq, nsub_eq, shl_eq, shl_eq, shl_eq, Nat.shiftLeft_eq, Nat.shiftLeft_eq, Nat.shiftLeft_eq,
      Nat.one_mul, Nat.and_two_pow_sub_one_eq_mod, mul_comm (n5nV rec) (2 ^ 9), mul_comm (n5nV rec) (2 ^ 3)]
  have hD : f5D' D N rec = n5D' D N rec := by
    unfold f5D' n5D'
    rw [hMB, mask_ops (n5MB rec) (n5nV rec), n5MB_eq, hm, Nat.mod_mod]
  have hblk' : L1.blocks (n5MB rec) (n5E rec) (Nat.mul (Nat.lor S (Nat.shiftLeft 1 (n5last rec))) L1.REP63)
      (Nat.div (Nat.add (n5m rec) 62) 63) = true := by rw [← hMB, ← hE, hm]; exact hblk
  -- as in `node5_spec`
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
  have hcard : ((range 511).filter (fun l => (S ||| 2 ^ last).testBit l = true)).card = dP + 1 := by
    rw [card_or_pow S last hSlt hl, hScard]
  have hd31 : dP + 1 ≤ 31 := by rw [← hd', n5d_eq]; have := Nat.mod_lt (rec >>> 17) (show 0 < 32 by norm_num); omega
  have hpc : pcnt 512 (S ||| 2 ^ last) ≤ 127 := by rw [pcnt_eq_card511 _ hS'lt, hcard]; omega
  rw [hS'eq] at hblk' hk
  have hrows := rows_ok rec (S ||| 2 ^ last) hS'lt hpc hR hblk'
  have hSl : S.testBit last = false := Nat.testBit_lt_two_pow hSlt
  have hlastOf : lastOf (S ||| 2 ^ last) = last := lastOf_or S last hSlt
  refine ⟨f5D' D N rec, ⟨by rw [or_pow_eq S _ hSlt]; positivity, hS'lt, hcard,
    by rw [hU, packU_or S last h hSl hl hH], fun A hΩ hB => ?_⟩, ?_⟩
  · rw [hlastOf] at hB ⊢
    refine ⟨?_, conf_ok S N c2 last A hΩ hl hSlt hS0 (fun A hΩ' hB' => (hFA A hΩ' hB').2) hC2 hB⟩
    have := dead_ok S D N rec A hΩ (by rw [hlast_eq]; exact hl) (by rw [hlast_eq]; exact hSlt) hS0 hFA
      (by rw [hlast_eq]; exact hrows) (by rw [hlast_eq]; exact hB)
    rw [hlast_eq, ← hD] at this; exact this
  · rw [lor_eq, nadd_eq] at hk; exact hk

end L5O
