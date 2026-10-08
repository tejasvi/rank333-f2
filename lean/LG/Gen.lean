module
public import R22Port.U_d41d8cd98f00
public import LG.Main
/-! # The context cap, parametric in the subspace `E` and the count (generic form of L479)

**Statement** (`CapG Em R lo`): in the universe of decompositions with at least `lo` rank-1 first factors, the subspace `E`
(point mask `Em`) holds at most `k - 1 = 21 - R` first factors, i.e. at least `R + 1` first factors lie outside `E`.  Here
`R = 22 - k` and `E`'s class bound in the 22-term table is `R` (at most `k` first factors on `E`, `hbase`), so this is the
raise of `E`'s class by one in that universe.  L479 is `E = K_479 = {0, 1, 10, 11}`, `R = 20`, `lo = 14` (`LG/Final.lean`).

**Proof** (`capG_of`), as L479's:
* a counterexample has exactly `R` first factors outside `E` (`hbase`), all terms nonzero (`dec_nz`), 22 distinct nonzero
  first factors: it lies in `OmG Em R lo`, which is closed under `E`'s stabilizer (`omG_act`);
* the canonicalization induction on the multiplicity vector's distance from its orbit maximum (`coreG`, as
  `E1GS.e1_sound_ext`); at the canonical point every slot holds (`IPG.slots`):
  - the IP's rows: RT entries passing `entryOK R` of the IP's class table, from its 22-term class facts (`entry_soundNR`,
    `slot_valid_cnt`);
  - the case row `i2` (optional): the cosets without a rank-1 point hold at most `R - (lo - q)` outside first factors, where
    `q = rk1cnt Em` bounds the rank-1 first factors inside `E` (distinct rank-1 points of `E`) (`slot_c2G`);
  - the label caps;
* leaves: certified ones by `E1GS.leaf_bridge`, external ones by `LeafNoExt` (no counterexample has the leaf's outside
  multiset), which is the certificate-independent form.  Bridges: `leafNoExt_of_nd` (UNSAT, any `E`, `R`), and in
  `LG/Final.lean` `leafNoExt_of_noLift3` (`NoLift3`, for `K_479`, `R = 20`).  `lift_identity` is the general algebra of a
  lift: for every functional `Y`, `T(Y) + Σ_{outside t, Y(a_t)=1} N_t = Σ_{inside s, Y(a_s)=1} N_s`;
* `EnumOK` (the enumeration's canonical-point statement) gives the contradiction.
`classFactsG_of`: the class facts of the universe `CaseK lo hi` with `E`'s class (a `K3eD_Cls` class) raised to `R + 1`. -/
@[expose] public section
set_option maxRecDepth 20000
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false
set_option exponentiation.threshold 600

namespace L479
open Finset RootSound Matrix E1GS

/-! ## Rows: the entry theorem at any outside count `R` -/

/-- **The entry theorem for a coset IP with `R` outside terms** (`entry_soundN2` at `R`) -/
theorem entry_soundNR (R CL e : Nat) (hcls : RT.FactN 22 (RT.kM CL (RT.eCls e)) (RT.cLB CL (RT.eCls e)))
    (h : RT.entryOK R CL e = true) : RT.FactN 22 (RT.dualM e) (R - RT.eCap e) := by
  unfold RT.entryOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, Nat.ble_eq] at h
  obtain ⟨⟨⟨⟨⟨_, hsd⟩, hP⟩, hQ⟩, hmap⟩, hR⟩ := h
  have hgen := RT.mapsIn_spec CL e hmap
  intro av b c hav hnz hinj hd
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN (t := RT.eT e) hd hP hQ
  have hnz' : ∀ s, C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s) ≠ 0 := by
    intro s h0
    rw [← RT.actN_zero (RT.eT e) (RT.eP e) (RT.eQ e)] at h0
    exact hnz s (C3.actN_inj hP hQ (hav s) (by norm_num) h0)
  have hinj' : Function.Injective (fun s => C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s)) := by
    intro s s' h'
    exact hinj (C3.actN_inj hP hQ (hav s) (hav s') h')
  have hk := hcls (fun s => C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s)) b' c' (fun s => C3.actN_lt _ _ _ _) hnz' hinj' hd'
  refine le_trans (by omega) (le_trans hk (Finset.card_le_card ?_))
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e2 : (RT.dualM e).testBit (av s)
  · rfl
  · exfalso
    rw [← hsd] at e2
    obtain ⟨_, hin⟩ := RT.spanM_ind e (fun w => RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) w) = true)
      (by show RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) 0) = true
          rw [RT.actN_zero]; exact RT.inK_zero _ _) hgen
      (fun x y hx hy h1 h2 => by
        show RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (x ^^^ y)) = true
        rw [RT.actN_xor _ _ _ _ _ hx hy]; exact RT.inK_xor (C3.actN_lt _ _ _ _) (C3.actN_lt _ _ _ _) h1 h2)
      (av s) e2
    have hin' : RT.inK CL (RT.eCls e) (C3.actN (RT.eT e) (RT.eP e) (RT.eQ e) (av s)) = true := hin
    rw [RT.kM_testBit _ _ _ (C3.actN_lt _ _ _ _), hin'] at hs
    exact absurd hs (by decide)

/-! ## The case row: cosets without a rank-1 point -/

/-- the number of rank-1 points of `E` -/
def rk1cnt (Em : ℕ) : ℕ := ((range 512).filter (fun a => Em.testBit a = true ∧ BC6s.rk3 a = 1)).card

/-- **the case row**: with at least `lo` rank-1 first factors (distinct), the cosets without a rank-1 point hold at most
`R - (lo - rk1cnt Em)` of the `R` outside first factors -/
theorem slot_c2G {n : ℕ} (VT N Em R lo : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N)
    (av : Fin n → ℕ) (hav : ∀ s, av s < 512) (hinj : Function.Injective av)
    (hR : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = R)
    (hII : lo ≤ (univ.filter (fun s => (toM3 (av s)).rank = 1)).card)
    (v : ℕ) (hcap : R + rk1cnt Em ≤ scap v + lo) (hrev : ∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j))
    (hlt : v < 2 ^ 264)
    (hmask : ∀ l < N, (smask v).testBit l = true → ∀ e < 512, Em.testBit e = true → BC6s.rk3 (vt VT l ^^^ e) ≠ 1) :
    SlotV (xOf av Em VT N) v := by
  classical
  refine ⟨?_, hrev, hlt⟩
  rw [msum_xOf av Em VT N (smask v) hN hC hav]
  have hrk : ∀ s, BC6s.rk3 (av s) = (toM3 (av s)).rank := fun s => S6.rk3_rank (av s) (hav s)
  have hsub : (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ ∃ l < N, (smask v).testBit l = true ∧
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
  -- the inside rank-1 first factors are distinct rank-1 points of `E`
  have hin1 : (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = 1)).card ≤ rk1cnt Em := by
    unfold rk1cnt
    rw [← Finset.card_image_of_injective _ hinj]
    apply Finset.card_le_card
    intro a ha
    simp only [mem_image, mem_filter, mem_univ, true_and] at ha
    obtain ⟨s, ⟨h1, h2⟩, rfl⟩ := ha
    simp only [mem_filter, mem_range]
    exact ⟨hav s, h1, by rw [hrk]; exact h2⟩
  have hsplit1 : (univ.filter (fun s => (toM3 (av s)).rank = 1)).card =
      (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = 1)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank = 1)).card := by
    rw [← card_union_of_disjoint]
    · congr 1; ext s; simp only [mem_filter, mem_univ, true_and, mem_union]
      cases Em.testBit (av s) <;> simp
    · rw [disjoint_filter]; intro s _ h1 h2; rw [h1.1] at h2; exact absurd h2.1 (by simp)
  have hsplit2 : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card =
      (univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank ≠ 1)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ (toM3 (av s)).rank = 1)).card := by
    rw [← card_union_of_disjoint]
    · congr 1; ext s; simp only [mem_filter, mem_univ, true_and, mem_union]; tauto
    · rw [disjoint_filter]; intro s _ h1 h2; exact h1.2 h2.2
  have := card_le_card hsub
  omega

/-! ## The decompositions of the induction -/

/-- 22 distinct nonzero first factors, nonzero second and third factors, at least `lo` rank-1 first factors, exactly `R`
first factors outside `E` -/
def OmG (Em R lo : ℕ) (av : Fin 22 → ℕ) (b c : Fin 22 → M3) : Prop :=
  (∀ s, av s < 512) ∧ (∀ s, av s ≠ 0) ∧ Function.Injective av ∧ IsDecomp (fun s => toM3 (av s)) b c ∧
  (∀ s, b s ≠ 0 ∧ c s ≠ 0) ∧ lo ≤ (univ.filter (fun s => (toM3 (av s)).rank = 1)).card ∧
  (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false)).card = R

/-- `OmG` is closed under the stabilizer of `E` -/
theorem omG_act {Em R lo VT N gp : ℕ} {t : Bool} {P Q : ℕ} (hg : GElt Em VT N gp t P Q) {av : Fin 22 → ℕ}
    {b c : Fin 22 → M3} (h : OmG Em R lo av b c) : ∃ b' c', OmG Em R lo (fun s => C3.actN t P Q (av s)) b' c' := by
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

/-! ## The IP facts (generic) -/

/-- the facts of a coset IP of `E` (outside count `C.R`, case bound `lo`, the IP's class table `CL`) that are checked by
`decide`; the slot `i2` is the case row or zero -/
structure IPG (C : E1G.Ctx) (CL Em lo LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ) : Prop where
  N_le : C.N ≤ 127
  R_le : C.R ≤ 22
  R_pos : 1 ≤ C.R
  DOM_lt : C.DOM < 2 ^ 512
  cosets : Cosets Em C.VT C.N
  domperp : DomPerp C.DOM Em
  planes : Planes LB C.VT C.N
  planesR : PlanesR LB LBR
  sl_spec : ∀ i < Ntab, sl i = E1G.slot LB LBR (tab i) ∧ E1G.dualIn C.DOM (tab i) = true ∧
    RT.entryOK C.R CL (tab i) = true
  cls_lt : ∀ i < Ntab, RT.eCls (tab i) < 496
  Ntab_le : Ntab ≤ i2
  i2_lt : i2 < 2 ^ 15
  c2 : sl i2 = 0 ∨ (C.R + rk1cnt Em ≤ scap (sl i2) + lo ∧
    (∀ j < 127, (smr (sl i2)).testBit j = (smask (sl i2)).testBit (126 - j)) ∧ sl i2 < 2 ^ 264 ∧
    ∀ l < C.N, (smask (sl i2)).testBit l = true → ∀ e < 512, Em.testBit e = true → BC6s.rk3 (vt C.VT l ^^^ e) ≠ 1)
  sl_zero : ∀ i, Ntab ≤ i → i < 2 ^ 15 → i ≠ i2 → sl i = 0
  capslot : ∀ l < C.N, nrows + l < Ntab ∧ (∀ j < C.N, (smask (sl (nrows + l))).testBit j = decide (j = l)) ∧
    scap (sl (nrows + l)) = E1G.fld UB l
  grp : ∀ g < 2048, GElt Em C.VT C.N (C.GP g) (GE g).1 (GE g).2.1 (GE g).2.2

/-- every slot holds for every decomposition of the induction -/
def SlotsG (C : E1G.Ctx) (Em lo : ℕ) (sl : ℕ → ℕ) : Prop :=
  ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmG Em C.R lo av b c → ∀ i < 2 ^ 15, SlotV (xOf av Em C.VT C.N) (sl i)

theorem IPG.slots {C : E1G.Ctx} {CL Em lo LB LBR UB Ntab nrows i2 : ℕ} {sl tab : ℕ → ℕ} {GE : ℕ → Bool × ℕ × ℕ}
    (h : IPG C CL Em lo LB LBR UB Ntab nrows i2 sl tab GE)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM CL c) (RT.cLB CL c)) : SlotsG C Em lo sl := by
  intro av b c hom i hi
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩ := hom
  by_cases hiN : i < Ntab
  · obtain ⟨e1, e2, e3⟩ := h.sl_spec i hiN
    rw [e1]
    have hF := entry_soundNR C.R CL (tab i) (hclsN _ (h.cls_lt i hiN)) e3
    exact slot_valid_cnt LB LBR C.VT C.N Em C.DOM C.R h.N_le h.planes h.planesR h.cosets h.domperp (tab i) e2 av hav
      hR (hF av b c hav hnz hinj hd)
  · by_cases hi2 : i = i2
    · subst hi2
      rcases h.c2 with h0 | ⟨hcap, hrev, hlt, hmask⟩
      · rw [h0]; exact slotV_zero _
      · exact slot_c2G C.VT C.N Em C.R lo h.N_le h.cosets av hav hinj hR hII (sl i) hcap hrev hlt hmask
    · rw [h.sl_zero i (by omega) hi hi2]; exact slotV_zero _

/-! ## Leaves -/

/-- **an external leaf is refuted**: no decomposition of the induction has the leaf's outside multiset (the
certificate-independent form; see `leafNoExt_of_nd`, `leafNoExt_of_noLift3`) -/
def LeafNoExt (C : E1G.Ctx) (Em lo pl : ℕ) : Prop :=
  ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmG Em C.R lo av b c → (∀ l, multR C.R pl l = xOf av Em C.VT C.N l) → False

/-- an UNSAT external leaf (`S5.NoDecomp` of its record) is refuted, for any `E` and outside count -/
theorem leafNoExt_of_nd {C : E1G.Ctx} {Em lo pl : ℕ} (hN : C.N ≤ 127) (hR : C.R ≤ 31) (hC : Cosets Em C.VT C.N)
    (hD : DomPerp C.DOM Em) (hDOM : C.DOM < 2 ^ 512)
    (hnd : S5.NoDecomp (S5.leafT (E1G.leafRec C.R C.VT C.DOM pl 0)) (S5.leafN (E1G.leafRec C.R C.VT C.DOM pl 0))
      (S6.leafDom6 (E1G.leafRec C.R C.VT C.DOM pl 0))) : LeafNoExt C Em lo pl := by
  intro av b c hom hx
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR'⟩ := hom
  exact leaf_bridge_nd C.VT C.N Em C.DOM C.R hN hR hC hD hDOM av b c hav hd hbc hR' pl 0 hx hnd

/-- **the algebra of a lift**: for a decomposition whose outside terms, reordered like the leaf's labels, are `L'`, and any
functional `Y`, `T(Y) + Σ_{t < R, Y(a_{L't}) = 1} N_{L't} = Σ_{inside s, Y(a_s) = 1} N_s` (`N_s = b_s c_sᵀ`). This is the
step every lifting criterion uses: L479's takes `Y` that is `1` on exactly one inside point (`lift_bridge`). -/
theorem lift_identity {n : ℕ} (Em : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3) (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (R : ℕ) (L' : List (Fin n)) (s0 : Fin n)
    (hmemL' : ∀ s ∈ L', Em.testBit (av s) = false)
    (hsum : ∀ G : Fin n → Matrix (Fin 9) (Fin 9) F2, (∀ s, Em.testBit (av s) = true → G s = 0) →
      ∑ s, G s = ∑ t ∈ range R, G (L'.getD t s0)) (hlen : L'.length = R)
    (Y : ℕ) (hY : Y < 512) :
    TX (toM3 Y) + ∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& Y) = true),
        vecMulVec (vecB (b (L'.getD t s0))) (vecC (c (L'.getD t s0))) =
      ∑ s ∈ univ.filter (fun s => Em.testBit (av s) = true ∧ BC5.par (av s &&& Y) = true),
        vecMulVec (vecB (b s)) (vecC (c s)) := by
  classical
  let F : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => vecMulVec (vecB (b s)) (vecC (c s))
  let G : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if BC5.par (av s &&& Y) = true then F s else 0
  have hTY : TX (toM3 Y) = ∑ s : Fin n, G s := by
    rw [TX_eq_sum hd (toM3 Y), hitSet, Finset.sum_filter]
    apply Finset.sum_congr rfl; intro s _
    simp only [G]
    rw [S5.pair_par Y (av s) hY (hav s)]
    cases BC5.par (av s &&& Y) <;> simp [S5.bf, F]
  let Go : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if Em.testBit (av s) = true then 0 else G s
  let Gi : Fin n → Matrix (Fin 9) (Fin 9) F2 := fun s => if Em.testBit (av s) = true then G s else 0
  have hsplit : ∑ s : Fin n, G s = ∑ s : Fin n, Go s + ∑ s : Fin n, Gi s := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl; intro s _
    simp only [Go, Gi]
    by_cases hs : Em.testBit (av s) = true
    · rw [if_pos hs, if_pos hs, zero_add]
    · rw [if_neg hs, if_neg hs, add_zero]
  have hGo : ∑ s : Fin n, Go s = ∑ t ∈ range R, Go (L'.getD t s0) :=
    hsum Go (fun s hs => by simp only [Go]; rw [if_pos hs])
  have hGoS : ∑ t ∈ range R, Go (L'.getD t s0) =
      ∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& Y) = true), F (L'.getD t s0) := by
    rw [Finset.sum_filter]
    apply Finset.sum_congr rfl; intro t ht
    rw [Finset.mem_range] at ht
    have hout := hmemL' (L'.getD t s0) (by
      rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (by omega)]; exact List.getElem_mem _)
    simp only [Go, G, hout, Bool.false_eq_true, if_false]
  have hGi : ∑ s : Fin n, Gi s =
      ∑ s ∈ univ.filter (fun s => Em.testBit (av s) = true ∧ BC5.par (av s &&& Y) = true), F s := by
    rw [Finset.sum_filter]
    apply Finset.sum_congr rfl; intro s _
    simp only [Gi, G]
    by_cases hs : Em.testBit (av s) = true
    · by_cases hp : BC5.par (av s &&& Y) = true
      · simp [hs, hp]
      · simp [hs, hp]
    · simp [hs]
  rw [hTY, hsplit, hGo, hGoS, hGi]
  show ∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& Y) = true), F (L'.getD t s0) +
      ∑ s ∈ univ.filter (fun s => Em.testBit (av s) = true ∧ BC5.par (av s &&& Y) = true), F s +
      ∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& Y) = true), F (L'.getD t s0) = _
  rw [add_comm (∑ t ∈ (range R).filter (fun t => BC5.par (av (L'.getD t s0) &&& Y) = true), F (L'.getD t s0)), add_assoc,
    mat_add_self, add_zero]

/-! ## The induction -/

/-- the base facts used by the induction (no slot table) -/
theorem coreG (C : E1G.Ctx) (CL Em lo LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPG C CL Em lo LB LBR UB Ntab nrows i2 sl tab GE) (hsl : SlotsG C Em lo sl) (henum : EnumOK C sl UB)
    (hext : ∀ pl ∈ C.EXT, LeafNoExt C Em lo pl) :
    ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmG Em C.R lo av b c → False := by
  have hN := h.N_le
  have hRle := h.R_le
  suffices key : ∀ m, ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmG Em C.R lo av b c →
      2 ^ 16256 - VR (xOf av Em C.VT C.N) = m → False from
    fun av b c hom => key _ av b c hom rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro av b c hom hm
  have hslot := hsl av b c hom
  have hom0 := hom
  obtain ⟨hav, hnz, hinj, hd, hbc, hII, hR⟩ := hom
  set x := xOf av Em C.VT C.N with hxdef
  have hsum : ∑ l ∈ range 127, x l = C.R := by rw [hxdef, sum_xOf av Em C.VT C.N hN h.cosets hav, hR]
  have hxle : ∀ l < 127, x l ≤ C.R := by
    intro l hl
    rw [← hsum]; exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_range.mpr hl)
  have hxb : ∀ l < 127, x l < 2 ^ 128 := fun l hl => lt_of_le_of_lt (hxle l hl) (by omega)
  by_cases hcan : ∀ g < 2048, ¬ (VR x < VR (push (C.GP g) x))
  · have hxub : ∀ l < 127, x l ≤ E1G.fld UB l := by
      intro l hl
      by_cases hlN : l < C.N
      · obtain ⟨h1, h2, h3⟩ := h.capslot l hlN
        have := (hslot (nrows + l) (by have := h.Ntab_le; have := h.i2_lt; omega)).1
        rw [h3, msum_cap x _ l C.N hN hlN (fun j hj => xOf_ge _ _ _ _ _ hj) h2] at this
        exact this
      · rw [hxdef, xOf_ge _ _ _ _ _ (by omega)]; exact Nat.zero_le _
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
            hR pl cert hx hleaf
        · rw [hc] at hleaf
          exact hext pl (extMem_spec pl C.EXT hleaf) av b c hom0 hx
      canon := hcan
      gp := fun g hg l hl => ((h.grp g hg).lab l hl).1 }
    have hx0 : ∃ l < 127, 0 < x l := by
      by_contra hc
      push Not at hc
      have : ∑ l ∈ range 127, x l = 0 := Finset.sum_eq_zero (fun l hl => by
        have := hc l (Finset.mem_range.mp hl); omega)
      have := h.R_pos; omega
    exact henum x hglob hslot hxub hx0
  · push Not at hcan
    obtain ⟨g, hg16, hlt⟩ := hcan
    have hG := h.grp g hg16
    obtain ⟨b', c', hom'⟩ := omG_act hG hom0
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

/-! ## The theorem -/

/-- **the context cap of `E`** in the universe of at least `lo` rank-1 first factors: at least `R + 1` first factors lie outside
`E` (i.e. at most `21 - R` on `E`) -/
def CapG (Em R lo : ℕ) : Prop :=
  ∀ A : R3RT.Spec.Dec22, lo ≤ KD.nType A 1 → R + 1 ≤ (univ.filter (fun s => Em.testBit (A.av s) = false)).card

/-- **The context cap from the enumeration and the leaf refutations** (generic L479). `hbase`: `E`'s bound in the 22-term
table (at least `C.R` outside); `hclsN`: the IP's class table; `h495`: RR's bound 22 for `{0}`. -/
theorem capG_of (C : E1G.Ctx) (CL Em lo LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (h : IPG C CL Em lo LB LBR UB Ntab nrows i2 sl tab GE) (henum : EnumOK C sl UB)
    (hext : ∀ pl ∈ C.EXT, LeafNoExt C Em lo pl)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM CL c) (RT.cLB CL c))
    (hbase : RT.FactN 22 Em C.R) (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) : CapG Em C.R lo := by
  intro A hlo
  by_contra hlt
  push Not at hlt
  have hR := hbase A.av A.b A.c A.lt A.ne A.inj A.dec
  apply coreG C CL Em lo LB LBR UB Ntab nrows i2 sl tab GE h (h.slots hclsN) henum hext A.av A.b A.c
  exact ⟨A.lt, A.ne, A.inj, A.dec, dec_nz h495 A, hlo, by omega⟩

/-- the class bounds of the universe with `E`'s class `cE` raised to `R + 1` -/
def cLBG (cE R : ℕ) (c : ℕ) : ℕ := if c = cE then R + 1 else RT.cLB RT.K3eD_Cls.CL c

/-- **the class facts of the universe `CaseK lo hi`** with the class `cE` of `E = K_cE` raised to `R + 1` -/
theorem classFactsG_of (cE R lo hi : ℕ) (hcap : CapG (RT.kM RT.K3eD_Cls.CL cE) R lo)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK lo hi) (cLBG cE R) := by
  intro A hΩ c hc
  unfold cLBG
  split_ifs with hcE
  · subst hcE
    exact hcap A (by rw [← KD.nType_eq]; exact hΩ.1)
  · exact hclsN c hc A.av A.b A.c A.lt A.ne A.inj A.dec

/-- the class bounds of the universe with several classes raised: `(cE, R) ∈ L` puts class `cE` at `R + 1` (the first entry for
a class counts) -/
def cLBGL (L : List (ℕ × ℕ)) (c : ℕ) : ℕ :=
  match L.find? (fun p => p.1 == c) with
  | some p => p.2 + 1
  | none => RT.cLB RT.K3eD_Cls.CL c

/-- **the class facts of `CaseK lo hi` with several classes raised** (e.g. L479 and plane caps together) -/
theorem classFactsGL_of (L : List (ℕ × ℕ)) (lo hi : ℕ)
    (hcap : ∀ p ∈ L, CapG (RT.kM RT.K3eD_Cls.CL p.1) p.2 lo)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK lo hi) (cLBGL L) := by
  intro A hΩ c hc
  unfold cLBGL
  cases hf : L.find? (fun p => p.1 == c) with
  | none => exact hclsN c hc A.av A.b A.c A.lt A.ne A.inj A.dec
  | some p =>
    have hp := List.mem_of_find?_eq_some hf
    have hpc : p.1 = c := by have := List.find?_some hf; simpa using this
    have := hcap p hp A (by rw [← KD.nType_eq]; exact hΩ.1)
    rw [hpc] at this
    exact this

theorem cLBGL_single (cE R : ℕ) : cLBGL [(cE, R)] = cLBG cE R := by
  funext c; unfold cLBGL cLBG
  by_cases h : cE = c
  · subst h; simp
  · have h1 : (cE == c) = false := by simp [h]
    have h2 : ¬ c = cE := fun e => h e.symm
    rw [if_neg h2]; simp only [List.find?, h1]

end L479

#print axioms L479.classFactsGL_of
#print axioms L479.entry_soundNR
#print axioms L479.slot_c2G
#print axioms L479.leafNoExt_of_nd
#print axioms L479.lift_identity
#print axioms L479.coreG
#print axioms L479.capG_of
#print axioms L479.classFactsG_of
