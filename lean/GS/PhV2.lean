module
public import R22Port.U_d41d8cd98f00
public import GS.PhV1
/-! # Track V, part 4: the shapes from the per-base checks

* mask algebra: `okbOf_perm`, `okbOf_cons` (the core masks do not depend on the order of the core terms, and `r1.AB` is
  absorbed by the first one);
* vertex facts: `vt_fields`, `vert_member` (a vertex compatible with a base passes the base's record and B-part masks),
  `member_adj` (compatible members are adjacent in the compacted rows);
* `checkS_elim`, `checkV1_elim`, `checkV2_elim`;
* `GS.shapeS_of : ShapeThmS`, `GS.shapeC2_of`, `GS.shapeC3_of`. -/
@[expose] public section
namespace GS.V
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## mask algebra -/

theorem rowsB_sub (r1 : R1) (t q : ℕ) : ∀ n, (rowsB r1 t n).testBit q = true → r1.AB.testBit q = true
  | 0, h => h
  | n + 1, h => by
    have h' : (Nat.land (rowsB r1 t n) (Nat.xor r1.AB (sx r1.SB (fYU t n)))).testBit q = true := h
    rw [testBit_land'] at h'
    exact rowsB_sub r1 t q n ((Bool.and_eq_true _ _).mp h').1

theorem rowsC_sub (r1 : R1) (t q : ℕ) : ∀ n, (rowsC r1 t n).testBit q = true → r1.AC.testBit q = true
  | 0, h => h
  | n + 1, h => by
    have h' : (Nat.land (rowsC r1 t n) (Nat.xor r1.AC (sx r1.SC (fXV t n)))).testBit q = true := h
    rw [testBit_land'] at h'
    exact rowsC_sub r1 t q n ((Bool.and_eq_true _ _).mp h').1

theorem AB_land_okB (r1 : R1) (t : ℕ) : r1.AB &&& okB r1 t = okB r1 t := by
  apply Nat.eq_of_testBit_eq; intro q
  rw [Nat.testBit_and]
  cases h : (okB r1 t).testBit q
  · simp
  · rw [rowsB_sub r1 t q _ h]; rfl

theorem AC_land_okC (r1 : R1) (t : ℕ) : r1.AC &&& okC r1 t = okC r1 t := by
  apply Nat.eq_of_testBit_eq; intro q
  rw [Nat.testBit_and]
  cases h : (okC r1 t).testBit q
  · simp
  · rw [rowsC_sub r1 t q _ h]; rfl

theorem okbOf_perm (r1 : R1) {L L' : List ℕ} (h : L.Perm L') : okbOf r1 L = okbOf r1 L' :=
  List.Perm.foldl_eq' h (fun x _ y _ z => by rw [Nat.land_assoc, Nat.land_comm (okB r1 x), ← Nat.land_assoc]) r1.AB

theorem okcOf_perm (r1 : R1) {L L' : List ℕ} (h : L.Perm L') : okcOf r1 L = okcOf r1 L' :=
  List.Perm.foldl_eq' h (fun x _ y _ z => by rw [Nat.land_assoc, Nat.land_comm (okC r1 x), ← Nat.land_assoc]) r1.AC

theorem refuted_perm {r1 : R1} {need : ℕ} {L L' : List ℕ} (h : L.Perm L') (hr : Refuted r1 need L') : Refuted r1 need L := by
  obtain ⟨cert, hc⟩ := hr
  exact ⟨cert, by rw [okbOf_perm r1 h, okcOf_perm r1 h]; exact hc⟩

theorem refuted_chain3 (r1 : R1) (need s x y z : ℕ)
    (h : ∃ cert, coreOK r1 need (Nat.land (Nat.land (Nat.land (okB r1 s) (okB r1 x)) (okB r1 y)) (okB r1 z))
      (Nat.land (Nat.land (Nat.land (okC r1 s) (okC r1 x)) (okC r1 y)) (okC r1 z)) cert = true) :
    Refuted r1 need [s, x, y, z] := by
  obtain ⟨cert, hc⟩ := h
  refine ⟨cert, ?_⟩
  show coreOK r1 need ((((r1.AB &&& okB r1 s) &&& okB r1 x) &&& okB r1 y) &&& okB r1 z)
    ((((r1.AC &&& okC r1 s) &&& okC r1 x) &&& okC r1 y) &&& okC r1 z) cert = true
  rw [AB_land_okB, AC_land_okC]; exact hc

theorem refuted_chain2 (r1 : R1) (need s x y : ℕ)
    (h : ∃ cert, coreOK r1 need (Nat.land (Nat.land (okB r1 s) (okB r1 x)) (okB r1 y))
      (Nat.land (Nat.land (okC r1 s) (okC r1 x)) (okC r1 y)) cert = true) :
    Refuted r1 need [s, x, y] := by
  obtain ⟨cert, hc⟩ := h
  refine ⟨cert, ?_⟩
  show coreOK r1 need (((r1.AB &&& okB r1 s) &&& okB r1 x) &&& okB r1 y) (((r1.AC &&& okC r1 s) &&& okC r1 x) &&& okC r1 y)
    cert = true
  rw [AB_land_okB, AC_land_okC]; exact hc

/-! ## vertices -/

section vertices
variable {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3)
include hF

theorem vert_bounds {c j : ℕ} (hv : Vert o nRec c j) :
    rYU0 (recG o c) < 2 ^ 29 ∧ rYU1 (recG o c) < 2 ^ 29 ∧ rBstart (recG o c) + j < nB2 ∧
    fld o.PB2X0 (rBstart (recG o c) + j) < 2 ^ 29 ∧ fld o.PB2X1 (rBstart (recG o c) + j) < 2 ^ 29 ∧
    rA (recG o c) < 512 := by
  obtain ⟨-, -, b0, b1, hw, hl, -, ha⟩ := hF.recs c hv.1
  have hjw : j < rWidth (recG o c) := by
    by_contra hge; push Not at hge
    have := hv.2; rw [testBit_false_of_lt hl hge] at this; exact absurd this (by decide)
  have hb : rBstart (recG o c) + j < nB2 := by omega
  obtain ⟨x0, x1⟩ := hF.bx _ hb
  exact ⟨b0, b1, hb, x0, x1, ha⟩

theorem vt_T2 (c j : ℕ) : vt o c j = T2 (rYU0 (recG o c)) (rYU1 (recG o c)) (fld o.PB2X0 (rBstart (recG o c) + j))
    (fld o.PB2X1 (rBstart (recG o c) + j)) (rA (recG o c)) := by
  rw [vt, vTerm_eq, get32_eq, get32_eq]

theorem vt_fields {c j : ℕ} (hv : Vert o nRec c j) :
    fYU (vt o c j) 0 = rYU0 (recG o c) ∧ fYU (vt o c j) 1 = rYU1 (recG o c) ∧
    fXV (vt o c j) 0 = fld o.PB2X0 (rBstart (recG o c) + j) ∧ fXV (vt o c j) 1 = fld o.PB2X1 (rBstart (recG o c) + j) ∧
    fR (vt o c j) = 2 ∧ fA (vt o c j) = rA (recG o c) := by
  obtain ⟨b0, b1, -, x0, x1, ha⟩ := vert_bounds hF hv
  rw [vt_T2 hF]
  exact ⟨fYU_T2_0 _ _ _ _ _ b0 b1 x0 x1, fYU_T2_1 _ _ _ _ _ b0 b1 x0 x1, fXV_T2_0 _ _ _ _ _ b0 b1 x0 x1,
    fXV_T2_1 _ _ _ _ _ b0 b1 x0 x1, fR_T2 _ _ _ _ _ b0 b1 x0 x1, fA_T2 _ _ _ _ _ b0 b1 x0 x1 ha⟩

/-- a vertex compatible with a base term passes the base's record and B-part masks -/
theorem vert_member (t : ℕ) {c j : ℕ} (hv : Vert o nRec c j) (hcp : CP t (vt o c j)) :
    (okcR o t).testBit c = true ∧ (okbR o t).testBit (rBstart (recG o c) + j) = true := by
  obtain ⟨-, h1, h2⟩ := CP_cross hcp
  obtain ⟨eY0, eY1, eX0, eX1, eR, -⟩ := vt_fields hF hv
  obtain ⟨-, -, hb, -, -, -⟩ := vert_bounds hF hv
  rw [eR] at h1 h2
  refine ⟨okcR_bit hF t c hv.1 (fun q hq => ⟨?_, ?_⟩), okbR_bit hF t _ hb (fun q hq => ⟨?_, ?_⟩)⟩
  · have := h2 q hq 0 (by norm_num); rw [eY0] at this; exact this
  · have := h2 q hq 1 (by norm_num); rw [eY1] at this; exact this
  · have := h1 0 (by norm_num) q hq; rw [eX0] at this
    rw [show Nat.land (fld o.PB2X0 (rBstart (recG o c) + j)) (fYU t q) = Nat.land (fYU t q) (fld o.PB2X0 (rBstart (recG o c) + j))
      from Nat.land_comm _ _]; exact this
  · have := h1 1 (by norm_num) q hq; rw [eX1] at this
    rw [show Nat.land (fld o.PB2X1 (rBstart (recG o c) + j)) (fYU t q) = Nat.land (fYU t q) (fld o.PB2X1 (rBstart (recG o c) + j))
      from Nat.land_comm _ _]; exact this

/-- members that are vertices: fields and adjacency -/
theorem member_adj {M : List (ℕ × ℕ)} {p : Packs} (hM : PRep o M p) (T : ℕ) (hT : p.m ≤ 2 ^ T)
    {ka kb ca ja cb jb : ℕ} (hka : ka < p.m) (hkb : kb < p.m) (hga : M.getD ka (0, 0) = (ca, ja))
    (hgb : M.getD kb (0, 0) = (cb, jb)) (hva : Vert o nRec ca ja) (hvb : Vert o nRec cb jb)
    (hta : memTerm p ka = vt o ca ja) (htb : memTerm p kb = vt o cb jb) (hcp : CP (vt o ca ja) (vt o cb jb)) :
    (arow p (rep32 p.m) (cmasks p.m T 0) ka).testBit kb = true := by
  apply arow_bit p T _ kb hT hkb
  obtain ⟨fY0, fY1, fX0, fX1, fA'⟩ := mem_fields hM kb hkb
  obtain ⟨b0, b1, -, x0, x1, ha⟩ := vert_bounds hF hvb
  have hAall : ∀ k' < p.m, fld p.A k' < 2 ^ 31 := by
    intro k' hk'
    rw [(mem_fields hM k' hk').2.2.2.2]
    unfold mA
    have : rA (recG o (M.getD k' (0, 0)).1) < 2 ^ 16 := by
      unfold rA; rw [show (65535 : ℕ) = 2 ^ 16 - 1 by norm_num]; exact land_lt _ _
    omega
  refine adj32_bit p _ kb hkb ?_ ?_ ?_ ?_ ?_ ?_ hAall ?_
  · rw [hta]; exact (vt_fields hF hva).2.2.2.2.1
  · rw [fY0]; unfold mY0; rw [hgb]; exact b0
  · rw [fY1]; unfold mY1; rw [hgb]; exact b1
  · rw [fX0]; unfold mX0; rw [hgb]; rw [get32_eq]; exact x0
  · rw [fX1]; unfold mX1; rw [hgb]; rw [get32_eq]; exact x1
  · rw [fA']; unfold mA; rw [hgb]; exact ha
  · rw [hta, htb]; exact hcp

end vertices

/-! ## unfolding the per-base checks -/

theorem checkS_elim (o : Orb2) (n1 c r j : ℕ) (chs : Chs) (recs : List MemRec) (h : checkS o n1 c r j chs recs = true) :
    ∃ p, phaseB o (Nat.land (okcR o (vTerm o r j)) (Nat.xor o.AR (Nat.land o.AR (Nat.sub (Nat.shiftLeft 1 (Nat.succ c)) 1))))
        (okbR o (vTerm o r j)) 0 o.CH chs p0 = some p ∧ p.m ≤ 2 ^ steps p.m ∧ recs.length = p.m ∧
      phaseC3 o n1 p (okB o.r1 (vTerm o r j)) (okC o.r1 (vTerm o r j)) (rep32 p.m) (2 ^ p.m - 1) (cmasks p.m (steps p.m) 0)
        (Nat.pred p.m) recs 0 [] = true := by
  unfold checkS at h
  dsimp only at h
  split at h
  · exact absurd h (by decide)
  · rename_i p hp
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨h1, h2⟩, h3⟩ := h
    refine ⟨p, hp, ?_, Nat.eq_of_beq_eq_true h2, ?_⟩
    · have := Nat.le_of_ble_eq_true h1; rwa [shiftLeft_one] at this
    · rw [show (2 : ℕ) ^ p.m - 1 = Nat.sub (Nat.shiftLeft 1 p.m) 1 by rw [shiftLeft_one]; rfl]; exact h3

theorem checkV1_elim (o : Orb2) (n1 iv : ℕ) (chs : Chs) (recs : List (List ℕ × List CoreCert)) (ws : List (ℕ × CoreCert))
    (h : checkV1 o n1 iv chs recs ws = true) :
    ∃ p, phaseB o (okcR o (v3term o iv)) (okbR o (v3term o iv)) 0 o.CH chs p0 = some p ∧ p.m ≤ 2 ^ steps p.m ∧
      recs.length = p.m ∧
      phaseC2 o n1 p (okB o.r1 (v3term o iv)) (okC o.r1 (v3term o iv)) (rep32 p.m) (2 ^ p.m - 1) (cmasks p.m (steps p.m) 0)
        (Nat.pred p.m) recs = true := by
  unfold checkV1 at h
  dsimp only at h
  split at h
  · exact absurd h (by decide)
  · rename_i p hp
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨⟨⟨h1, h2⟩, h3⟩, -⟩, -⟩ := h
    refine ⟨p, hp, ?_, Nat.eq_of_beq_eq_true h2, ?_⟩
    · have := Nat.le_of_ble_eq_true h1; rwa [shiftLeft_one] at this
    · rw [show (2 : ℕ) ^ p.m - 1 = Nat.sub (Nat.shiftLeft 1 p.m) 1 by rw [shiftLeft_one]; rfl]; exact h3

theorem checkV2_elim (o : Orb2) (n1 iv : ℕ) (chs : Chs) (recs : List MemRec) (ws : List ℕ)
    (qs : List (ℕ × List ℕ × List CoreCert)) (h : checkV2 o n1 iv chs recs ws qs = true) :
    ∃ p, phaseB o (okcR o (v3term o iv)) (okbR o (v3term o iv)) 0 o.CH chs p0 = some p ∧ p.m ≤ 2 ^ steps p.m ∧
      recs.length = p.m ∧
      phaseC3 o n1 p (okB o.r1 (v3term o iv)) (okC o.r1 (v3term o iv)) (rep32 p.m) (2 ^ p.m - 1)
        (cmasks p.m (steps p.m) 0) (Nat.pred p.m) recs 0 [] = true ∧
      listChk32 ws (wMask o iv (v3term o iv)) = true ∧ ws = qs.map Prod.fst ∧
      shapeQ o (Nat.succ n1) p (rep32 p.m) (okB o.r1 (v3term o iv)) (okC o.r1 (v3term o iv)) qs = true := by
  unfold checkV2 at h
  dsimp only at h
  split at h
  · exact absurd h (by decide)
  · rename_i p hp
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := h
    refine ⟨p, hp, ?_, Nat.eq_of_beq_eq_true h2, ?_, h4, ?_, h6⟩
    · have := Nat.le_of_ble_eq_true h1; rwa [shiftLeft_one] at this
    · rw [show (2 : ℕ) ^ p.m - 1 = Nat.sub (Nat.shiftLeft 1 p.m) 1 by rw [shiftLeft_one]; rfl]; exact h3
    · exact beq_iff_eq.mp h5

theorem allV1_head {o : Orb2} {n1 iv : ℕ} {c : VCert1} (h : allV1 o n1 iv [c] = true) :
    checkV1 o n1 iv c.1 c.2.1 c.2.2 = true := by
  have h' : (checkV1 o n1 iv c.1 c.2.1 c.2.2 && allV1 o n1 (Nat.succ iv) []) = true := h
  rw [Bool.and_eq_true] at h'; exact h'.1

theorem allV2_head {o : Orb2} {n1 iv : ℕ} {c : VCert2} (h : allV2 o n1 iv [c] = true) :
    checkV2 o n1 iv c.1 c.2.1 c.2.2.1 c.2.2.2 = true := by
  have h' : (checkV2 o n1 iv c.1 c.2.1 c.2.2.1 c.2.2.2 && allV2 o n1 (Nat.succ iv) []) = true := h
  rw [Bool.and_eq_true] at h'; exact h'.1

/-! ## three members of a phase-B walk -/

/-- the members of three pairwise compatible vertices are distinct and pairwise adjacent; some ordering is a triangle -/
theorem triangle_of {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3)
    {M : List (ℕ × ℕ)} {p : Packs} (hM : PRep o M p) (T : ℕ) (hT : p.m ≤ 2 ^ T)
    {c1 j1 c2 j2 c3 j3 : ℕ} (hv1 : Vert o nRec c1 j1) (hv2 : Vert o nRec c2 j2) (hv3 : Vert o nRec c3 j3)
    (hm1 : (c1, j1) ∈ M) (hm2 : (c2, j2) ∈ M) (hm3 : (c3, j3) ∈ M)
    (h12 : CP (vt o c1 j1) (vt o c2 j2)) (h13 : CP (vt o c1 j1) (vt o c3 j3)) (h23 : CP (vt o c2 j2) (vt o c3 j3)) :
    ∃ i j k, i < j ∧ j < k ∧ k < p.m ∧
      (arow p (rep32 p.m) (cmasks p.m T 0) i).testBit j = true ∧ (arow p (rep32 p.m) (cmasks p.m T 0) i).testBit k = true ∧
      (arow p (rep32 p.m) (cmasks p.m T 0) j).testBit k = true ∧
      [memTerm p i, memTerm p j, memTerm p k].Perm [vt o c1 j1, vt o c2 j2, vt o c3 j3] := by
  obtain ⟨k1, hk1, hg1, ht1⟩ := memTerm_of_mem hM hm1
  obtain ⟨k2, hk2, hg2, ht2⟩ := memTerm_of_mem hM hm2
  obtain ⟨k3, hk3, hg3, ht3⟩ := memTerm_of_mem hM hm3
  have adj : ∀ ka kb ca ja cb jb, ka < p.m → kb < p.m → M.getD ka (0, 0) = (ca, ja) → M.getD kb (0, 0) = (cb, jb) →
      Vert o nRec ca ja → Vert o nRec cb jb → memTerm p ka = vt o ca ja → memTerm p kb = vt o cb jb →
      CP (vt o ca ja) (vt o cb jb) → (arow p (rep32 p.m) (cmasks p.m T 0) ka).testBit kb = true :=
    fun ka kb ca ja cb jb h1 h2 h3 h4 h5 h6 h7 h8 h9 => member_adj hF hM T hT h1 h2 h3 h4 h5 h6 h7 h8 h9
  have a12 := adj _ _ _ _ _ _ hk1 hk2 hg1 hg2 hv1 hv2 ht1 ht2 h12
  have a21 := adj _ _ _ _ _ _ hk2 hk1 hg2 hg1 hv2 hv1 ht2 ht1 (CP_symm h12)
  have a13 := adj _ _ _ _ _ _ hk1 hk3 hg1 hg3 hv1 hv3 ht1 ht3 h13
  have a31 := adj _ _ _ _ _ _ hk3 hk1 hg3 hg1 hv3 hv1 ht3 ht1 (CP_symm h13)
  have a23 := adj _ _ _ _ _ _ hk2 hk3 hg2 hg3 hv2 hv3 ht2 ht3 h23
  have a32 := adj _ _ _ _ _ _ hk3 hk2 hg3 hg2 hv3 hv2 ht3 ht2 (CP_symm h23)
  have ne : ∀ ka kb ca ja cb jb, memTerm p ka = vt o ca ja → memTerm p kb = vt o cb jb → CP (vt o ca ja) (vt o cb jb) →
      ka ≠ kb := by
    intro ka kb ca ja cb jb h1 h2 h3 e
    subst e
    have := (CP_cross h3).1; rw [← h1, ← h2] at this; exact this rfl
  have n12 := ne _ _ _ _ _ _ ht1 ht2 h12
  have n13 := ne _ _ _ _ _ _ ht1 ht3 h13
  have n23 := ne _ _ _ _ _ _ ht2 ht3 h23
  rcases Nat.lt_or_gt_of_ne n12 with l12 | l12 <;> rcases Nat.lt_or_gt_of_ne n13 with l13 | l13 <;>
    rcases Nat.lt_or_gt_of_ne n23 with l23 | l23
  · exact ⟨k1, k2, k3, l12, l23, hk3, a12, a13, a23, by rw [ht1, ht2, ht3]⟩
  · exact ⟨k1, k3, k2, l13, l23, hk2, a13, a12, a32, by rw [ht1, ht3, ht2]; exact List.Perm.swap _ _ _ |>.cons _⟩
  · omega
  · exact ⟨k3, k1, k2, l13, l12, hk2, a31, a32, a12, by
      rw [ht3, ht1, ht2]
      exact (List.Perm.swap _ _ _).trans ((List.Perm.swap _ _ _).cons _)⟩
  · exact ⟨k2, k1, k3, l12, l13, hk3, a21, a23, a13, by rw [ht2, ht1, ht3]; exact List.Perm.swap _ _ _⟩
  · omega
  · exact ⟨k2, k3, k1, l23, l13, hk1, a23, a21, a31, by
      rw [ht2, ht3, ht1]
      exact ((List.Perm.swap _ _ _).cons _).trans (List.Perm.swap _ _ _)⟩
  · exact ⟨k3, k2, k1, l23, l12, hk1, a32, a31, a21, by
      rw [ht3, ht2, ht1]
      exact ((List.Perm.swap _ _ _).trans ((List.Perm.swap _ _ _).cons _)).trans (List.Perm.swap _ _ _)⟩

end GS.V

namespace GS
open G G.V2 G.D2 G.A2 G.Acc GS.V

/-- **shape S** (d ≤ 1, (17,4,1) and (17,5,0)) -/
theorem shapeS_of : ShapeThmS := by
  intro o PY0 PY1 nB2 nRec nV3 v3 hF hS c j c1 j1 c2 j2 c3 j3 hv hv1 hv2 hv3 hc1 hc2 hc3 h01 h02 h03 h12 h13 h23
  obtain ⟨cert, hcert⟩ := hS c hv.1 j hv.2
  obtain ⟨p, hpb, hT, hlen, hC3⟩ := checkS_elim o 17 c (recG o c) j cert.1 cert.2 hcert
  obtain ⟨M, hM, hmem⟩ := phaseB_member hF hpb
  have habove : ∀ c', c < c' → c' < nRec →
      (Nat.xor o.AR (Nat.land o.AR (Nat.sub (Nat.shiftLeft 1 (Nat.succ c)) 1))).testBit c' = true := by
    intro c' h1 h2
    rw [testBit_xor', testBit_land', hF.AR, shiftLeft_one, show Nat.sub (2 ^ Nat.succ c) 1 = 2 ^ (c + 1) - 1 from rfl,
      Nat.testBit_two_pow_sub_one, Nat.testBit_two_pow_sub_one]
    have : ¬ (c' < c + 1) := by omega
    simp [h2, this]
  have mem : ∀ c' j', Vert o nRec c' j' → c < c' → CP (vt o c j) (vt o c' j') → (c', j') ∈ M := by
    intro c' j' hv' hlt hcp
    obtain ⟨h1, h2⟩ := vert_member hF _ hv' hcp
    exact hmem c' j' hv' (by rw [testBit_land', show vTerm o (recG o c) j = vt o c j from rfl, h1, habove c' hlt hv'.1]; rfl) h2
  obtain ⟨i, j', k, hij, hjk, hk, hA1, hA2, hA3, hperm⟩ :=
    triangle_of hF hM (steps p.m) hT hv1 hv2 hv3 (mem _ _ hv1 hc1 h01) (mem _ _ hv2 hc2 h02) (mem _ _ hv3 hc3 h03) h12 h13 h23
  have hm1 : 1 ≤ p.m := by omega
  have hc := phaseC3_spec o 17 p _ _ (rep32 p.m) (2 ^ p.m - 1) (cmasks p.m (steps p.m) 0) rfl
    (fun j0 => arow_lt p (steps p.m) _ hT) cert.2 (Nat.pred p.m) 0 [] (by rw [hlen, Nat.pred_eq_sub_one]; omega) (by rw [Nat.pred_eq_sub_one]; omega)
    (by rw [Nat.pred_eq_sub_one]; exact rowInv_init _ _ _) hC3 i j' k (by rw [Nat.pred_eq_sub_one]; omega) hij hjk hk hA1 hA2 hA3
  exact refuted_perm (hperm.symm.cons _) (refuted_chain3 o.r1 17 _ _ _ _ hc)

/-- **shape C2** (d = 1, (18,2,2)): edges in the rank-2 neighbourhood of a rank-3 vertex -/
theorem shapeC2_of (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ) (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 true) (hV : VOK1 o nV3) :
    ShapeC2 o nRec nV3 := by
  intro iv hiv c1 j1 c2 j2 hv1 hv2 h1 h2 h12
  obtain ⟨cert, hcert⟩ := hV iv hiv
  obtain ⟨p, hpb, hT, hlen, hC2⟩ := checkV1_elim o 18 iv _ _ _ (allV1_head hcert)
  obtain ⟨M, hM, hmem⟩ := phaseB_member hF hpb
  have mem : ∀ c' j', Vert o nRec c' j' → CP (v3term o iv) (vt o c' j') → (c', j') ∈ M := by
    intro c' j' hv' hcp
    obtain ⟨h1, h2⟩ := vert_member hF _ hv' hcp
    exact hmem c' j' hv' h1 h2
  obtain ⟨k1, hk1, hg1, ht1⟩ := memTerm_of_mem hM (mem _ _ hv1 h1)
  obtain ⟨k2, hk2, hg2, ht2⟩ := memTerm_of_mem hM (mem _ _ hv2 h2)
  have a12 := member_adj hF hM (steps p.m) hT hk1 hk2 hg1 hg2 hv1 hv2 ht1 ht2 h12
  have a21 := member_adj hF hM (steps p.m) hT hk2 hk1 hg2 hg1 hv2 hv1 ht2 ht1 (CP_symm h12)
  have n12 : k1 ≠ k2 := by
    intro e; subst e
    have := (CP_cross h12).1; rw [← ht1, ← ht2] at this; exact this rfl
  have hm1 : 1 ≤ p.m := by omega
  rcases Nat.lt_or_gt_of_ne n12 with l | l
  · have hc := phaseC2_spec o 18 p _ _ (rep32 p.m) (2 ^ p.m - 1) (cmasks p.m (steps p.m) 0) rfl cert.2.1 (Nat.pred p.m)
      (by rw [hlen, Nat.pred_eq_sub_one]; omega) (by rw [Nat.pred_eq_sub_one]; omega) hC2 k1 k2 (by rw [Nat.pred_eq_sub_one]; omega) l hk2 a12
    rw [ht1, ht2] at hc
    exact refuted_chain2 o.r1 18 _ _ _ hc
  · have hc := phaseC2_spec o 18 p _ _ (rep32 p.m) (2 ^ p.m - 1) (cmasks p.m (steps p.m) 0) rfl cert.2.1 (Nat.pred p.m)
      (by rw [hlen, Nat.pred_eq_sub_one]; omega) (by rw [Nat.pred_eq_sub_one]; omega) hC2 k2 k1 (by rw [Nat.pred_eq_sub_one]; omega) l hk1 a21
    rw [ht1, ht2] at hc
    exact refuted_perm ((List.Perm.swap _ _ _).cons _) (refuted_chain2 o.r1 18 _ _ _ hc)

/-- **shape C3** (d = 2, (17,3,2)): triangles in the rank-2 neighbourhood of a rank-3 vertex -/
theorem shapeC3_of (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ) (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 true) (hV : VOK2 o nV3) :
    ShapeC3 o nRec nV3 := by
  intro iv hiv c1 j1 c2 j2 c3 j3 hv1 hv2 hv3 h1 h2 h3 h12 h13 h23
  obtain ⟨cert, hcert⟩ := hV iv hiv
  obtain ⟨p, hpb, hT, hlen, hC3, -, -, -⟩ := checkV2_elim o 17 iv _ _ _ _ (allV2_head hcert)
  obtain ⟨M, hM, hmem⟩ := phaseB_member hF hpb
  have mem : ∀ c' j', Vert o nRec c' j' → CP (v3term o iv) (vt o c' j') → (c', j') ∈ M := by
    intro c' j' hv' hcp
    obtain ⟨h1, h2⟩ := vert_member hF _ hv' hcp
    exact hmem c' j' hv' h1 h2
  obtain ⟨i, j', k, hij, hjk, hk, hA1, hA2, hA3, hperm⟩ :=
    triangle_of hF hM (steps p.m) hT hv1 hv2 hv3 (mem _ _ hv1 h1) (mem _ _ hv2 h2) (mem _ _ hv3 h3) h12 h13 h23
  have hm1 : 1 ≤ p.m := by omega
  have hc := phaseC3_spec o 17 p _ _ (rep32 p.m) (2 ^ p.m - 1) (cmasks p.m (steps p.m) 0) rfl
    (fun j0 => arow_lt p (steps p.m) _ hT) cert.2.1 (Nat.pred p.m) 0 [] (by rw [hlen, Nat.pred_eq_sub_one]; omega) (by rw [Nat.pred_eq_sub_one]; omega)
    (by rw [Nat.pred_eq_sub_one]; exact rowInv_init _ _ _) hC3 i j' k (by rw [Nat.pred_eq_sub_one]; omega) hij hjk hk hA1 hA2 hA3
  exact refuted_perm (hperm.symm.cons _) (refuted_chain3 o.r1 17 _ _ _ _ hc)

end GS

#print axioms GS.shapeS_of
#print axioms GS.shapeC2_of
#print axioms GS.shapeC3_of
