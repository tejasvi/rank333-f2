module
public import R22Port.U_d41d8cd98f00
public import GS.PhA5
/-! # Track A, part 6: one rank-2 first factor (`checkA2a`): the B-part fields, the records, and completeness

`checkA2a_facts`: from `checkA2a t0 d o PY0 PY1 a b0 b1 c0 c1 es css = true` (anchor `t0 = pkState d T0`):
* the B-part fields `PB2X0/PB2X1` at `[b0, b1)` are below `2^29`;
* the records at `[c0, c1)`: their `YU` fields agree with `PY0/PY1` and are below `2^29`, `bstart = b0`, `width = b1 - b0`,
  `vloc < 2^width`, first factor `a`;
* every valid state of first factor `a` (rank 2) compatible with the anchor is a vertex `(c, j)`, `c ∈ [c0, c1)`, with
  `vt o c j = pkState d s`. -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc G.V2 Finset

theorem lt_two_pow_of_bits {x n : ℕ} (h : ∀ q, x.testBit q = true → q < n) : x < 2 ^ n := by
  apply Nat.lt_pow_two_of_testBit
  intro i hi
  by_contra hne
  have := h i (by simpa using hne)
  omega

/-- the unpacked `checkA2a` -/
theorem checkA2a_unpack {t0 d : ℕ} {o : Orb2} {PY0 PY1 a b0 b1 c0 c1 : ℕ} {es : List ℕ} {css : List (List CEnt)}
    (h : checkA2a t0 d o PY0 PY1 a b0 b1 c0 c1 es css = true) :
    b0 + sumPc (bmL t0 d a 2 (2 ^ (2 * d)) 0) = b1 ∧ sumPc (bmL t0 d a 2 (2 ^ (2 * d)) 0) ≤ 512 ∧
    es.length = sumPc (bmL t0 d a 2 (2 ^ (2 * d)) 0) ∧
    groupsW (fun a V => bmaskF t0 d a V 2) a (2 ^ (2 * d)) 0 es = some [] ∧ bFields d o b0 es = true ∧
    css.length = 2 ^ (2 * d) ∧
    ∃ recsR, us2 t0 d a b0 (sumPc (bmL t0 d a 2 (2 ^ (2 * d)) 0)) (bmL t0 d a 2 (2 ^ (2 * d)) 0)
      (offsL (bmL t0 d a 2 (2 ^ (2 * d)) 0) 0) 0 css [] = some recsR ∧ c0 + recsR.reverse.length = c1 ∧
      cmpRecs o PY0 PY1 c0 recsR.reverse = true := by
  have e : Nat.shiftLeft 1 (Nat.mul 2 d) = 2 ^ (2 * d) := shiftLeft_one _
  unfold checkA2a at h
  rw [e] at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  refine ⟨Nat.eq_of_beq_eq_true h1, Nat.le_of_ble_eq_true h2, Nat.eq_of_beq_eq_true h3, ?_, h5,
    Nat.eq_of_beq_eq_true h6, ?_⟩
  · revert h4
    cases groupsW (fun a V => bmaskF t0 d a V 2) a (2 ^ (2 * d)) 0 es with
    | none => simp
    | some l => cases l <;> simp
  · revert h7
    cases hu : us2 t0 d a b0 (sumPc (bmL t0 d a 2 (2 ^ (2 * d)) 0)) (bmL t0 d a 2 (2 ^ (2 * d)) 0)
      (offsL (bmL t0 d a 2 (2 ^ (2 * d)) 0) 0) 0 css [] with
    | none => simp
    | some recsR =>
      intro h7
      simp only [Bool.and_eq_true] at h7
      exact ⟨recsR, rfl, Nat.eq_of_beq_eq_true h7.1, h7.2⟩

/-- the bmask list's masks have bits only at `32 B`, `B < 512` -/
theorem bmL_mok (t0 d a r n : ℕ) : ∀ i < (bmL t0 d a r n 0).length, MOK ((bmL t0 d a r n 0).getD i 0) := by
  intro i hi
  rw [bmL_length] at hi
  rw [bmL_getD t0 d a r n 0 i hi]; exact bmaskF_mok _ _ _ _ _

/-- the vertex masks of `recV` are below `2^width` -/
theorem recV_vloc_lt {d U r : ℕ} {parts BmL : List ℕ} (hm : ∀ i < BmL.length, MOK (BmL.getD i 0)) {ps : List ℕ} {vloc : ℕ}
    (h : recV d U r parts BmL (offsL BmL 0) 0 ps 0 = some vloc) : vloc < 2 ^ sumPc BmL := by
  obtain ⟨_, _, hbits, _, _⟩ := recV_spec d U r parts BmL (offsL BmL 0) 0 ps 0 vloc h
  apply lt_two_pow_of_bits
  intro q hq
  rcases hbits q hq with h0 | ⟨i, hi, B, hB, rfl⟩
  · simp at h0
  · have hB' : (BmL.getD i 0).testBit (32 * B) = true := validB_sub _ _ _ _ _ _ _ _ hB
    exact vpos_lt BmL hm i B hi hB'

/-- the facts of one rank-2 first factor -/
theorem checkA2a_facts {d : ℕ} {T0 : State} (hA : Anchor d T0) {o : Orb2} {PY0 PY1 a b0 b1 c0 c1 : ℕ} {es : List ℕ}
    {css : List (List CEnt)} (hck : checkA2a (pkState d T0) d o PY0 PY1 a b0 b1 c0 c1 es css = true)
    (ha : a < 512) (hb0 : b0 < 2 ^ 24) :
    b0 ≤ b1 ∧ c0 ≤ c1 ∧ b1 - b0 ≤ 512 ∧
    (∀ b, b0 ≤ b → b < b1 → get32 o.PB2X0 b < 2 ^ 29 ∧ get32 o.PB2X1 b < 2 ^ 29) ∧
    (∀ c, c0 ≤ c → c < c1 → get32 PY0 c = rYU0 (recG o c) ∧ get32 PY1 c = rYU1 (recG o c) ∧
      rYU0 (recG o c) < 2 ^ 29 ∧ rYU1 (recG o c) < 2 ^ 29 ∧ rBstart (recG o c) = b0 ∧
      rWidth (recG o c) = b1 - b0 ∧ rLoc (recG o c) < 2 ^ rWidth (recG o c) ∧ rA (recG o c) = a) ∧
    (∀ s : State, Valid d s → Compat d T0 s → s.a = a → rk s.a = 2 →
      ∃ c j, c0 ≤ c ∧ c < c1 ∧ (rLoc (recG o c)).testBit j = true ∧ vt o c j = pkState d s) := by
  obtain ⟨hb1, hw512, hlen, hgW, hbF, hcss, recsR, hus, hc1, hcmp⟩ := checkA2a_unpack hck
  set nU := 2 ^ (2 * d) with hnU
  set BmL := bmL (pkState d T0) d a 2 nU 0 with hBmL
  set width := sumPc BmL with hwidth
  have hBmLlen : BmL.length = nU := bmL_length _ _ _ _ _ _
  have hm : ∀ i < BmL.length, MOK (BmL.getD i 0) := bmL_mok _ _ _ _ _
  obtain ⟨pre, hes, hprelen, hpre, hpos, _⟩ := groupsW_spec _ a nU 0 es [] hgW
  rw [List.append_nil] at hes
  subst hes
  obtain ⟨⟨new, hnew, hnewf⟩, hall⟩ := us2_spec _ d a b0 width BmL (offsL BmL 0) 0 css [] recsR hus
  rw [List.append_nil] at hnew
  subst hnew
  -- every record is decoded
  have hrec : ∀ x ∈ recsR, ∃ C U' vloc, C < 512 ∧ vloc < 2 ^ width ∧
      x = mkRec b0 width a (yuF d a C U' 0) (yuF d a C U' 1) vloc := by
    intro x hx
    obtain ⟨U', C, ps, vloc, hC, hr, rfl⟩ := hnewf x hx
    exact ⟨C, U', vloc, hC, recV_vloc_lt hm hr, rfl⟩
  have hdec : ∀ C U' vloc, C < 512 → RecDec (mkRec b0 width a (yuF d a C U' 0) (yuF d a C U' 1) vloc)
      b0 width a (yuF d a C U' 0) (yuF d a C U' 1) vloc := by
    intro C U' vloc hC
    exact mkRec_dec _ _ _ _ _ _ (lt_trans hb0 (by norm_num)) (lt_of_le_of_lt hw512 (by norm_num)) (lt_trans ha (by norm_num))
      (lt_trans (yuF_lt d a C U' 0 hA.hd hC (Rc_lt _ _)) (by norm_num))
      (lt_trans (yuF_lt d a C U' 1 hA.hd hC (Rc_lt _ _)) (by norm_num))
  refine ⟨by omega, by rw [← hc1]; omega, by omega, ?_, ?_, ?_⟩
  · -- B-part fields
    intro b h1 h2
    have hi : b - b0 < es.length := by rw [hlen]; omega
    obtain ⟨hX0, hX1⟩ := bFields_spec d o b0 es hbF (b - b0) hi
    rw [show b0 + (b - b0) = b by omega] at hX0 hX1
    obtain ⟨_, i, hiU, _, hmB⟩ := hpre _ (getD_mem hi)
    have hX : eX (es.getD (b - b0) 0) < 512 := by
      have := (bmaskF_mok _ _ _ _ _ _ hmB).2; omega
    rw [hX0, hX1]
    exact ⟨xvF_lt _ _ _ _ _ hA.hd hX (Lc_lt _ _), xvF_lt _ _ _ _ _ hA.hd hX (Lc_lt _ _)⟩
  · -- records
    intro c h1 h2
    have hi : c - c0 < recsR.reverse.length := by omega
    obtain ⟨hR, hY0, hY1⟩ := cmpRecs_spec o PY0 PY1 c0 recsR.reverse hcmp (c - c0) hi
    rw [show c0 + (c - c0) = c by omega] at hR hY0 hY1
    have hmem : recsR.reverse.getD (c - c0) 0 ∈ recsR := List.mem_reverse.mp (getD_mem hi)
    obtain ⟨C, U', vloc, hC, hv, hx⟩ := hrec _ hmem
    have hd := hdec C U' vloc hC
    rw [← hx] at hd
    rw [hR, hY0, hY1, hd.y0, hd.y1, hd.bs, hd.wd, hd.lc, hd.aa]
    refine ⟨rfl, rfl, yuF_lt d a C U' 0 hA.hd hC (Rc_lt _ _), yuF_lt d a C U' 1 hA.hd hC (Rc_lt _ _), rfl, by omega, hv, rfl⟩
  · -- completeness
    intro s hv hc hsa hr2
    obtain ⟨_, hsa512, hsB, hsC, hsU, hsV, _⟩ := hv
    have hUlt : s.U < nU := by rw [hr2] at hsU; rw [hnU]; simpa [Nat.mul_comm] using hsU
    have hVlt : s.V < nU := by rw [hr2] at hsV; rw [hnU]; simpa [Nat.mul_comm] using hsV
    have hCm : (cmaskF (pkState d T0) d a (0 + s.U) 2).testBit (32 * s.C) = true := by
      have := cmaskF_of_compat hA hsC hc
      rw [hr2, hsa] at this; simpa using this
    obtain ⟨ps, vloc, hr, hin⟩ := hall s.U (by rw [hcss]; exact hUlt) s.C hsC hCm
    rw [Nat.zero_add] at hr hin
    obtain ⟨_, hallV, _, _, _⟩ := recV_spec d s.U 2 (diagParts a s.C 2 4) BmL (offsL BmL 0) 0 ps 0 vloc hr
    have hBm : (BmL.getD s.V 0).testBit (32 * s.B) = true := by
      rw [hBmL, bmL_getD _ _ _ _ _ _ _ hVlt, Nat.zero_add]
      have := bmaskF_of_compat hA hsB hc
      rw [hr2, hsa] at this; exact this
    have hval : (validB d s.U (0 + s.V) 2 (diagParts a s.C 2 4) (Nat.mul 2 2) (BmL.getD s.V 0)).testBit (32 * s.B) = true := by
      have := validB_of_valid hA.hd hsB hsC ⟨by omega, hsa512, hsB, hsC, hsU, hsV, by assumption⟩ (BmL.getD s.V 0) hBm
      rw [hr2, hsa] at this
      simpa using this
    have hbit := hallV s.V (by rw [hBmLlen]; exact hVlt) s.B hval
    have hne : vloc ≠ 0 := by intro h0; rw [h0] at hbit; simp at hbit
    have hmemR := hin hne
    obtain ⟨i, hi, hget⟩ : ∃ i < recsR.reverse.length, recsR.reverse.getD i 0 = mkRec b0 width a (yuF d a s.C s.U 0)
        (yuF d a s.C s.U 1) vloc := by
      obtain ⟨i, hi, hgi⟩ := List.getElem_of_mem (List.mem_reverse.mpr hmemR)
      exact ⟨i, hi, by rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]; simpa using hgi⟩
    obtain ⟨hR, _, _⟩ := cmpRecs_spec o PY0 PY1 c0 recsR.reverse hcmp i hi
    have hd := hdec s.C s.U vloc hsC
    set j := vpos (BmL.getD s.V 0) ((offsL BmL 0).getD s.V 0) s.B with hj
    refine ⟨c0 + i, j, by omega, by omega, ?_, ?_⟩
    · rw [hR, hget, hd.lc]; exact hbit
    · -- the packed term of the vertex
      unfold vt
      rw [hR, hget, vTerm_eq, hd.bs, hd.y0, hd.y1, hd.aa, pkState_eq, hr2]
      -- the B-part at position j is `(a, s.V, s.B)`
      have hjpos : j = ∑ i' ∈ range s.V, cntM (bmaskF (pkState d T0) d a (0 + i') 2) +
          rankM (bmaskF (pkState d T0) d a (0 + s.V) 2) s.B := by
        rw [hj]; unfold vpos
        rw [pc32_low _ _ (hm s.V (by rw [hBmLlen]; exact hVlt)), offsL_getD BmL 0 s.V (by rw [hBmLlen]; exact hVlt), Nat.zero_add]
        rw [hBmL, bmL_getD _ _ _ _ _ _ _ hVlt]
        congr 1
        apply Finset.sum_congr rfl; intro i' hi'
        simp only [mem_range] at hi'
        rw [bmL_getD _ _ _ _ _ _ _ (by omega), pc32_eq _ (bmaskF_mok _ _ _ _ _)]
      have hmaskB : (bmaskF (pkState d T0) d a (0 + s.V) 2).testBit (32 * s.B) = true := by
        rw [Nat.zero_add]; have := hBm; rw [hBmL, bmL_getD _ _ _ _ _ _ _ hVlt, Nat.zero_add] at this; exact this
      obtain ⟨e, he, heA, heW, heX, hlt⟩ := hpos s.V hVlt s.B hmaskB
      rw [← hjpos] at he hlt
      obtain ⟨hX0, hX1⟩ := bFields_spec d o b0 es hbF j hlt
      rw [he, heA, heW, heX, Nat.zero_add] at hX0 hX1
      have e0 : xvF d a s.B s.V 0 = xvS d s 0 := by rw [← hsa]; exact xvF_state d s 0 hsB
      have e1 : xvF d a s.B s.V 1 = xvS d s 1 := by rw [← hsa]; exact xvF_state d s 1 hsB
      have f0 : yuF d a s.C s.U 0 = yuS d s 0 := by rw [← hsa]; exact yuF_state d s 0 hsC
      have f1 : yuF d a s.C s.U 1 = yuS d s 1 := by rw [← hsa]; exact yuF_state d s 1 hsC
      rw [e0] at hX0
      rw [e1] at hX1
      rw [hsa]
      apply pkOf_congr
      intro q hq
      rcases (show q = 0 ∨ q = 1 by omega) with rfl | rfl
      · simp only [if_pos]
        exact ⟨f0, hX0⟩
      · simp only [show (1 : ℕ) ≠ 0 by decide, if_false]
        exact ⟨f1, hX1⟩

end GS

#print axioms GS.checkA2a_facts
