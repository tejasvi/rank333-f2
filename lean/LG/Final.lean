module
public import R22Port.U_d41d8cd98f00
public import LG.Gen
/-! # `HC.L479II`, `HC.cLBII`, `HC.classFactsII` (the forms agreed with hcls and R3, spec rev 6a)

* `HC.L479II`: in case (II) the class-479 line `K_479 = {0, 1, 10, 11}` holds at most one first factor.
* `L479.l479II_of`: `HC.L479II` from the l479cw IP's facts (`IPL`), its enumeration (`EnumOK`), the external leaves'
  refutations, the 22-term capacity table and RR's bound 22 for `K_495 = {0}`.
* `HC.classFactsII_of`: the case-(II) class facts with class 479 raised to 21.

Both are instances of the parametric glue (`LG/Gen.lean`): `E = K_479`, `R = 20`, `lo = 14` (`IPL.toIPG`; the external
leaves through `leafNoExt_of_nd` / `leafNoExt_of_noLift3`; `L479.capG_of`, `L479.classFactsG_of`). The statements are
unchanged. -/
@[expose] public section
namespace HC
open RootSound Finset

/-- **L479 in case (II)** -/
def L479II : Prop :=
  ∀ A : R3RT.Spec.Dec22, KD.CaseII A →
    21 ≤ (univ.filter (fun s => (RT.kM RT.K3eD_Cls.CL 479).testBit (A.av s) = false)).card

/-- the case-(II) class bounds: class 479 at 21 -/
def cLBII (c : ℕ) : ℕ := if c = 479 then 21 else RT.cLB RT.K3eD_Cls.CL c

/-- the case-(II) class bounds are the generic ones at class 479, `R = 20` -/
theorem cLBII_eq : cLBII = L479.cLBG 479 20 := by funext c; rfl

/-- **the case-(II) class facts** (an instance of `L479.classFactsG_of`) -/
theorem classFactsII_of (hL : L479II)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK 14 22) cLBII := by
  rw [cLBII_eq]
  exact L479.classFactsG_of 479 20 14 22 (fun A hA => hL A hA) hclsN

end HC

namespace L479
open RootSound Finset E1GS

theorem rk1cnt479 : rk1cnt (RT.kM RT.K3eD_Cls.CL 479) = 1 := by unfold rk1cnt; decide +kernel

/-- **the L479 IP facts are an instance of the generic ones** (`E = K_479`, `R = 20`, the case row at `lo = 14`) -/
theorem IPL.toIPG {C : E1G.Ctx} {Em LB LBR UB Ntab nrows i2 : ℕ} {sl tab : ℕ → ℕ} {GE : ℕ → Bool × ℕ × ℕ}
    (h : IPL C Em LB LBR UB Ntab nrows i2 sl tab GE) : IPG C RT.K3eD_Cls.CL Em 14 LB LBR UB Ntab nrows i2 sl tab GE where
  N_le := h.N_le
  R_le := by rw [h.R_eq]; decide
  R_pos := by rw [h.R_eq]; decide
  DOM_lt := h.DOM_lt
  cosets := h.cosets
  domperp := h.domperp
  planes := h.planes
  planesR := h.planesR
  sl_spec := fun i hi => by rw [h.R_eq]; exact h.sl_spec i hi
  cls_lt := h.cls_lt
  Ntab_le := h.Ntab_le
  i2_lt := h.i2_lt
  c2 := Or.inr ⟨by rw [h.R_eq, h.c2_cap, h.Em_eq, rk1cnt479], h.c2_rev, h.c2_lt, h.c2_mask⟩
  sl_zero := h.sl_zero
  capslot := h.capslot
  grp := h.grp

/-- **a `NoLift3` leaf is refuted** for `E = K_479` and 20 outside terms (`lift_bridge`): a decomposition of the induction has
exactly two first factors on `E`, distinct and nonzero -/
theorem leafNoExt_of_noLift3 {C : E1G.Ctx} {Em lo pl : ℕ} (hN : C.N ≤ 127) (hR : C.R = 20) (hC : Cosets Em C.VT C.N)
    (hD : DomPerp C.DOM Em) (hDOM : C.DOM < 2 ^ 512) (hEm : Em = RT.kM RT.K3eD_Cls.CL 479)
    (hnl : NoLift3 (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
      (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0))) : LeafNoExt C Em lo pl := by
  intro av b c hom hx
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR'⟩ := hom
  have hE : ∀ a < 512, Em.testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) := by rw [hEm]; exact kM479_bit
  have hin2 : (Finset.univ.filter (fun s : Fin 22 => Em.testBit (av s) = true)).card = 2 := by
    have := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset (Fin 22)))
      (fun s : Fin 22 => Em.testBit (av s) = true)
    simp only [Bool.not_eq_true, Finset.card_univ, Fintype.card_fin] at this
    omega
  obtain ⟨u0, u1, hu, hpair⟩ := Finset.card_eq_two.mp hin2
  have hmem : ∀ s, Em.testBit (av s) = true ↔ s = u0 ∨ s = u1 := by
    intro s
    have := congrArg (fun S => s ∈ S) hpair
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_insert, Finset.mem_singleton, eq_iff_iff] at this
    exact this
  exact lift_bridge C.VT C.N Em C.DOM C.R hN (by omega) hC hD hDOM hE av b c hav hd hbc u0 u1 hu
    ((hmem u0).mpr (Or.inl rfl)) ((hmem u1).mpr (Or.inr rfl)) (hnz u0) (hnz u1) (fun e => hu (hinj e))
    (fun s hs => (hmem s).mp hs) pl 0 hx hnl

/-- **`HC.L479II` from the enumeration and the leaf certificates** (an instance of `L479.capG_of`) -/
theorem l479II_of (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPL C Em LB LBR UB Ntab nrows i2 sl tab GE) (henum : EnumOK C sl UB)
    (hext : ∀ pl ∈ C.EXT,
      S5.NoDecomp (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
        (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)) ∨
      NoLift3 (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
        (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)))
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c))
    (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) : HC.L479II := by
  have hext' : ∀ pl ∈ C.EXT, LeafNoExt C Em 14 pl := by
    intro pl hpl
    rcases hext pl hpl with hnd | hnl
    · exact leafNoExt_of_nd h.N_le (by rw [h.R_eq]; decide) h.cosets h.domperp h.DOM_lt hnd
    · exact leafNoExt_of_noLift3 h.N_le h.R_eq h.cosets h.domperp h.DOM_lt h.Em_eq hnl
  have hbase : RT.FactN 22 Em C.R := by
    have h20 := hclsN 479 (by norm_num)
    rw [cLB479, ← h.Em_eq, ← h.R_eq] at h20
    exact h20
  have hcap := capG_of C RT.K3eD_Cls.CL Em 14 LB LBR UB Ntab nrows i2 sl tab GE h.toIPG henum hext' hclsN hbase h495
  intro A hII
  have := hcap A hII
  rw [h.R_eq, h.Em_eq] at this
  exact this

/-- **`HC.L479II`, W variant**: the IP keeps the two W-type rows at cap 9 (Lemma W(a) as the named hypothesis `hW`) -/
theorem l479II_ofW (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 iw0 iw1 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPLW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE) (henum : EnumOK C sl UB) (hext : ExtOK C)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c))
    (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) (hW : WaFact) : HC.L479II := by
  intro A hII
  by_contra hlt
  push Not at hlt
  have h20 := hclsN 479 (by norm_num) A.av A.b A.c A.lt A.ne A.inj A.dec
  rw [cLB479] at h20
  apply coreW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE h henum hext hclsN hW A.av A.b A.c
  refine ⟨A.lt, A.ne, A.inj, A.dec, dec_nz h495 A, hII, ?_⟩
  rw [h.Em_eq]
  omega

end L479

#print axioms L479.l479II_ofW
#print axioms L479.lift_bridge
#print axioms L479.core
#print axioms L479.l479II_of
#print axioms HC.classFactsII_of
