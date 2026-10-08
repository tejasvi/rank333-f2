module
public import R22Port.U_d41d8cd98f00
public import GS.PhD2
/-! # Track D: soundness of phase D (`G.D2.coreOK`)

**Discrepancy with `GS.PhaseDThm`.**  `coreOKf`'s `col` case accepts `classesOK cl` for any `need`, but 16 colour classes
refute only cliques of at least 17 candidates.  The `br` case recurses at `need - 1` (so 17 becomes 16 below a branch
node), and nothing in the checker forbids a `col` node there.  `PhaseDThm` as stated is therefore false
(`not_PhaseDThm`: the empty clique at `need = 0` with an accepted `col` certificate on an empty group list).

What holds (`phaseD_sound`, `GS/PhD3.lean`): if `coreOK r1 need okb okc cert` accepts and every `col` node of `cert` is
reached with `need ≥ 17` (`colSafe need cert`, a `Bool` on the certificate, checkable by `decide`), then no `need`
pairwise compatible candidates exist (`NoClique`).  The only use of `colSafe` is the hypothesis `17 ≤ need` of
`col_sound`; with the one-line checker change `col: Nat.ble 17 need && classesOK cl` it would follow from acceptance
and `PhaseDThm` would hold as stated. -/
@[expose] public section
namespace GS.PD
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## the side condition on certificates -/

/-- every `col` node is reached with `need ≥ 17` (fuel as `coreOKf`) -/
def colSafef : ℕ → ℕ → CoreCert → Bool
  | 0, _, _ => true
  | _ + 1, _, .cnt _ => true
  | _ + 1, need, .col _ _ => Nat.ble 17 need
  | f + 1, need, .br _ _ _ _ cout cins => colSafef f need cout && cins.all (fun c => colSafef f (Nat.pred need) c)

def colSafe (need : ℕ) (cert : CoreCert) : Bool := colSafef 64 need cert

/-! ## classes -/

theorem indep_all (PY PX PA R : ℕ) : ∀ (L : List ℕ), indep PY PX PA R L = true → ∀ x ∈ L,
    Nat.land (nz32 (Nat.xor PA (Nat.mul (fA x) R)) R)
      (Nat.xor R (Nat.lor (swarPar PX R (fYU x 0)) (swarPar PY R (fXV x 0)))) = 0
  | [], _ => by simp
  | y :: ys, h => by
    have h' : (Nat.beq (Nat.land (nz32 (Nat.xor PA (Nat.mul (fA y) R)) R)
        (Nat.xor R (Nat.lor (swarPar PX R (fYU y 0)) (swarPar PY R (fXV y 0))))) 0 && indep PY PX PA R ys) = true := h
    rw [Bool.and_eq_true] at h'
    intro x hx
    rcases List.mem_cons.mp hx with rfl | hx
    · exact Nat.eq_of_beq_eq_true h'.1
    · exact indep_all PY PX PA R ys h'.2 x hx

theorem fYU_lt (t q : ℕ) : fYU t q < 2 ^ 29 := by
  show (t >>> (32 * q)) &&& M29 < 2 ^ 29
  rw [show M29 = 2 ^ 29 - 1 by decide, land_two_pow_sub_one]; exact Nat.mod_lt _ (by norm_num)

theorem fXV_lt (t q : ℕ) : fXV t q < 2 ^ 29 := by
  show (t >>> (96 + 32 * q)) &&& M29 < 2 ^ 29
  rw [show M29 = 2 ^ 29 - 1 by decide, land_two_pow_sub_one]; exact Nat.mod_lt _ (by norm_num)

theorem fA_lt (t : ℕ) : fA t < 512 := by
  show (t >>> 196) &&& 511 < 512
  rw [show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, land_two_pow_sub_one]; exact Nat.mod_lt _ (by norm_num)

theorem fA_lt9 (t : ℕ) : fA t < 2 ^ 9 := by have := fA_lt t; norm_num; exact this

theorem xor_ne_zero {a b : ℕ} (h : a ≠ b) : a ^^^ b ≠ 0 := by
  intro e; apply h
  apply Nat.eq_of_testBit_eq; intro i
  have := congrArg (fun z => z.testBit i) e
  simp only [Nat.testBit_xor, Nat.zero_testBit] at this
  revert this; cases a.testBit i <;> cases b.testBit i <;> simp

/-- **a class of `classesOK`**: no two of its members with different first factors are compatible -/
theorem classOK_sound (cl : List ℕ) (h : classOK cl = true) (x y : ℕ) (hx : x ∈ cl) (hy : y ∈ cl)
    (hxy : compatP x y = true) (hrx : fR x = 1) (hry : fR y = 1) : False := by
  obtain ⟨hA, hp1, hp2⟩ := (compatP_r1_iff x y hrx hry).mp hxy
  set m := cl.length
  set R := rep32 m
  have hm := indep_all _ _ _ R cl h x hx
  obtain ⟨k, hk, hky⟩ := idx_of_mem hy
  -- the packs of the class
  have hPA : pack fA cl 0 0 = pk32 (fun i => fA (cl.getD i 0)) m :=
    pack_pk32 fA cl (fun z _ => lt_of_lt_of_le (fA_lt z) (by norm_num))
  have hXor : Nat.xor (pack fA cl 0 0) (Nat.mul (fA x) R) = pk32 (fun i => fA (cl.getD i 0) ^^^ fA x) m := by
    apply Nat.eq_of_testBit_eq; intro p
    show (pack fA cl 0 0 ^^^ fA x * R).testBit p = _
    have hb1 : ∀ i < m, fA (cl.getD i 0) < 2 ^ 32 := fun i _ => lt_of_lt_of_le (fA_lt _) (by norm_num)
    have hb2 : ∀ i < m, fA (cl.getD i 0) ^^^ fA x < 2 ^ 32 := fun i _ =>
      lt_of_lt_of_le (Nat.xor_lt_two_pow (fA_lt9 _) (fA_lt9 _)) (by norm_num)
    rw [Nat.testBit_xor, hPA, testBit_pk32 _ m p hb1, testBit_mul_rep32 _ m p (lt_of_lt_of_le (fA_lt x) (by norm_num)),
      testBit_pk32 _ m p hb2, Nat.testBit_xor]
    cases decide (p / 32 < m) <;> simp
  have hbit := congrArg (fun z => z.testBit (32 * k)) hm
  simp only [Nat.zero_testBit] at hbit
  change ((nz32 (Nat.xor (pack fA cl 0 0) (Nat.mul (fA x) R)) R) &&&
    (R ^^^ (swarPar (pack (fun x => fXV x 0) cl 0 0) R (fYU x 0) ||| swarPar (pack (fun x => fYU x 0) cl 0 0) R (fXV x 0)))).testBit
      (32 * k) = false at hbit
  rw [Nat.testBit_and, hXor, testBit_nz32 _ m _ (fun i _ =>
      lt_of_lt_of_le (Nat.xor_lt_two_pow (fA_lt9 _) (fA_lt9 _)) (by norm_num))] at hbit
  rw [Nat.testBit_xor, Nat.testBit_or, testBit_rep32, swarPar_testBit _ _ m _ (lt_of_lt_of_le (fYU_lt x 0) (by norm_num)),
    swarPar_testBit _ _ m _ (lt_of_lt_of_le (fXV_lt x 0) (by norm_num))] at hbit
  have e1 : 32 * k / 32 = k := by omega
  have e2 : 32 * k % 32 = 0 := by omega
  rw [e1, e2] at hbit
  rw [fld_pack (fun x => fXV x 0) cl (fun z _ => lt_of_lt_of_le (fXV_lt z 0) (by norm_num)) k hk,
    fld_pack (fun x => fYU x 0) cl (fun z _ => lt_of_lt_of_le (fYU_lt z 0) (by norm_num)) k hk, hky] at hbit
  have hne : fA y ^^^ fA x ≠ 0 := xor_ne_zero (Ne.symm hA)
  have q1 : parZ (fXV y 0 &&& fYU x 0) ≠ 1 := by
    rw [parZ_and_comm, (par32_zero_iff _).mp hp1]; decide
  have q2 : parZ (fYU y 0 &&& fXV x 0) ≠ 1 := by
    rw [(par32_zero_iff _).mp hp2]; decide
  simp [hne, q1, q2] at hbit
  omega

/-! ## candidates of a clique -/

/-- the packed term of a candidate has rank 1 and its fields -/
theorem cand_bounds {r1 : R1} {PB1 PC1 nB nC okb okc : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {x : ℕ × ℕ × ℕ}
    (hx : Cand r1 PB1 PC1 okb okc x) :
    x.2.1 < nB ∧ x.2.2 < nC ∧ fld PB1 x.2.1 < 2 ^ 29 ∧ fld PC1 x.2.2 < 2 ^ 29 ∧ (grpAt r1 x.1).a < 512 := by
  obtain ⟨hg, hb1, hb2, hc1, hc2, -, -, -⟩ := hx
  obtain ⟨h1, h2, -, -, -, h6⟩ := grp_data hD hg
  have hb : x.2.1 < nB := by omega
  have hc : x.2.2 < nC := by omega
  exact ⟨hb, hc, hD.fB _ hb, hD.fC _ hc, h6⟩

theorem fR_term1 {r1 : R1} {PB1 PC1 nB nC okb okc : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {x : ℕ × ℕ × ℕ}
    (hx : Cand r1 PB1 PC1 okb okc x) : fR (term1 r1 PB1 PC1 x) = 1 := by
  obtain ⟨-, -, hB, hC, -⟩ := cand_bounds hD hx
  exact fR_mk _ _ _ hC hB

/-- compatibility of the terms of two candidates -/
theorem CP_term1 {r1 : R1} {PB1 PC1 nB nC okb okc okb' okc' : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {x y : ℕ × ℕ × ℕ}
    (hx : Cand r1 PB1 PC1 okb okc x) (hy : Cand r1 PB1 PC1 okb' okc' y) :
    CP (term1 r1 PB1 PC1 x) (term1 r1 PB1 PC1 y) ↔ (grpAt r1 x.1).a ≠ (grpAt r1 y.1).a ∧
      par32 (fld PC1 x.2.2 &&& fld PB1 y.2.1) = 0 ∧ par32 (fld PC1 y.2.2 &&& fld PB1 x.2.1) = 0 := by
  obtain ⟨-, -, hBx, hCx, hax⟩ := cand_bounds hD hx
  obtain ⟨-, -, hBy, hCy, hay⟩ := cand_bounds hD hy
  exact compatP_mk _ _ _ _ _ _ hCx hBx hax hCy hBy hay

theorem CP_symm {r1 : R1} {PB1 PC1 nB nC okb okc okb' okc' : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {x y : ℕ × ℕ × ℕ}
    (hx : Cand r1 PB1 PC1 okb okc x) (hy : Cand r1 PB1 PC1 okb' okc' y)
    (h : CP (term1 r1 PB1 PC1 x) (term1 r1 PB1 PC1 y)) : CP (term1 r1 PB1 PC1 y) (term1 r1 PB1 PC1 x) := by
  obtain ⟨h1, h2, h3⟩ := (CP_term1 hD hx hy).mp h
  exact (CP_term1 hD hy hx).mpr ⟨Ne.symm h1, h3, h2⟩

/-- pairwise compatible candidates lie in distinct groups -/
theorem grp_ne {r1 : R1} {PB1 PC1 nB nC okb okc : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {x y : ℕ × ℕ × ℕ}
    (hx : Cand r1 PB1 PC1 okb okc x) (hy : Cand r1 PB1 PC1 okb okc y)
    (h : CP (term1 r1 PB1 PC1 x) (term1 r1 PB1 PC1 y)) : x.1 ≠ y.1 := by
  intro e
  have := ((CP_term1 hD hx hy).mp h).1
  rw [e] at this; exact this rfl

/-- a clique of candidates: in distinct groups, and the list has no repetition -/
theorem clique_nodup {r1 : R1} {PB1 PC1 nB nC okb okc : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {L : List (ℕ × ℕ × ℕ)}
    (hc : ∀ x ∈ L, Cand r1 PB1 PC1 okb okc x) (hp : L.Pairwise (fun x y => CP (term1 r1 PB1 PC1 x) (term1 r1 PB1 PC1 y))) :
    (L.map Prod.fst).Nodup := by
  rw [List.Nodup, List.pairwise_map]
  exact List.Pairwise.imp_of_mem (fun {x y} hx hy h => grp_ne hD (hc x hx) (hc y hy) h) hp

/-! ## the three cases -/

/-- **cnt**: fewer than `need` groups may hold a candidate, and a clique uses distinct groups -/
theorem cnt_sound {r1 : R1} {PB1 PC1 nB nC : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {need okb okc : ℕ}
    {cs : List (Option (List ℕ × List ℕ))} {n : ℕ} (hc : cntOK okb okc r1.gs cs 0 = some n) (hn : n < need) :
    NoClique r1 PB1 PC1 need okb okc := by
  rintro ⟨L, hlen, hcand, hpw⟩
  obtain ⟨S, hS1, hS2, hS3⟩ := cntOK_spec okb okc r1.gs cs 0 n hc
  -- every member's group is in `S`
  have hin : ∀ x ∈ L, x.1 ∈ S := by
    intro x hx
    by_contra hnot
    obtain ⟨obs, ocs, he⟩ := hS3 x.1 (hcand x hx).1 hnot
    exact grpEmpty_sound hD (hcand x hx).1 he x (hcand x hx) rfl
  have hsub : (L.map Prod.fst).toFinset ⊆ S := by
    intro g hg
    rw [List.mem_toFinset, List.mem_map] at hg
    obtain ⟨x, hx, rfl⟩ := hg
    exact hin x hx
  have hcard := Finset.card_le_card hsub
  rw [List.toFinset_card_of_nodup (clique_nodup hD hcand hpw), List.length_map] at hcard
  omega

/-- **col**: every candidate is in one of 16 classes; with `need ≥ 17` two clique members share a class -/
theorem col_sound {r1 : R1} {PB1 PC1 nB nC : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {need okb okc : ℕ}
    {cs : List (List ℕ × List ℕ × List (List ℕ))} {cols : ℕ} {cl : List (List ℕ)}
    (hc : colOK okb okc r1.gs cs cols empty16 = some cl) (hok : classesOK cl = true) (hneed : 17 ≤ need) :
    NoClique r1 PB1 PC1 need okb okc := by
  rintro ⟨L, hlen, hcand, hpw⟩
  obtain ⟨-, -, hcol⟩ := colOK_spec okb okc r1.gs cs cols empty16 cl rfl hc
  -- every candidate's term is coloured
  have hcl : ∀ x ∈ L, ∃ k < 16, term1 r1 PB1 PC1 x ∈ cl.getD k [] := by
    rintro ⟨gi, b, c⟩ hx
    have hxc := hcand _ hx
    obtain ⟨hg, hb1, hb2, hc1, hc2, hokb, hokc, hpar⟩ := hxc
    simp only at hg hb1 hb2 hc1 hc2 hokb hokc hpar
    obtain ⟨-, -, hPB, hPC, -, -⟩ := grp_data hD hg
    obtain ⟨obs, ocs, hobs, hocs, hmem⟩ := hcol gi hg
    simp only [grpAt] at hb1 hb2 hc1 hc2 hPB hPC hokb hokc ⊢
    have hbL := listed_of obs okb _ _ b hobs hb1 hb2 hokb
    have hcL := listed_of ocs okc _ _ c hocs hc1 hc2 hokc
    obtain ⟨i, hi, hie⟩ := idx_of_mem hcL
    have e1 : (r1.gs.getD gi g0).lb + (b - (r1.gs.getD gi g0).lb) = b := by omega
    have e2 : (r1.gs.getD gi g0).lc + (c - (r1.gs.getD gi g0).lc) = c := by omega
    have hfP : fld (packC (r1.gs.getD gi g0).PC ocs 0 0).1 i = fld PC1 c := by
      rw [packC_fld _ ocs i hi, hie, hPC _ (by omega), e2]
    have hfB : get32 (r1.gs.getD gi g0).PB (b - (r1.gs.getD gi g0).lb) = fld PB1 b := by
      rw [hPB _ (by omega), e1]
    have hbit : (swarPar (packC (r1.gs.getD gi g0).PC ocs 0 0).1 (rep32 (packC (r1.gs.getD gi g0).PC ocs 0 0).2)
        (get32 (r1.gs.getD gi g0).PB (b - (r1.gs.getD gi g0).lb))).testBit (32 * i) = true := by
      rw [packC_snd]
      apply (swar_bit _ _ _ i (get32_lt _ _) hi).mpr
      rw [hfP, hfB]; exact (par32_one_iff _).mp hpar
    obtain ⟨k, hk, hm⟩ := hmem _ hbL i hbit
    refine ⟨k, hk, ?_⟩
    rw [get32_eq, hfP, hfB] at hm
    exact hm
  -- pigeonhole over the 16 classes
  let f : Fin L.length → Fin 16 := fun p => ⟨Classical.choose (hcl _ (List.getElem_mem p.2)),
    (Classical.choose_spec (hcl _ (List.getElem_mem p.2))).1⟩
  have hf : ∀ p : Fin L.length, term1 r1 PB1 PC1 L[p] ∈ cl.getD (f p) [] := fun p =>
    (Classical.choose_spec (hcl _ (List.getElem_mem p.2))).2
  obtain ⟨p, q, hpq, hfpq⟩ := Fintype.exists_ne_map_eq_of_card_lt f (by simp; omega)
  have hclass := classesOK_get cl hok (f q)
  have hxp := hf p
  have hxq := hf q
  rw [hfpq] at hxp
  have hcp := hcand _ (List.getElem_mem p.2)
  have hcq := hcand _ (List.getElem_mem q.2)
  rcases Nat.lt_or_gt_of_ne (fun e => hpq (Fin.ext e)) with hlt | hlt
  · have hC := List.pairwise_iff_getElem.mp hpw p q p.2 q.2 hlt
    exact classOK_sound _ hclass _ _ hxp hxq hC (fR_term1 hD hcp) (fR_term1 hD hcq)
  · have hC := List.pairwise_iff_getElem.mp hpw q p q.2 p.2 hlt
    exact classOK_sound _ hclass _ _ hxq hxp hC (fR_term1 hD hcq) (fR_term1 hD hcp)

/-- **col** (the guarded D2 of md5 48bab26f…): every candidate is in one of the classes `< need - 1` (the classes from
`need - 1` on are empty), so `need` clique members put two in one class -/
theorem col_sound' {r1 : R1} {PB1 PC1 nB nC : ℕ} (hD : R1Data r1 PB1 PC1 nB nC) {need okb okc : ℕ}
    {cs : List (List ℕ × List ℕ × List (List ℕ))} {cols : ℕ} {cl : List (List ℕ)}
    (hc : colOK okb okc r1.gs cs cols empty16 = some cl) (hok : classesOK cl = true)
    (hdrop : (cl.drop (Nat.pred need)).all List.isEmpty = true) (hneed : 1 ≤ need) :
    NoClique r1 PB1 PC1 need okb okc := by
  rintro ⟨L, hlen, hcand, hpw⟩
  obtain ⟨-, -, hcol⟩ := colOK_spec okb okc r1.gs cs cols empty16 cl rfl hc
  -- every candidate's term is coloured
  have hcl : ∀ x ∈ L, ∃ k < 16, term1 r1 PB1 PC1 x ∈ cl.getD k [] := by
    rintro ⟨gi, b, c⟩ hx
    have hxc := hcand _ hx
    obtain ⟨hg, hb1, hb2, hc1, hc2, hokb, hokc, hpar⟩ := hxc
    simp only at hg hb1 hb2 hc1 hc2 hokb hokc hpar
    obtain ⟨-, -, hPB, hPC, -, -⟩ := grp_data hD hg
    obtain ⟨obs, ocs, hobs, hocs, hmem⟩ := hcol gi hg
    simp only [grpAt] at hb1 hb2 hc1 hc2 hPB hPC hokb hokc ⊢
    have hbL := listed_of obs okb _ _ b hobs hb1 hb2 hokb
    have hcL := listed_of ocs okc _ _ c hocs hc1 hc2 hokc
    obtain ⟨i, hi, hie⟩ := idx_of_mem hcL
    have e1 : (r1.gs.getD gi g0).lb + (b - (r1.gs.getD gi g0).lb) = b := by omega
    have e2 : (r1.gs.getD gi g0).lc + (c - (r1.gs.getD gi g0).lc) = c := by omega
    have hfP : fld (packC (r1.gs.getD gi g0).PC ocs 0 0).1 i = fld PC1 c := by
      rw [packC_fld _ ocs i hi, hie, hPC _ (by omega), e2]
    have hfB : get32 (r1.gs.getD gi g0).PB (b - (r1.gs.getD gi g0).lb) = fld PB1 b := by
      rw [hPB _ (by omega), e1]
    have hbit : (swarPar (packC (r1.gs.getD gi g0).PC ocs 0 0).1 (rep32 (packC (r1.gs.getD gi g0).PC ocs 0 0).2)
        (get32 (r1.gs.getD gi g0).PB (b - (r1.gs.getD gi g0).lb))).testBit (32 * i) = true := by
      rw [packC_snd]
      apply (swar_bit _ _ _ i (get32_lt _ _) hi).mpr
      rw [hfP, hfB]; exact (par32_one_iff _).mp hpar
    obtain ⟨k, hk, hm⟩ := hmem _ hbL i hbit
    refine ⟨k, hk, ?_⟩
    rw [get32_eq, hfP, hfB] at hm
    exact hm
  -- the classes from `need - 1` on are empty
  have hempty : ∀ k, Nat.pred need ≤ k → cl.getD k [] = [] := by
    intro k hk
    rw [List.all_eq_true] at hdrop
    by_cases hkl : k < cl.length
    · have hm : cl[k] ∈ cl.drop (Nat.pred need) := by
        rw [List.mem_iff_getElem]
        refine ⟨k - Nat.pred need, by rw [List.length_drop]; omega, ?_⟩
        rw [List.getElem_drop]
        congr 1; omega
      have he := hdrop _ hm
      rw [List.getD_eq_getElem _ _ hkl]
      exact List.isEmpty_iff.mp he
    · rw [List.getD_eq_default _ _ (by omega)]
  have hcl' : ∀ x ∈ L, ∃ k < Nat.pred need, term1 r1 PB1 PC1 x ∈ cl.getD k [] := by
    intro x hx
    obtain ⟨k, -, hm⟩ := hcl x hx
    refine ⟨k, ?_, hm⟩
    by_contra hge
    push Not at hge
    rw [hempty k hge] at hm
    exact absurd hm List.not_mem_nil
  -- pigeonhole over the `need - 1` classes
  let f : Fin L.length → Fin (Nat.pred need) := fun p => ⟨Classical.choose (hcl' _ (List.getElem_mem p.2)),
    (Classical.choose_spec (hcl' _ (List.getElem_mem p.2))).1⟩
  have hf : ∀ p : Fin L.length, term1 r1 PB1 PC1 L[p] ∈ cl.getD (f p) [] := fun p =>
    (Classical.choose_spec (hcl' _ (List.getElem_mem p.2))).2
  obtain ⟨p, q, hpq, hfpq⟩ := Fintype.exists_ne_map_eq_of_card_lt f (by simp; omega)
  have hclass := classesOK_get cl hok (f q)
  have hxp := hf p
  have hxq := hf q
  rw [hfpq] at hxp
  have hcp := hcand _ (List.getElem_mem p.2)
  have hcq := hcand _ (List.getElem_mem q.2)
  rcases Nat.lt_or_gt_of_ne (fun e => hpq (Fin.ext e)) with hlt | hlt
  · have hC := List.pairwise_iff_getElem.mp hpw p q p.2 q.2 hlt
    exact classOK_sound _ hclass _ _ hxp hxq hC (fR_term1 hD hcp) (fR_term1 hD hcq)
  · have hC := List.pairwise_iff_getElem.mp hpw q p q.2 p.2 hlt
    exact classOK_sound _ hclass _ _ hxq hxp hC (fR_term1 hD hcq) (fR_term1 hD hcp)

end GS.PD
