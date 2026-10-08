module
public import R22Port.U_d41d8cd98f00
public import LG.Gen
public import HC.Transport
/-! # Transport of the context cap along a symmetry

`capG_transport`: if a symmetry `(t, P, Q)` (prof7's group, `C3.actN`, `P`, `Q` invertible) maps every point of `E'` into `E`,
then `CapG E R lo → CapG E' R lo`. A decomposition moved by the symmetry is again a `Dec22` (`Dec22.act`) with the same
rank-1 count, and a first factor outside `E'` maps outside `E`... read backwards: a first factor whose image lies outside
`E` lies outside `E'`.

Use: an IP built on any representative `E` of a class gives the cap for the class representative `K_c` that
`classFactsG_of` takes (`mapsTo t P Q E K_c`). -/
@[expose] public section
set_option linter.unusedSectionVars false

namespace L479
open Finset RootSound

/-- a decomposition moved by the symmetry `(t, P, Q)` -/
noncomputable def Dec22.act (A : R3RT.Spec.Dec22) (t : Bool) (P Q : ℕ) (hP : C3.isGL P = true)
    (hQ : C3.isGL Q = true) : R3RT.Spec.Dec22 where
  av := fun s => C3.actN t P Q (A.av s)
  b := Classical.choose (C3.isDecomp_actN (t := t) A.dec hP hQ)
  c := Classical.choose (Classical.choose_spec (C3.isDecomp_actN (t := t) A.dec hP hQ))
  lt := fun s => C3.actN_lt _ _ _ _
  ne := fun s h0 => A.ne s (C3.actN_inj hP hQ (A.lt s) (by norm_num) (h0.trans (RT.actN_zero t P Q).symm))
  inj := fun s s' h => A.inj (C3.actN_inj hP hQ (A.lt s) (A.lt s') h)
  dec := Classical.choose_spec (Classical.choose_spec (C3.isDecomp_actN (t := t) A.dec hP hQ))

theorem nType_act (A : R3RT.Spec.Dec22) {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true)
    (r : ℕ) : KD.nType (Dec22.act A t P Q hP hQ) r = KD.nType A r := by
  unfold KD.nType
  apply congrArg Finset.card
  apply Finset.filter_congr
  intro s _
  show (toM3 (C3.actN t P Q (A.av s))).rank = r ↔ (toM3 (A.av s)).rank = r
  rw [rank_actN hP hQ]

/-- **transport of the context cap** -/
theorem capG_transport {Em Em' R lo : ℕ} {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true)
    (hmap : HC.mapsTo t P Q Em Em' = true) (h : CapG Em R lo) : CapG Em' R lo := by
  intro A hA
  have h1 := h (Dec22.act A t P Q hP hQ) (by rw [nType_act]; exact hA)
  refine le_trans h1 (Finset.card_le_card ?_)
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e : Em'.testBit (A.av s)
  · rfl
  · have h2 := HC.mapsTo_spec hmap _ (A.lt s) e
    have h3 : Em.testBit (C3.actN t P Q (A.av s)) = false := hs
    rw [h2] at h3; exact absurd h3 (by decide)

/-- **transport of a 22-term class fact** (`FactN`: distinct nonzero first factors) along a symmetry mapping `E'` into `E` -/
theorem factN_transport {Em Em' k : ℕ} {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true)
    (hmap : HC.mapsTo t P Q Em Em' = true) (h : RT.FactN 22 Em k) : RT.FactN 22 Em' k := by
  intro av b c hav hnz hinj hd
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN (t := t) hd hP hQ
  have hk := h (fun s => C3.actN t P Q (av s)) b' c' (fun s => C3.actN_lt _ _ _ _)
    (fun s h0 => hnz s (C3.actN_inj hP hQ (hav s) (by norm_num) (h0.trans (RT.actN_zero t P Q).symm)))
    (fun s s' e => hinj (C3.actN_inj hP hQ (hav s) (hav s') e)) hd'
  refine le_trans hk (Finset.card_le_card ?_)
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e : Em'.testBit (av s)
  · rfl
  · have h2 := HC.mapsTo_spec hmap _ (hav s) e
    have h3 : Em.testBit (C3.actN t P Q (av s)) = false := hs
    rw [h2] at h3; exact absurd h3 (by decide)

/-- **the enumeration statement from the root job**: `JobOK C sl UB 0` (the root start state: mode 0, empty prefix; e.g. the
native E1 checker's `cov_sound` at key 0) gives `EnumOK C sl UB` (every `x` below the caps completes the root start state) -/
theorem enumOK_of_job0 {C : E1G.Ctx} {sl : ℕ → ℕ} {UB : ℕ} (h : E1GS.JobOK C sl UB 0) : EnumOK C sl UB := by
  intro x hglob hslot hxub hx0
  apply h x hglob hslot hxub hx0
  unfold E1GS.StartOK
  simp only [Nat.zero_div, Nat.zero_mod]
  rw [if_neg (by omega)]
  refine ⟨fun l => by simp [E1GS.multR], fun l hl => by omega, fun l _ => by simp [E1GS.multR], fun l hl => ?_⟩
  simp only [E1GS.multR, Nat.zero_add, Nat.sub_zero]
  exact hxub l hl

end L479

#print axioms L479.capG_transport
#print axioms L479.enumOK_of_job0
#print axioms L479.factN_transport
