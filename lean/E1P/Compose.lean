module
public import R22Port.U_d41d8cd98f00
public import E1P.Bridge3
public import E1P.Asm
/-! # Composing chains: a top chain whose frontier records are glued to separately proved search jobs

* `chain_sound_ext`: like `chain_sound`, but a header record may instead be glued to a block of an external list `Js`
  whose start states `x` cannot complete (each job's own chain theorem, e.g. `E1P.J2900.no_start`).
* `glueChkX`: the Bool check, with witness `w < Ss.length` meaning block `w` of the chain and `w = Ss.length + k` meaning
  job `k`.
* `e1_sound_ext`: E1 for one coset IP from a top chain (first block the root) and the jobs' chain theorems. -/
@[expose] public section
set_option maxRecDepth 20000
namespace E1PS
open Finset RootSound Matrix

theorem chain_sound_ext (C : E1P.Ctx) (sl : ℕ → ℕ) (UB UBR : ℕ) (ub x : ℕ → ℕ) (hg : Glob C x)
    (hsl : ∀ i < 2 ^ 19, SlotV x (sl i)) (hUB : UB = V ub) (hUBR : UBR = VR ub) (hubb : ∀ l < 255, ub l ≤ 2 ^ 32)
    (hxub : ∀ l < 255, x l ≤ ub l) (hx : ∃ l < 255, 0 < x l) (Ss Js : List ℕ)
    (hJ : ∀ k < Js.length, ¬ StartOK x ub (Js.getD k 0))
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true)
    (hglue : ∀ i < Ss.length, ∀ j < E1P.rd 8 (E1P.bS2 (Ss.getD i 0)),
      (∃ i', i < i' ∧ i' < Ss.length ∧ (E1P.glue (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true ∨
        E1P.glue0 (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true)) ∨
      (∃ k < Js.length, E1P.glue (recOf (Ss.getD i 0) j) (Js.getD k 0) = true ∨
        E1P.glue0 (recOf (Ss.getD i 0) j) (Js.getD k 0) = true)) :
    ∀ i < Ss.length, ¬ StartOK x ub (Ss.getD i 0) := by
  suffices hk : ∀ k, ∀ i < Ss.length, Ss.length - i ≤ k → ¬ StartOK x ub (Ss.getD i 0) from
    fun i hi => hk Ss.length i hi (by omega)
  intro k
  induction k with
  | zero => intro i hi hk; omega
  | succ k ih =>
    intro i hi hk hs
    obtain ⟨j, hj⟩ := block_sound C sl UB UBR ub x hg hsl hUB hUBR hubb hxub _ (hblk i hi) hs
    by_cases hjn : j < E1P.rd 8 (E1P.bS2 (Ss.getD i 0))
    · rcases hglue i hi j hjn with ⟨i', hii', hi', hgl⟩ | ⟨k', hk', hgl⟩
      · rcases hgl with hgl | hgl
        · exact ih i' hi' (by omega) (glue_start x ub _ _ hgl hj)
        · exact ih i' hi' (by omega) (glue0_start x ub hxub _ _ hgl hj)
      · rcases hgl with hgl | hgl
        · exact hJ k' hk' (glue_start x ub _ _ hgl hj)
        · exact hJ k' hk' (glue0_start x ub hxub _ _ hgl hj)
    · rw [hdr_rec _ j (by omega)] at hj
      exact recV_zero x hx hj

/-- record `j` of block `i` is glued to `w`: a later block of the chain (`w < |Ss|`) or job `w - |Ss|` -/
noncomputable def glue1X (Ss Js : List ℕ) (i j w : ℕ) : Bool :=
  cond (Nat.blt w Ss.length) (glue1 Ss i j w)
    (Nat.blt (w - Ss.length) Js.length &&
      (E1P.glue (recOf (Ss.getD i 0) j) (Js.getD (w - Ss.length) 0) ||
       E1P.glue0 (recOf (Ss.getD i 0) j) (Js.getD (w - Ss.length) 0)))

noncomputable def glueChkX (Ss Js : List ℕ) (W : List (List ℕ)) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i b => b &&
    Nat.rec (motive := fun _ => Bool) true (fun j c => c && glue1X Ss Js i j ((W.getD i []).getD j 0))
      (E1P.rd 8 (E1P.bS2 (Ss.getD i 0)))) Ss.length

theorem glueChkX_spec (Ss Js : List ℕ) (W : List (List ℕ)) (h : glueChkX Ss Js W = true) :
    ∀ i < Ss.length, ∀ j < E1P.rd 8 (E1P.bS2 (Ss.getD i 0)),
      (∃ i', i < i' ∧ i' < Ss.length ∧ (E1P.glue (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true ∨
        E1P.glue0 (recOf (Ss.getD i 0) j) (Ss.getD i' 0) = true)) ∨
      (∃ k < Js.length, E1P.glue (recOf (Ss.getD i 0) j) (Js.getD k 0) = true ∨
        E1P.glue0 (recOf (Ss.getD i 0) j) (Js.getD k 0) = true) := by
  have hrows : ∀ i < Ss.length, Nat.rec (motive := fun _ => Bool) true
      (fun j c => c && glue1X Ss Js i j ((W.getD i []).getD j 0)) (E1P.rd 8 (E1P.bS2 (Ss.getD i 0))) = true := by
    unfold glueChkX at h
    generalize Ss.length = L at h
    intro i hi
    induction L with
    | zero => omega
    | succ L ih =>
      have h' := h
      simp only [Bool.and_eq_true] at h'
      rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
      · exact ih h'.1 hlt
      · exact h'.2
  intro i hi j hj
  have hr := hrows i hi
  generalize E1P.rd 8 (E1P.bS2 (Ss.getD i 0)) = K at hr hj
  induction K with
  | zero => omega
  | succ K ih =>
    have h' := hr
    simp only [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hj with hlt | rfl
    · exact ih h'.1 hlt
    · have hw := h'.2
      unfold glue1X at hw
      generalize (W.getD i []).getD j 0 = w at hw
      cases hb : Nat.blt w Ss.length
      · rw [hb, cond_false] at hw
        simp only [Bool.and_eq_true, Bool.or_eq_true, Nat.blt_eq] at hw
        exact Or.inr ⟨w - Ss.length, hw.1, hw.2⟩
      · rw [hb, cond_true] at hw
        exact Or.inl ⟨w, glue1_spec Ss i j w hw⟩

/-- the shape of a search job's chain theorem (e.g. `E1P.J2900.no_start`) -/
def JobOK (C : E1P.Ctx) (sl : ℕ → ℕ) (UB : ℕ) (S : ℕ) : Prop :=
  ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 19, SlotV x (sl i)) → (∀ l < 255, x l ≤ E1P.fld UB l) → (∃ l < 255, 0 < x l) →
    ¬ StartOK x (fun l => E1P.fld UB l) S

/-- **E1 for one coset IP, composed**: a top chain from the root, and search jobs with their own chain theorems. -/
theorem e1_sound_ext (C : E1P.Ctx) (Em LB LBR UB UBR Ntab nrows : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPOK C Em LB LBR UB UBR Ntab nrows sl tab GE)
    (hrow : ∀ i < Ntab, RT.Fact (RT.dualM (tab i)) (C.R - RT.eCap (tab i)))
    (Ss Js : List ℕ) (W : List (List ℕ)) (hne : 0 < Ss.length) (hroot : Ss.getD 0 0 % 2 ^ 14 = 0)
    (hblk : ∀ i < Ss.length, E1P.block C sl UB UBR (Ss.getD i 0) = true) (hgl : glueChkX Ss Js W = true)
    (hjobs : ∀ k < Js.length, JobOK C sl UB (Js.getD k 0)) :
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
    apply chain_sound_ext C sl UB UBR (fun l => E1P.fld UB l) x hglob hslot h.UB_eq h.UBR_eq h.UB_le hxub hx0 Ss Js
      (fun k hk => hjobs k hk x hglob hslot hxub hx0) hblk (glueChkX_spec Ss Js W hgl) 0 hne
    have h0 : Ss.getD 0 0 % 2 = 0 := by
      have := Nat.mod_mod_of_dvd (Ss.getD 0 0) (show 2 ∣ 2 ^ 14 by norm_num); rw [hroot] at this; omega
    have hd0 : Ss.getD 0 0 / 2 % 2 ^ 5 = 0 := by
      have a := mod_div_mod (Ss.getD 0 0) 14 1 5 (by omega)
      rw [hroot] at a; simpa using a.symm
    have hp0 : Ss.getD 0 0 / 2 ^ 6 % 2 ^ 8 = 0 := by
      have a := mod_div_mod (Ss.getD 0 0) 14 6 8 (by omega)
      rw [hroot] at a; simpa using a.symm
    unfold StartOK
    rw [hd0, hp0, if_neg (by omega)]
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

end E1PS
