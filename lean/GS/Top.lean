module
public import R22Port.U_d41d8cd98f00
public import GS.Ok
/-! # L5: the six `NoFam_*` from the tracks' theorems and the acceptance statements

Each `noFam_*_of` takes the phase-A theorem (`PhaseAThm`), the phase-D theorem (`PhaseDThm`), the shape theorem of its
check and the acceptance statement (`G/Accept.lean`), and proves the interface's `NoFam_*` (`G/Interface.lean`).
Common steps: `fam_pair` (distinct members are compatible), `vt_fA` (a vertex's first factor is its record's),
`clique_contra` (the `need` rank-1 members are a clique of candidates of the core's masks, which `NoClique` excludes). -/
@[expose] public section
namespace GS
open G G.V2 G.D2 G.A2 G.Acc

/-! ## families -/

theorem fam_pair {d : ℕ} {t0 : State} {F : List State} (h : Family d (t0 :: F)) :
    ∀ a ∈ F, ∀ b ∈ F, a ≠ b → Compat d a b :=
  List.Pairwise.forall (fun _ _ hc => compat_symm hc) (List.pairwise_cons.mp h.2).2

theorem fam_valid0 {d : ℕ} {t0 : State} {F : List State} (h : Family d (t0 :: F)) : Valid d t0 :=
  h.1 t0 List.mem_cons_self

/-! ## the rank-1 clique -/

/-- the parts of a rank-1 member (from `R1Complete`) -/
def PartsOK (d : ℕ) (r1 : R1) (PB1 PC1 : ℕ) (s : State) (x : ℕ × ℕ × ℕ) : Prop :=
  x.1 < r1.gs.length ∧ (grpAt r1 x.1).lb ≤ x.2.1 ∧ x.2.1 < (grpAt r1 x.1).lb + (grpAt r1 x.1).nb ∧
  (grpAt r1 x.1).lc ≤ x.2.2 ∧ x.2.2 < (grpAt r1 x.1).lc + (grpAt r1 x.1).nc ∧
  fld PB1 x.2.1 = fXV (pkState d s) 0 ∧ fld PC1 x.2.2 = fYU (pkState d s) 0 ∧ (grpAt r1 x.1).a = s.a

theorem parts_exists {d : ℕ} {T0 : State} {r1 : R1} {PB1 PC1 : ℕ} (hC : R1Complete d T0 r1 PB1 PC1) {s : State}
    (hv : Valid d s) (hc : Compat d T0 s) (hr : rk s.a = 1) : ∃ x, PartsOK d r1 PB1 PC1 s x := by
  obtain ⟨gi, b, c, h1, h2, h3, h4, h5, h6, h7, h8⟩ := hC s hv hc hr
  exact ⟨(gi, b, c), h1, h2, h3, h4, h5, h6, h7, h8⟩

theorem term1_parts {d : ℕ} (hd : d ≤ 2) {r1 : R1} {PB1 PC1 : ℕ} {s : State} (hv : Valid d s) (hr : rk s.a = 1)
    {x : ℕ × ℕ × ℕ} (hx : PartsOK d r1 PB1 PC1 s x) : term1 r1 PB1 PC1 x = pkState d s := by
  obtain ⟨_, _, _, _, _, hb, hc, ha⟩ := hx
  have hsa : s.a < 512 := hv.2.1
  unfold term1
  rw [hb, hc, ha, fYU_pk (by omega) hd hsa, fXV_pk (by omega) hd hsa, mkTerm1_eq, pkState_eq, hr]
  exact pkOf_congr (fun q hq => by
    have : q = 0 := by omega
    subst this; exact ⟨rfl, rfl⟩)

/-- **the rank-1 members are a clique of candidates**: excluded by `NoClique` -/
theorem clique_contra {d : ℕ} (hd : d ≤ 2) {T0 : State} {r1 : R1} {PB1 PC1 nB nC need : ℕ}
    (hR : R1Data r1 PB1 PC1 nB nC) (hC : R1Complete d T0 r1 PB1 PC1) (coreSt : List State)
    (hcv : ∀ s ∈ coreSt, Valid d s)
    (hNC : NoClique r1 PB1 PC1 need (okbOf r1 (coreSt.map (pkState d))) (okcOf r1 (coreSt.map (pkState d))))
    (L1 : List State) (hL1 : FamOK d T0 1 L1) (hlen : L1.length = need)
    (hcomp : ∀ x ∈ L1, ∀ s ∈ coreSt, Compat d s x) : False := by
  classical
  have hex : ∀ s ∈ L1, ∃ x, PartsOK d r1 PB1 PC1 s x :=
    fun s hs => parts_exists hC (hL1.valid s hs) (hL1.anchor s hs) (hL1.rank s hs)
  let cand : State → ℕ × ℕ × ℕ := fun s => if hs : s ∈ L1 then Classical.choose (hex s hs) else (0, 0, 0)
  have hcand : ∀ s ∈ L1, PartsOK d r1 PB1 PC1 s (cand s) := by
    intro s hs; simp only [cand, dif_pos hs]; exact Classical.choose_spec (hex s hs)
  apply hNC
  refine ⟨L1.map cand, by rw [List.length_map, hlen], ?_, ?_⟩
  · -- every member gives a candidate
    intro y hy
    obtain ⟨s, hs, rfl⟩ := List.mem_map.mp hy
    have hp := hcand s hs
    have hv := hL1.valid s hs
    have hr := hL1.rank s hs
    have hsa : s.a < 512 := hv.2.1
    obtain ⟨h1, h2, h3, h4, h5, hb, hc, ha⟩ := hp
    have hgr := (hR.grps _ h1)
    refine ⟨h1, h2, h3, h4, h5, ?_, ?_, ?_⟩
    · -- B-part OK for every core term
      apply okbOf_bit r1 nB hR.AB _ _ (by omega)
      intro t ht
      obtain ⟨u, hu, rfl⟩ := List.mem_map.mp ht
      have huv := hcv u hu
      have hua : u.a < 512 := huv.2.1
      have hfY : ∀ q < fR (pkState d u), fYU (pkState d u) q < 2 ^ 29 := by
        intro q hq; rw [fR_pk hd hua] at hq; rw [fYU_pk hq hd hua]; exact yuS_lt d u q hd
      refine (okB_bit r1 PB1 nB hR.SB hR.AB hR.fB _ hfY _).mpr ⟨by omega, fun q hq => ?_⟩
      rw [fR_pk hd hua] at hq
      rw [fYU_pk hq hd hua, hb, fXV_pk (by omega) hd hsa]
      exact compat_par hd (hcomp s hs u hu) q hq 0 (by omega)
    · -- C-part OK for every core term
      apply okcOf_bit r1 nC hR.AC _ _ (by omega)
      intro t ht
      obtain ⟨u, hu, rfl⟩ := List.mem_map.mp ht
      have huv := hcv u hu
      have hua : u.a < 512 := huv.2.1
      have hfX : ∀ q < fR (pkState d u), fXV (pkState d u) q < 2 ^ 29 := by
        intro q hq; rw [fR_pk hd hua] at hq; rw [fXV_pk hq hd hua]; exact xvS_lt d u q hd
      refine (okC_bit r1 PC1 nC hR.SC hR.AC hR.fC _ hfX _).mpr ⟨by omega, fun q hq => ?_⟩
      rw [fR_pk hd hua] at hq
      rw [fXV_pk hq hd hua, hc, fYU_pk (by omega) hd hsa]
      exact compat_par' hd (hcomp s hs u hu) 0 (by omega) q hq
    · -- diagonal parity
      rw [hb, hc, fYU_pk (by omega) hd hsa, fXV_pk (by omega) hd hsa]
      have := valid_par hd hv 0 (by omega) 0 (by omega)
      simpa using this
  · -- pairwise compatible
    rw [List.pairwise_map]
    apply List.pairwise_iff_getElem.mpr
    intro i j hi hj hij
    have hsi : L1[i] ∈ L1 := List.getElem_mem hi
    have hsj : L1[j] ∈ L1 := List.getElem_mem hj
    rw [term1_parts hd (hL1.valid _ hsi) (hL1.rank _ hsi) (hcand _ hsi),
      term1_parts hd (hL1.valid _ hsj) (hL1.rank _ hsj) (hcand _ hsj)]
    have hpair := hL1.pair i hi j hj (by omega)
    rw [List.getD_eq_getElem _ _ hi, List.getD_eq_getElem _ _ hj] at hpair
    exact compat_CP hd (hL1.valid _ hsi) (hL1.valid _ hsj) hpair

/-! ## vertices -/

theorem lt_of_testBit {x j n : ℕ} (hx : x < 2 ^ n) (h : x.testBit j = true) : j < n := by
  by_contra hc
  rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h
  exact absurd h (by simp)

/-- a vertex's packed term has its record's first factor -/
theorem vt_fA {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3) {c j : ℕ}
    (hV : Vert o nRec c j) : fA (vt o c j) = rA (recG o c) := by
  obtain ⟨hc, hj⟩ := hV
  obtain ⟨_, _, hy0, hy1, hw, hloc, _, hA⟩ := hF.recs c hc
  have hjw : j < rWidth (recG o c) := lt_of_testBit hloc hj
  have hb := hF.bx (rBstart (recG o c) + j) (by omega)
  unfold vt
  rw [vTerm_eq]
  apply fA_pkOf
  refine ⟨by norm_num, fun q hq => ?_, fun q hq => ?_, hA⟩
  · split
    · exact hy0
    · exact hy1
  · rw [get32_eq, get32_eq]
    split
    · exact hb.1
    · exact hb.2

/-- vertices of members with distinct first factors are in distinct records -/
theorem vert_ne {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3)
    {d : ℕ} (hd : d ≤ 2) {c j c' j' : ℕ} {s s' : State} (hV : Vert o nRec c j) (hV' : Vert o nRec c' j')
    (h : vt o c j = pkState d s) (h' : vt o c' j' = pkState d s') (hs : s.a < 512) (hs' : s'.a < 512)
    (hne : s.a ≠ s'.a) : c ≠ c' := by
  intro e
  apply hne
  rw [← fA_pk hd hs, ← fA_pk hd hs', ← h, ← h', vt_fA hF hV, vt_fA hF hV', e]

/-- a V3 entry's packed term has its state's first factor -/
theorem v3_ne {o : Orb2} {d : ℕ} (hd : d ≤ 2) {iv iw : ℕ} {s s' : State}
    (h : v3term o iv = pkState d s) (h' : v3term o iw = pkState d s') (hs : s.a < 512) (hs' : s'.a < 512)
    (hne : s.a ≠ s'.a) : iv ≠ iw := by
  intro e
  apply hne
  rw [← fA_pk hd hs, ← fA_pk hd hs', ← h, ← h', e]

/-- `Refuted` of a core given as packed states -/
theorem refuted_map {r1 : R1} {need : ℕ} {ts : List ℕ} {ss : List State} {d : ℕ} (h : ts = ss.map (pkState d))
    (hr : Refuted r1 need ts) : ∃ cert, coreOK r1 need (okbOf r1 (ss.map (pkState d))) (okcOf r1 (ss.map (pkState d))) cert = true := by
  subst h; exact hr

end GS
