module
public import R22Port.U_874064cbf360
public import RG.Job
public import E1N.Item
public import E1G.Compose
/-! # Items: the refinement of `E1N.item` and the root composition

* `item_ref`: `E1N.item D k s = true → (∀ c ∈ keyExt k, JobOK C sl UB c) → JobOK C sl UB (keyS k)` (infra R3);
* `checked_step`: the same for `E1N.Checked D k`, the `step` of `R22N.covG_sound` with `root := keyS`, `kids := keyExt`;
* `e1_sound_job`: `JobOK C sl UB 0` (the root start state: mode 0, empty prefix) gives the IP's E1 conclusion.  It is
  `E1GS.e1_sound_ext` (hcls/E1G/Compose.lean, md5 af511efc5fac0ce759ac3495710973ec) with its top chain replaced by the
  root item's `JobOK`: the same orbit argument, and at the canonical point the root's `JobOK` instead of `chain_sound_ext`. -/
@[expose] public section
set_option maxRecDepth 20000
namespace E1NRG
open E1N E1GS Finset RootSound Matrix

variable {D : IPD} {C : E1G.Ctx} {sl : ℕ → ℕ} {UB UBR : ℕ}

theorem keyExt_getD (k j : ℕ) (hj : j < (E1N.keyExt k).toArray.size) :
    (E1N.keyExt k).toArray.getD j 0 ∈ E1N.keyExt k := by
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hj, Option.getD_some, List.getElem_toArray]
  exact List.getElem_mem _

/-- **an item**: accepted, with every external child `JobOK`, gives `JobOK` of its start key -/
theorem item_ref (hD : IPRel D C sl UB UBR) (k : ℕ) (s : String) (h : E1N.item D k s = true)
    (hk : ∀ c ∈ E1N.keyExt k, JobOK C sl UB c) : JobOK C sl UB (E1N.keyS k) :=
  jobB_ref hD (E1N.keyS k) (E1N.keyExt k).toArray (E1N.dec7 s) h (fun j hj => hk _ (keyExt_getD k j hj))

/-- the `step` of `R22N.covG_sound` for `E1N.Checked D` (`root := keyS`, `kids := keyExt`, `P := JobOK C sl UB`) -/
theorem checked_step (hD : IPRel D C sl UB UBR) :
    ∀ k, E1N.Checked D k → (∀ c ∈ E1N.keyExt k, JobOK C sl UB c) → JobOK C sl UB (E1N.keyS k) :=
  fun k ⟨s, hs⟩ hk => item_ref hD k s hs hk

theorem keyExtW_getD (W k j : ℕ) (hj : j < (E1N.keyExtW W k).toArray.size) :
    (E1N.keyExtW W k).toArray.getD j 0 ∈ E1N.keyExtW W k := by
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hj, Option.getD_some, List.getElem_toArray]
  exact List.getElem_mem _

/-- **an item with `W`-bit start keys** (mode-0 or mode-1 starts and children) -/
theorem item_refW (hD : IPRel D C sl UB UBR) (W k : ℕ) (s : String) (h : E1N.itemW D W k s = true)
    (hk : ∀ c ∈ E1N.keyExtW W k, JobOK C sl UB c) : JobOK C sl UB (E1N.keySW W k) :=
  jobB_ref hD (E1N.keySW W k) (E1N.keyExtW W k).toArray (E1N.dec7 s) h (fun j hj => hk _ (keyExtW_getD W k j hj))

/-- the `step` of `R22N.covG_sound` for `E1N.CheckedW D W` (`root := keySW W`, `kids := keyExtW W`) -/
theorem checked_stepW (hD : IPRel D C sl UB UBR) (W : ℕ) :
    ∀ k, E1N.CheckedW D W k → (∀ c ∈ E1N.keyExtW W k, JobOK C sl UB c) → JobOK C sl UB (E1N.keySW W k) :=
  fun k ⟨s, hs⟩ hk => item_refW hD W k s hs hk

/-- **E1 for one coset IP from the root item's `JobOK`** -/
theorem e1_sound_job (C : E1G.Ctx) (Em LB LBR UB UBR Ntab nrows : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPOK C Em LB LBR UB UBR Ntab nrows sl tab GE)
    (hrow : ∀ i < Ntab, RT.Fact (RT.dualM (tab i)) (C.R - RT.eCap (tab i)))
    (hext : ∀ pl ∈ C.EXT, S5.NoDecomp (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
      (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)))
    (hjob : JobOK C sl UB 0) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c →
      (∀ s, b s ≠ 0 ∧ c s ≠ 0) → (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R → False := by
  -- the same orbit argument as `e1_sound`, with `chain_sound_ext` at the canonical point
  have hN := h.N_le
  suffices key : ∀ m, ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) →
      IsDecomp (fun s => toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R →
      2 ^ 16256 - VR (xOf av Em C.VT C.N) = m → False from
    fun n av b c hav hd hbc hR => key _ n av b c hav hd hbc hR rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro n av b c hav hd hbc hR hm
  set x := xOf av Em C.VT C.N with hxdef
  have hsum : ∑ l ∈ range 127, x l = C.R := by rw [hxdef, sum_xOf av Em C.VT C.N hN h.cosets hav, hR]
  have hxle : ∀ l < 127, x l ≤ C.R := by
    intro l hl
    rw [← hsum]; exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_range.mpr hl)
  have hxb : ∀ l < 127, x l < 2 ^ 128 := fun l hl => lt_of_le_of_lt (hxle l hl) (by have := h.R_le; omega)
  by_cases hcan : ∀ g < 2048, ¬ (VR x < VR (push (C.GP g) x))
  · have hslot : ∀ i < 2 ^ 15, SlotV x (sl i) := by
      intro i hi
      by_cases hiN : i < Ntab
      · obtain ⟨e1, e2⟩ := h.sl_spec i hiN
        rw [e1]
        exact slot_valid LB LBR C.VT C.N Em C.DOM C.R hN h.planes h.planesR h.cosets h.domperp (tab i) (hrow i hiN) e2
          av b c hav hd hR
      · rw [h.sl_zero i (by omega) hi]; exact slotV_zero x
    have hxub : ∀ l < 127, x l ≤ E1G.fld UB l := by
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
        leafOK_bridge C Em hN h.R_le h.cosets h.domperp h.DOM_lt hext av b c hav hd hbc hR pl cert hx hleaf
      canon := hcan
      gp := fun g hg l hl => ((h.grp g hg).lab l hl).1 }
    have hx0 : ∃ l < 127, 0 < x l := by
      by_contra hc
      push_neg at hc
      have : ∑ l ∈ range 127, x l = 0 := Finset.sum_eq_zero (fun l hl => by
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
    have hbound : VR (push (C.GP g) x) < 2 ^ 16256 := by
      apply VR_lt; intro l hl
      have : push (C.GP g) x l ≤ ∑ j ∈ range 127, x j := by
        unfold push; apply Finset.sum_le_sum; intro j _; split
        · exact le_rfl
        · exact Nat.zero_le _
      have := h.R_le; omega
    have hVx : VR x < 2 ^ 16256 := VR_lt x hxb
    exact ih (2 ^ 16256 - VR (push (C.GP g) x)) (by omega) n _ b' c' hav' hd' hbc' hR' (by rw [hx'])

end E1NRG
