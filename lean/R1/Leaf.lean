module
public import R22Port.U_a0f0f2a06783
public import R1.Load
public import R1.Node
public import NLP.E1Hook
public import E1N.Leaf
/-! # The E1 (leaf2) leaf hook: `E1N.leafHookG C.VT C.DOM C.EXT` satisfies `IPRel.leaf` (the kernel's `E1.leafOK`)

* `winZero_iff`: the native zero test of the certificate window is `win B q e = 0`;
* `extMem_eq`: the kernel's `List.rec` membership test is `List.contains`;
* `packN_eq`: the native packing of the prefix is the kernel's `pk 7 (af labs) labs.size`;
* `leafHookG_rel` through the leaf agent's `NL.e1_leaf`, and `mkIPD_rel_hookG`. -/
@[expose] public section
namespace E1NR1
open E1N Finset E1S

theorem pk_cons (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : pk B a (L + 1) = a 0 + 2 ^ B * pk B (fun v => a (v + 1)) L := by
  unfold pk
  rw [Finset.sum_range_succ', Finset.mul_sum, add_comm]
  simp only [Nat.mul_zero, pow_zero, Nat.mul_one]
  congr 1
  apply Finset.sum_congr rfl; intro v _
  rw [show B * (v + 1) = B + B * v by ring, pow_add]; ring

theorem pk_packL (B : ℕ) : ∀ l : List ℕ, pk B (fun v => l.getD v 0) l.length = NL.packL B l
  | [] => by simp [pk, NL.packL]
  | x :: xs => by
    rw [List.length_cons, pk_cons, NL.packL]
    simp only [List.getD_cons_zero, List.getD_cons_succ]
    rw [pk_packL B xs]

theorem pk_af_packL (labs : Array ℕ) : pk 7 (af labs) labs.size = NL.packL 7 labs.toList := by
  rw [← pk_packL 7 labs.toList, Array.length_toList]
  apply pk_congr; intro v _
  unfold af
  rw [Array.getD_eq_getD_getElem?, List.getD_eq_getElem?_getD, Array.getElem?_toList]

theorem packL_foldr : ∀ l : List ℕ, l.foldr (fun x a => x + 2 ^ 7 * a) 0 = NL.packL 7 l
  | [] => rfl
  | x :: xs => by rw [List.foldr_cons, packL_foldr xs]; rfl

theorem packN_eq (labs : Array ℕ) : E1N.packN 7 labs = pk 7 (af labs) labs.size := by
  rw [pk_af_packL, ← packL_foldr]
  unfold E1N.packN
  rw [Array.foldr_toList]

theorem win_nl (B : ByteArray) (q e : ℕ) : win B q e = NL.win (NL.natOfBytes B) e q := by
  unfold win NL.win
  rw [NL.rd_eq', NL.sk_eq', Nat.shiftRight_eq_div_pow]
  rfl

theorem leafHook_terms (VT : ℕ) (labs : Array ℕ) :
    (labs.map fun x => Nat.land (Nat.shiftRight VT (Nat.mul 9 x)) 511) = (labs.toList.map (NL.termOf VT)).toArray := by
  apply Array.ext'
  simp only [Array.toList_map]
  rfl

/-! ## The zero test -/

theorem zero_of_digits : ∀ (f x : ℕ), x < 2 ^ (48 * f) → (∀ j < f, x / 2 ^ (48 * j) % 2 ^ 48 = 0) → x = 0
  | 0, x, hx, _ => by simpa using hx
  | f + 1, x, hx, hd => by
    have h0 := hd 0 (by omega)
    simp only [Nat.mul_zero, pow_zero, Nat.div_one] at h0
    have hq : x / 2 ^ 48 = 0 := by
      apply zero_of_digits f
      · rw [Nat.div_lt_iff_lt_mul (by positivity), ← pow_add]
        calc x < 2 ^ (48 * (f + 1)) := hx
          _ = 2 ^ (48 * f + 48) := by ring_nf
      · intro j hj
        have := hd (j + 1) (by omega)
        rwa [Nat.div_div_eq_div_mul, ← pow_add, show 48 + 48 * j = 48 * (j + 1) by ring]
    have := Nat.div_add_mod x (2 ^ 48)
    rw [hq, h0] at this
    omega

theorem winZeroGo_true (B : ByteArray) (e : ℕ) : ∀ f q, E1N.winZeroGo B e f q = true →
    ∀ j < f, win B q e / 2 ^ (48 * j) % 2 ^ 48 = 0
  | 0, _, _, j, hj => absurd hj (Nat.not_lt_zero _)
  | f + 1, q, h, j, hj => by
    unfold E1N.winZeroGo at h
    simp only [Bool.and_eq_true, beq_iff_eq] at h
    obtain ⟨h0, hr⟩ := h
    rw [win_digit]
    cases j with
    | zero =>
      rw [rdE_eq _ _ _ 48 (by norm_num)] at h0
      simpa using h0
    | succ j =>
      have := winZeroGo_true B e f (q + 48) hr j (by omega)
      rw [win_digit, show q + 48 + 48 * j = q + 48 * (j + 1) by ring] at this
      exact this

theorem winZeroGo_false (B : ByteArray) (e : ℕ) : ∀ f q, E1N.winZeroGo B e f q = false →
    ∃ j < f, win B q e / 2 ^ (48 * j) % 2 ^ 48 ≠ 0
  | 0, _, h => absurd h (by simp [E1N.winZeroGo])
  | f + 1, q, h => by
    unfold E1N.winZeroGo at h
    rw [Bool.and_eq_false_iff] at h
    rcases h with h0 | hr
    · refine ⟨0, by omega, ?_⟩
      rw [win_digit]
      have : E1N.rdE B q e 48 ≠ 0 := by simpa using h0
      rw [rdE_eq _ _ _ 48 (by norm_num)] at this
      simpa using this
    · obtain ⟨j, hj, hne⟩ := winZeroGo_false B e f (q + 48) hr
      refine ⟨j + 1, by omega, ?_⟩
      rw [win_digit] at hne ⊢
      rwa [show q + 48 + 48 * j = q + 48 * (j + 1) by ring] at hne

/-- the native zero test is `win B q e = 0` -/
theorem winZero_iff (B : ByteArray) (q e : ℕ) : E1N.winZero B q e = true ↔ win B q e = 0 := by
  unfold E1N.winZero
  constructor
  · intro h
    apply zero_of_digits ((e - q) / 48 + 1)
    · exact lt_of_lt_of_le (win_lt B q e) (Nat.pow_le_pow_right (by norm_num) (by omega))
    · exact winZeroGo_true B e _ q h
  · intro h
    by_contra hc
    obtain ⟨j, -, hne⟩ := winZeroGo_false B e _ q (by simpa using hc)
    rw [h] at hne
    simp at hne

/-! ## External leaves -/

theorem extMem_eq (pl : ℕ) : ∀ l : List ℕ,
    @List.rec ℕ (fun _ => Bool) false (fun e _ ih => @Bool.rec (fun _ => Bool) ih true (Nat.beq e pl)) l = l.contains pl
  | [] => rfl
  | e :: l => by
    show @Bool.rec (fun _ => Bool) (@List.rec ℕ (fun _ => Bool) false
      (fun e _ ih => @Bool.rec (fun _ => Bool) ih true (Nat.beq e pl)) l) true (Nat.beq e pl) = (e :: l).contains pl
    rw [extMem_eq pl l, List.contains_cons]
    by_cases h : e = pl
    · subst h; rw [show Nat.beq e e = true from Nat.beq_refl e]; simp
    · rw [show Nat.beq e pl = false from by cases hb : Nat.beq e pl; rfl; exact absurd (Nat.eq_of_beq_eq_true hb) h]
      simp [Ne.symm h]

/-- **the E1 leaf hook**: an accepted `E1N.leafHookG C.VT C.DOM C.EXT` call is the kernel's `E1.leafOK` -/
theorem leafHookG_rel (C : E1.Ctx) (hD : C.DOM < 2 ^ 512) :
    ∀ labs B q e, E1N.leafHookG C.VT C.DOM C.EXT labs B q e = true → labs.size = C.R → (∀ t < labs.size, af labs t < 127) →
      E1.leafOK C (pk 7 (af labs) labs.size) (win B q e) = true := by
  intro labs B q e h hR hl
  unfold E1N.leafHookG at h
  unfold E1.leafOK
  by_cases hz : E1N.winZero B q e = true
  · rw [if_pos hz, packN_eq] at h
    rw [(winZero_iff B q e).mp hz, selC (Nat.beq 0 0) rfl, extMem_eq]
    exact h
  · rw [if_neg hz] at h
    have hne : win B q e ≠ 0 := fun h0 => hz ((winZero_iff B q e).mpr h0)
    rw [selCF (Nat.beq (win B q e) 0) (by cases hb : Nat.beq (win B q e) 0; rfl; exact absurd (Nat.eq_of_beq_eq_true hb) hne)]
    rw [pk_af_packL, win_nl]
    refine NL.e1_leaf C.R C.VT C.DOM labs.toList (by rw [Array.length_toList, hR]) ?_ hD B q e ?_
    · intro x hx
      obtain ⟨t, ht, rfl⟩ := List.getElem_of_mem hx
      rw [Array.length_toList] at ht
      have := hl t ht
      unfold af at this
      rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem ht, Option.getD_some] at this
      rw [Array.getElem_toList]
      omega
    · unfold E1N.leafHook at h
      rw [leafHook_terms] at h
      exact h

/-- the native IP data built with the E1 leaf hook satisfy `IPRel` -/
theorem mkIPD_rel_hookG (C : E1.Ctx) (UB UBR : ℕ) (ch : ℕ → ℕ) (hN : C.N ≤ 127) (hDOM : C.DOM < 2 ^ 512)
    (hUB : UB = V (fun l => E1.fld UB l)) (hUBR : UBR = VR (fun l => E1.fld UB l))
    (hub : ∀ x < 127, E1.fld UB x ≤ 2 ^ 32) :
    IPRel (E1N.mkIPD 7 15 4 4 C.R C.N UB ch (E1.gpE C.GP) (E1N.leafHookG C.VT C.DOM C.EXT)) C (slw ch) UB UBR :=
  mkIPD_rel C UB UBR ch _ hN hUB hUBR hub (leafHookG_rel C hDOM)

end E1NR1

namespace E1NR1
open E1N Finset E1S

/-- the halves of a 128-slot chunk table give its slots -/
theorem slw_half (ch : ℕ → ℕ) (i : ℕ) : slw (E1N.half ch) i = ch (i / 128) / 2 ^ (264 * (i % 128)) % 2 ^ 264 := by
  unfold slw E1N.half
  rw [Nat.one_shiftLeft, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow,
    show i / 64 / 2 = i / 128 by omega, mod_div_mod _ 16896 (264 * (i % 64)) 264 (by omega), Nat.div_div_eq_div_mul,
    ← pow_add, show 16896 * (i / 64 % 2) + 264 * (i % 64) = 264 * (i % 128) by omega]

/-- **leaf2's E1 IPs**: the native data built from the table's 128-slot chunks (through `half`), the group `gpE`, and the
leaf hook satisfy `IPRel` for the slot function `i ↦ ch (i / 128) / 2^(264 (i % 128)) % 2^264` (the table's `entry`) -/
theorem mkIPD_rel_E1 (C : E1.Ctx) (UB UBR : ℕ) (ch : ℕ → ℕ) (hN : C.N ≤ 127) (hDOM : C.DOM < 2 ^ 512)
    (hUB : UB = V (fun l => E1.fld UB l)) (hUBR : UBR = VR (fun l => E1.fld UB l))
    (hub : ∀ x < 127, E1.fld UB x ≤ 2 ^ 32) :
    IPRel (E1N.mkIPD 7 15 4 4 C.R C.N UB (E1N.half ch) (E1.gpE C.GP) (E1N.leafHookG C.VT C.DOM C.EXT)) C
      (fun i => ch (i / 128) / 2 ^ (264 * (i % 128)) % 2 ^ 264) UB UBR := by
  have h := mkIPD_rel_hookG C UB UBR (E1N.half ch) hN hDOM hUB hUBR hub
  rw [show slw (E1N.half ch) = (fun i => ch (i / 128) / 2 ^ (264 * (i % 128)) % 2 ^ 264) from funext (slw_half ch)] at h
  exact h

end E1NR1
