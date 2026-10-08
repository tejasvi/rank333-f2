module
public import R22Port.U_d41d8cd98f00
public import E1.PkE
/-! # Semantics of E1's data: slots, row tables, prefixes, budgets, states

* A slot `v` (264 bits) is **valid for `x`** (`SlotV`) when its row holds for the multiplicity vector `x`
  (`msum x (smask v) ≤ scap v`) and its reversed mask is the reversal of its mask.
* `mkRT` stores slots at `264 j`; every slot position of the result is valid (`mkRT_ok`) when every table slot is.
* `mult d pl`: the multiplicities of the `d` labels packed in `pl` (`[7]` each); `mvOf` packs them (`mvOf_eq`).
* `budU` packs `127 × [3]` budget fields (`budU_eq`); `stEq` decodes a header record (`stEq_spec`).
* `Cmpl x d pos pl u`: `x` completes the prefix (labels `≥ pos` added) within the budgets `u`. -/
@[expose] public section
namespace E1S
open Finset
set_option exponentiation.threshold 600

/-! ## Slots -/

def smask (v : ℕ) : ℕ := v % 2 ^ 127
def smr (v : ℕ) : ℕ := v / 2 ^ 127 % 2 ^ 127
def scap (v : ℕ) : ℕ := v / 2 ^ 254 % 32
/-- `∑_{l ∈ m} x l` over labels `< 127` -/
def msum (x : ℕ → ℕ) (m : ℕ) : ℕ := ∑ l ∈ range 127, (if m.testBit l then x l else 0)

def SlotV (x : ℕ → ℕ) (v : ℕ) : Prop :=
  msum x (smask v) ≤ scap v ∧ (∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j)) ∧ v < 2 ^ 264

theorem slotV_zero (x : ℕ → ℕ) : SlotV x 0 := by
  refine ⟨?_, ?_, by norm_num⟩
  · simp [msum, smask, scap]
  · intro j _; simp [smr, smask]

/-- every slot position of the row table `T` is valid -/
def SlotsOK (x : ℕ → ℕ) (T : ℕ) : Prop := ∀ j, SlotV x (T / 2 ^ (264 * j) % 2 ^ 264)

theorem slot_at_or (T v n j : ℕ) (hT : T < 2 ^ (264 * n)) (hv : v < 2 ^ 264) :
    (T ||| v <<< (264 * n)) / 2 ^ (264 * j) % 2 ^ 264 =
      if j < n then T / 2 ^ (264 * j) % 2 ^ 264 else if j = n then v else 0 := by
  have hor : T ||| v <<< (264 * n) = T + 2 ^ (264 * n) * v := by
    rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hT, Nat.shiftLeft_eq]; ring
  rw [hor]
  by_cases hj : j < n
  · rw [if_pos hj]
    obtain ⟨r, hr⟩ : ∃ r, n = j + 1 + r := ⟨n - (j + 1), by omega⟩
    have e : 2 ^ (264 * n) * v = 2 ^ (264 * j) * (2 ^ 264 * (2 ^ (264 * r) * v)) := by
      rw [hr, show 264 * (j + 1 + r) = 264 * j + 264 + 264 * r by ring, pow_add, pow_add]; ring
    rw [e, Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]
  · rw [if_neg hj]
    by_cases hjn : j = n
    · subst hjn
      rw [if_pos rfl, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hT, Nat.zero_add, Nat.mod_eq_of_lt hv]
    · rw [if_neg hjn]
      have hlt : T + 2 ^ (264 * n) * v < 2 ^ (264 * j) := by
        have h1 : 2 ^ (264 * n) * v < 2 ^ (264 * n) * 2 ^ 264 := Nat.mul_lt_mul_of_pos_left hv (by positivity)
        have h2 : 2 ^ (264 * n) * 2 ^ 264 ≤ 2 ^ (264 * j) := by
          rw [← pow_add]; exact Nat.pow_le_pow_right (by norm_num) (by omega)
        have h3 : T + 2 ^ (264 * n) * v < 2 ^ (264 * n) * (v + 1) := by rw [Nat.mul_succ]; omega
        calc T + 2 ^ (264 * n) * v < 2 ^ (264 * n) * (v + 1) := h3
          _ ≤ 2 ^ (264 * n) * 2 ^ 264 := Nat.mul_le_mul_left _ hv
          _ ≤ 2 ^ (264 * j) := h2
      rw [Nat.div_eq_of_lt hlt, Nat.zero_mod]

theorem slot_or_lt (T v n : ℕ) (hT : T < 2 ^ (264 * n)) (hv : v < 2 ^ 264) :
    T ||| v <<< (264 * n) < 2 ^ (264 * (n + 1)) := by
  apply Nat.or_lt_two_pow (lt_of_lt_of_le hT (Nat.pow_le_pow_right (by norm_num) (by omega)))
  rw [Nat.shiftLeft_eq, show 264 * (n + 1) = 264 + 264 * n by ring, pow_add]
  exact Nat.mul_lt_mul_of_pos_right hv (by positivity)

theorem mkRT_ok (x : ℕ → ℕ) (sl : ℕ → ℕ) (hsl : ∀ i < 2 ^ 15, SlotV x (sl i)) (k S : ℕ) :
    SlotsOK x (E1.mkRT sl k S).1 := by
  -- invariant: the accumulator is below `2^(264 j)` and all its slots are valid
  suffices h : ∀ k T j S, T < 2 ^ (264 * j) → SlotsOK x T →
      SlotsOK x ((Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun T _ S => (T, S))
        (fun _ ih T j S => ih (Nat.lor T (Nat.shiftLeft (sl (E1.rd 15 S)) (Nat.mul 264 j))) (Nat.succ j) (E1.sk 15 S)) k T j S).1) by
    exact h k 0 0 S (by norm_num) (fun j => by simpa using slotV_zero x)
  intro k
  induction k with
  | zero => intro T j S _ hT; exact hT
  | succ k ih =>
    intro T j S hlt hT
    have hrd : E1.rd 15 S < 2 ^ 15 := by rw [rd_eq]; exact Nat.mod_lt _ (by positivity)
    have hv : sl (E1.rd 15 S) < 2 ^ 264 := (hsl _ hrd).2.2
    apply ih
    · exact slot_or_lt T _ j hlt hv
    · intro j'
      show SlotV x ((T ||| sl (E1.rd 15 S) <<< (264 * j)) / 2 ^ (264 * j') % 2 ^ 264)
      rw [slot_at_or T _ j j' hlt hv]
      split
      · exact hT j'
      · split
        · exact hsl _ hrd
        · exact slotV_zero x

/-- the row-table accessors read the slot at position `j` -/
theorem rmask_eq (T j : ℕ) : E1.rmask T j = smask (T / 2 ^ (264 * j) % 2 ^ 264) := by
  show (T >>> (264 * j)) &&& E1.M127 = _
  rw [M127_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, smask, Nat.mod_mod_of_dvd]
  exact pow_dvd_pow 2 (by norm_num)

theorem rmaskr_eq (T j : ℕ) : E1.rmaskr T j = smr (T / 2 ^ (264 * j) % 2 ^ 264) := by
  show (T >>> (264 * j + 127)) &&& E1.M127 = _
  rw [M127_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, smr, pow_add, ← Nat.div_div_eq_div_mul]
  have e : T / 2 ^ (264 * j) = T / 2 ^ (264 * j) % 2 ^ 264 + 2 ^ 264 * (T / 2 ^ (264 * j) / 2 ^ 264) :=
    (Nat.mod_add_div _ _).symm
  conv_lhs => rw [e]
  rw [show 2 ^ 264 * (T / 2 ^ (264 * j) / 2 ^ 264) = 2 ^ 127 * (2 ^ 127 * (2 ^ 10 * (T / 2 ^ (264 * j) / 2 ^ 264))) by
    rw [← mul_assoc, ← mul_assoc, ← pow_add, ← pow_add]]
  rw [Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]

theorem rcap_eq (T j : ℕ) : E1.rcap T j = scap (T / 2 ^ (264 * j) % 2 ^ 264) := by
  show (T >>> (264 * j + 254)) &&& 31 = _
  rw [show (31 : ℕ) = 2 ^ 5 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, scap, pow_add,
    ← Nat.div_div_eq_div_mul]
  have e : T / 2 ^ (264 * j) = T / 2 ^ (264 * j) % 2 ^ 264 + 2 ^ 264 * (T / 2 ^ (264 * j) / 2 ^ 264) :=
    (Nat.mod_add_div _ _).symm
  conv_lhs => rw [e]
  rw [show 2 ^ 264 * (T / 2 ^ (264 * j) / 2 ^ 264) = 2 ^ 254 * (2 ^ 5 * (2 ^ 5 * (T / 2 ^ (264 * j) / 2 ^ 264))) by
    rw [← mul_assoc, ← mul_assoc, ← pow_add, ← pow_add]]
  rw [Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]
  norm_num

theorem smask_lt (v : ℕ) : smask v < 2 ^ 127 := Nat.mod_lt _ (by positivity)
theorem smr_lt (v : ℕ) : smr v < 2 ^ 127 := Nat.mod_lt _ (by positivity)
theorem scap_lt (v : ℕ) : scap v < 32 := Nat.mod_lt _ (by norm_num)

/-! ## Boolean glue for the checker's `sel` / `∧ᵇ` -/

theorem band (a b : Bool) : @Bool.rec (fun _ => Bool) false b a = (a && b) := by cases a <;> rfl
theorem selE {α : Sort _} (c : Bool) (a b : α) : @Bool.rec (fun _ => α) b a c = cond c a b := by cases c <;> rfl
theorem band_true {a b : Bool} (h : @Bool.rec (fun _ => Bool) false b a = true) : a = true ∧ b = true := by
  cases a <;> simp_all

/-! ## Prefixes: multiplicities of the packed labels -/

/-- multiplicity of label `l` among the `d` labels `[7]` packed in `pl` (lowest first) -/
def multR : ℕ → ℕ → ℕ → ℕ
  | 0, _, _ => 0
  | d + 1, pl, l => (if pl % 128 = l then 1 else 0) + multR d (pl / 128) l

theorem multR_sum (d pl : ℕ) (hlab : ∀ l, 127 ≤ l → multR d pl l = 0) :
    ∑ l ∈ range 127, multR d pl l = d := by
  induction d generalizing pl with
  | zero => simp [multR]
  | succ d ih =>
    simp only [multR]
    rw [Finset.sum_add_distrib]
    have h0 : pl % 128 < 127 := by
      by_contra hc
      have := hlab (pl % 128) (by omega)
      simp [multR] at this
    have hl' : ∀ l, 127 ≤ l → multR d (pl / 128) l = 0 := by
      intro l hl; have := hlab l hl; simp only [multR] at this; omega
    rw [ih _ hl', Finset.sum_ite_eq (range 127) (pl % 128) (fun _ => 1)]
    simp [Finset.mem_range.mpr h0]; omega

theorem multR_le (d pl l : ℕ) : multR d pl l ≤ d := by
  induction d generalizing pl with
  | zero => simp [multR]
  | succ d ih => simp only [multR]; have := ih (pl / 128); split <;> omega

theorem multR_append_add (d : ℕ) : ∀ pl, pl < 2 ^ (7 * d) → ∀ l, l < 128 → ∀ l',
    multR (d + 1) (pl + 2 ^ (7 * d) * l) l' = multR d pl l' + (if l = l' then 1 else 0) := by
  induction d with
  | zero =>
    intro pl hpl l hl l'
    have : pl = 0 := by simpa using hpl
    subst this
    simp [multR, Nat.mod_eq_of_lt hl, Nat.div_eq_of_lt hl]
  | succ d ih =>
    intro pl hpl l hl l'
    have e1 : (pl + 2 ^ (7 * (d + 1)) * l) % 128 = pl % 128 := by
      rw [show 2 ^ (7 * (d + 1)) * l = 128 * (2 ^ (7 * d) * l) by rw [Nat.mul_succ, pow_add]; ring,
        Nat.add_mul_mod_self_left]
    have e2 : (pl + 2 ^ (7 * (d + 1)) * l) / 128 = pl / 128 + 2 ^ (7 * d) * l := by
      rw [show 2 ^ (7 * (d + 1)) * l = 128 * (2 ^ (7 * d) * l) by rw [Nat.mul_succ, pow_add]; ring,
        Nat.add_mul_div_left _ _ (by norm_num)]
    have hpl' : pl / 128 < 2 ^ (7 * d) := by
      rw [Nat.div_lt_iff_lt_mul (by norm_num)]
      calc pl < 2 ^ (7 * (d + 1)) := hpl
        _ = 2 ^ (7 * d) * 128 := by rw [Nat.mul_succ, pow_add]; norm_num
    show (if (pl + 2 ^ (7 * (d + 1)) * l) % 128 = l' then 1 else 0) + multR (d + 1) ((pl + 2 ^ (7 * (d + 1)) * l) / 128) l' =
      (if pl % 128 = l' then 1 else 0) + multR d (pl / 128) l' + (if l = l' then 1 else 0)
    rw [e1, e2, ih _ hpl' l hl l']; ring

/-- appending a label at position `d` -/
theorem multR_append (d pl l : ℕ) (hpl : pl < 2 ^ (7 * d)) (hl : l < 128) (l' : ℕ) :
    multR (d + 1) (pl ||| l <<< (7 * d)) l' = multR d pl l' + (if l = l' then 1 else 0) := by
  have hor : pl ||| l <<< (7 * d) = pl + 2 ^ (7 * d) * l := by
    rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hpl, Nat.shiftLeft_eq]; ring
  rw [hor]; exact multR_append_add d pl hpl l hl l'

theorem append_lt (d pl l : ℕ) (hpl : pl < 2 ^ (7 * d)) (hl : l < 128) : pl ||| l <<< (7 * d) < 2 ^ (7 * (d + 1)) := by
  apply Nat.or_lt_two_pow (lt_of_lt_of_le hpl (Nat.pow_le_pow_right (by norm_num) (by omega)))
  rw [Nat.shiftLeft_eq, show 7 * (d + 1) = 7 + 7 * d by ring, pow_add]
  exact Nat.mul_lt_mul_of_pos_right (by omega) (by positivity)

theorem one_eq (l : ℕ) : E1.one l = 2 ^ (128 * l) := by
  show (1 : ℕ) <<< (128 * l) = _; rw [Nat.one_shiftLeft]

theorem mvOf_gen (d : ℕ) : ∀ MV MVR pl, (∀ l, 127 ≤ l → multR d pl l = 0) →
    (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
      (fun _ ih MV MVR pl => ih (Nat.add MV (E1.one (E1.rd 7 pl))) (Nat.add MVR (E1.oner (E1.rd 7 pl))) (E1.sk 7 pl)) d MV MVR pl)
      = (MV + V (multR d pl), MVR + VR (multR d pl)) := by
  induction d with
  | zero => intro MV MVR pl _; simp [multR, V_zero]
  | succ d ih =>
    intro MV MVR pl hlab
    have h0 : pl % 128 < 127 := by
      by_contra hc
      have := hlab (pl % 128) (by omega)
      simp [multR] at this
    have hl' : ∀ l, 127 ≤ l → multR d (pl / 128) l = 0 := by
      intro l hl; have := hlab l hl; simp only [multR] at this; omega
    have hstep : (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
        (fun _ ih MV MVR pl => ih (Nat.add MV (E1.one (E1.rd 7 pl))) (Nat.add MVR (E1.oner (E1.rd 7 pl))) (E1.sk 7 pl)) (d + 1)
          MV MVR pl) =
        (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
        (fun _ ih MV MVR pl => ih (Nat.add MV (E1.one (E1.rd 7 pl))) (Nat.add MVR (E1.oner (E1.rd 7 pl))) (E1.sk 7 pl)) d
          (MV + E1.one (pl % 128)) (MVR + E1.oner (pl % 128)) (pl / 128)) := by
      show (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
        (fun _ ih MV MVR pl => ih (Nat.add MV (E1.one (E1.rd 7 pl))) (Nat.add MVR (E1.oner (E1.rd 7 pl))) (E1.sk 7 pl)) d
          (Nat.add MV (E1.one (E1.rd 7 pl))) (Nat.add MVR (E1.oner (E1.rd 7 pl))) (E1.sk 7 pl)) = _
      rw [rd_eq, sk_eq, show (2 : ℕ) ^ 7 = 128 by norm_num]; rfl
    rw [hstep, ih _ _ _ hl', one_V _ h0, oner_VR _ h0]
    simp only [Prod.mk.injEq]
    constructor
    · rw [Nat.add_assoc, V_add]
      refine congrArg (MV + ·) (V_congr _ _ (fun l _ => ?_))
      show (if l = pl % 128 then 1 else 0) + multR d (pl / 128) l = (if pl % 128 = l then 1 else 0) + multR d (pl / 128) l
      by_cases h : l = pl % 128
      · rw [if_pos h, if_pos h.symm]
      · rw [if_neg h, if_neg (Ne.symm h)]
    · rw [Nat.add_assoc, VR_add]
      refine congrArg (MVR + ·) (VR_congr _ _ (fun l _ => ?_))
      show (if l = pl % 128 then 1 else 0) + multR d (pl / 128) l = (if pl % 128 = l then 1 else 0) + multR d (pl / 128) l
      by_cases h : l = pl % 128
      · rw [if_pos h, if_pos h.symm]
      · rw [if_neg h, if_neg (Ne.symm h)]

theorem mvOf_eq (d pl : ℕ) (hlab : ∀ l, 127 ≤ l → multR d pl l = 0) :
    E1.mvOf d pl = (V (multR d pl), VR (multR d pl)) := by
  have := mvOf_gen d 0 0 pl hlab
  simp only [Nat.zero_add] at this
  exact this

/-! ## Budgets and states -/

def bud3 (B l : ℕ) : ℕ := B / 2 ^ (3 * l) % 8

theorem bud3_lt (B l : ℕ) : bud3 B l < 8 := Nat.mod_lt _ (by norm_num)

theorem recsum_eq (f : ℕ → ℕ) (n : ℕ) :
    Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1.one l))) n = pk 128 f n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show Nat.add (Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1.one l))) n) (Nat.mul (f n) (E1.one n)) = _
    rw [ih, pk_succ, one_eq]; rfl

theorem budU_eq (B : ℕ) : E1.budU B = V (bud3 B) := by
  show Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (E1.rd 3 (E1.sk (Nat.mul 3 l) B)) (E1.one l))) 127 = _
  rw [recsum_eq]
  apply pk_congr; intro l _; rw [rd_eq, sk_eq]; rfl

theorem recsumR_eq (f : ℕ → ℕ) (n : ℕ) (hn : n ≤ 127) :
    Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1.oner l))) n =
      ∑ l ∈ range n, f l * 2 ^ (128 * (126 - l)) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show Nat.add (Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1.oner l))) n) (Nat.mul (f n) (E1.oner n)) = _
    rw [ih (by omega), Finset.sum_range_succ]
    congr 1
    show f n * (1 <<< (128 * (126 - n))) = _
    rw [Nat.one_shiftLeft]

theorem budUR_eq (B : ℕ) : E1.budUR B = VR (bud3 B) := by
  show Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (E1.rd 3 (E1.sk (Nat.mul 3 l) B)) (E1.oner l))) 127 = _
  rw [recsumR_eq _ 127 le_rfl]
  show _ = ∑ j ∈ range 127, bud3 B (126 - j) * 2 ^ (128 * j)
  rw [← Finset.sum_range_reflect]
  apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
  rw [rd_eq, sk_eq, show 126 - (127 - 1 - l) = l by omega, show 127 - 1 - l = 126 - l by omega]; rfl

/-- `x` completes the prefix `(d, pos, pl)` (only labels `≥ pos` added) within the budgets `u` -/
def Cmpl (x : ℕ → ℕ) (d pos pl : ℕ) (u : ℕ → ℕ) : Prop :=
  (∀ l, multR d pl l ≤ x l) ∧ (∀ l < pos, x l = multR d pl l) ∧ (∀ l, pos < l → multR d pl l = 0) ∧
    (∀ l < 127, x l ≤ multR d pl l + u l)

/-- the state recorded as `r` (`[5] d, [7] pos, d × [7] prefix, 127 × [3] budgets`) -/
def RecV (x : ℕ → ℕ) (r : ℕ) : Prop :=
  Cmpl x (r % 2 ^ 5) (r / 2 ^ 5 % 2 ^ 7) (r / 2 ^ 12 % 2 ^ (7 * (r % 2 ^ 5))) (bud3 (r / 2 ^ (12 + 7 * (r % 2 ^ 5))))

/-- `x` reaches one of the delegated states in `H` -/
def Reach (x : ℕ → ℕ) (H : ℕ) : Prop := ∃ j, RecV x (H / 2 ^ (540 * j) % 2 ^ 540)

theorem stEq_reach (x : ℕ → ℕ) (H j d pos pl : ℕ) (u : ℕ → ℕ) (hu : ∀ l < 127, u l < 2 ^ 128)
    (h : E1.stEq (E1.rd 540 (E1.sk (Nat.mul 540 j) H)) d pos pl (V u) = true) (hc : Cmpl x d pos pl u) : Reach x H := by
  refine ⟨j, ?_⟩
  set r := H / 2 ^ (540 * j) % 2 ^ 540 with hr
  have hr' : E1.rd 540 (E1.sk (Nat.mul 540 j) H) = r := by rw [rd_eq, sk_eq]; rfl
  rw [hr'] at h
  unfold E1.stEq at h
  obtain ⟨h1, h⟩ := band_true h
  obtain ⟨h2, h⟩ := band_true h
  obtain ⟨h3, h4⟩ := band_true h
  have e1 : r % 2 ^ 5 = d := by have := Nat.eq_of_beq_eq_true h1; rwa [rd_eq] at this
  have e2 : r / 2 ^ 5 % 2 ^ 7 = pos := by have := Nat.eq_of_beq_eq_true h2; rwa [rd_eq, sk_eq] at this
  have e3 : r / 2 ^ 12 % 2 ^ (7 * d) = pl := by have := Nat.eq_of_beq_eq_true h3; rwa [rd_eq, sk_eq] at this
  have e4 : V (bud3 (r / 2 ^ (12 + 7 * d))) = V u := by
    have := Nat.eq_of_beq_eq_true h4; rwa [budU_eq, sk_eq] at this
  have e5 := V_inj _ _ (fun l _ => lt_trans (bud3_lt _ _) (by norm_num)) hu e4
  unfold RecV
  rw [e1, e2, e3]
  obtain ⟨c1, c2, c3, c4⟩ := hc
  exact ⟨c1, c2, c3, fun l hl => by rw [e5 l hl]; exact c4 l hl⟩

/-! ## Duals, saturations, fixings -/

theorem spread_slot (T j : ℕ) : E1.spread (E1.rmask T j) = V (fun l => if (smask (T / 2 ^ (264 * j) % 2 ^ 264)).testBit l then 1 else 0) := by
  rw [rmask_eq, spread_V _ (smask_lt _)]

/-- `rdual`'s loop with explicit accumulators -/
def rdualF (RTb : ℕ) (k : ℕ) : ℕ → ℕ → ℕ → ℕ × ℕ × ℕ :=
  Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ × ℕ) (fun BC T S => (BC, T, S))
    (fun _ ih BC T S => ih (Nat.add BC (Nat.mul (E1.rd 36 (E1.sk 12 S)) (E1.rcap RTb (E1.rd 12 S))))
      (Nat.add T (Nat.mul (E1.rd 36 (E1.sk 12 S)) (E1.spread (E1.rmask RTb (E1.rd 12 S))))) (E1.sk 48 S)) k

theorem rdual_eq (RTb k S : ℕ) : E1.rdual RTb k S = rdualF RTb k 0 0 S := rfl
theorem rdualF_zero (RTb BC T S : ℕ) : rdualF RTb 0 BC T S = (BC, T, S) := rfl
theorem rdualF_succ (RTb k BC T S : ℕ) : rdualF RTb (k + 1) BC T S =
    rdualF RTb k (BC + E1.rd 36 (E1.sk 12 S) * E1.rcap RTb (E1.rd 12 S))
      (T + E1.rd 36 (E1.sk 12 S) * E1.spread (E1.rmask RTb (E1.rd 12 S))) (E1.sk 48 S) := rfl

/-- a dual of `k` rows: `T = V t` with `∑ t x ≤ ∑ Y cap` for every `x` satisfying the rows -/
theorem rdual_gen (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (k : ℕ) : ∀ BC t S TB,
    (∀ l < 127, t l ≤ TB) → ∑ l ∈ range 127, t l * x l ≤ BC →
    ∃ t', (rdualF RTb k BC (V t) S).2.1 = V t' ∧ (∀ l < 127, t' l ≤ TB + k * 2 ^ 36) ∧
      ∑ l ∈ range 127, t' l * x l ≤ (rdualF RTb k BC (V t) S).1 := by
  induction k with
  | zero => intro BC t S TB ht hs; exact ⟨t, rfl, fun l hl => by simpa using ht l hl, hs⟩
  | succ k ih =>
    intro BC t S TB ht hs
    rw [rdualF_succ]
    generalize hj : E1.rd 12 S = j
    generalize hY : E1.rd 36 (E1.sk 12 S) = Y
    have hYlt : Y < 2 ^ 36 := by rw [← hY, rd_eq]; exact Nat.mod_lt _ (by positivity)
    have hv := hT j
    generalize hvd : RTb / 2 ^ (264 * j) % 2 ^ 264 = v at hv
    have eT : V t + Y * E1.spread (E1.rmask RTb j) = V (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) := by
      rw [spread_slot, hvd, mul_comm, V_mul, V_add]
    have eB : BC + Y * E1.rcap RTb j = BC + Y * scap v := by rw [rcap_eq, hvd]
    rw [eT, eB]
    have hb : ∀ l < 127, (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) l ≤ TB + 2 ^ 36 := by
      intro l hl; have := ht l hl; dsimp only; split <;> omega
    have hs' : ∑ l ∈ range 127, (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) l * x l ≤ BC + Y * scap v := by
      have e : ∑ l ∈ range 127, (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) l * x l =
          ∑ l ∈ range 127, t l * x l + Y * msum x (smask v) := by
        rw [msum, Finset.mul_sum, ← Finset.sum_add_distrib]
        apply Finset.sum_congr rfl; intro l _; dsimp only; split <;> ring
      rw [e]
      exact Nat.add_le_add hs (Nat.mul_le_mul_left _ hv.1)
    obtain ⟨t', h1, h2, h3⟩ := ih (BC + Y * scap v) (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y)
      (E1.sk 48 S) (TB + 2 ^ 36) hb hs'
    exact ⟨t', h1, fun l hl => by have := h2 l hl; rw [Nat.succ_mul]; omega, h3⟩

theorem rdual_sem (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (k S : ℕ) (hk : k < 64) :
    ∃ t', (E1.rdual RTb k S).2.1 = V t' ∧ (∀ l < 127, t' l < 2 ^ 42) ∧
      ∑ l ∈ range 127, t' l * x l ≤ (E1.rdual RTb k S).1 := by
  obtain ⟨t', h1, h2, h3⟩ := rdual_gen x RTb hT k 0 (fun _ => 0) S 0 (fun _ _ => le_rfl) (by simp)
  rw [V_zero] at h1 h3
  refine ⟨t', h1, fun l hl => ?_, h3⟩
  have := h2 l hl
  have : k * 2 ^ 36 < 2 ^ 42 := by
    calc k * 2 ^ 36 < 64 * 2 ^ 36 := Nat.mul_lt_mul_of_pos_right hk (by positivity)
      _ = 2 ^ 42 := by norm_num
  omega

/-- the rest of the stream after a dual -/
theorem rdual_rest (RTb k S : ℕ) : (E1.rdual RTb k S).2.2 = S / 2 ^ (48 * k) := by
  suffices h : ∀ k BC T S, (rdualF RTb k BC T S).2.2 = S / 2 ^ (48 * k) from h k 0 0 S
  intro k
  induction k with
  | zero => intro BC T S; simp [rdualF_zero]
  | succ k ih =>
    intro BC T S
    rw [rdualF_succ, ih, sk_eq, Nat.div_div_eq_div_mul, ← pow_add]; ring_nf

end E1S
