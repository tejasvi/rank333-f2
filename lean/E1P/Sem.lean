module
public import R22Port.U_d41d8cd98f00
public import E1P.PkE
/-! # Semantics of E1's data: slots, row tables, prefixes, budgets, states

* A slot `v` (520 bits) is **valid for `x`** (`SlotV`) when its row holds for the multiplicity vector `x`
  (`msum x (smask v) ≤ scap v`) and its reversed mask is the reversal of its mask.
* `mkRT` stores slots at `520 j` (divide and conquer, `mkRTd`); every slot position of the result is valid (`mkRT_ok`)
  when every table slot is.
* `mult d pl`: the multiplicities of the `d` labels packed in `pl` (`[8]` each); `mvOf` packs them (`mvOf_eq`).
* `budU` packs `255 × [3]` budget fields (`budU_eq`); `stEq` decodes a header record (`stEq_spec`).
* `Cmpl x d pos pl u`: `x` completes the prefix (labels `≥ pos` added) within the budgets `u`. -/
@[expose] public section
namespace E1PS
open Finset
set_option exponentiation.threshold 1200
set_option maxRecDepth 20000

/-! ## Slots -/

def smask (v : ℕ) : ℕ := v % 2 ^ 255
def smr (v : ℕ) : ℕ := v / 2 ^ 255 % 2 ^ 255
def scap (v : ℕ) : ℕ := v / 2 ^ 510 % 32
/-- `∑_{l ∈ m} x l` over labels `< 255` -/
def msum (x : ℕ → ℕ) (m : ℕ) : ℕ := ∑ l ∈ range 255, (if m.testBit l then x l else 0)

def SlotV (x : ℕ → ℕ) (v : ℕ) : Prop :=
  msum x (smask v) ≤ scap v ∧ (∀ j < 255, (smr v).testBit j = (smask v).testBit (254 - j)) ∧ v < 2 ^ 520

theorem slotV_zero (x : ℕ → ℕ) : SlotV x 0 := by
  refine ⟨?_, ?_, by norm_num⟩
  · simp [msum, smask, scap]
  · intro j _; simp [smr, smask]

/-- every slot position of the row table `T` is valid -/
def SlotsOK (x : ℕ → ℕ) (T : ℕ) : Prop := ∀ j, SlotV x (T / 2 ^ (520 * j) % 2 ^ 520)

theorem slot_at_or (T v n j : ℕ) (hT : T < 2 ^ (520 * n)) (hv : v < 2 ^ 520) :
    (T ||| v <<< (520 * n)) / 2 ^ (520 * j) % 2 ^ 520 =
      if j < n then T / 2 ^ (520 * j) % 2 ^ 520 else if j = n then v else 0 := by
  have hor : T ||| v <<< (520 * n) = T + 2 ^ (520 * n) * v := by
    rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hT, Nat.shiftLeft_eq]; ring
  rw [hor]
  by_cases hj : j < n
  · rw [if_pos hj]
    obtain ⟨r, hr⟩ : ∃ r, n = j + 1 + r := ⟨n - (j + 1), by omega⟩
    have e : 2 ^ (520 * n) * v = 2 ^ (520 * j) * (2 ^ 520 * (2 ^ (520 * r) * v)) := by
      rw [hr, show 520 * (j + 1 + r) = 520 * j + 520 + 520 * r by ring, pow_add, pow_add]; ring
    rw [e, Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]
  · rw [if_neg hj]
    by_cases hjn : j = n
    · subst hjn
      rw [if_pos rfl, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hT, Nat.zero_add, Nat.mod_eq_of_lt hv]
    · rw [if_neg hjn]
      have hlt : T + 2 ^ (520 * n) * v < 2 ^ (520 * j) := by
        have h1 : 2 ^ (520 * n) * v < 2 ^ (520 * n) * 2 ^ 520 := Nat.mul_lt_mul_of_pos_left hv (by positivity)
        have h2 : 2 ^ (520 * n) * 2 ^ 520 ≤ 2 ^ (520 * j) := by
          rw [← pow_add]; exact Nat.pow_le_pow_right (by norm_num) (by omega)
        have h3 : T + 2 ^ (520 * n) * v < 2 ^ (520 * n) * (v + 1) := by rw [Nat.mul_succ]; omega
        calc T + 2 ^ (520 * n) * v < 2 ^ (520 * n) * (v + 1) := h3
          _ ≤ 2 ^ (520 * n) * 2 ^ 520 := Nat.mul_le_mul_left _ hv
          _ ≤ 2 ^ (520 * j) := h2
      rw [Nat.div_eq_of_lt hlt, Nat.zero_mod]

theorem slot_or_lt (T v n : ℕ) (hT : T < 2 ^ (520 * n)) (hv : v < 2 ^ 520) :
    T ||| v <<< (520 * n) < 2 ^ (520 * (n + 1)) := by
  apply Nat.or_lt_two_pow (lt_of_lt_of_le hT (Nat.pow_le_pow_right (by norm_num) (by omega)))
  rw [Nat.shiftLeft_eq, show 520 * (n + 1) = 520 + 520 * n by ring, pow_add]
  exact Nat.mul_lt_mul_of_pos_right hv (by positivity)

theorem slots_or_eq (A B c : ℕ) (hA : A < 2 ^ (520 * c)) : A ||| B <<< (520 * c) = A + 2 ^ (520 * c) * B := by
  rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hA, Nat.shiftLeft_eq]; ring

/-- the slots of `A ||| B << 520 c` are those of `A` (below `c`) and then those of `B` -/
theorem slots_or (x : ℕ → ℕ) (A B c : ℕ) (hA : A < 2 ^ (520 * c)) (hAok : SlotsOK x A) (hBok : SlotsOK x B) :
    SlotsOK x (A ||| B <<< (520 * c)) := by
  intro j
  rw [slots_or_eq A B c hA]
  by_cases hj : j < c
  · obtain ⟨r, hr⟩ : ∃ r, c = j + 1 + r := ⟨c - (j + 1), by omega⟩
    have e : 2 ^ (520 * c) * B = 2 ^ (520 * j) * (2 ^ 520 * (2 ^ (520 * r) * B)) := by
      rw [hr, show 520 * (j + 1 + r) = 520 * j + 520 + 520 * r by ring, pow_add, pow_add]; ring
    rw [e, Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]
    exact hAok j
  · obtain ⟨r, hr⟩ : ∃ r, j = c + r := ⟨j - c, by omega⟩
    have e : (A + 2 ^ (520 * c) * B) / 2 ^ (520 * j) = B / 2 ^ (520 * r) := by
      rw [hr, show 520 * (c + r) = 520 * c + 520 * r by ring, pow_add, ← Nat.div_div_eq_div_mul,
        Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hA, zero_add]
    rw [e]; exact hBok r

theorem slots_or_lt (A B c d : ℕ) (hA : A < 2 ^ (520 * c)) (hB : B < 2 ^ (520 * d)) :
    A ||| B <<< (520 * c) < 2 ^ (520 * (c + d)) := by
  rw [slots_or_eq A B c hA, show 520 * (c + d) = 520 * c + 520 * d by ring, pow_add]
  calc A + 2 ^ (520 * c) * B < 2 ^ (520 * c) + 2 ^ (520 * c) * B := by omega
    _ = 2 ^ (520 * c) * (B + 1) := by ring
    _ ≤ 2 ^ (520 * c) * 2 ^ (520 * d) := Nat.mul_le_mul_left _ hB

theorem slotsOK_zero (x : ℕ → ℕ) : SlotsOK x 0 := fun j => by simpa using slotV_zero x

theorem slotsOK_single (x : ℕ → ℕ) (v : ℕ) (hv : SlotV x v) : SlotsOK x v := by
  intro j
  rcases Nat.eq_zero_or_pos j with rfl | hj
  · simp only [mul_zero, pow_zero, Nat.div_one, Nat.mod_eq_of_lt hv.2.2]; exact hv
  · have : v / 2 ^ (520 * j) = 0 :=
      Nat.div_eq_of_lt (lt_of_lt_of_le hv.2.2 (Nat.pow_le_pow_right (by norm_num) (by omega)))
    rw [this, Nat.zero_mod]; exact slotV_zero x

/-- the leaf of `mkRTd`: one slot (`n = 1`) or none -/
theorem mkRT_leaf (x : ℕ → ℕ) (sl : ℕ → ℕ) (hsl : ∀ i < 2 ^ 19, SlotV x (sl i)) (n IX : ℕ) :
    @Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1) < 2 ^ (520 * n) ∧
      SlotsOK x (@Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1)) := by
  have hrd : E1P.rd 19 IX < 2 ^ 19 := by rw [rd_eq]; exact Nat.mod_lt _ (by positivity)
  cases h : Nat.beq n 1
  · exact ⟨Nat.two_pow_pos _, slotsOK_zero x⟩
  · have hn : n = 1 := Nat.eq_of_beq_eq_true h
    subst hn
    exact ⟨by simpa using (hsl _ hrd).2.2, slotsOK_single x _ (hsl _ hrd)⟩

/-- every slot of `mkRTd` is a table slot or empty, and `n` slots fit in `520 n` bits -/
theorem mkRTd_ok (x : ℕ → ℕ) (sl : ℕ → ℕ) (hsl : ∀ i < 2 ^ 19, SlotV x (sl i)) :
    ∀ h n IX, E1P.mkRTd sl h n IX < 2 ^ (520 * n) ∧ SlotsOK x (E1P.mkRTd sl h n IX) := by
  intro h
  induction h with
  | zero => intro n IX; exact mkRT_leaf x sl hsl n IX
  | succ h ih =>
    intro n IX
    show @Bool.rec (fun _ => ℕ)
        (Nat.lor (E1P.mkRTd sl h (Nat.shiftRight n 1) (E1P.rd (Nat.mul 19 (Nat.shiftRight n 1)) IX))
          (Nat.shiftLeft (E1P.mkRTd sl h (Nat.sub n (Nat.shiftRight n 1)) (E1P.sk (Nat.mul 19 (Nat.shiftRight n 1)) IX))
            (Nat.mul 520 (Nat.shiftRight n 1))))
        (@Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1)) (Nat.ble n 1) < 2 ^ (520 * n) ∧
      SlotsOK x (@Bool.rec (fun _ => ℕ)
        (Nat.lor (E1P.mkRTd sl h (Nat.shiftRight n 1) (E1P.rd (Nat.mul 19 (Nat.shiftRight n 1)) IX))
          (Nat.shiftLeft (E1P.mkRTd sl h (Nat.sub n (Nat.shiftRight n 1)) (E1P.sk (Nat.mul 19 (Nat.shiftRight n 1)) IX))
            (Nat.mul 520 (Nat.shiftRight n 1))))
        (@Bool.rec (fun _ => ℕ) 0 (sl (E1P.rd 19 IX)) (Nat.beq n 1)) (Nat.ble n 1))
    cases Nat.ble n 1
    · have hc : Nat.shiftRight n 1 ≤ n := by
        show n >>> 1 ≤ n
        rw [Nat.shiftRight_eq_div_pow]; exact Nat.div_le_self _ _
      obtain ⟨hA1, hA2⟩ := ih (Nat.shiftRight n 1) (E1P.rd (Nat.mul 19 (Nat.shiftRight n 1)) IX)
      obtain ⟨hB1, hB2⟩ := ih (n - Nat.shiftRight n 1) (E1P.sk (Nat.mul 19 (Nat.shiftRight n 1)) IX)
      refine ⟨?_, slots_or x _ _ _ hA1 hA2 hB2⟩
      have := slots_or_lt _ _ _ _ hA1 hB1
      rwa [show Nat.shiftRight n 1 + (n - Nat.shiftRight n 1) = n by omega] at this
    · exact mkRT_leaf x sl hsl n IX

theorem mkRT_fst (sl : ℕ → ℕ) (k S : ℕ) : (E1P.mkRT sl k S).1 = E1P.mkRTd sl 13 k (E1P.rd (Nat.mul 19 k) S) := by
  unfold E1P.mkRT; rfl

theorem mkRT_ok (x : ℕ → ℕ) (sl : ℕ → ℕ) (hsl : ∀ i < 2 ^ 19, SlotV x (sl i)) (k S : ℕ) :
    SlotsOK x (E1P.mkRT sl k S).1 := by
  rw [mkRT_fst]; exact (mkRTd_ok x sl hsl 13 k _).2

theorem MSL_eq : E1P.MSL = 2 ^ 520 - 1 := by decide

theorem slotAt_eq (T j : ℕ) : E1P.slotAt T j = T / 2 ^ (520 * j) % 2 ^ 520 := by
  show (T >>> (520 * j)) &&& E1P.MSL = _
  rw [MSL_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]

/-- the row-table accessors read the slot at position `j` -/
theorem rmask_eq (T j : ℕ) : E1P.rmask T j = smask (T / 2 ^ (520 * j) % 2 ^ 520) := by
  show E1P.slotAt T j &&& E1P.M255 = _
  rw [slotAt_eq, M255_eq, Nat.and_two_pow_sub_one_eq_mod, smask]

theorem rmaskr_eq (T j : ℕ) : E1P.rmaskr T j = smr (T / 2 ^ (520 * j) % 2 ^ 520) := by
  show (E1P.slotAt T j >>> 255) &&& E1P.M255 = _
  rw [slotAt_eq, M255_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, smr]

theorem rcap_eq (T j : ℕ) : E1P.rcap T j = scap (T / 2 ^ (520 * j) % 2 ^ 520) := by
  show (E1P.slotAt T j >>> 510) &&& 31 = _
  rw [slotAt_eq, show (31 : ℕ) = 2 ^ 5 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, scap]

theorem smask_lt (v : ℕ) : smask v < 2 ^ 255 := Nat.mod_lt _ (by positivity)
theorem smr_lt (v : ℕ) : smr v < 2 ^ 255 := Nat.mod_lt _ (by positivity)
theorem scap_lt (v : ℕ) : scap v < 32 := Nat.mod_lt _ (by norm_num)

/-! ## Boolean glue for the checker's `sel` / `∧ᵇ` -/

theorem band (a b : Bool) : @Bool.rec (fun _ => Bool) false b a = (a && b) := by cases a <;> rfl
theorem selE {α : Sort _} (c : Bool) (a b : α) : @Bool.rec (fun _ => α) b a c = cond c a b := by cases c <;> rfl
theorem band_true {a b : Bool} (h : @Bool.rec (fun _ => Bool) false b a = true) : a = true ∧ b = true := by
  cases a <;> simp_all

/-! ## Prefixes: multiplicities of the packed labels -/

/-- multiplicity of label `l` among the `d` labels `[8]` packed in `pl` (lowest first) -/
def multR : ℕ → ℕ → ℕ → ℕ
  | 0, _, _ => 0
  | d + 1, pl, l => (if pl % 256 = l then 1 else 0) + multR d (pl / 256) l

theorem multR_sum (d pl : ℕ) (hlab : ∀ l, 255 ≤ l → multR d pl l = 0) :
    ∑ l ∈ range 255, multR d pl l = d := by
  induction d generalizing pl with
  | zero => simp [multR]
  | succ d ih =>
    simp only [multR]
    rw [Finset.sum_add_distrib]
    have h0 : pl % 256 < 255 := by
      by_contra hc
      have := hlab (pl % 256) (by omega)
      simp [multR] at this
    have hl' : ∀ l, 255 ≤ l → multR d (pl / 256) l = 0 := by
      intro l hl; have := hlab l hl; simp only [multR] at this; omega
    rw [ih _ hl', Finset.sum_ite_eq (range 255) (pl % 256) (fun _ => 1)]
    simp [Finset.mem_range.mpr h0]; omega

theorem multR_le (d pl l : ℕ) : multR d pl l ≤ d := by
  induction d generalizing pl with
  | zero => simp [multR]
  | succ d ih => simp only [multR]; have := ih (pl / 256); split <;> omega

theorem multR_append_add (d : ℕ) : ∀ pl, pl < 2 ^ (8 * d) → ∀ l, l < 256 → ∀ l',
    multR (d + 1) (pl + 2 ^ (8 * d) * l) l' = multR d pl l' + (if l = l' then 1 else 0) := by
  induction d with
  | zero =>
    intro pl hpl l hl l'
    have : pl = 0 := by simpa using hpl
    subst this
    simp [multR, Nat.mod_eq_of_lt hl, Nat.div_eq_of_lt hl]
  | succ d ih =>
    intro pl hpl l hl l'
    have e1 : (pl + 2 ^ (8 * (d + 1)) * l) % 256 = pl % 256 := by
      rw [show 2 ^ (8 * (d + 1)) * l = 256 * (2 ^ (8 * d) * l) by rw [Nat.mul_succ, pow_add]; ring,
        Nat.add_mul_mod_self_left]
    have e2 : (pl + 2 ^ (8 * (d + 1)) * l) / 256 = pl / 256 + 2 ^ (8 * d) * l := by
      rw [show 2 ^ (8 * (d + 1)) * l = 256 * (2 ^ (8 * d) * l) by rw [Nat.mul_succ, pow_add]; ring,
        Nat.add_mul_div_left _ _ (by norm_num)]
    have hpl' : pl / 256 < 2 ^ (8 * d) := by
      rw [Nat.div_lt_iff_lt_mul (by norm_num)]
      calc pl < 2 ^ (8 * (d + 1)) := hpl
        _ = 2 ^ (8 * d) * 256 := by rw [Nat.mul_succ, pow_add]; norm_num
    show (if (pl + 2 ^ (8 * (d + 1)) * l) % 256 = l' then 1 else 0) + multR (d + 1) ((pl + 2 ^ (8 * (d + 1)) * l) / 256) l' =
      (if pl % 256 = l' then 1 else 0) + multR d (pl / 256) l' + (if l = l' then 1 else 0)
    rw [e1, e2, ih _ hpl' l hl l']; ring

/-- appending a label at position `d` -/
theorem multR_append (d pl l : ℕ) (hpl : pl < 2 ^ (8 * d)) (hl : l < 256) (l' : ℕ) :
    multR (d + 1) (pl ||| l <<< (8 * d)) l' = multR d pl l' + (if l = l' then 1 else 0) := by
  have hor : pl ||| l <<< (8 * d) = pl + 2 ^ (8 * d) * l := by
    rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hpl, Nat.shiftLeft_eq]; ring
  rw [hor]; exact multR_append_add d pl hpl l hl l'

theorem append_lt (d pl l : ℕ) (hpl : pl < 2 ^ (8 * d)) (hl : l < 256) : pl ||| l <<< (8 * d) < 2 ^ (8 * (d + 1)) := by
  apply Nat.or_lt_two_pow (lt_of_lt_of_le hpl (Nat.pow_le_pow_right (by norm_num) (by omega)))
  rw [Nat.shiftLeft_eq, show 8 * (d + 1) = 8 + 8 * d by ring, pow_add]
  exact Nat.mul_lt_mul_of_pos_right (by omega) (by positivity)

theorem one_eq (l : ℕ) : E1P.one l = 2 ^ (256 * l) := by
  show (1 : ℕ) <<< (256 * l) = _; rw [Nat.one_shiftLeft]

theorem mvOf_gen (d : ℕ) : ∀ MV MVR pl, (∀ l, 255 ≤ l → multR d pl l = 0) →
    (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
      (fun _ ih MV MVR pl => ih (Nat.add MV (E1P.one (E1P.rd 8 pl))) (Nat.add MVR (E1P.oner (E1P.rd 8 pl))) (E1P.sk 8 pl)) d MV MVR pl)
      = (MV + V (multR d pl), MVR + VR (multR d pl)) := by
  induction d with
  | zero => intro MV MVR pl _; simp [multR, V_zero]
  | succ d ih =>
    intro MV MVR pl hlab
    have h0 : pl % 256 < 255 := by
      by_contra hc
      have := hlab (pl % 256) (by omega)
      simp [multR] at this
    have hl' : ∀ l, 255 ≤ l → multR d (pl / 256) l = 0 := by
      intro l hl; have := hlab l hl; simp only [multR] at this; omega
    have hstep : (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
        (fun _ ih MV MVR pl => ih (Nat.add MV (E1P.one (E1P.rd 8 pl))) (Nat.add MVR (E1P.oner (E1P.rd 8 pl))) (E1P.sk 8 pl)) (d + 1)
          MV MVR pl) =
        (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
        (fun _ ih MV MVR pl => ih (Nat.add MV (E1P.one (E1P.rd 8 pl))) (Nat.add MVR (E1P.oner (E1P.rd 8 pl))) (E1P.sk 8 pl)) d
          (MV + E1P.one (pl % 256)) (MVR + E1P.oner (pl % 256)) (pl / 256)) := by
      show (Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ) (fun MV MVR _ => (MV, MVR))
        (fun _ ih MV MVR pl => ih (Nat.add MV (E1P.one (E1P.rd 8 pl))) (Nat.add MVR (E1P.oner (E1P.rd 8 pl))) (E1P.sk 8 pl)) d
          (Nat.add MV (E1P.one (E1P.rd 8 pl))) (Nat.add MVR (E1P.oner (E1P.rd 8 pl))) (E1P.sk 8 pl)) = _
      rw [rd_eq, sk_eq, show (2 : ℕ) ^ 8 = 256 by norm_num]; rfl
    rw [hstep, ih _ _ _ hl', one_V _ h0, oner_VR _ h0]
    simp only [Prod.mk.injEq]
    constructor
    · rw [Nat.add_assoc, V_add]
      refine congrArg (MV + ·) (V_congr _ _ (fun l _ => ?_))
      show (if l = pl % 256 then 1 else 0) + multR d (pl / 256) l = (if pl % 256 = l then 1 else 0) + multR d (pl / 256) l
      by_cases h : l = pl % 256
      · rw [if_pos h, if_pos h.symm]
      · rw [if_neg h, if_neg (Ne.symm h)]
    · rw [Nat.add_assoc, VR_add]
      refine congrArg (MVR + ·) (VR_congr _ _ (fun l _ => ?_))
      show (if l = pl % 256 then 1 else 0) + multR d (pl / 256) l = (if pl % 256 = l then 1 else 0) + multR d (pl / 256) l
      by_cases h : l = pl % 256
      · rw [if_pos h, if_pos h.symm]
      · rw [if_neg h, if_neg (Ne.symm h)]

theorem mvOf_eq (d pl : ℕ) (hlab : ∀ l, 255 ≤ l → multR d pl l = 0) :
    E1P.mvOf d pl = (V (multR d pl), VR (multR d pl)) := by
  have := mvOf_gen d 0 0 pl hlab
  simp only [Nat.zero_add] at this
  exact this

/-! ## Budgets and states -/

def bud3 (B l : ℕ) : ℕ := B / 2 ^ (3 * l) % 8

theorem bud3_lt (B l : ℕ) : bud3 B l < 8 := Nat.mod_lt _ (by norm_num)

theorem recsum_eq (f : ℕ → ℕ) (n : ℕ) :
    Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1P.one l))) n = pk 256 f n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show Nat.add (Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1P.one l))) n) (Nat.mul (f n) (E1P.one n)) = _
    rw [ih, pk_succ, one_eq]; rfl

theorem budU_eq (B : ℕ) : E1P.budU B = V (bud3 B) := by
  show Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (E1P.rd 3 (E1P.sk (Nat.mul 3 l) B)) (E1P.one l))) 255 = _
  rw [recsum_eq]
  apply pk_congr; intro l _; rw [rd_eq, sk_eq]; rfl

theorem recsumR_eq (f : ℕ → ℕ) (n : ℕ) (hn : n ≤ 255) :
    Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1P.oner l))) n =
      ∑ l ∈ range n, f l * 2 ^ (256 * (254 - l)) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show Nat.add (Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (f l) (E1P.oner l))) n) (Nat.mul (f n) (E1P.oner n)) = _
    rw [ih (by omega), Finset.sum_range_succ]
    congr 1
    show f n * (1 <<< (256 * (254 - n))) = _
    rw [Nat.one_shiftLeft]

theorem budUR_eq (B : ℕ) : E1P.budUR B = VR (bud3 B) := by
  show Nat.rec (motive := fun _ => ℕ) 0 (fun l U => Nat.add U (Nat.mul (E1P.rd 3 (E1P.sk (Nat.mul 3 l) B)) (E1P.oner l))) 255 = _
  rw [recsumR_eq _ 255 le_rfl]
  show _ = ∑ j ∈ range 255, bud3 B (254 - j) * 2 ^ (256 * j)
  rw [← Finset.sum_range_reflect]
  apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
  rw [rd_eq, sk_eq, show 254 - (255 - 1 - l) = l by omega, show 255 - 1 - l = 254 - l by omega]; rfl

/-- `x` completes the prefix `(d, pos, pl)` (only labels `≥ pos` added) within the budgets `u` -/
def Cmpl (x : ℕ → ℕ) (d pos pl : ℕ) (u : ℕ → ℕ) : Prop :=
  (∀ l, multR d pl l ≤ x l) ∧ (∀ l < pos, x l = multR d pl l) ∧ (∀ l, pos < l → multR d pl l = 0) ∧
    (∀ l < 255, x l ≤ multR d pl l + u l)

/-- the state recorded as `r` (`[5] d, [8] pos, d × [8] prefix, 255 × [3] budgets`) -/
def RecV (x : ℕ → ℕ) (r : ℕ) : Prop :=
  Cmpl x (r % 2 ^ 5) (r / 2 ^ 5 % 2 ^ 8) (r / 2 ^ 13 % 2 ^ (8 * (r % 2 ^ 5))) (bud3 (r / 2 ^ (13 + 8 * (r % 2 ^ 5))))

/-- `x` reaches one of the delegated states in `H` -/
def Reach (x : ℕ → ℕ) (H : ℕ) : Prop := ∃ j, RecV x (H / 2 ^ (946 * j) % 2 ^ 946)

/-- `E1P.stEq` in the named form (its definition uses the per-operation macros) -/
theorem stEq_named (r d pos pl UF : ℕ) : E1P.stEq r d pos pl UF =
    @Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false (@Bool.rec (fun _ => Bool) false
      (Nat.beq (E1P.budU (E1P.sk (Nat.add 13 (Nat.mul 8 d)) r)) UF) (Nat.beq (E1P.rd (Nat.mul 8 d) (E1P.sk 13 r)) pl))
      (Nat.beq (E1P.rd 8 (E1P.sk 5 r)) pos)) (Nat.beq (E1P.rd 5 r) d) := rfl

theorem stEq_reach (x : ℕ → ℕ) (H j d pos pl : ℕ) (u : ℕ → ℕ) (hu : ∀ l < 255, u l < 2 ^ 256)
    (h : E1P.stEq (E1P.rd 946 (E1P.sk (Nat.mul 946 j) H)) d pos pl (V u) = true) (hc : Cmpl x d pos pl u) : Reach x H := by
  refine ⟨j, ?_⟩
  set r := H / 2 ^ (946 * j) % 2 ^ 946 with hr
  have hr' : E1P.rd 946 (E1P.sk (Nat.mul 946 j) H) = r := by rw [rd_eq, sk_eq]; rfl
  rw [hr', stEq_named] at h
  obtain ⟨h1, h⟩ := band_true h
  obtain ⟨h2, h⟩ := band_true h
  obtain ⟨h3, h4⟩ := band_true h
  have e1 : r % 2 ^ 5 = d := by have := Nat.eq_of_beq_eq_true h1; rwa [rd_eq] at this
  have e2 : r / 2 ^ 5 % 2 ^ 8 = pos := by have := Nat.eq_of_beq_eq_true h2; rwa [rd_eq, sk_eq] at this
  have e3 : r / 2 ^ 13 % 2 ^ (8 * d) = pl := by have := Nat.eq_of_beq_eq_true h3; rwa [rd_eq, sk_eq] at this
  have e4 : V (bud3 (r / 2 ^ (13 + 8 * d))) = V u := by
    have := Nat.eq_of_beq_eq_true h4; rwa [budU_eq, sk_eq] at this
  have e5 := V_inj _ _ (fun l _ => lt_trans (bud3_lt _ _) (by norm_num)) hu e4
  unfold RecV
  rw [e1, e2, e3]
  obtain ⟨c1, c2, c3, c4⟩ := hc
  exact ⟨c1, c2, c3, fun l hl => by rw [e5 l hl]; exact c4 l hl⟩

/-! ## Duals, saturations, fixings -/

theorem spread_slot (T j : ℕ) : E1P.spread (E1P.rmask T j) = V (fun l => if (smask (T / 2 ^ (520 * j) % 2 ^ 520)).testBit l then 1 else 0) := by
  rw [rmask_eq, spread_V _ (smask_lt _)]

/-- `rdual`'s loop with explicit accumulators -/
def rdualF (RTb : ℕ) (k : ℕ) : ℕ → ℕ → ℕ → ℕ × ℕ × ℕ :=
  Nat.rec (motive := fun _ => ℕ → ℕ → ℕ → ℕ × ℕ × ℕ) (fun BC T S => (BC, T, S))
    (fun _ ih BC T S => ih (Nat.add BC (Nat.mul (E1P.rd 36 (E1P.sk 12 S)) (E1P.rcap RTb (E1P.rd 12 S))))
      (Nat.add T (Nat.mul (E1P.rd 36 (E1P.sk 12 S)) (E1P.spread (E1P.rmask RTb (E1P.rd 12 S))))) (E1P.sk 48 S)) k

theorem rdual_eq (RTb k S : ℕ) : E1P.rdual RTb k S = rdualF RTb k 0 0 S := rfl
theorem rdualF_zero (RTb BC T S : ℕ) : rdualF RTb 0 BC T S = (BC, T, S) := rfl
theorem rdualF_succ (RTb k BC T S : ℕ) : rdualF RTb (k + 1) BC T S =
    rdualF RTb k (BC + E1P.rd 36 (E1P.sk 12 S) * E1P.rcap RTb (E1P.rd 12 S))
      (T + E1P.rd 36 (E1P.sk 12 S) * E1P.spread (E1P.rmask RTb (E1P.rd 12 S))) (E1P.sk 48 S) := rfl

/-- a dual of `k` rows: `T = V t` with `∑ t x ≤ ∑ Y cap` for every `x` satisfying the rows -/
theorem rdual_gen (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (k : ℕ) : ∀ BC t S TB,
    (∀ l < 255, t l ≤ TB) → ∑ l ∈ range 255, t l * x l ≤ BC →
    ∃ t', (rdualF RTb k BC (V t) S).2.1 = V t' ∧ (∀ l < 255, t' l ≤ TB + k * 2 ^ 36) ∧
      ∑ l ∈ range 255, t' l * x l ≤ (rdualF RTb k BC (V t) S).1 := by
  induction k with
  | zero => intro BC t S TB ht hs; exact ⟨t, rfl, fun l hl => by simpa using ht l hl, hs⟩
  | succ k ih =>
    intro BC t S TB ht hs
    rw [rdualF_succ]
    generalize hj : E1P.rd 12 S = j
    generalize hY : E1P.rd 36 (E1P.sk 12 S) = Y
    have hYlt : Y < 2 ^ 36 := by rw [← hY, rd_eq]; exact Nat.mod_lt _ (by positivity)
    have hv := hT j
    generalize hvd : RTb / 2 ^ (520 * j) % 2 ^ 520 = v at hv
    have eT : V t + Y * E1P.spread (E1P.rmask RTb j) = V (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) := by
      rw [spread_slot, hvd, mul_comm, V_mul, V_add]
    have eB : BC + Y * E1P.rcap RTb j = BC + Y * scap v := by rw [rcap_eq, hvd]
    rw [eT, eB]
    have hb : ∀ l < 255, (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) l ≤ TB + 2 ^ 36 := by
      intro l hl; have := ht l hl; dsimp only; split <;> omega
    have hs' : ∑ l ∈ range 255, (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) l * x l ≤ BC + Y * scap v := by
      have e : ∑ l ∈ range 255, (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y) l * x l =
          ∑ l ∈ range 255, t l * x l + Y * msum x (smask v) := by
        rw [msum, Finset.mul_sum, ← Finset.sum_add_distrib]
        apply Finset.sum_congr rfl; intro l _; dsimp only; split <;> ring
      rw [e]
      exact Nat.add_le_add hs (Nat.mul_le_mul_left _ hv.1)
    obtain ⟨t', h1, h2, h3⟩ := ih (BC + Y * scap v) (fun l => t l + (if (smask v).testBit l then 1 else 0) * Y)
      (E1P.sk 48 S) (TB + 2 ^ 36) hb hs'
    exact ⟨t', h1, fun l hl => by have := h2 l hl; rw [Nat.succ_mul]; omega, h3⟩

theorem rdual_sem (x : ℕ → ℕ) (RTb : ℕ) (hT : SlotsOK x RTb) (k S : ℕ) (hk : k < 64) :
    ∃ t', (E1P.rdual RTb k S).2.1 = V t' ∧ (∀ l < 255, t' l < 2 ^ 42) ∧
      ∑ l ∈ range 255, t' l * x l ≤ (E1P.rdual RTb k S).1 := by
  obtain ⟨t', h1, h2, h3⟩ := rdual_gen x RTb hT k 0 (fun _ => 0) S 0 (fun _ _ => le_rfl) (by simp)
  rw [V_zero] at h1 h3
  refine ⟨t', h1, fun l hl => ?_, h3⟩
  have := h2 l hl
  have : k * 2 ^ 36 < 2 ^ 42 := by
    calc k * 2 ^ 36 < 64 * 2 ^ 36 := Nat.mul_lt_mul_of_pos_right hk (by positivity)
      _ = 2 ^ 42 := by norm_num
  omega

/-- the rest of the stream after a dual -/
theorem rdual_rest (RTb k S : ℕ) : (E1P.rdual RTb k S).2.2 = S / 2 ^ (48 * k) := by
  suffices h : ∀ k BC T S, (rdualF RTb k BC T S).2.2 = S / 2 ^ (48 * k) from h k 0 0 S
  intro k
  induction k with
  | zero => intro BC T S; simp [rdualF_zero]
  | succ k ih =>
    intro BC T S
    rw [rdualF_succ, ih, sk_eq, Nat.div_div_eq_div_mul, ← pow_add]; ring_nf

end E1PS
