module
public import R22Port.U_d41d8cd98f00
public import GS.PhA8
public import GS.Compact
/-! # Track A: **phase A** (`GS.PhaseAThm`)

From `A : PhaseA d (pkState d T0) v3` (`d ≤ 2`, `T0` valid): the rank-1 data (`R1Data`, with the slices from
`slicesOK_spec`), rank-1 completeness (`checkR1_facts`), the record/B-part/V3 data (`OrbFacts`: the ranges of
`checkGlob` cover `[0, nB2)`, `[0, nRec)`, `[0, nV3)` and each range is one `checkA2a`/`checkA3a`), and completeness for
ranks 2 and 3 (`checkA2a_facts`, `checkA3a_facts` at the range of the state's first factor). -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc G.V2 G.D2 Finset

theorem allA2_one {t0 d : ℕ} {o : Orb2} {PY0 PY1 : ℕ} {rB rC : List (ℕ × ℕ × ℕ)} {i : ℕ}
    {c : List ℕ × List (List CEnt)} (h : allA2 t0 d o PY0 PY1 rB rC i [c] = true) :
    checkA2a t0 d o PY0 PY1 (rg rB i).1 (rg rB i).2.1 (rg rB i).2.2 (rg rC i).2.1 (rg rC i).2.2 c.1 c.2 = true := by
  obtain ⟨es, css⟩ := c
  have h' : ((match rB.getD i (0, 0, 0), rC.getD i (0, 0, 0) with
     | (a, b0, b1), (_, c0, c1) => checkA2a t0 d o PY0 PY1 a b0 b1 c0 c1 es css) &&
    allA2 t0 d o PY0 PY1 rB rC (Nat.succ i) []) = true := h
  have h3 : allA2 t0 d o PY0 PY1 rB rC (Nat.succ i) [] = true := rfl
  rw [h3, Bool.and_true] at h'
  unfold rg
  revert h'
  rcases rB.getD i (0, 0, 0) with ⟨a, b0, b1⟩
  rcases rC.getD i (0, 0, 0) with ⟨x, c0, c1⟩
  exact id

theorem allA3_one {t0 d : ℕ} {o : Orb2} {rV : List (ℕ × ℕ × ℕ)} {i : ℕ} {css : List (List CEnt)}
    (h : allA3 t0 d o rV i [css] = true) :
    checkA3a t0 d o (rg rV i).1 (rg rV i).2.1 (rg rV i).2.2 css = true := by
  have h' : ((match rV.getD i (0, 0, 0) with
     | (a, v0, v1) => checkA3a t0 d o a v0 v1 css) && allA3 t0 d o rV (Nat.succ i) []) = true := h
  have h3 : allA3 t0 d o rV (Nat.succ i) [] = true := rfl
  rw [h3, Bool.and_true] at h'
  unfold rg
  revert h'
  rcases rV.getD i (0, 0, 0) with ⟨a, v0, v1⟩
  exact id

/-- the unpacked `checkGlob` -/
theorem checkGlob_unpack {v3 : Bool} {t0 : ℕ} {o : Orb2} {nB2 nRec nV3 : ℕ} {rB rC rV : List (ℕ × ℕ × ℕ)}
    (h : checkGlob v3 t0 o nB2 nRec nV3 rB rC rV = true) :
    rangesOK rB (ofRank 2 (fA t0)) 0 nB2 = true ∧ rangesOK rC (ofRank 2 (fA t0)) 0 nRec = true ∧
    (v3 = true → rangesOK rV (ofRank 3 (fA t0)) 0 nV3 = true ∧ o.RV3 = rep32 nV3) ∧
    nB2 < 2 ^ 24 ∧ o.AB2 = 2 ^ nB2 - 1 ∧ o.AR = 2 ^ nRec - 1 ∧ o.CH.length = (nRec + 255) / 256 := by
  unfold checkGlob at h
  generalize ofRank 2 (fA t0) = as2 at h ⊢
  generalize ofRank 3 (fA t0) = as3 at h ⊢
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  have h5' : o.AB2 = Nat.sub (Nat.shiftLeft 1 nB2) 1 := Nat.eq_of_beq_eq_true h5
  have h6' : o.AR = Nat.sub (Nat.shiftLeft 1 nRec) 1 := Nat.eq_of_beq_eq_true h6
  rw [shiftLeft_one] at h5' h6'
  refine ⟨h1, h2, fun hv => ?_, by have : nB2 + 1 ≤ 16777216 := Nat.le_of_ble_eq_true h4; norm_num; omega, h5', h6',
    Nat.eq_of_beq_eq_true h7⟩
  rw [hv] at h3
  simp only [Bool.not_true, Bool.false_or, Bool.and_eq_true] at h3
  exact ⟨h3.1, Nat.eq_of_beq_eq_true h3.2⟩

theorem anchor_of {d : ℕ} {T0 : State} (hd : d ≤ 2) (hv : Valid d T0) : Anchor d T0 := ⟨hd, hv.2.1⟩

/-- **phase A** -/
theorem phaseA_thm : PhaseAThm := by
  intro d T0 v3 A hd hv0
  have hA := anchor_of hd hv0
  have hfA : fA (pkState d T0) = T0.a := fA_pk hd hA.ha
  obtain ⟨hAB, hAC, hfB, hfC, hgrps, hainj, hdisjB, hdisjC, hR1c⟩ := checkR1_facts hA A.r1
  obtain ⟨hrB, hrC, hrV, hnB2, hAB2, hAR, hCH⟩ := checkGlob_unpack A.glob
  obtain ⟨hlB, _, hrgB, hcovB, _⟩ := rangesOK_spec A.rB _ 0 A.nB2 hrB
  obtain ⟨hlC, _, hrgC, hcovC, _⟩ := rangesOK_spec A.rC _ 0 A.nRec hrC
  -- every rank-2 range index gives `checkA2a_facts`
  have hA2 : ∀ i < A.rB.length, ∃ es css, checkA2a (pkState d T0) d A.o A.PY0 A.PY1 (rg A.rB i).1 (rg A.rB i).2.1 (rg A.rB i).2.2
      (rg A.rC i).2.1 (rg A.rC i).2.2 es css = true := by
    intro i hi
    obtain ⟨c, hc⟩ := A.a2 i hi
    exact ⟨c.1, c.2, allA2_one hc⟩
  have has2 : ∀ i < A.rB.length, (rg A.rB i).1 ∈ ofRank 2 (fA (pkState d T0)) := by
    intro i hi; rw [(hrgB i hi).1]; exact getD_mem (by rw [← hlB]; exact hi)
  have hfacts2 : ∀ i < A.rB.length, ∃ es css, checkA2a (pkState d T0) d A.o A.PY0 A.PY1 (rg A.rB i).1 (rg A.rB i).2.1 (rg A.rB i).2.2
      (rg A.rC i).2.1 (rg A.rC i).2.2 es css = true ∧ (rg A.rB i).1 < 512 ∧ (rg A.rB i).2.1 < 2 ^ 24 := by
    intro i hi
    obtain ⟨es, css, h⟩ := hA2 i hi
    obtain ⟨_, h1, h2, h3⟩ := hrgB i hi
    exact ⟨es, css, h, (mem_ofRank.mp (has2 i hi)).1, by omega⟩
  have hlBC : A.rB.length = A.rC.length := by rw [hlB, hlC]
  refine ⟨⟨slicesOK_spec _ _ _ A.slB, slicesOK_spec _ _ _ A.slC, hAB, hAC, hfB, hfC, hgrps, hainj, hdisjB, hdisjC⟩,
    hR1c, ⟨slicesOK_spec _ _ _ A.slY0, slicesOK_spec _ _ _ A.slY1, slicesOK_spec _ _ _ A.slX0, slicesOK_spec _ _ _ A.slX1,
      hAR, hAB2, ?_, ?_, hCH, ?_⟩, ?_, ?_⟩
  · -- records
    intro c hc
    obtain ⟨i, hi, h1, h2⟩ := hcovC c (Nat.zero_le _) hc
    have hiB : i < A.rB.length := by rw [hlBC]; exact hi
    obtain ⟨es, css, hck, ha, hb0⟩ := hfacts2 i hiB
    obtain ⟨hb01, _, _, _, hrec, _⟩ := checkA2a_facts hA hck ha hb0
    obtain ⟨hY0, hY1, hY0lt, hY1lt, hbs, hwd, hlc, haa⟩ := hrec c h1 h2
    obtain ⟨_, _, _, hb1⟩ := hrgB i hiB
    have hamem := mem_ofRank.mp (has2 i hiB)
    refine ⟨by rw [← get32_eq]; exact hY0, by rw [← get32_eq]; exact hY1, hY0lt, hY1lt, ?_, hlc, ?_, ?_⟩
    · rw [hbs, hwd]; omega
    · rw [haa]; exact Nat.pos_of_ne_zero hamem.2.2.2
    · rw [haa]; exact hamem.1
  · -- B-part fields
    intro b hb
    obtain ⟨i, hi, h1, h2⟩ := hcovB b (Nat.zero_le _) hb
    obtain ⟨es, css, hck, ha, hb0⟩ := hfacts2 i hi
    obtain ⟨_, _, _, hbx, _, _⟩ := checkA2a_facts hA hck ha hb0
    obtain ⟨h3, h4⟩ := hbx b h1 h2
    exact ⟨by rw [← get32_eq]; exact h3, by rw [← get32_eq]; exact h4⟩
  · -- V3
    intro hv3
    obtain ⟨hrV', hRV3⟩ := hrV hv3
    obtain ⟨hlV, _, hrgV, hcovV, _⟩ := rangesOK_spec A.rV _ 0 A.nV3 hrV'
    refine ⟨hRV3, fun iv hiv => ?_⟩
    obtain ⟨i, hi, h1, h2⟩ := hcovV iv (Nat.zero_le _) hiv
    obtain ⟨css, hc⟩ := A.a3 hv3 i hi
    have hck := allA3_one hc
    have hamem : (rg A.rV i).1 ∈ ofRank 3 (fA (pkState d T0)) := by
      rw [(hrgV i hi).1]; exact getD_mem (by rw [← hlV]; exact hi)
    obtain ⟨_, hflds, _⟩ := checkA3a_facts hA hck (mem_ofRank.mp hamem).1
    obtain ⟨hY0, hY1, hY2, hX0, hX1, hX2, hAA, hR, hlt, hAlt⟩ := hflds iv h1 h2
    exact ⟨by rw [← get32_eq]; exact hY0, by rw [← get32_eq]; exact hY1, by rw [← get32_eq]; exact hY2,
      by rw [← get32_eq]; exact hX0, by rw [← get32_eq]; exact hX1, by rw [← get32_eq]; exact hX2,
      by rw [← get32_eq]; exact hAA, hR, hlt, hAlt⟩
  · -- rank-2 completeness
    intro s hv hc hr2
    have hmem : s.a ∈ ofRank 2 (fA (pkState d T0)) := by
      rw [mem_ofRank, hfA]; exact ⟨hv.2.1, hr2, fun e => hc.1 e.symm, by have := hv.1; omega⟩
    obtain ⟨i, hi, hget⟩ := List.getElem_of_mem hmem
    have hiB : i < A.rB.length := by rw [hlB]; exact hi
    have hai : (rg A.rB i).1 = s.a := by
      rw [(hrgB i hiB).1, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]; simpa using hget
    obtain ⟨es, css, hck, ha, hb0⟩ := hfacts2 i hiB
    obtain ⟨_, _, _, _, _, hcomp⟩ := checkA2a_facts hA hck ha hb0
    obtain ⟨c, j, h1, h2, hbit, hvt⟩ := hcomp s hv hc hai.symm hr2
    obtain ⟨_, _, _, hc1⟩ := hrgC i (by rw [← hlBC]; exact hiB)
    exact ⟨c, j, ⟨by omega, hbit⟩, hvt⟩
  · -- rank-3 completeness
    intro hv3 s hv hc hr3
    obtain ⟨hrV', _⟩ := hrV hv3
    obtain ⟨hlV, _, hrgV, _, _⟩ := rangesOK_spec A.rV _ 0 A.nV3 hrV'
    have hmem : s.a ∈ ofRank 3 (fA (pkState d T0)) := by
      rw [mem_ofRank, hfA]; exact ⟨hv.2.1, hr3, fun e => hc.1 e.symm, by have := hv.1; omega⟩
    obtain ⟨i, hi, hget⟩ := List.getElem_of_mem hmem
    have hiV : i < A.rV.length := by rw [hlV]; exact hi
    have hai : (rg A.rV i).1 = s.a := by
      rw [(hrgV i hiV).1, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]; simpa using hget
    obtain ⟨css, hcV⟩ := A.a3 hv3 i hiV
    have hck := allA3_one hcV
    obtain ⟨_, _, hcomp⟩ := checkA3a_facts hA hck (by rw [hai]; exact hv.2.1)
    obtain ⟨v, h1, h2, hvt⟩ := hcomp s hv hc hai.symm hr3
    obtain ⟨_, _, _, hv1⟩ := hrgV i hiV
    exact ⟨v, by omega, hvt⟩

end GS

#print axioms GS.phaseA_thm
