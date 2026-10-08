module
public import R22Port.U_d41d8cd98f00
public import E1.Node
/-! # Soundness of E1 blocks and block chains

* `StartOK x ub S`: `x` completes the start state of block `S` (mode 1: the recorded budgets; mode 0: the label caps
  `ub` minus the prefix).
* `block_sound`: an accepted block whose start state `x` completes leads `x` to one of its header's delegated states.
* `glue_start`: a header record glued to a block (`E1.glue`) makes `x` complete that block's start state.
* `chain_sound`: in a chain of accepted blocks where every header record is glued to a later block, `x` completes no
  block's start state. -/
@[expose] public section
namespace E1S
open Finset
set_option exponentiation.threshold 600

local macro "sel " c:term:max a:term:max b:term:max : term => `(@Bool.rec (fun _ => _) $b $a $c)

/-- `x` completes the start state of block `S` -/
def StartOK (x ub : ℕ → ℕ) (S : ℕ) : Prop :=
  Cmpl x (S / 2 % 2 ^ 5) (S / 2 ^ 6 % 2 ^ 7) (S / 2 ^ 13 % 2 ^ (7 * (S / 2 % 2 ^ 5)))
    (if S % 2 = 1 then bud3 (S / 2 ^ (13 + 7 * (S / 2 % 2 ^ 5)))
     else fun l => ub l - multR (S / 2 % 2 ^ 5) (S / 2 ^ 13 % 2 ^ (7 * (S / 2 % 2 ^ 5))) l)

theorem bD_eq (S : ℕ) : E1.bD S = S / 2 % 2 ^ 5 := by
  show E1.rd 5 (E1.sk 1 S) = _; rw [rd_eq, sk_eq]; rfl
theorem bPos_eq (S : ℕ) : E1.rd 7 (E1.sk 6 S) = S / 2 ^ 6 % 2 ^ 7 := by rw [rd_eq, sk_eq]
theorem bPl_eq (S : ℕ) : E1.bPl S = S / 2 ^ 13 % 2 ^ (7 * (S / 2 % 2 ^ 5)) := by
  show E1.rd (Nat.mul 7 (E1.bD S)) (E1.sk 13 S) = _; rw [rd_eq, sk_eq, bD_eq]; rfl
theorem bS1_eq (S : ℕ) : E1.bS1 S = S / 2 ^ (13 + 7 * (S / 2 % 2 ^ 5)) := by
  show E1.sk (Nat.add 13 (Nat.mul 7 (E1.bD S))) S = _; rw [sk_eq, bD_eq]; rfl
theorem mode_lt (S : ℕ) : E1.rd 1 S < 2 := by rw [rd_eq]; exact Nat.mod_lt _ (by norm_num)

theorem bUF_eq (UB S : ℕ) : E1.bUF UB S =
    sel (Nat.beq (E1.rd 1 S) 1) (E1.budU (E1.bS1 S)) (Nat.sub UB (E1.mvOf (E1.bD S) (E1.bPl S)).1) := rfl
theorem bUFR_eq (UBR S : ℕ) : E1.bUFR UBR S =
    sel (Nat.beq (E1.rd 1 S) 1) (E1.budUR (E1.bS1 S)) (Nat.sub UBR (E1.mvOf (E1.bD S) (E1.bPl S)).2) := rfl
theorem bSat_eq (sl : ℕ → ℕ) (UB UBR S : ℕ) : E1.bSat sl UB UBR S =
    sel (Nat.beq (E1.rd 1 S) 0)
      (E1.sats (E1.bRT sl S).1 (E1.rd 8 (E1.bRT sl S).2) (E1.mvOf (E1.bD S) (E1.bPl S)).1 (E1.bUF UB S) (E1.bUFR UBR S)
        (E1.sk 8 (E1.bRT sl S).2))
      (true, E1.bUF UB S, E1.bUFR UBR S, (E1.bRT sl S).2) := rfl
theorem bRT_eq (sl : ℕ → ℕ) (S : ℕ) : E1.bRT sl S = E1.mkRT sl (E1.rd 12 (E1.hdr (E1.bS2 S)).2.2) (E1.sk 12 (E1.hdr (E1.bS2 S)).2.2) :=
  rfl
theorem block_eq (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR S : ℕ) : E1.block C sl UB UBR S =
    @Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false
      (E1.node C (E1.bRT sl S).1 (E1.hdr (E1.bS2 S)).2.1 24 (E1.bD S) (E1.rd 7 (E1.sk 6 S)) (E1.bPl S)
        (E1.mvOf (E1.bD S) (E1.bPl S)).1 (E1.mvOf (E1.bD S) (E1.bPl S)).2
        (E1.bSat sl UB UBR S).2.1 (E1.bSat sl UB UBR S).2.2.1 (E1.bSat sl UB UBR S).2.2.2)
      (Nat.ble (E1.bD S) C.R)) (E1.bSat sl UB UBR S).1 := rfl

/-- **Blocks.** -/
theorem block_sound (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (ub x : ℕ → ℕ) (hg : Glob C x)
    (hsl : ∀ i < 2 ^ 15, SlotV x (sl i)) (hUB : UB = V ub) (hUBR : UBR = VR ub) (hubb : ∀ l < 127, ub l ≤ 2 ^ 32)
    (hxub : ∀ l < 127, x l ≤ ub l) (S : ℕ) (h : E1.block C sl UB UBR S = true) (hs : StartOK x ub S) :
    Reach x (E1.hdr (E1.bS2 S)).2.1 := by
  rw [block_eq] at h
  obtain ⟨hsat, h⟩ := band_true h
  obtain ⟨-, hnode⟩ := band_true h
  have hT : SlotsOK x (E1.bRT sl S).1 := by rw [bRT_eq]; exact mkRT_ok x sl hsl _ _
  -- the prefix
  unfold StartOK at hs
  rw [← bPl_eq, ← bS1_eq, ← bPos_eq, ← bD_eq] at hs
  have hm0 : ∀ l, 127 ≤ l → multR (E1.bD S) (E1.bPl S) l = 0 := by
    intro l hl; have := hs.1 l; rw [hg.xN l (by have := hg.N_le; omega)] at this; omega
  have hmv := mvOf_eq (E1.bD S) (E1.bPl S) hm0
  have hpl : E1.bPl S < 2 ^ (7 * E1.bD S) := by rw [bPl_eq, bD_eq]; exact Nat.mod_lt _ (by positivity)
  have hmle : ∀ l < 127, multR (E1.bD S) (E1.bPl S) l ≤ 2 ^ 40 := by
    intro l _; have := multR_le (E1.bD S) (E1.bPl S) l
    have : E1.bD S < 32 := by rw [bD_eq]; exact Nat.mod_lt _ (by norm_num)
    omega
  rw [hmv] at hnode
  apply node_sound hg hT 24 _ _ _ _ _ _ _ _ hnode
  -- the start budgets
  rw [bSat_eq, bUF_eq, bUFR_eq, hmv] at hsat ⊢
  have hmode := mode_lt S
  have hmod2 : S % 2 = E1.rd 1 S := by rw [rd_eq]; rfl
  rw [hmod2] at hs
  generalize E1.rd 1 S = mode at hsat hs hmode ⊢
  rcases (by omega : mode = 0 ∨ mode = 1) with rfl | rfl
  · -- mode 0: label caps minus the prefix, then the saturated rows
    rw [show Nat.beq 0 1 = false from rfl, show Nat.beq 0 0 = true from rfl] at hsat ⊢
    dsimp only at hsat ⊢
    rw [if_neg (by norm_num)] at hs
    have hmub : ∀ l < 127, multR (E1.bD S) (E1.bPl S) l ≤ ub l := fun l hl => le_trans (hs.1 l) (hxub l hl)
    have e1 : Nat.sub UB (V (multR (E1.bD S) (E1.bPl S))) = V (fun l => ub l - multR (E1.bD S) (E1.bPl S) l) := by
      rw [hUB]; exact V_sub _ _ hmub
    have e2 : Nat.sub UBR (VR (multR (E1.bD S) (E1.bPl S))) = VR (fun l => ub l - multR (E1.bD S) (E1.bPl S) l) := by
      rw [hUBR]; exact VR_sub _ _ hmub
    rw [e1, e2] at hsat ⊢
    rw [sats_eq] at hsat ⊢
    obtain ⟨-, u', h1, h2, h3, h4⟩ := sats_sem x _ hT _ hmle hs.1 _ true _ _
      (fun l hl => by have := hubb l hl; omega) hsat
    refine ⟨u', rfl, rfl, h1, h2, fun l hl => le_trans (h3 l hl) (by have := hubb l hl; omega),
      ⟨hs.1, hs.2.1, hs.2.2.1, h4 hs.2.2.2⟩, hpl⟩
  · -- mode 1: the recorded budgets
    rw [show Nat.beq 1 1 = true from rfl, show Nat.beq 1 0 = false from rfl] at ⊢
    dsimp only
    rw [if_pos rfl] at hs
    refine ⟨bud3 (E1.bS1 S), rfl, rfl, budU_eq _, budUR_eq _, fun l _ => le_trans (le_of_lt (bud3_lt _ _)) (by norm_num),
      hs, hpl⟩

/-! ## Glue and chains -/

theorem mod_div_mod (a W k j : ℕ) (h : k + j ≤ W) : (a % 2 ^ W) / 2 ^ k % 2 ^ j = a / 2 ^ k % 2 ^ j := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow,
    Nat.testBit_div_two_pow]
  by_cases hi : i < j
  · have : i + k < W := by omega
    simp [hi, this]
  · simp [hi]

theorem cmpl_congr (x : ℕ → ℕ) (d pos pl : ℕ) (u v : ℕ → ℕ) (huv : ∀ l < 127, u l = v l) (h : Cmpl x d pos pl u) :
    Cmpl x d pos pl v := ⟨h.1, h.2.1, h.2.2.1, fun l hl => by rw [← huv l hl]; exact h.2.2.2 l hl⟩

/-- a glued header record makes `x` complete the glued block's start state -/
theorem glue_start (x ub : ℕ → ℕ) (r Sc : ℕ) (hgl : E1.glue r Sc = true) (hr : RecV x r) : StartOK x ub Sc := by
  unfold E1.glue at hgl
  obtain ⟨h1, h2⟩ := band_true hgl
  have hm : Sc % 2 = 1 := by have := Nat.eq_of_beq_eq_true h1; rwa [rd_eq] at this
  have hr' : Sc / 2 % 2 ^ (393 + 7 * (r % 2 ^ 5)) = r := by
    have := Nat.eq_of_beq_eq_true h2; rwa [rd_eq, rd_eq, sk_eq] at this
  set W := 393 + 7 * (r % 2 ^ 5) with hW
  have ed : Sc / 2 % 2 ^ 5 = r % 2 ^ 5 := by
    rw [← hr', Nat.mod_mod_of_dvd _ (pow_dvd_pow 2 (by omega))]
  have epos : Sc / 2 ^ 6 % 2 ^ 7 = r / 2 ^ 5 % 2 ^ 7 := by
    rw [← hr', mod_div_mod _ W 5 7 (by omega), Nat.div_div_eq_div_mul, ← pow_succ']
  have epl : Sc / 2 ^ 13 % 2 ^ (7 * (r % 2 ^ 5)) = r / 2 ^ 12 % 2 ^ (7 * (r % 2 ^ 5)) := by
    rw [← hr', mod_div_mod _ W 12 _ (by omega), Nat.div_div_eq_div_mul, ← pow_succ']
  unfold StartOK
  rw [ed, if_pos hm, epos, epl]
  apply cmpl_congr x _ _ _ (bud3 (r / 2 ^ (12 + 7 * (r % 2 ^ 5)))) _ _ hr
  intro l hl
  unfold bud3
  rw [Nat.div_div_eq_div_mul, Nat.div_div_eq_div_mul, ← pow_add, ← pow_add, ← hr',
    show (8 : ℕ) = 2 ^ 3 by norm_num, mod_div_mod _ W _ 3 (by omega), Nat.div_div_eq_div_mul, ← pow_succ']
  congr 2; ring

/-- a header record glued to a search job (a mode-0 block with the same prefix) makes `x` complete the job's start state -/
theorem glue0_start (x ub : ℕ → ℕ) (hxub : ∀ l < 127, x l ≤ ub l) (r Sc : ℕ) (hgl : E1.glue0 r Sc = true)
    (hr : RecV x r) : StartOK x ub Sc := by
  unfold E1.glue0 at hgl
  obtain ⟨h1, h2⟩ := band_true hgl
  have hm : Sc % 2 = 0 := by have := Nat.eq_of_beq_eq_true h1; rwa [rd_eq] at this
  have hr' : Sc / 2 % 2 ^ (12 + 7 * (r % 2 ^ 5)) = r % 2 ^ (12 + 7 * (r % 2 ^ 5)) := by
    have := Nat.eq_of_beq_eq_true h2; rwa [rd_eq, rd_eq, rd_eq, sk_eq] at this
  set W := 12 + 7 * (r % 2 ^ 5) with hW
  have ed : Sc / 2 % 2 ^ 5 = r % 2 ^ 5 := by
    rw [← Nat.mod_mod_of_dvd (Sc / 2) (pow_dvd_pow 2 (show 5 ≤ W by omega)), hr',
      Nat.mod_mod_of_dvd _ (pow_dvd_pow 2 (show 5 ≤ W by omega))]
  have epos : Sc / 2 ^ 6 % 2 ^ 7 = r / 2 ^ 5 % 2 ^ 7 := by
    have a1 := mod_div_mod (Sc / 2) W 5 7 (by omega)
    have a2 := mod_div_mod r W 5 7 (by omega)
    rw [hr'] at a1
    rw [← a2, a1, Nat.div_div_eq_div_mul, ← pow_succ']
  have epl : Sc / 2 ^ 13 % 2 ^ (7 * (r % 2 ^ 5)) = r / 2 ^ 12 % 2 ^ (7 * (r % 2 ^ 5)) := by
    have a1 := mod_div_mod (Sc / 2) W 12 (7 * (r % 2 ^ 5)) (by omega)
    have a2 := mod_div_mod r W 12 (7 * (r % 2 ^ 5)) (by omega)
    rw [hr'] at a1
    rw [← a2, a1, Nat.div_div_eq_div_mul, ← pow_succ']
  unfold StartOK
  rw [ed, if_neg (by omega), epos, epl]
  obtain ⟨c1, c2, c3, -⟩ := hr
  refine ⟨c1, c2, c3, fun l hl => ?_⟩
  have := hxub l hl
  beta_reduce
  omega

/-- records beyond the header's count are zero, and `x` completes no zero record -/
theorem recV_zero (x : ℕ → ℕ) (hx : ∃ l < 127, 0 < x l) : ¬ RecV x 0 := by
  intro h
  obtain ⟨l, hl, hxl⟩ := hx
  have := h.2.2.2 l hl
  simp [multR, bud3] at this
  omega

theorem hdr_rec (S j : ℕ) (hj : E1.rd 8 S ≤ j) : (E1.hdr S).2.1 / 2 ^ (540 * j) % 2 ^ 540 = 0 := by
  show E1.rd (540 * E1.rd 8 S) (E1.sk 8 S) / 2 ^ (540 * j) % 2 ^ 540 = 0
  rw [rd_eq, sk_eq]
  have hlt : S / 2 ^ 8 % 2 ^ (540 * E1.rd 8 S) < 2 ^ (540 * j) :=
    lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (Nat.pow_le_pow_right (by norm_num) (by
      show 540 * E1.rd 8 S ≤ 540 * j; omega))
  rw [Nat.div_eq_of_lt hlt, Nat.zero_mod]

/-- **Chains.** If every block is accepted and every header record is glued to a later block, `x` completes no block's
start state. -/
theorem chain_sound (C : E1.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (ub x : ℕ → ℕ) (hg : Glob C x)
    (hsl : ∀ i < 2 ^ 15, SlotV x (sl i)) (hUB : UB = V ub) (hUBR : UBR = VR ub) (hubb : ∀ l < 127, ub l ≤ 2 ^ 32)
    (hxub : ∀ l < 127, x l ≤ ub l) (hx : ∃ l < 127, 0 < x l) (Ss : List ℕ)
    (hblk : ∀ i < Ss.length, E1.block C sl UB UBR (Ss.getD i 0) = true)
    (hglue : ∀ i < Ss.length, ∀ j < E1.rd 8 (E1.bS2 (Ss.getD i 0)), ∃ i', i < i' ∧ i' < Ss.length ∧
      (E1.glue ((E1.hdr (E1.bS2 (Ss.getD i 0))).2.1 / 2 ^ (540 * j) % 2 ^ 540) (Ss.getD i' 0) = true ∨
       E1.glue0 ((E1.hdr (E1.bS2 (Ss.getD i 0))).2.1 / 2 ^ (540 * j) % 2 ^ 540) (Ss.getD i' 0) = true)) :
    ∀ i < Ss.length, ¬ StartOK x ub (Ss.getD i 0) := by
  -- strong induction on the distance to the end of the chain
  suffices hk : ∀ k, ∀ i < Ss.length, Ss.length - i ≤ k → ¬ StartOK x ub (Ss.getD i 0) from
    fun i hi => hk Ss.length i hi (by omega)
  intro k
  induction k with
  | zero => intro i hi hk; omega
  | succ k ih =>
    intro i hi hk hs
    obtain ⟨j, hj⟩ := block_sound C sl UB UBR ub x hg hsl hUB hUBR hubb hxub _ (hblk i hi) hs
    by_cases hjn : j < E1.rd 8 (E1.bS2 (Ss.getD i 0))
    · obtain ⟨i', hii', hi', hgl⟩ := hglue i hi j hjn
      rcases hgl with hgl | hgl
      · exact ih i' hi' (by omega) (glue_start x ub _ _ hgl hj)
      · exact ih i' hi' (by omega) (glue0_start x ub hxub _ _ hgl hj)
    · rw [hdr_rec _ j (by omega)] at hj
      exact recV_zero x hx hj

end E1S
