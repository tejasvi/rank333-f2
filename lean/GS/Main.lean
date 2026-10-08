module
public import R22Port.U_d41d8cd98f00
public import GS.Top
/-! # The six `NoFam_*` (conditional on the tracks' theorems)

`noFam_17_4_1_of`, `noFam_17_5_0_of` (shape S), `noFam_18_2_2_of` (C2), `noFam_19_0_3_of` (W), `noFam_17_3_2_of` (C3),
`noFam_18_1_3_of` (Q): from `PhaseAThm`, `PhaseDThm`, the shape theorem and the acceptance statement. -/
@[expose] public section
namespace GS
open G G.V2 G.D2 G.A2 G.Acc

/-- distinct ranks give distinct members -/
theorem ne_of_rank {s x : State} {r r' : ℕ} (hs : rk s.a = r) (hx : rk x.a = r') (h : r ≠ r') : s ≠ x := by
  rintro rfl; exact h (hs.symm.trans hx)

/-- the core members are compatible with the rank-1 members -/
theorem core_comp {d : ℕ} {t0 : State} {F : List State} (hF : Family d (t0 :: F)) {L1 : List State}
    (hL1 : FamOK d t0 1 L1) (hm1 : ∀ s ∈ L1, s ∈ F) {coreSt : List State} (hcF : ∀ s ∈ coreSt, s ∈ F)
    (hcr : ∀ s ∈ coreSt, rk s.a ≠ 1) : ∀ x ∈ L1, ∀ s ∈ coreSt, Compat d s x := by
  intro x hx s hs
  exact fam_pair hF s (hcF s hs) x (hm1 x hx) (fun e => hcr s hs (e ▸ hL1.rank x hx))

theorem fin4_min (c : Fin 4 → ℕ) (hinj : Function.Injective c) : ∃ m : Fin 4, ∀ i, i ≠ m → c m < c i := by
  obtain ⟨m, -, hm⟩ := Finset.exists_min_image Finset.univ c ⟨0, Finset.mem_univ _⟩
  exact ⟨m, fun i hi => lt_of_le_of_ne (hm i (Finset.mem_univ _)) (fun e => hi (hinj e).symm)⟩

/-- the shape-S core from a base of least record index -/
theorem shapeS_core {o : Orb2} {nRec : ℕ} (hSh : ShapeS o nRec) {d : ℕ} (s : Fin 4 → State) (c j : Fin 4 → ℕ)
    (hV : ∀ i, Vert o nRec (c i) (j i)) (hvt : ∀ i, vt o (c i) (j i) = pkState d (s i))
    (hCP : ∀ i i', i ≠ i' → CP (pkState d (s i)) (pkState d (s i'))) (m a b e : Fin 4) (hma : m ≠ a) (hmb : m ≠ b)
    (hme : m ≠ e) (hab : a ≠ b) (hae : a ≠ e) (hbe : b ≠ e) (h1 : c m < c a) (h2 : c m < c b) (h3 : c m < c e) :
    Refuted o.r1 17 ([s m, s a, s b, s e].map (pkState d)) := by
  have := hSh (c m) (j m) (c a) (j a) (c b) (j b) (c e) (j e) (hV m) (hV a) (hV b) (hV e) h1 h2 h3
    (by rw [hvt, hvt]; exact hCP m a hma) (by rw [hvt, hvt]; exact hCP m b hmb) (by rw [hvt, hvt]; exact hCP m e hme)
    (by rw [hvt, hvt]; exact hCP a b hab) (by rw [hvt, hvt]; exact hCP a e hae) (by rw [hvt, hvt]; exact hCP b e hbe)
  rw [hvt m, hvt a, hvt b, hvt e] at this
  simpa using this

/-- **shape S**: four rank-2 members and 17 rank-1 members are impossible -/
theorem shapeS_contra {d : ℕ} (hd : d ≤ 2) {t0 : State} {F : List State} (hF : Family d (t0 :: F)) {o : Orb2}
    {PB1 PC1 nB nC PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hR1 : R1Data o.r1 PB1 PC1 nB nC)
    (hC1 : R1Complete d t0 o.r1 PB1 PC1) (hOF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3) (hRec : RecComplete d t0 o nRec)
    (hSh : ShapeS o nRec) (hD : ∀ need okb okc cert, coreOK o.r1 need okb okc cert = true → NoClique o.r1 PB1 PC1 need okb okc)
    (h1 : 17 ≤ count 1 F) (h2 : 4 ≤ count 2 F) : False := by
  classical
  obtain ⟨L2, hl2, hL2, hm2⟩ := fam_take hF 2 4 h2
  obtain ⟨L1, hl1, hL1, hm1⟩ := fam_take hF 1 17 h1
  let s : Fin 4 → State := fun i => L2.getD i default
  have hsm : ∀ i : Fin 4, s i ∈ L2 := fun i => famOK_mem hL2 (by rw [hl2]; exact i.2)
  have hv : ∀ i : Fin 4, ∃ c j, Vert o nRec c j ∧ vt o c j = pkState d (s i) :=
    fun i => hRec _ (hL2.valid _ (hsm i)) (hL2.anchor _ (hsm i)) (hL2.rank _ (hsm i))
  choose c j hVt using hv
  have hpair : ∀ i i' : Fin 4, i ≠ i' → Compat d (s i) (s i') := fun i i' h =>
    hL2.pair i (by rw [hl2]; exact i.2) i' (by rw [hl2]; exact i'.2) (fun e => h (Fin.ext e))
  have hinj : Function.Injective c := by
    intro i i' e
    by_contra hne
    exact vert_ne hOF hd (hVt i).1 (hVt i').1 (hVt i).2 (hVt i').2 (hL2.valid _ (hsm i)).2.1 (hL2.valid _ (hsm i')).2.1
      (hpair i i' hne).1 e
  have hCP : ∀ i i', i ≠ i' → CP (pkState d (s i)) (pkState d (s i')) := fun i i' h =>
    compat_CP hd (hL2.valid _ (hsm i)) (hL2.valid _ (hsm i')) (hpair i i' h)
  obtain ⟨m, hm⟩ := fin4_min c hinj
  -- the core and the contradiction, given the order of the other three
  have finish : ∀ a b e : Fin 4, m ≠ a → m ≠ b → m ≠ e → a ≠ b → a ≠ e → b ≠ e → False := by
    intro a b e hma hmb hme hab hae hbe
    have hr := shapeS_core hSh s c j (fun i => (hVt i).1) (fun i => (hVt i).2) hCP m a b e hma hmb hme hab hae hbe
      (hm a (Ne.symm hma)) (hm b (Ne.symm hmb)) (hm e (Ne.symm hme))
    obtain ⟨cert, hcert⟩ := hr
    have hcore : ∀ u ∈ [s m, s a, s b, s e], u ∈ L2 := by
      intro u hu; simp only [List.mem_cons, List.not_mem_nil, or_false] at hu
      rcases hu with rfl | rfl | rfl | rfl <;> exact hsm _
    exact clique_contra hd hR1 hC1 [s m, s a, s b, s e] (fun u hu => hL2.valid u (hcore u hu))
      (hD 17 _ _ cert hcert) L1 hL1 hl1
      (core_comp hF hL1 hm1 (fun u hu => hm2 u (hcore u hu)) (fun u hu => by rw [hL2.rank u (hcore u hu)]; decide))
  fin_cases m
  · exact finish 1 2 3 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · exact finish 0 2 3 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · exact finish 0 1 3 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · exact finish 0 1 2 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)

/-- **(17,4,1)** -/
theorem noFam_17_4_1_of (hA : PhaseAThm) (hD : PhaseDThm) (hS : ShapeThmS) (hacc : Accept_d1S) : NoFam_17_4_1 := by
  intro t0 ht0
  rintro ⟨F, hF, h1, h2, -⟩
  obtain ⟨A, hSOK⟩ := hacc t0 ht0
  obtain ⟨hR1, hC1, hOF, hRec, -⟩ := hA 1 t0 true A (by norm_num) (fam_valid0 hF)
  exact shapeS_contra (by norm_num) hF hR1 hC1 hOF hRec (hS A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 true hOF hSOK)
    (hD _ _ _ _ _ hR1) h1 h2

/-- **(17,5,0)** -/
theorem noFam_17_5_0_of (hA : PhaseAThm) (hD : PhaseDThm) (hS : ShapeThmS) (hacc : Accept_d0S) : NoFam_17_5_0 := by
  intro t0 ht0
  rintro ⟨F, hF, h1, h2, -⟩
  obtain ⟨A, hSOK⟩ := hacc t0 ht0
  obtain ⟨hR1, hC1, hOF, hRec, -⟩ := hA 0 t0 false A (by norm_num) (fam_valid0 hF)
  exact shapeS_contra (by norm_num) hF hR1 hC1 hOF hRec (hS A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 false hOF hSOK)
    (hD _ _ _ _ _ hR1) h1 h2

/-! ## rank-3 bases -/

/-- the members of one rank as vertices / V3 entries -/
theorem mem_v3 {d : ℕ} {t0 : State} {o : Orb2} {nV3 : ℕ} (hV3 : V3Complete d t0 o nV3) {L : List State}
    (hL : FamOK d t0 3 L) {i : ℕ} (hi : i < L.length) : ∃ iv < nV3, v3term o iv = pkState d (L.getD i default) :=
  hV3 _ (hL.valid _ (famOK_mem hL hi)) (hL.anchor _ (famOK_mem hL hi)) (hL.rank _ (famOK_mem hL hi))

theorem mem_vt {d : ℕ} {t0 : State} {o : Orb2} {nRec : ℕ} (hRec : RecComplete d t0 o nRec) {L : List State}
    (hL : FamOK d t0 2 L) {i : ℕ} (hi : i < L.length) : ∃ c j, Vert o nRec c j ∧ vt o c j = pkState d (L.getD i default) :=
  hRec _ (hL.valid _ (famOK_mem hL hi)) (hL.anchor _ (famOK_mem hL hi)) (hL.rank _ (famOK_mem hL hi))

/-- **(18,2,2)**: one rank-3, two rank-2, 18 rank-1 members -/
theorem noFam_18_2_2_of (hA : PhaseAThm) (hD : PhaseDThm) (hS : ShapeThm1) (hacc : Accept_d1V) : NoFam_18_2_2 := by
  intro t0 ht0
  rintro ⟨F, hF, h1, h2, h3⟩
  obtain ⟨A, hVOK⟩ := hacc t0 ht0
  obtain ⟨hR1, hC1, hOF, hRec, hV3⟩ := hA 1 t0 true A (by norm_num) (fam_valid0 hF)
  obtain ⟨hC2, -⟩ := hS A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 hOF hVOK
  obtain ⟨L3, hl3, hL3, hm3⟩ := fam_take hF 3 1 h3
  obtain ⟨L2, hl2, hL2, hm2⟩ := fam_take hF 2 2 h2
  obtain ⟨L1, hl1, hL1, hm1⟩ := fam_take hF 1 18 h1
  have hd : (1 : ℕ) ≤ 2 := by norm_num
  let v := L3.getD 0 default
  let s1 := L2.getD 0 default
  let s2 := L2.getD 1 default
  have hv : v ∈ L3 := famOK_mem hL3 (by omega)
  have hs1 : s1 ∈ L2 := famOK_mem hL2 (by omega)
  have hs2 : s2 ∈ L2 := famOK_mem hL2 (by omega)
  obtain ⟨iv, hiv, hvt⟩ := mem_v3 (hV3 rfl) hL3 (i := 0) (by omega)
  obtain ⟨c1, j1, hV1, hvt1⟩ := mem_vt hRec hL2 (i := 0) (by omega)
  obtain ⟨c2, j2, hV2, hvt2⟩ := mem_vt hRec hL2 (i := 1) (by omega)
  have hvs : ∀ s ∈ L2, Compat 1 v s := fun s hs =>
    fam_pair hF v (hm3 v hv) s (hm2 s hs) (ne_of_rank (hL3.rank v hv) (hL2.rank s hs) (by decide))
  have h12 : Compat 1 s1 s2 := hL2.pair 0 (by omega) 1 (by omega) (by decide)
  have hr := hC2 iv hiv c1 j1 c2 j2 hV1 hV2
    (by rw [hvt, hvt1]; exact compat_CP hd (hL3.valid v hv) (hL2.valid s1 hs1) (hvs s1 hs1))
    (by rw [hvt, hvt2]; exact compat_CP hd (hL3.valid v hv) (hL2.valid s2 hs2) (hvs s2 hs2))
    (by rw [hvt1, hvt2]; exact compat_CP hd (hL2.valid s1 hs1) (hL2.valid s2 hs2) h12)
  rw [hvt, hvt1, hvt2] at hr
  obtain ⟨cert, hcert⟩ := hr
  have hcore : ∀ u ∈ [v, s1, s2], u ∈ F ∧ Valid 1 u ∧ rk u.a ≠ 1 := by
    intro u hu; simp only [List.mem_cons, List.not_mem_nil, or_false] at hu
    rcases hu with rfl | rfl | rfl
    · exact ⟨hm3 _ hv, hL3.valid _ hv, by rw [hL3.rank _ hv]; decide⟩
    · exact ⟨hm2 _ hs1, hL2.valid _ hs1, by rw [hL2.rank _ hs1]; decide⟩
    · exact ⟨hm2 _ hs2, hL2.valid _ hs2, by rw [hL2.rank _ hs2]; decide⟩
  exact clique_contra hd hR1 hC1 [v, s1, s2] (fun u hu => (hcore u hu).2.1)
    (hD _ _ _ _ _ hR1 18 _ _ cert (by simpa using hcert)) L1 hL1 hl1
    (core_comp hF hL1 hm1 (fun u hu => (hcore u hu).1) (fun u hu => (hcore u hu).2.2))

/-- two rank-3 members as V3 entries in index order -/
theorem v3_pair {d : ℕ} (hd : d ≤ 2) {t0 : State} {o : Orb2} {nV3 : ℕ} (hV3 : V3Complete d t0 o nV3) {L : List State}
    (hL : FamOK d t0 3 L) (hl : 2 ≤ L.length) :
    ∃ iv < nV3, ∃ iw < nV3, iv < iw ∧ ∃ v w : State, v ∈ L ∧ w ∈ L ∧ Compat d v w ∧
      v3term o iv = pkState d v ∧ v3term o iw = pkState d w := by
  obtain ⟨i0, hi0, h0⟩ := mem_v3 hV3 hL (i := 0) (by omega)
  obtain ⟨i1, hi1, h1⟩ := mem_v3 hV3 hL (i := 1) (by omega)
  have hm0 := famOK_mem hL (i := 0) (by omega)
  have hm1 := famOK_mem hL (i := 1) (by omega)
  have hc01 := hL.pair 0 (by omega) 1 (by omega) (by decide)
  have hne : i0 ≠ i1 := v3_ne hd h0 h1 (hL.valid _ hm0).2.1 (hL.valid _ hm1).2.1 hc01.1
  rcases Nat.lt_or_gt_of_ne hne with hlt | hgt
  · exact ⟨i0, hi0, i1, hi1, hlt, _, _, hm0, hm1, hc01, h0, h1⟩
  · exact ⟨i1, hi1, i0, hi0, hgt, _, _, hm1, hm0, compat_symm hc01, h1, h0⟩

/-- **(19,0,3)**: two rank-3, 19 rank-1 members -/
theorem noFam_19_0_3_of (hA : PhaseAThm) (hD : PhaseDThm) (hS : ShapeThm1) (hacc : Accept_d1V) : NoFam_19_0_3 := by
  intro t0 ht0
  rintro ⟨F, hF, h1, -, h3⟩
  obtain ⟨A, hVOK⟩ := hacc t0 ht0
  obtain ⟨hR1, hC1, hOF, hRec, hV3⟩ := hA 1 t0 true A (by norm_num) (fam_valid0 hF)
  obtain ⟨-, hW⟩ := hS A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 hOF hVOK
  obtain ⟨L3, hl3, hL3, hm3⟩ := fam_take hF 3 2 h3
  obtain ⟨L1, hl1, hL1, hm1⟩ := fam_take hF 1 19 h1
  have hd : (1 : ℕ) ≤ 2 := by norm_num
  obtain ⟨iv, hiv, iw, hiw, hlt, v, w, hv, hw, hvw, hvt, hwt⟩ := v3_pair hd (hV3 rfl) hL3 (by omega)
  have hr := hW iv hiv iw hiw hlt (by rw [hvt, hwt]; exact compat_CP hd (hL3.valid v hv) (hL3.valid w hw) hvw)
  rw [hvt, hwt] at hr
  obtain ⟨cert, hcert⟩ := hr
  have hcore : ∀ u ∈ [v, w], u ∈ F ∧ Valid 1 u ∧ rk u.a ≠ 1 := by
    intro u hu; simp only [List.mem_cons, List.not_mem_nil, or_false] at hu
    rcases hu with rfl | rfl
    · exact ⟨hm3 _ hv, hL3.valid _ hv, by rw [hL3.rank _ hv]; decide⟩
    · exact ⟨hm3 _ hw, hL3.valid _ hw, by rw [hL3.rank _ hw]; decide⟩
  exact clique_contra hd hR1 hC1 [v, w] (fun u hu => (hcore u hu).2.1)
    (hD _ _ _ _ _ hR1 19 _ _ cert (by simpa using hcert)) L1 hL1 hl1
    (core_comp hF hL1 hm1 (fun u hu => (hcore u hu).1) (fun u hu => (hcore u hu).2.2))

/-- **(17,3,2)**: one rank-3, three rank-2, 17 rank-1 members -/
theorem noFam_17_3_2_of (hA : PhaseAThm) (hD : PhaseDThm) (hS : ShapeThm2) (hacc : Accept_d2) : NoFam_17_3_2 := by
  intro t0 ht0
  rintro ⟨F, hF, h1, h2, h3⟩
  obtain ⟨A, hVOK⟩ := hacc t0 ht0
  obtain ⟨hR1, hC1, hOF, hRec, hV3⟩ := hA 2 t0 true A (by norm_num) (fam_valid0 hF)
  obtain ⟨hC3, -⟩ := hS A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 hOF hVOK
  obtain ⟨L3, hl3, hL3, hm3⟩ := fam_take hF 3 1 h3
  obtain ⟨L2, hl2, hL2, hm2⟩ := fam_take hF 2 3 h2
  obtain ⟨L1, hl1, hL1, hm1⟩ := fam_take hF 1 17 h1
  have hd : (2 : ℕ) ≤ 2 := le_rfl
  let v := L3.getD 0 default
  let s1 := L2.getD 0 default
  let s2 := L2.getD 1 default
  let s3 := L2.getD 2 default
  have hv : v ∈ L3 := famOK_mem hL3 (by omega)
  have hs1 : s1 ∈ L2 := famOK_mem hL2 (by omega)
  have hs2 : s2 ∈ L2 := famOK_mem hL2 (by omega)
  have hs3 : s3 ∈ L2 := famOK_mem hL2 (by omega)
  obtain ⟨iv, hiv, hvt⟩ := mem_v3 (hV3 rfl) hL3 (i := 0) (by omega)
  obtain ⟨c1, j1, hV1, hvt1⟩ := mem_vt hRec hL2 (i := 0) (by omega)
  obtain ⟨c2, j2, hV2, hvt2⟩ := mem_vt hRec hL2 (i := 1) (by omega)
  obtain ⟨c3, j3, hV3', hvt3⟩ := mem_vt hRec hL2 (i := 2) (by omega)
  have hvs : ∀ s ∈ L2, Compat 2 v s := fun s hs =>
    fam_pair hF v (hm3 v hv) s (hm2 s hs) (ne_of_rank (hL3.rank v hv) (hL2.rank s hs) (by decide))
  have hr := hC3 iv hiv c1 j1 c2 j2 c3 j3 hV1 hV2 hV3'
    (by rw [hvt, hvt1]; exact compat_CP hd (hL3.valid v hv) (hL2.valid s1 hs1) (hvs s1 hs1))
    (by rw [hvt, hvt2]; exact compat_CP hd (hL3.valid v hv) (hL2.valid s2 hs2) (hvs s2 hs2))
    (by rw [hvt, hvt3]; exact compat_CP hd (hL3.valid v hv) (hL2.valid s3 hs3) (hvs s3 hs3))
    (by rw [hvt1, hvt2]; exact compat_CP hd (hL2.valid s1 hs1) (hL2.valid s2 hs2) (hL2.pair 0 (by omega) 1 (by omega) (by decide)))
    (by rw [hvt1, hvt3]; exact compat_CP hd (hL2.valid s1 hs1) (hL2.valid s3 hs3) (hL2.pair 0 (by omega) 2 (by omega) (by decide)))
    (by rw [hvt2, hvt3]; exact compat_CP hd (hL2.valid s2 hs2) (hL2.valid s3 hs3) (hL2.pair 1 (by omega) 2 (by omega) (by decide)))
  rw [hvt, hvt1, hvt2, hvt3] at hr
  obtain ⟨cert, hcert⟩ := hr
  have hcore : ∀ u ∈ [v, s1, s2, s3], u ∈ F ∧ Valid 2 u ∧ rk u.a ≠ 1 := by
    intro u hu; simp only [List.mem_cons, List.not_mem_nil, or_false] at hu
    rcases hu with rfl | rfl | rfl | rfl
    · exact ⟨hm3 _ hv, hL3.valid _ hv, by rw [hL3.rank _ hv]; decide⟩
    · exact ⟨hm2 _ hs1, hL2.valid _ hs1, by rw [hL2.rank _ hs1]; decide⟩
    · exact ⟨hm2 _ hs2, hL2.valid _ hs2, by rw [hL2.rank _ hs2]; decide⟩
    · exact ⟨hm2 _ hs3, hL2.valid _ hs3, by rw [hL2.rank _ hs3]; decide⟩
  exact clique_contra hd hR1 hC1 [v, s1, s2, s3] (fun u hu => (hcore u hu).2.1)
    (hD _ _ _ _ _ hR1 17 _ _ cert (by simpa using hcert)) L1 hL1 hl1
    (core_comp hF hL1 hm1 (fun u hu => (hcore u hu).1) (fun u hu => (hcore u hu).2.2))

/-- **(18,1,3)**: two rank-3, one rank-2, 18 rank-1 members -/
theorem noFam_18_1_3_of (hA : PhaseAThm) (hD : PhaseDThm) (hS : ShapeThm2) (hacc : Accept_d2) : NoFam_18_1_3 := by
  intro t0 ht0
  rintro ⟨F, hF, h1, h2, h3⟩
  obtain ⟨A, hVOK⟩ := hacc t0 ht0
  obtain ⟨hR1, hC1, hOF, hRec, hV3⟩ := hA 2 t0 true A (by norm_num) (fam_valid0 hF)
  obtain ⟨-, hQ⟩ := hS A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 hOF hVOK
  obtain ⟨L3, hl3, hL3, hm3⟩ := fam_take hF 3 2 h3
  obtain ⟨L2, hl2, hL2, hm2⟩ := fam_take hF 2 1 h2
  obtain ⟨L1, hl1, hL1, hm1⟩ := fam_take hF 1 18 h1
  have hd : (2 : ℕ) ≤ 2 := le_rfl
  obtain ⟨iv, hiv, iw, hiw, hlt, v, w, hv, hw, hvw, hvt, hwt⟩ := v3_pair hd (hV3 rfl) hL3 (by omega)
  let s := L2.getD 0 default
  have hs : s ∈ L2 := famOK_mem hL2 (by omega)
  obtain ⟨c, j, hV, hst⟩ := mem_vt hRec hL2 (i := 0) (by omega)
  have hc3 : ∀ u ∈ L3, Compat 2 u s := fun u hu =>
    fam_pair hF u (hm3 u hu) s (hm2 s hs) (ne_of_rank (hL3.rank u hu) (hL2.rank s hs) (by decide))
  have hr := hQ iv hiv iw hiw hlt (by rw [hvt, hwt]; exact compat_CP hd (hL3.valid v hv) (hL3.valid w hw) hvw) c j hV
    (by rw [hvt, hst]; exact compat_CP hd (hL3.valid v hv) (hL2.valid s hs) (hc3 v hv))
    (by rw [hwt, hst]; exact compat_CP hd (hL3.valid w hw) (hL2.valid s hs) (hc3 w hw))
  rw [hvt, hwt, hst] at hr
  obtain ⟨cert, hcert⟩ := hr
  have hcore : ∀ u ∈ [v, w, s], u ∈ F ∧ Valid 2 u ∧ rk u.a ≠ 1 := by
    intro u hu; simp only [List.mem_cons, List.not_mem_nil, or_false] at hu
    rcases hu with rfl | rfl | rfl
    · exact ⟨hm3 _ hv, hL3.valid _ hv, by rw [hL3.rank _ hv]; decide⟩
    · exact ⟨hm3 _ hw, hL3.valid _ hw, by rw [hL3.rank _ hw]; decide⟩
    · exact ⟨hm2 _ hs, hL2.valid _ hs, by rw [hL2.rank _ hs]; decide⟩
  exact clique_contra hd hR1 hC1 [v, w, s] (fun u hu => (hcore u hu).2.1)
    (hD _ _ _ _ _ hR1 18 _ _ cert (by simpa using hcert)) L1 hL1 hl1
    (core_comp hF hL1 hm1 (fun u hu => (hcore u hu).1) (fun u hu => (hcore u hu).2.2))

end GS

#print axioms GS.noFam_17_4_1_of
#print axioms GS.noFam_17_5_0_of
#print axioms GS.noFam_18_2_2_of
#print axioms GS.noFam_19_0_3_of
#print axioms GS.noFam_17_3_2_of
#print axioms GS.noFam_18_1_3_of
