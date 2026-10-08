module
public import R22Port.U_a0f0f2a06783
public import R.Load
public import NLP.E1Hook
public import E1N.Leaf
/-! # The leaf hook: `E1N.leafHook C.VT C.DOM` satisfies `IPRel.leaf`, through the leaf agent's `NL.e1p_leaf`

* `pk_af_packL`: the kernel's packing `pk 8 (af labs) labs.size` of a label array is the leaf agent's `NL.packL 8 labs.toList`;
* `win_nl`: our window `win B q e` is the leaf agent's `NL.win (NL.natOfBytes B) e q`;
* `leafHook_rel`, and `mkIPD_rel_hook`: the IP data built with the leaf hook satisfy `IPRel` (no hypothesis on the leaf). -/
@[expose] public section
namespace E1NR
open E1N Finset E1PS

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

theorem pk_af_packL (labs : Array ℕ) : pk 8 (af labs) labs.size = NL.packL 8 labs.toList := by
  rw [← pk_packL 8 labs.toList, Array.length_toList]
  apply pk_congr; intro v _
  unfold af
  rw [Array.getD_eq_getD_getElem?, List.getD_eq_getElem?_getD, Array.getElem?_toList]

theorem win_nl (B : ByteArray) (q e : ℕ) : win B q e = NL.win (NL.natOfBytes B) e q := by
  unfold win NL.win
  rw [NL.rd_eq', NL.sk_eq', Nat.shiftRight_eq_div_pow]
  rfl

theorem leafHook_terms (VT : ℕ) (labs : Array ℕ) :
    (labs.map fun x => Nat.land (Nat.shiftRight VT (Nat.mul 9 x)) 511) = (labs.toList.map (NL.termOf VT)).toArray := by
  apply Array.ext'
  simp only [Array.toList_map]
  rfl

/-- **The leaf hook**: an accepted `E1N.leafHook C.VT C.DOM` call is the kernel's leaf check of the prefix -/
theorem leafHook_rel (C : E1P.Ctx) (hD : C.DOM < 2 ^ 512) :
    ∀ labs B q e, E1N.leafHook C.VT C.DOM labs B q e = true → labs.size = C.R → (∀ t < labs.size, af labs t < 255) →
      BC7.leafS (E1P.leafRec C.R C.VT C.DOM (pk 8 (af labs) labs.size) (win B q e)) = true := by
  intro labs B q e h hR hl
  rw [pk_af_packL, win_nl]
  refine NL.e1p_leaf C.R C.VT C.DOM labs.toList (by rw [Array.length_toList, hR]) ?_ hD B q e ?_
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

/-- the native IP data built with the leaf hook satisfy `IPRel` -/
theorem mkIPD_rel_hook (C : E1P.Ctx) (UB UBR : ℕ) (ch : ℕ → ℕ) (hN : C.N ≤ 255) (hDOM : C.DOM < 2 ^ 512)
    (hUB : UB = V (fun l => E1P.fld UB l)) (hUBR : UBR = VR (fun l => E1P.fld UB l))
    (hub : ∀ x < 255, E1P.fld UB x ≤ 2 ^ 32) :
    IPRel (E1N.mkIPD 8 19 6 11 C.R C.N UB ch C.GP (E1N.leafHook C.VT C.DOM)) C (E1P.slc ch) UB UBR :=
  mkIPD_rel C UB UBR ch _ hN hUB hUBR hub (leafHook_rel C hDOM)

end E1NR
