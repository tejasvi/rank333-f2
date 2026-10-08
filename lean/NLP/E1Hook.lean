module
public import R22Port.U_d41d8cd98f00
public import NLP.Leaf
public import E1.Check
public import E1P.Check
public import E1G.Check
/-! # NLP.E1Hook: the native leaf hook of the E1 family

The E1, E1G and E1P checkers check a leaf of prefix `pl` (labels packed `lb` bits each: 7, 7, 8) by
`BC7.leafS (leafRec R VT DOM pl cert)`.  Every `leafRec` is `leafForm R T DOM cert` with `T` the packed first factors
`(VT >>> 9 x) &&& 511` of the labels `x`.  So an accepted `NL.leafCertW` with those first factors, the domain `M8.ofNat DOM`
and the certificate window `[q, e)` of `B` gives `BC7.leafS (leafRec R VT DOM (packL lb labs) (win (natOfBytes B) e q)) = true`
(`e1_leaf`, `e1g_leaf`, `e1p_leaf`). -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

/-! ## `M8.ofNat` -/

theorem M8.ofNat_toNat (x : Nat) : (M8.ofNat x).toNat = x % 2 ^ 512 := by
  apply M8.toNat_eq _ _ (Nat.mod_lt _ (Nat.two_pow_pos 512))
  intro i hi
  rw [M8.bit_wd _ _ hi, Nat.testBit_mod_two_pow, decide_eq_true hi, Bool.true_and]
  have hw : ∀ k, ((x >>> (64 * k)) % 2 ^ 64).toUInt64.toNat = (x >>> (64 * k)) % 2 ^ 64 := fun k => by
    rw [Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.mod_mod]
  have hk : (M8.ofNat x).wd (i / 64) = ((x >>> (64 * (i / 64))) % 2 ^ 64).toUInt64 := by
    have : i / 64 < 8 := by omega
    unfold M8.ofNat M8.wd
    interval_cases h : i / 64 <;> simp
  rw [hk, hw, Nat.testBit_mod_two_pow, decide_eq_true (Nat.mod_lt _ (by norm_num)), Bool.true_and,
    Nat.testBit_shiftRight, show 64 * (i / 64) + i % 64 = i by omega]

theorem M8.ofNat_toNat_lt (x : Nat) (hx : x < 2 ^ 512) : (M8.ofNat x).toNat = x := by
  rw [M8.ofNat_toNat, Nat.mod_eq_of_lt hx]

/-! ## Packed labels and first factors -/

/-- labels packed `lb` bits each, the first at the low end -/
def packL (lb : Nat) : List Nat → Nat
  | [] => 0
  | x :: xs => x + 2 ^ lb * packL lb xs

/-- the first factor of label `x` -/
def termOf (VT x : Nat) : Nat := Nat.land (Nat.shiftRight VT (Nat.mul 9 x)) 511

/-- the `leafRec` term loop, any label width -/
def termsG (lb R VT pl : Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) (fun acc _ _ => acc)
    (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (BC5.rd lb pl))) 511)
      (Nat.mul 9 i))) (Nat.succ i) (BC5.sk lb pl)) R 0 0 pl

theorem termsLoop (lb VT : Nat) : ∀ (l : List Nat), (∀ x ∈ l, x < 2 ^ lb) → ∀ acc i,
    Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) (fun acc _ _ => acc)
      (fun _ ih acc i pl => ih (Nat.lor acc (Nat.shiftLeft (Nat.land (Nat.shiftRight VT (Nat.mul 9 (BC5.rd lb pl))) 511)
        (Nat.mul 9 i))) (Nat.succ i) (BC5.sk lb pl)) l.length acc i (packL lb l) =
      Nat.lor acc (Nat.shiftLeft (BC5.packT (l.map (termOf VT))) (Nat.mul 9 i))
  | [], _, acc, i => by simp [BC5.packT, packL]
  | x :: xs, h, acc, i => by
    have hx := h x List.mem_cons_self
    have e1 : BC5.rd lb (packL lb (x :: xs)) = x := rd_split _ _ _ hx
    have e2 : BC5.sk lb (packL lb (x :: xs)) = packL lb xs := sk_split _ _ _ hx
    show Nat.rec (motive := fun _ => Nat → Nat → Nat → Nat) _ _ xs.length _ _ _ = _
    rw [e1, e2, termsLoop lb VT xs (fun y hy => h y (List.mem_cons_of_mem _ hy))]
    show Nat.lor (Nat.lor acc (Nat.shiftLeft (termOf VT x) (Nat.mul 9 i))) (Nat.shiftLeft (BC5.packT (xs.map (termOf VT)))
      (Nat.mul 9 (Nat.succ i))) = Nat.lor acc (Nat.shiftLeft (Nat.lor (termOf VT x) (Nat.shiftLeft (BC5.packT (xs.map (termOf VT))) 9))
      (Nat.mul 9 i))
    simp only [Nat.lor_eq, Nat.shiftLeft_eq', Nat.mul_eq, Nat.shiftLeft_or_distrib, ← Nat.shiftLeft_add, Nat.or_assoc]
    rw [show 9 + 9 * i = 9 * (i + 1) by ring]

theorem termsG_eq (lb R VT : Nat) (labs : List Nat) (hR : labs.length = R) (hl : ∀ x ∈ labs, x < 2 ^ lb) :
    termsG lb R VT (packL lb labs) = BC5.packT (labs.map (termOf VT)) := by
  subst hR
  unfold termsG
  rw [termsLoop lb VT labs hl 0 0]
  simp [Nat.lor_eq, Nat.shiftLeft_eq']

theorem termOf_lt (VT x : Nat) : termOf VT x < 512 := by
  unfold termOf; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)

theorem packT_lt : ∀ (l : List Nat), (∀ x ∈ l, x < 512) → BC5.packT l < 2 ^ (9 * l.length)
  | [], _ => by simp [BC5.packT]
  | x :: xs, h => by
    have hx := h x List.mem_cons_self
    have ih := packT_lt xs (fun y hy => h y (List.mem_cons_of_mem _ hy))
    show Nat.lor x (Nat.shiftLeft (BC5.packT xs) 9) < 2 ^ (9 * (xs.length + 1))
    rw [or_shift x _ 9 (by omega), show 9 * (xs.length + 1) = 9 + 9 * xs.length by ring, Nat.pow_add]
    have : 2 ^ 9 * BC5.packT xs + 2 ^ 9 ≤ 2 ^ 9 * 2 ^ (9 * xs.length) := by
      rw [← Nat.mul_succ]; exact Nat.mul_le_mul_left _ ih
    omega

/-! ## The hook -/

/-- the hook for any `leafRec` of the E1 shape -/
theorem leafForm_hook (R VT DOM : Nat) (labs : List Nat) (hR : labs.length = R) (hD : DOM < 2 ^ 512) (B : ByteArray)
    (q e : Nat) (h : leafCertW (labs.map (termOf VT)).toArray (M8.ofNat DOM) B q e = true) :
    BC7.leafS (leafForm R (BC5.packT (labs.map (termOf VT))) DOM (win (natOfBytes B) e q)) = true := by
  obtain ⟨h1, h2, h3⟩ := leafCertW_sound _ _ _ _ _ h
  simp only [List.size_toArray, List.length_map, List.toList_toArray] at h1 h2 h3
  rw [M8.ofNat_toNat_lt _ hD, hR] at h3
  rw [R7.leafS7_ref, leafS_form R _ DOM _ (by omega) _ hD]
  · exact h3
  · have := packT_lt (labs.map (termOf VT)) h2
    simpa [List.length_map, hR] using this

/-- **the E1 leaf hook** (7-bit labels) -/
theorem e1_leaf (R VT DOM : Nat) (labs : List Nat) (hR : labs.length = R) (hl : ∀ x ∈ labs, x < 2 ^ 7)
    (hD : DOM < 2 ^ 512) (B : ByteArray) (q e : Nat)
    (h : leafCertW (labs.map (termOf VT)).toArray (M8.ofNat DOM) B q e = true) :
    BC7.leafS (E1.leafRec R VT DOM (packL 7 labs) (win (natOfBytes B) e q)) = true := by
  have hrec : E1.leafRec R VT DOM (packL 7 labs) (win (natOfBytes B) e q) =
      leafForm R (termsG 7 R VT (packL 7 labs)) DOM (win (natOfBytes B) e q) := rfl
  rw [hrec, termsG_eq 7 R VT labs hR hl]
  exact leafForm_hook R VT DOM labs hR hD B q e h

/-- **the E1G leaf hook** (7-bit labels) -/
theorem e1g_leaf (R VT DOM : Nat) (labs : List Nat) (hR : labs.length = R) (hl : ∀ x ∈ labs, x < 2 ^ 7)
    (hD : DOM < 2 ^ 512) (B : ByteArray) (q e : Nat)
    (h : leafCertW (labs.map (termOf VT)).toArray (M8.ofNat DOM) B q e = true) :
    BC7.leafS (E1G.leafRec R VT DOM (packL 7 labs) (win (natOfBytes B) e q)) = true := by
  have hrec : E1G.leafRec R VT DOM (packL 7 labs) (win (natOfBytes B) e q) =
      leafForm R (termsG 7 R VT (packL 7 labs)) DOM (win (natOfBytes B) e q) := rfl
  rw [hrec, termsG_eq 7 R VT labs hR hl]
  exact leafForm_hook R VT DOM labs hR hD B q e h

/-- **the E1P leaf hook** (8-bit labels) -/
theorem e1p_leaf (R VT DOM : Nat) (labs : List Nat) (hR : labs.length = R) (hl : ∀ x ∈ labs, x < 2 ^ 8)
    (hD : DOM < 2 ^ 512) (B : ByteArray) (q e : Nat)
    (h : leafCertW (labs.map (termOf VT)).toArray (M8.ofNat DOM) B q e = true) :
    BC7.leafS (E1P.leafRec R VT DOM (packL 8 labs) (win (natOfBytes B) e q)) = true := by
  have hrec : E1P.leafRec R VT DOM (packL 8 labs) (win (natOfBytes B) e q) =
      leafForm R (termsG 8 R VT (packL 8 labs)) DOM (win (natOfBytes B) e q) := rfl
  rw [hrec, termsG_eq 8 R VT labs hR hl]
  exact leafForm_hook R VT DOM labs hR hD B q e h

end NL
