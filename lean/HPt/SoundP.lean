module
public import R22Port.U_d41d8cd98f00
public import E1P.Compose
/-! # E1 for an E1P coset IP from the canonical-point statement (hpt)

`e1_sound_enum`: `IPOK`, the rows and the canonical-point statement (`∀ x, Glob C x → slots → x ≤ UB → x ≠ 0 → False`, the
conclusion of a root level glued to its jobs, `E1PS.enum_of_chain_w`) give the IP's E1 conclusion.  `e1_sound_job` is a
verbatim copy of the native E1 agent's E1P `E1NR.e1_sound_job` (`r22/lean/native/e1/R/Item.lean`), itself
`E1PS.e1_sound_ext` (hcls/E1P/Compose.lean) with the top chain replaced by the root's `JobOK`. -/
@[expose] public section
set_option maxRecDepth 20000
namespace HPt
open E1PS Finset RootSound Matrix

/-- **E1 for one coset IP from the root item's `JobOK`** -/
theorem e1_sound_job (C : E1P.Ctx) (Em LB LBR UB UBR Ntab nrows : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPOK C Em LB LBR UB UBR Ntab nrows sl tab GE)
    (hrow : ∀ i < Ntab, RT.Fact (RT.dualM (tab i)) (C.R - RT.eCap (tab i)))
    (hjob : JobOK C sl UB 0) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c →
      (∀ s, b s ≠ 0 ∧ c s ≠ 0) → (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R → False := by
  -- the same orbit argument as `e1_sound`, with `chain_sound_ext` at the canonical point
  have hN := h.N_le
  suffices key : ∀ m, ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) →
      IsDecomp (fun s => toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R →
      2 ^ 65280 - VR (xOf av Em C.VT C.N) = m → False from
    fun n av b c hav hd hbc hR => key _ n av b c hav hd hbc hR rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro n av b c hav hd hbc hR hm
  set x := xOf av Em C.VT C.N with hxdef
  have hsum : ∑ l ∈ range 255, x l = C.R := by rw [hxdef, sum_xOf av Em C.VT C.N hN h.cosets hav, hR]
  have hxle : ∀ l < 255, x l ≤ C.R := by
    intro l hl
    rw [← hsum]; exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_range.mpr hl)
  have hxb : ∀ l < 255, x l < 2 ^ 256 := fun l hl => lt_of_le_of_lt (hxle l hl) (by have := h.R_le; omega)
  by_cases hcan : ∀ g < 2048, ¬ (VR x < VR (push (C.GP g) x))
  · have hslot : ∀ i < 2 ^ 19, SlotV x (sl i) := by
      intro i hi
      by_cases hiN : i < Ntab
      · obtain ⟨e1, e2⟩ := h.sl_spec i hiN
        rw [e1]
        exact slot_valid LB LBR C.VT C.N Em C.DOM C.R hN h.planes h.planesR h.cosets h.domperp (tab i) (hrow i hiN) e2
          av b c hav hd hR
      · rw [h.sl_zero i (by omega) hi]; exact slotV_zero x
    have hxub : ∀ l < 255, x l ≤ E1P.fld UB l := by
      intro l hl
      by_cases hlN : l < C.N
      · obtain ⟨h1, h2, h3⟩ := h.capslot l hlN
        have := (hslot (nrows + l) (by have := h.Ntab_le; omega)).1
        rw [h3, msum_cap x _ l C.N hN hlN (fun j hj => xOf_ge _ _ _ _ _ hj) h2] at this
        exact this
      · rw [hxdef, xOf_ge _ _ _ _ _ (by omega)]; exact Nat.zero_le _
    have hglob : Glob C x := {
      N_le := hN
      R_le := h.R_le
      xN := fun l hl => xOf_ge _ _ _ _ _ hl
      xR := hsum
      leaf := fun pl cert hx hleaf =>
        leaf_bridge C.VT C.N Em C.DOM C.R hN h.R_le h.cosets h.domperp h.DOM_lt av b c hav hd hbc hR pl cert hx hleaf
      canon := hcan
      gp := fun g hg l hl => ((h.grp g hg).lab l hl).1 }
    have hx0 : ∃ l < 255, 0 < x l := by
      by_contra hc
      push_neg at hc
      have : ∑ l ∈ range 255, x l = 0 := Finset.sum_eq_zero (fun l hl => by
        have := hc l (Finset.mem_range.mp hl); omega)
      have := h.R_pos; omega
    apply hjob x hglob hslot hxub hx0
    unfold StartOK
    simp only [Nat.zero_div, Nat.zero_mod]
    rw [if_neg (by omega)]
    refine ⟨fun l => by simp [multR], fun l hl => by omega, fun l _ => by simp [multR], fun l hl => ?_⟩
    simp only [multR, Nat.zero_add, Nat.sub_zero]
    exact hxub l hl
  · push_neg at hcan
    obtain ⟨g, hg16, hlt⟩ := hcan
    have hG := h.grp g hg16
    obtain ⟨b', c', hd', hbc'⟩ := isDecomp_actN_nz hd hbc (t := (GE g).1) hG.glP hG.glQ
    have hav' : ∀ s, C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s) < 512 := fun s => C3.actN_lt _ _ _ _
    have hR' : (univ.filter (fun s : Fin n => Em.testBit (C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s)) = false)).card = C.R := by
      rw [← hR]; apply congrArg Finset.card; apply Finset.filter_congr; intro s _; rw [hG.fixE _ (hav s)]
    have hx' : VR (xOf (fun s => C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s)) Em C.VT C.N) = VR (push (C.GP g) x) :=
      VR_congr _ _ (fun l hl => xOf_act hN h.cosets hG av hav l hl)
    have hbound : VR (push (C.GP g) x) < 2 ^ 65280 := by
      apply VR_lt; intro l hl
      have : push (C.GP g) x l ≤ ∑ j ∈ range 255, x j := by
        unfold push; apply Finset.sum_le_sum; intro j _; split
        · exact le_rfl
        · exact Nat.zero_le _
      have := h.R_le; omega
    have hVx : VR x < 2 ^ 65280 := VR_lt x hxb
    exact ih (2 ^ 65280 - VR (push (C.GP g) x)) (by omega) n _ b' c' hav' hd' hbc' hR' (by rw [hx'])


/-- **E1 for one coset IP from the canonical-point statement** (`EnumOK`-shape, the conclusion of a root level glued to its jobs) -/
theorem e1_sound_enum (C : E1P.Ctx) (Em LB LBR UB UBR Ntab nrows : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPOK C Em LB LBR UB UBR Ntab nrows sl tab GE)
    (hrow : ∀ i < Ntab, RT.Fact (RT.dualM (tab i)) (C.R - RT.eCap (tab i)))
    (hen : ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 19, SlotV x (sl i)) → (∀ l < 255, x l ≤ E1P.fld UB l) →
      (∃ l < 255, 0 < x l) → False) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c →
      (∀ s, b s ≠ 0 ∧ c s ≠ 0) → (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R → False := by
  -- the same orbit argument as `e1_sound`, with `chain_sound_ext` at the canonical point
  have hN := h.N_le
  suffices key : ∀ m, ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) →
      IsDecomp (fun s => toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R →
      2 ^ 65280 - VR (xOf av Em C.VT C.N) = m → False from
    fun n av b c hav hd hbc hR => key _ n av b c hav hd hbc hR rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro n av b c hav hd hbc hR hm
  set x := xOf av Em C.VT C.N with hxdef
  have hsum : ∑ l ∈ range 255, x l = C.R := by rw [hxdef, sum_xOf av Em C.VT C.N hN h.cosets hav, hR]
  have hxle : ∀ l < 255, x l ≤ C.R := by
    intro l hl
    rw [← hsum]; exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_range.mpr hl)
  have hxb : ∀ l < 255, x l < 2 ^ 256 := fun l hl => lt_of_le_of_lt (hxle l hl) (by have := h.R_le; omega)
  by_cases hcan : ∀ g < 2048, ¬ (VR x < VR (push (C.GP g) x))
  · have hslot : ∀ i < 2 ^ 19, SlotV x (sl i) := by
      intro i hi
      by_cases hiN : i < Ntab
      · obtain ⟨e1, e2⟩ := h.sl_spec i hiN
        rw [e1]
        exact slot_valid LB LBR C.VT C.N Em C.DOM C.R hN h.planes h.planesR h.cosets h.domperp (tab i) (hrow i hiN) e2
          av b c hav hd hR
      · rw [h.sl_zero i (by omega) hi]; exact slotV_zero x
    have hxub : ∀ l < 255, x l ≤ E1P.fld UB l := by
      intro l hl
      by_cases hlN : l < C.N
      · obtain ⟨h1, h2, h3⟩ := h.capslot l hlN
        have := (hslot (nrows + l) (by have := h.Ntab_le; omega)).1
        rw [h3, msum_cap x _ l C.N hN hlN (fun j hj => xOf_ge _ _ _ _ _ hj) h2] at this
        exact this
      · rw [hxdef, xOf_ge _ _ _ _ _ (by omega)]; exact Nat.zero_le _
    have hglob : Glob C x := {
      N_le := hN
      R_le := h.R_le
      xN := fun l hl => xOf_ge _ _ _ _ _ hl
      xR := hsum
      leaf := fun pl cert hx hleaf =>
        leaf_bridge C.VT C.N Em C.DOM C.R hN h.R_le h.cosets h.domperp h.DOM_lt av b c hav hd hbc hR pl cert hx hleaf
      canon := hcan
      gp := fun g hg l hl => ((h.grp g hg).lab l hl).1 }
    have hx0 : ∃ l < 255, 0 < x l := by
      by_contra hc
      push_neg at hc
      have : ∑ l ∈ range 255, x l = 0 := Finset.sum_eq_zero (fun l hl => by
        have := hc l (Finset.mem_range.mp hl); omega)
      have := h.R_pos; omega
    exact hen x hglob hslot hxub hx0
  · push_neg at hcan
    obtain ⟨g, hg16, hlt⟩ := hcan
    have hG := h.grp g hg16
    obtain ⟨b', c', hd', hbc'⟩ := isDecomp_actN_nz hd hbc (t := (GE g).1) hG.glP hG.glQ
    have hav' : ∀ s, C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s) < 512 := fun s => C3.actN_lt _ _ _ _
    have hR' : (univ.filter (fun s : Fin n => Em.testBit (C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s)) = false)).card = C.R := by
      rw [← hR]; apply congrArg Finset.card; apply Finset.filter_congr; intro s _; rw [hG.fixE _ (hav s)]
    have hx' : VR (xOf (fun s => C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s)) Em C.VT C.N) = VR (push (C.GP g) x) :=
      VR_congr _ _ (fun l hl => xOf_act hN h.cosets hG av hav l hl)
    have hbound : VR (push (C.GP g) x) < 2 ^ 65280 := by
      apply VR_lt; intro l hl
      have : push (C.GP g) x l ≤ ∑ j ∈ range 255, x j := by
        unfold push; apply Finset.sum_le_sum; intro j _; split
        · exact le_rfl
        · exact Nat.zero_le _
      have := h.R_le; omega
    have hVx : VR x < 2 ^ 65280 := VR_lt x hxb
    exact ih (2 ^ 65280 - VR (push (C.GP g) x)) (by omega) n _ b' c' hav' hd' hbc' hR' (by rw [hx'])

end HPt

#print axioms HPt.e1_sound_job
#print axioms HPt.e1_sound_enum
