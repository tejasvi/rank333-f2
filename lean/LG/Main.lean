module
public import R22Port.U_d41d8cd98f00
public import E1G.Compose
public import LG.Lift
public import LG.Dec
public import S6.LG
public import KD.Canon
public import R3RT.SpecO
/-! # L479 in case (II): a class-479 line holds at most one first factor (the glue)

For the l479cw coset IP of `E = K_479 = {0, 1, 10, 11}` (hcls's E1G chain, 20 terms outside `E`):
* `EnumOK C sl UB`: the canonical-point part of the enumeration (hcls: `chain_sound_ext` and the root's `StartOK`);
* `IPL …`: the per-IP facts checked by `decide` (cosets, planes, the slot table with its RT entries passing `entryOK 20`,
  the case-II slot `i2` (cap 7 on cosets without a rank-1 point), the label caps, the stabilizer elements).
`l479II_of`: from these, the external leaves' refutations (`NoDecomp` or `NoLift3`), the 22-term capacity table `hclsN`
and the class bound 22 of `K_495 = {0}` (RR), **`HC.L479II`**. Proof: a case-(II) `Dec22` with two first factors on `E`
(exactly two: class 479's bound 20) has all terms nonzero and lies in `OmL`; `OmL` is closed under the stabilizer; induction
on how far the multiplicity vector is from its orbit maximum (as `E1GS.e1_sound_ext`); at the canonical point every slot
holds (`slot_valid_cnt` from `entry_soundN2`, `slot_c2` from case II), the leaves are refuted (`E1GS.leaf_bridge`,
`leaf_bridge_nd`, `lift_bridge`), and `EnumOK` gives the contradiction. -/
@[expose] public section
set_option maxRecDepth 20000
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false
set_option exponentiation.threshold 600

namespace L479
open Finset RootSound Matrix E1GS

/-- the canonical-point part of an E1G enumeration -/
def EnumOK (C : E1G.Ctx) (sl : ℕ → ℕ) (UB : ℕ) : Prop :=
  ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 15, SlotV x (sl i)) → (∀ l < 127, x l ≤ E1G.fld UB l) → (∃ l < 127, 0 < x l) → False

/-- the facts of the L479 coset IP that are checked by `decide` -/
structure IPL (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ) : Prop where
  N_le : C.N ≤ 127
  R_eq : C.R = 20
  DOM_lt : C.DOM < 2 ^ 512
  Em_eq : Em = RT.kM RT.K3eD_Cls.CL 479
  cosets : Cosets Em C.VT C.N
  domperp : DomPerp C.DOM Em
  planes : Planes LB C.VT C.N
  planesR : PlanesR LB LBR
  sl_spec : ∀ i < Ntab, sl i = E1G.slot LB LBR (tab i) ∧ E1G.dualIn C.DOM (tab i) = true ∧
    RT.entryOK 20 RT.K3eD_Cls.CL (tab i) = true
  cls_lt : ∀ i < Ntab, RT.eCls (tab i) < 496
  Ntab_le : Ntab ≤ i2
  i2_lt : i2 < 2 ^ 15
  c2_cap : scap (sl i2) = 7
  c2_rev : ∀ j < 127, (smr (sl i2)).testBit j = (smask (sl i2)).testBit (126 - j)
  c2_lt : sl i2 < 2 ^ 264
  c2_mask : ∀ l < C.N, (smask (sl i2)).testBit l = true →
    ∀ e < 512, Em.testBit e = true → BC6s.rk3 (vt C.VT l ^^^ e) ≠ 1
  sl_zero : ∀ i, Ntab ≤ i → i < 2 ^ 15 → i ≠ i2 → sl i = 0
  capslot : ∀ l < C.N, nrows + l < Ntab ∧ (∀ j < C.N, (smask (sl (nrows + l))).testBit j = decide (j = l)) ∧
    scap (sl (nrows + l)) = E1G.fld UB l
  grp : ∀ g < 2048, GElt Em C.VT C.N (C.GP g) (GE g).1 (GE g).2.1 (GE g).2.2

/-! ## Slots -/

/-- **slot validity from the row's count** (the proof of `E1GS.slot_valid`, with the count of terms outside the row given
directly instead of by `RT.Fact`) -/
theorem slot_valid_cnt (LB LBR VT N Em DOM R : ℕ) (hN : N ≤ 127) (hP : Planes LB VT N) (hPR : PlanesR LB LBR)
    (hC : Cosets Em VT N) (hD : DomPerp DOM Em) (e : ℕ) (hin : E1G.dualIn DOM e = true) {n : ℕ} (av : Fin n → ℕ)
    (hav : ∀ s, av s < 512) (hR : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = R)
    (hcnt : R - RT.eCap e ≤ (univ.filter (fun s : Fin n => (RT.dualM e).testBit (av s) = false)).card) :
    SlotV (xOf av Em VT N) (E1G.slot LB LBR e) := by
  have hm := labM_lt LB e
  have hmr := labM_lt LBR e
  have hcap : RT.eCap e < 32 := Nat.mod_lt _ (by norm_num)
  have eslot : E1G.slot LB LBR e = E1G.labM LB e + 2 ^ 127 * (E1G.labM LBR e + 2 ^ 127 * RT.eCap e) := by
    show E1G.labM LB e ||| (E1G.labM LBR e <<< 127 ||| RT.eCap e <<< 254) = _
    have h1 : E1G.labM LBR e <<< 127 ||| RT.eCap e <<< 254 = (E1G.labM LBR e + 2 ^ 127 * RT.eCap e) <<< 127 := by
      rw [show (254 : ℕ) = 127 + 127 from rfl, Nat.shiftLeft_add, ← Nat.shiftLeft_or_distrib, Nat.lor_comm,
        ← Nat.shiftLeft_add_eq_or_of_lt hmr, Nat.shiftLeft_eq (RT.eCap e) 127]
      ring_nf
    rw [h1, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hm, Nat.shiftLeft_eq]; ring
  have hsm : smask (E1G.slot LB LBR e) = E1G.labM LB e := by
    unfold smask; rw [eslot, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hm]
  have hsr : smr (E1G.slot LB LBR e) = E1G.labM LBR e := by
    unfold smr
    rw [eslot, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hm, Nat.zero_add, Nat.add_mul_mod_self_left,
      Nat.mod_eq_of_lt hmr]
  have hsc : scap (E1G.slot LB LBR e) = RT.eCap e := by
    unfold scap
    have e2 : E1G.labM LB e + 2 ^ 127 * (E1G.labM LBR e + 2 ^ 127 * RT.eCap e) =
        (E1G.labM LB e + 2 ^ 127 * E1G.labM LBR e) + 2 ^ 254 * RT.eCap e := by ring
    have hlow : E1G.labM LB e + 2 ^ 127 * E1G.labM LBR e < 2 ^ 254 := by
      have : 2 ^ 127 * E1G.labM LBR e ≤ 2 ^ 127 * (2 ^ 127 - 1) := Nat.mul_le_mul_left _ (by omega)
      have h3 : 2 ^ 127 * (2 ^ 127 - 1) + 2 ^ 127 = (2 : ℕ) ^ 254 := by norm_num
      omega
    rw [eslot, e2, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hlow, Nat.zero_add, Nat.mod_eq_of_lt hcap]
  have hlt : E1G.slot LB LBR e < 2 ^ 264 := by
    rw [eslot]
    have : E1G.labM LBR e + 2 ^ 127 * RT.eCap e < 2 ^ 137 := by
      have : 2 ^ 127 * RT.eCap e ≤ 2 ^ 127 * 31 := Nat.mul_le_mul_left _ (by omega)
      have h3 : (2 : ℕ) ^ 127 + 2 ^ 127 * 31 ≤ 2 ^ 137 := by norm_num
      omega
    have h4 : 2 ^ 127 * (E1G.labM LBR e + 2 ^ 127 * RT.eCap e) ≤ 2 ^ 127 * (2 ^ 137 - 1) := Nat.mul_le_mul_left _ (by omega)
    have h5 : (2 : ℕ) ^ 127 * (2 ^ 137 - 1) + 2 ^ 127 = 2 ^ 264 := by norm_num
    omega
  refine ⟨?_, fun j hj => by rw [hsr, hsm]; exact labM_rev LB LBR e hPR j hj, hlt⟩
  rw [hsm, hsc, msum_xOf av Em VT N _ hN hC hav]
  -- the dual vectors are domain functionals
  have hdom : ∀ k < 9 - RT.eD e, DOM.testBit (RT.eV e (RT.eD e + k)) = true := by
    have h : ∀ m, (Nat.rec (motive := fun _ => Bool) true
        (fun j b => b && Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) j))) m) = true →
        ∀ k < m, DOM.testBit (RT.eV e (RT.eD e + k)) = true := by
      intro m
      induction m with
      | zero => intro _ k hk; omega
      | succ m ih =>
        intro hm k hk
        have hm' : ((Nat.rec (motive := fun _ => Bool) true
          (fun j b => b && Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) j))) m) &&
            Nat.testBit DOM (RT.eV e (Nat.add (RT.eD e) m))) = true := hm
        rw [Bool.and_eq_true] at hm'
        rcases (by omega : k < m ∨ k = m) with h | h
        · exact ih hm'.1 k h
        · subst h; exact hm'.2
    exact h _ hin
  have hfv : ∀ k, RT.eV e (RT.eD e + k) < 512 := fun k => Nat.mod_lt _ (by norm_num)
  have hU : ∀ w < 512, (RT.dualM e).testBit w = true ↔
      ∀ k < 9 - RT.eD e, BC5.par (w &&& RT.eV e (RT.eD e + k)) = false :=
    fun w hw => RT.kerM_testBit (fun k => RT.eV e (RT.eD e + k)) hfv (9 - RT.eD e) w hw
  have hEU : ∀ a < 512, Em.testBit a = true → (RT.dualM e).testBit a = true := by
    intro a ha hE
    rw [hU a ha]
    intro k hk
    exact hD _ (hfv k) (hdom k hk) a ha hE
  have hinv : ∀ a < 512, ∀ w < 512, Em.testBit (a ^^^ w) = true →
      ((RT.dualM e).testBit a = true ↔ (RT.dualM e).testBit w = true) := by
    intro a ha w hw hE
    rw [hU a ha, hU w hw]
    constructor
    · intro h k hk; rw [← par_coset hD _ (hfv k) (hdom k hk) a w ha hw hE]; exact h k hk
    · intro h k hk; rw [par_coset hD _ (hfv k) (hdom k hk) a w ha hw hE]; exact h k hk
  have hset : (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ ∃ l < N, (E1G.labM LB e).testBit l = true ∧
      Em.testBit (av s ^^^ vt VT l) = true)) =
      univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ (RT.dualM e).testBit (av s) = true) := by
    apply Finset.filter_congr
    intro s _
    constructor
    · rintro ⟨h0, l, hl, hM, hE⟩
      refine ⟨h0, (hinv (av s) (hav s) (vt VT l) (vt_lt VT l) hE).mpr ?_⟩
      rwa [labM_testBit LB VT N e hP l hl hN] at hM
    · rintro ⟨h0, hu⟩
      obtain ⟨l, hl, hE⟩ := hC.cover (av s) (hav s) h0
      refine ⟨h0, l, hl, ?_, hE⟩
      rw [labM_testBit LB VT N e hP l hl hN]
      exact (hinv (av s) (hav s) (vt VT l) (vt_lt VT l) hE).mp hu
  rw [hset]
  -- count: outside `E` = (outside `E`, inside `U`) + outside `U`
  have hsplit : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card =
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ (RT.dualM e).testBit (av s) = true)).card +
      (univ.filter (fun s : Fin n => (RT.dualM e).testBit (av s) = false)).card := by
    rw [← Finset.card_union_of_disjoint]
    · apply congrArg Finset.card
      ext s
      simp only [mem_filter, mem_univ, true_and, mem_union]
      constructor
      · intro h0
        cases hu : (RT.dualM e).testBit (av s)
        · exact Or.inr rfl
        · exact Or.inl ⟨h0, rfl⟩
      · rintro (⟨h0, _⟩ | hu)
        · exact h0
        · cases h0 : Em.testBit (av s)
          · rfl
          · rw [hEU (av s) (hav s) h0] at hu; exact absurd hu (by simp)
    · rw [Finset.disjoint_filter]
      intro s _ h1 h2; rw [h1.2] at h2; exact absurd h2 (by simp)
  omega



theorem kM479_bit : ∀ a < 512, (RT.kM RT.K3eD_Cls.CL 479).testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) := by
  decide +kernel

theorem cLB479 : RT.cLB RT.K3eD_Cls.CL 479 = 20 := by decide +kernel

/-- the only rank-1 point of `E` is `1` -/
theorem rk_one_E : ∀ a < 512, (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) → BC6s.rk3 a = 1 → a = 1 := by decide +kernel

/-- **the case-II slot**: at most 7 of the 20 outside first factors lie in cosets without a rank-1 point -/
theorem slot_c2 (VT N Em : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N)
    (hE : ∀ a < 512, Em.testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11))
    (av : Fin 22 → ℕ) (hav : ∀ s, av s < 512) (hinj : Function.Injective av)
    (hR : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false)).card = 20)
    (hII : 14 ≤ (univ.filter (fun s => (toM3 (av s)).rank = 1)).card)
    (v : ℕ) (hcap : scap v = 7) (hrev : ∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j)) (hlt : v < 2 ^ 264)
    (hmask : ∀ l < N, (smask v).testBit l = true → ∀ e < 512, Em.testBit e = true → BC6s.rk3 (vt VT l ^^^ e) ≠ 1) :
    SlotV (xOf av Em VT N) v := by
  classical
  refine ⟨?_, hrev, hlt⟩
  rw [hcap, msum_xOf av Em VT N (smask v) hN hC hav]
  have hrk : ∀ s, BC6s.rk3 (av s) = (toM3 (av s)).rank := fun s => S6.rk3_rank (av s) (hav s)
  -- the set counted by the slot has no rank-1 member
  have hsub : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false ∧ ∃ l < N, (smask v).testBit l = true ∧
      Em.testBit (av s ^^^ vt VT l) = true)) ⊆
      univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank ≠ 1) := by
    intro s hs
    simp only [mem_filter, mem_univ, true_and] at hs ⊢
    obtain ⟨h0, l, hl, hm, hE'⟩ := hs
    refine ⟨h0, ?_⟩
    have hne := hmask l hl hm (av s ^^^ vt VT l) (RootSound.TransBits.xor_lt _ _ (hav s) (vt_lt VT l)) hE'
    rw [show vt VT l ^^^ (av s ^^^ vt VT l) = av s by
      rw [Nat.xor_comm (av s), ← Nat.xor_assoc, Nat.xor_self, Nat.zero_xor], hrk] at hne
    exact hne
  -- at most one inside first factor has rank 1
  have hin1 : (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = 1)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro s hs t ht
    simp only [mem_filter, mem_univ, true_and] at hs ht
    have e1 := rk_one_E (av s) (hav s) ((hE _ (hav s)).mp hs.1) (by rw [hrk]; exact hs.2)
    have e2 := rk_one_E (av t) (hav t) ((hE _ (hav t)).mp ht.1) (by rw [hrk]; exact ht.2)
    exact hinj (e1.trans e2.symm)
  -- counting
  have hsplit1 : (univ.filter (fun s => (toM3 (av s)).rank = 1)).card =
      (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = 1)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank = 1)).card := by
    rw [← card_union_of_disjoint]
    · congr 1; ext s; simp only [mem_filter, mem_univ, true_and, mem_union]
      cases Em.testBit (av s) <;> simp
    · rw [disjoint_filter]; intro s _ h1 h2; rw [h1.1] at h2; exact absurd h2.1 (by simp)
  have hsplit2 : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false)).card =
      (univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank ≠ 1)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank = 1)).card := by
    rw [← card_union_of_disjoint]
    · congr 1; ext s; simp only [mem_filter, mem_univ, true_and, mem_union]; tauto
    · rw [disjoint_filter]; intro s _ h1 h2; exact h1.2 h2.2
  have := card_le_card hsub
  omega

/-! ## The decompositions of the induction -/

/-- 22 distinct nonzero first factors, nonzero second and third factors, case (II), exactly 20 first factors outside `E` -/
def OmL (Em : ℕ) (av : Fin 22 → ℕ) (b c : Fin 22 → M3) : Prop :=
  (∀ s, av s < 512) ∧ (∀ s, av s ≠ 0) ∧ Function.Injective av ∧ IsDecomp (fun s => toM3 (av s)) b c ∧
  (∀ s, b s ≠ 0 ∧ c s ≠ 0) ∧ 14 ≤ (univ.filter (fun s => (toM3 (av s)).rank = 1)).card ∧
  (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false)).card = 20

/-- `OmL` is closed under the stabilizer of `E` -/
theorem omL_act {Em VT N gp : ℕ} {t : Bool} {P Q : ℕ} (hg : GElt Em VT N gp t P Q) {av : Fin 22 → ℕ} {b c : Fin 22 → M3}
    (h : OmL Em av b c) : ∃ b' c', OmL Em (fun s => C3.actN t P Q (av s)) b' c' := by
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩ := h
  obtain ⟨b', c', hd', hbc'⟩ := isDecomp_actN_nz hd hbc (t := t) hg.glP hg.glQ
  refine ⟨b', c', fun s => C3.actN_lt _ _ _ _, ?_, ?_, hd', hbc', ?_, ?_⟩
  · intro s h0
    rw [← RT.actN_zero t P Q] at h0
    exact hnz s (C3.actN_inj hg.glP hg.glQ (hav s) (by norm_num) h0)
  · intro s s' h'
    exact hinj (C3.actN_inj hg.glP hg.glQ (hav s) (hav s') h')
  · simp only [rank_actN hg.glP hg.glQ]; exact hII
  · rw [← hR]; apply congrArg Finset.card; apply Finset.filter_congr; intro s _; rw [hg.fixE _ (hav s)]

/-! ## The main theorem, with slot validity as a parameter -/

/-- the base facts of the coset IP (no slot table) -/
structure IPB (C : E1G.Ctx) (Em LB LBR UB nrows : ℕ) (sl : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ) : Prop where
  N_le : C.N ≤ 127
  R_eq : C.R = 20
  DOM_lt : C.DOM < 2 ^ 512
  Em_eq : Em = RT.kM RT.K3eD_Cls.CL 479
  cosets : Cosets Em C.VT C.N
  domperp : DomPerp C.DOM Em
  caps_lt : ∀ l < C.N, nrows + l < 2 ^ 15
  capslot : ∀ l < C.N, (∀ j < C.N, (smask (sl (nrows + l))).testBit j = decide (j = l)) ∧
    scap (sl (nrows + l)) = E1G.fld UB l
  grp : ∀ g < 2048, GElt Em C.VT C.N (C.GP g) (GE g).1 (GE g).2.1 (GE g).2.2

/-- every slot holds for every decomposition of the induction -/
def SlotsOK (C : E1G.Ctx) (Em : ℕ) (sl : ℕ → ℕ) : Prop :=
  ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmL Em av b c → ∀ i < 2 ^ 15, SlotV (xOf av Em C.VT C.N) (sl i)

/-- the external leaves are refuted -/
def ExtOK (C : E1G.Ctx) : Prop :=
  ∀ pl ∈ C.EXT,
    S5.NoDecomp (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
      (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0)) ∨
    NoLift3 (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
      (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0))

theorem core' (C : E1G.Ctx) (Em LB LBR UB nrows : ℕ) (sl : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPB C Em LB LBR UB nrows sl GE) (hsl : SlotsOK C Em sl) (henum : EnumOK C sl UB) (hext : ExtOK C) :
    ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmL Em av b c → False := by
  have hN := h.N_le
  have hR20 := h.R_eq
  have hE : ∀ a < 512, Em.testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) := by
    rw [h.Em_eq]; exact kM479_bit
  suffices key : ∀ m, ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmL Em av b c →
      2 ^ 16256 - VR (xOf av Em C.VT C.N) = m → False from
    fun av b c hom => key _ av b c hom rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro av b c hom hm
  have hslot := hsl av b c hom
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩ := hom
  set x := xOf av Em C.VT C.N with hxdef
  have hsum : ∑ l ∈ range 127, x l = C.R := by rw [hxdef, sum_xOf av Em C.VT C.N hN h.cosets hav, hR, hR20]
  have hxle : ∀ l < 127, x l ≤ C.R := by
    intro l hl
    rw [← hsum]; exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_range.mpr hl)
  have hxb : ∀ l < 127, x l < 2 ^ 128 := fun l hl => lt_of_le_of_lt (hxle l hl) (by omega)
  by_cases hcan : ∀ g < 2048, ¬ (VR x < VR (push (C.GP g) x))
  · -- canonical: the leaves are refuted, and the enumeration excludes `x`
    have hxub : ∀ l < 127, x l ≤ E1G.fld UB l := by
      intro l hl
      by_cases hlN : l < C.N
      · obtain ⟨h2, h3⟩ := h.capslot l hlN
        have := (hslot (nrows + l) (h.caps_lt l hlN)).1
        rw [h3, msum_cap x _ l C.N hN hlN (fun j hj => xOf_ge _ _ _ _ _ hj) h2] at this
        exact this
      · rw [hxdef, xOf_ge _ _ _ _ _ (by omega)]; exact Nat.zero_le _
    -- the two first factors on `E`
    have hin2 : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = true)).card = 2 := by
      have := filter_card_add_filter_neg_card_eq_card (s := (univ : Finset (Fin 22)))
        (fun s : Fin 22 => Em.testBit (av s) = true)
      simp only [Bool.not_eq_true, card_univ, Fintype.card_fin] at this
      omega
    obtain ⟨u0, u1, hu, hpair⟩ := Finset.card_eq_two.mp hin2
    have hmem : ∀ s, Em.testBit (av s) = true ↔ s = u0 ∨ s = u1 := by
      intro s
      have := congrArg (fun S => s ∈ S) hpair
      simp only [mem_filter, mem_univ, true_and, mem_insert, mem_singleton, eq_iff_iff] at this
      exact this
    have hglob : Glob C x := {
      N_le := hN
      R_le := by omega
      xN := fun l hl => xOf_ge _ _ _ _ _ hl
      xR := hsum
      leaf := fun pl cert hx hleaf => by
        unfold E1G.leafOK at hleaf
        cases hc : Nat.beq cert 0
        · rw [hc] at hleaf
          exact leaf_bridge C.VT C.N Em C.DOM C.R hN (by omega) h.cosets h.domperp h.DOM_lt av b c hav hd hbc
            (by rw [hR, hR20]) pl cert hx hleaf
        · rw [hc] at hleaf
          rcases hext pl (extMem_spec pl C.EXT hleaf) with hnd | hnl
          · exact leaf_bridge_nd C.VT C.N Em C.DOM C.R hN (by omega) h.cosets h.domperp h.DOM_lt av b c hav hd hbc
              (by rw [hR, hR20]) pl 0 hx hnd
          · exact lift_bridge C.VT C.N Em C.DOM C.R hN (by omega) h.cosets h.domperp h.DOM_lt hE av b c hav hd hbc
              u0 u1 hu ((hmem u0).mpr (Or.inl rfl)) ((hmem u1).mpr (Or.inr rfl)) (hnz u0) (hnz u1)
              (fun e => hu (hinj e)) (fun s hs => (hmem s).mp hs) pl 0 hx hnl
      canon := hcan
      gp := fun g hg l hl => ((h.grp g hg).lab l hl).1 }
    have hx0 : ∃ l < 127, 0 < x l := by
      by_contra hc
      push Not at hc
      have : ∑ l ∈ range 127, x l = 0 := Finset.sum_eq_zero (fun l hl => by
        have := hc l (Finset.mem_range.mp hl); omega)
      omega
    exact henum x hglob hslot hxub hx0
  · -- not canonical: a group element makes the multiplicity vector larger
    push Not at hcan
    obtain ⟨g, hg16, hlt⟩ := hcan
    have hG := h.grp g hg16
    obtain ⟨b', c', hom'⟩ := omL_act hG ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩
    have hx' : VR (xOf (fun s => C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s)) Em C.VT C.N) = VR (push (C.GP g) x) :=
      VR_congr _ _ (fun l hl => xOf_act hN h.cosets hG av hav l hl)
    have hbound : VR (push (C.GP g) x) < 2 ^ 16256 := by
      apply VR_lt; intro l hl
      have : push (C.GP g) x l ≤ ∑ j ∈ range 127, x j := by
        unfold push; apply Finset.sum_le_sum; intro j _; split
        · exact le_rfl
        · exact Nat.zero_le _
      omega
    have hVx : VR x < 2 ^ 16256 := VR_lt x hxb
    exact ih (2 ^ 16256 - VR (push (C.GP g) x)) (by omega) _ b' c' hom' (by rw [hx'])

/-! ## Front end 1: the IP without W rows (`IPL`) -/

theorem IPL.toIPB {C : E1G.Ctx} {Em LB LBR UB Ntab nrows i2 : ℕ} {sl tab : ℕ → ℕ} {GE : ℕ → Bool × ℕ × ℕ}
    (h : IPL C Em LB LBR UB Ntab nrows i2 sl tab GE) : IPB C Em LB LBR UB nrows sl GE :=
  { N_le := h.N_le, R_eq := h.R_eq, DOM_lt := h.DOM_lt, Em_eq := h.Em_eq, cosets := h.cosets, domperp := h.domperp,
    caps_lt := fun l hl => by have := (h.capslot l hl).1; have := h.Ntab_le; have := h.i2_lt; omega
    capslot := fun l hl => (h.capslot l hl).2
    grp := h.grp }

/-- the table rows (FactN-22 via their RT entries) and the case-II slot hold -/
theorem IPL.slots {C : E1G.Ctx} {Em LB LBR UB Ntab nrows i2 : ℕ} {sl tab : ℕ → ℕ} {GE : ℕ → Bool × ℕ × ℕ}
    (h : IPL C Em LB LBR UB Ntab nrows i2 sl tab GE)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) : SlotsOK C Em sl := by
  intro av b c hom i hi
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩ := hom
  have hE : ∀ a < 512, Em.testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) := by
    rw [h.Em_eq]; exact kM479_bit
  by_cases hiN : i < Ntab
  · obtain ⟨e1, e2, e3⟩ := h.sl_spec i hiN
    rw [e1]
    have hF := entry_soundN2 RT.K3eD_Cls.CL (tab i) (hclsN _ (h.cls_lt i hiN)) e3
    exact slot_valid_cnt LB LBR C.VT C.N Em C.DOM C.R h.N_le h.planes h.planesR h.cosets h.domperp (tab i) e2 av hav
      (by rw [hR, h.R_eq]) (by rw [h.R_eq]; exact hF av b c hav hnz hinj hd)
  · by_cases hi2 : i = i2
    · subst hi2
      exact slot_c2 C.VT C.N Em h.N_le h.cosets hE av hav hinj hR hII (sl i) h.c2_cap h.c2_rev h.c2_lt h.c2_mask
    · rw [h.sl_zero i (by omega) hi hi2]; exact slotV_zero _

theorem core (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPL C Em LB LBR UB Ntab nrows i2 sl tab GE) (henum : EnumOK C sl UB) (hext : ExtOK C)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmL Em av b c → False :=
  core' C Em LB LBR UB nrows sl GE h.toIPB (h.slots hclsN) henum hext

/-! ## Front end 2: the IP with the two W rows at cap 9 (needs Lemma W(a)) -/

/-- **Lemma W(a)** for 22-term decompositions, as a named hypothesis (proved unconditionally: `L479.lemmaWa`) -/
def WaFact : Prop :=
  ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c →
    11 ≤ (univ.filter (fun s => ¬ av s < 64)).card ∧ 11 ≤ (univ.filter (fun s => ¬ (av s &&& 292 = 0))).card

/-- the IP with two more special slots: the W-type rows `{row 2 = 0}` (`iw0`) and `{column 2 = 0}` (`iw1`), cap 9 -/
structure IPLW (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 iw0 iw1 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ) : Prop
    where
  N_le : C.N ≤ 127
  R_eq : C.R = 20
  DOM_lt : C.DOM < 2 ^ 512
  Em_eq : Em = RT.kM RT.K3eD_Cls.CL 479
  cosets : Cosets Em C.VT C.N
  domperp : DomPerp C.DOM Em
  planes : Planes LB C.VT C.N
  planesR : PlanesR LB LBR
  sl_spec : ∀ i < Ntab, sl i = E1G.slot LB LBR (tab i) ∧ E1G.dualIn C.DOM (tab i) = true ∧
    RT.entryOK 20 RT.K3eD_Cls.CL (tab i) = true
  cls_lt : ∀ i < Ntab, RT.eCls (tab i) < 496
  Ntab_le : Ntab ≤ i2
  i2_lt : i2 < 2 ^ 15
  c2_cap : scap (sl i2) = 7
  c2_rev : ∀ j < 127, (smr (sl i2)).testBit j = (smask (sl i2)).testBit (126 - j)
  c2_lt : sl i2 < 2 ^ 264
  c2_mask : ∀ l < C.N, (smask (sl i2)).testBit l = true →
    ∀ e < 512, Em.testBit e = true → BC6s.rk3 (vt C.VT l ^^^ e) ≠ 1
  w_lt : iw0 < 2 ^ 15 ∧ iw1 < 2 ^ 15
  w0_cap : 9 ≤ scap (sl iw0)
  w0_rev : ∀ j < 127, (smr (sl iw0)).testBit j = (smask (sl iw0)).testBit (126 - j)
  w0_lt : sl iw0 < 2 ^ 264
  w0_mask : ∀ l < C.N, (smask (sl iw0)).testBit l = true → vt C.VT l < 64
  w1_cap : 9 ≤ scap (sl iw1)
  w1_rev : ∀ j < 127, (smr (sl iw1)).testBit j = (smask (sl iw1)).testBit (126 - j)
  w1_lt : sl iw1 < 2 ^ 264
  w1_mask : ∀ l < C.N, (smask (sl iw1)).testBit l = true → vt C.VT l &&& 292 = 0
  sl_zero : ∀ i, Ntab ≤ i → i < 2 ^ 15 → i ≠ i2 → i ≠ iw0 → i ≠ iw1 → sl i = 0
  capslot : ∀ l < C.N, nrows + l < Ntab ∧ (∀ j < C.N, (smask (sl (nrows + l))).testBit j = decide (j = l)) ∧
    scap (sl (nrows + l)) = E1G.fld UB l
  grp : ∀ g < 2048, GElt Em C.VT C.N (C.GP g) (GE g).1 (GE g).2.1 (GE g).2.2

/-- a W-type slot: at most `22 - 11 - 2 = 9` outside first factors in a W-type subspace containing `E` -/
theorem slot_w (VT N Em : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N) (Wp : ℕ → Prop) [DecidablePred Wp]
    (hWE : ∀ a < 512, Em.testBit a = true → Wp a) (hWx : ∀ a e, Wp a → Wp e → Wp (a ^^^ e))
    (av : Fin 22 → ℕ) (hav : ∀ s, av s < 512)
    (hR : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false)).card = 20)
    (hW : 11 ≤ (univ.filter (fun s => ¬ Wp (av s))).card)
    (v : ℕ) (hcap : 9 ≤ scap v) (hrev : ∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j)) (hlt : v < 2 ^ 264)
    (hmask : ∀ l < N, (smask v).testBit l = true → Wp (vt VT l)) :
    SlotV (xOf av Em VT N) v := by
  classical
  refine ⟨?_, hrev, hlt⟩
  rw [msum_xOf av Em VT N (smask v) hN hC hav]
  have hsub : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false ∧ ∃ l < N, (smask v).testBit l = true ∧
      Em.testBit (av s ^^^ vt VT l) = true)) ⊆ univ.filter (fun s => Em.testBit (av s) = false ∧ Wp (av s)) := by
    intro s hs
    simp only [mem_filter, mem_univ, true_and] at hs ⊢
    obtain ⟨h0, l, hl, hm, hE'⟩ := hs
    refine ⟨h0, ?_⟩
    have h1 := hWx _ _ (hmask l hl hm) (hWE _ (RootSound.TransBits.xor_lt _ _ (hav s) (vt_lt VT l)) hE')
    rwa [show vt VT l ^^^ (av s ^^^ vt VT l) = av s by
      rw [Nat.xor_comm (av s), ← Nat.xor_assoc, Nat.xor_self, Nat.zero_xor]] at h1
  have hsplit : (univ.filter (fun s => Wp (av s))).card =
      (univ.filter (fun s => Em.testBit (av s) = true ∧ Wp (av s))).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ Wp (av s))).card := by
    rw [← card_union_of_disjoint]
    · congr 1; ext s; simp only [mem_filter, mem_univ, true_and, mem_union]
      cases Em.testBit (av s) <;> simp
    · rw [disjoint_filter]; intro s _ h1 h2; rw [h1.1] at h2; exact absurd h2.1 (by simp)
  have hinW : (univ.filter (fun s => Em.testBit (av s) = true ∧ Wp (av s))).card =
      (univ.filter (fun s : Fin 22 => Em.testBit (av s) = true)).card := by
    congr 1; ext s; simp only [mem_filter, mem_univ, true_and]
    exact ⟨fun h => h.1, fun h => ⟨h, hWE _ (hav s) h⟩⟩
  have hin2 : (univ.filter (fun s : Fin 22 => Em.testBit (av s) = true)).card = 2 := by
    have := filter_card_add_filter_neg_card_eq_card (s := (univ : Finset (Fin 22)))
      (fun s : Fin 22 => Em.testBit (av s) = true)
    simp only [Bool.not_eq_true, card_univ, Fintype.card_fin] at this
    omega
  have hWc : (univ.filter (fun s => Wp (av s))).card + (univ.filter (fun s => ¬ Wp (av s))).card = 22 := by
    rw [filter_card_add_filter_neg_card_eq_card]; simp
  have := card_le_card hsub
  omega

theorem E_lt64 : ∀ a < 512, (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) → a < 64 ∧ a &&& 292 = 0 := by decide +kernel

theorem xor_lt64 (a e : ℕ) (ha : a < 64) (he : e < 64) : a ^^^ e < 64 := Nat.xor_lt_two_pow (n := 6) ha he

theorem xor_292 (a e : ℕ) (ha : a &&& 292 = 0) (he : e &&& 292 = 0) : (a ^^^ e) &&& 292 = 0 := by
  rw [Nat.and_xor_distrib_right, ha, he]; rfl

theorem IPLW.toIPB {C : E1G.Ctx} {Em LB LBR UB Ntab nrows i2 iw0 iw1 : ℕ} {sl tab : ℕ → ℕ} {GE : ℕ → Bool × ℕ × ℕ}
    (h : IPLW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE) : IPB C Em LB LBR UB nrows sl GE :=
  { N_le := h.N_le, R_eq := h.R_eq, DOM_lt := h.DOM_lt, Em_eq := h.Em_eq, cosets := h.cosets, domperp := h.domperp,
    caps_lt := fun l hl => by have := (h.capslot l hl).1; have := h.Ntab_le; have := h.i2_lt; omega
    capslot := fun l hl => (h.capslot l hl).2
    grp := h.grp }

theorem IPLW.slots {C : E1G.Ctx} {Em LB LBR UB Ntab nrows i2 iw0 iw1 : ℕ} {sl tab : ℕ → ℕ} {GE : ℕ → Bool × ℕ × ℕ}
    (h : IPLW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) (hW : WaFact) :
    SlotsOK C Em sl := by
  intro av b c hom i hi
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩ := hom
  have hE : ∀ a < 512, Em.testBit a = true ↔ (a = 0 ∨ a = 1 ∨ a = 10 ∨ a = 11) := by
    rw [h.Em_eq]; exact kM479_bit
  have hWa := hW av b c hav hd
  by_cases hiN : i < Ntab
  · obtain ⟨e1, e2, e3⟩ := h.sl_spec i hiN
    rw [e1]
    have hF := entry_soundN2 RT.K3eD_Cls.CL (tab i) (hclsN _ (h.cls_lt i hiN)) e3
    exact slot_valid_cnt LB LBR C.VT C.N Em C.DOM C.R h.N_le h.planes h.planesR h.cosets h.domperp (tab i) e2 av hav
      (by rw [hR, h.R_eq]) (by rw [h.R_eq]; exact hF av b c hav hnz hinj hd)
  · by_cases hi2 : i = i2
    · subst hi2
      exact slot_c2 C.VT C.N Em h.N_le h.cosets hE av hav hinj hR hII (sl i) h.c2_cap h.c2_rev h.c2_lt h.c2_mask
    · by_cases hw0 : i = iw0
      · subst hw0
        exact slot_w C.VT C.N Em h.N_le h.cosets (fun a => a < 64)
          (fun a ha hEa => (E_lt64 a ha ((hE a ha).mp hEa)).1) (fun a e ha he => xor_lt64 a e ha he)
          av hav hR hWa.1 (sl i) h.w0_cap h.w0_rev h.w0_lt h.w0_mask
      · by_cases hw1 : i = iw1
        · subst hw1
          exact slot_w C.VT C.N Em h.N_le h.cosets (fun a => a &&& 292 = 0)
            (fun a ha hEa => (E_lt64 a ha ((hE a ha).mp hEa)).2) (fun a e ha he => xor_292 a e ha he)
            av hav hR hWa.2 (sl i) h.w1_cap h.w1_rev h.w1_lt h.w1_mask
        · rw [h.sl_zero i (by omega) hi hi2 hw0 hw1]; exact slotV_zero _

theorem coreW (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 iw0 iw1 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPLW C Em LB LBR UB Ntab nrows i2 iw0 iw1 sl tab GE) (henum : EnumOK C sl UB) (hext : ExtOK C)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) (hW : WaFact) :
    ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmL Em av b c → False :=
  core' C Em LB LBR UB nrows sl GE h.toIPB (h.slots hclsN hW) henum hext

end L479
