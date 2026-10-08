module
public import R22Port.U_d41d8cd98f00
public import G.Accept
public import GS.Pk
/-! # The intermediate statements of the soundness proof (fixed interface between the parallel tracks)

Each track proves one theorem whose statement is fixed here; the top level (`GS/Top.lean`) composes them.
* **phase A** (`PhaseAThm`): from `PhaseA d (pkState d T0) v3` and the anchor's validity, the rank-1 data facts
  (`R1Data`), the record/V3 data facts (`OrbFacts`), and completeness of the lists for rank 1, 2, 3 states compatible with
  the anchor (`R1Complete`, `RecComplete`, `V3Complete`);
* **phase D** (`PhaseDThm`): `coreOK r1 need okb okc cert = true` and `R1Data` ⇒ no `need` pairwise compatible candidates
  of the masks (`NoClique`);
* **shapes** (`ShapeThmC3`, …): the per-base checks ⇒ every core of the shape's form is refuted (`Refuted`).
Checker-level compatibility of packed terms is the checker's own `compatP` (`CP`). -/
@[expose] public section
namespace GS
open G G.V2 G.D2 G.A2 G.Acc

/-! ## core masks and refutation -/

/-- the B-part mask of a core: the rank-1 B-parts compatible (B-direction) with every core term -/
def okbOf (r1 : R1) (ts : List ℕ) : ℕ := ts.foldl (fun m t => m &&& okB r1 t) r1.AB
/-- the C-part mask of a core -/
def okcOf (r1 : R1) (ts : List ℕ) : ℕ := ts.foldl (fun m t => m &&& okC r1 t) r1.AC

/-- the core `ts` is refuted for `need`: a phase-D certificate is accepted on its masks -/
def Refuted (r1 : R1) (need : ℕ) (ts : List ℕ) : Prop :=
  ∃ cert : CoreCert, coreOK r1 need (okbOf r1 ts) (okcOf r1 ts) cert = true

/-- checker-level compatibility of packed terms -/
def CP (t s : ℕ) : Prop := compatP t s = true

/-! ## the anchor-level lists -/

/-- a rank-2 vertex: record `c < nRec`, local vertex `j` -/
def Vert (o : Orb2) (nRec c j : ℕ) : Prop := c < nRec ∧ (rLoc (recG o c)).testBit j = true

/-- its packed term -/
def vt (o : Orb2) (c j : ℕ) : ℕ := vTerm o (recG o c) j

/-- slices of the first `n` fields of `x` (no bits at or above `n`) -/
def SlOKn (S : Sl29) (x : ℕ → ℕ) (n : ℕ) : Prop :=
  ∀ i < 29, ∀ k, (S.get i).testBit k = (decide (k < n) && (x k).testBit i)

/-- the empty group (default of `getD`) -/
abbrev grpAt (r1 : R1) (gi : ℕ) : Grp := r1.gs.getD gi g0

/-- the rank-1 data of an anchor (phase A): slices, masks, field bounds, the groups (one per first factor) -/
structure R1Data (r1 : R1) (PB1 PC1 nB nC : ℕ) : Prop where
  SB : SlOKn r1.SB (fld PB1) nB
  SC : SlOKn r1.SC (fld PC1) nC
  AB : r1.AB = 2 ^ nB - 1
  AC : r1.AC = 2 ^ nC - 1
  fB : ∀ b < nB, fld PB1 b < 2 ^ 29
  fC : ∀ c < nC, fld PC1 c < 2 ^ 29
  grps : ∀ gi < r1.gs.length, (grpAt r1 gi).lb + (grpAt r1 gi).nb ≤ nB ∧ (grpAt r1 gi).lc + (grpAt r1 gi).nc ≤ nC ∧
    (grpAt r1 gi).PB = win PB1 (32 * (grpAt r1 gi).lb) (32 * (grpAt r1 gi).nb) ∧
    (grpAt r1 gi).PC = win PC1 (32 * (grpAt r1 gi).lc) (32 * (grpAt r1 gi).nc) ∧
    0 < (grpAt r1 gi).a ∧ (grpAt r1 gi).a < 512
  a_inj : ∀ gi < r1.gs.length, ∀ gj < r1.gs.length, (grpAt r1 gi).a = (grpAt r1 gj).a → gi = gj
  disjB : ∀ gi < r1.gs.length, ∀ gj < r1.gs.length, gi ≠ gj → ∀ b, (grpAt r1 gi).lb ≤ b → b < (grpAt r1 gi).lb + (grpAt r1 gi).nb →
    ¬ ((grpAt r1 gj).lb ≤ b ∧ b < (grpAt r1 gj).lb + (grpAt r1 gj).nb)
  disjC : ∀ gi < r1.gs.length, ∀ gj < r1.gs.length, gi ≠ gj → ∀ c, (grpAt r1 gi).lc ≤ c → c < (grpAt r1 gi).lc + (grpAt r1 gi).nc →
    ¬ ((grpAt r1 gj).lc ≤ c ∧ c < (grpAt r1 gj).lc + (grpAt r1 gj).nc)

/-- a rank-1 candidate `(gi, b, c)` of the masks `okb`, `okc`: B-part `b` and C-part `c` of group `gi`, both OK, with
diagonal parity 1 (a valid rank-1 state) -/
def Cand (r1 : R1) (PB1 PC1 okb okc : ℕ) (x : ℕ × ℕ × ℕ) : Prop :=
  x.1 < r1.gs.length ∧ (grpAt r1 x.1).lb ≤ x.2.1 ∧ x.2.1 < (grpAt r1 x.1).lb + (grpAt r1 x.1).nb ∧
  (grpAt r1 x.1).lc ≤ x.2.2 ∧ x.2.2 < (grpAt r1 x.1).lc + (grpAt r1 x.1).nc ∧
  okb.testBit x.2.1 = true ∧ okc.testBit x.2.2 = true ∧ par32 (fld PC1 x.2.2 &&& fld PB1 x.2.1) = 1

/-- the packed term of a candidate -/
def term1 (r1 : R1) (PB1 PC1 : ℕ) (x : ℕ × ℕ × ℕ) : ℕ := mkTerm1 (fld PC1 x.2.2) (fld PB1 x.2.1) (grpAt r1 x.1).a

/-- no `need` pairwise compatible candidates -/
def NoClique (r1 : R1) (PB1 PC1 need okb okc : ℕ) : Prop :=
  ¬ ∃ L : List (ℕ × ℕ × ℕ), L.length = need ∧ (∀ x ∈ L, Cand r1 PB1 PC1 okb okc x) ∧
    L.Pairwise (fun x y => CP (term1 r1 PB1 PC1 x) (term1 r1 PB1 PC1 y))

/-- the record / B-part / V3 data of an anchor (phase A), used by phases B and C -/
structure OrbFacts (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ) (v3 : Bool) : Prop where
  SY0 : SlOKn o.SY0 (fld PY0) nRec
  SY1 : SlOKn o.SY1 (fld PY1) nRec
  SX0 : SlOKn o.SX0 (fld o.PB2X0) nB2
  SX1 : SlOKn o.SX1 (fld o.PB2X1) nB2
  AR : o.AR = 2 ^ nRec - 1
  AB2 : o.AB2 = 2 ^ nB2 - 1
  recs : ∀ c < nRec, fld PY0 c = rYU0 (recG o c) ∧ fld PY1 c = rYU1 (recG o c) ∧
    rYU0 (recG o c) < 2 ^ 29 ∧ rYU1 (recG o c) < 2 ^ 29 ∧
    rBstart (recG o c) + rWidth (recG o c) ≤ nB2 ∧ rLoc (recG o c) < 2 ^ rWidth (recG o c) ∧
    0 < rA (recG o c) ∧ rA (recG o c) < 512
  bx : ∀ b < nB2, fld o.PB2X0 b < 2 ^ 29 ∧ fld o.PB2X1 b < 2 ^ 29
  CH : o.CH.length = (nRec + 255) / 256
  V3 : v3 = true → o.RV3 = rep32 nV3 ∧ ∀ iv < nV3,
    fld o.V3Y0 iv = fYU (v3term o iv) 0 ∧ fld o.V3Y1 iv = fYU (v3term o iv) 1 ∧ fld o.V3Y2 iv = fYU (v3term o iv) 2 ∧
    fld o.V3X0 iv = fXV (v3term o iv) 0 ∧ fld o.V3X1 iv = fXV (v3term o iv) 1 ∧ fld o.V3X2 iv = fXV (v3term o iv) 2 ∧
    fld o.V3A iv = fA (v3term o iv) ∧ fR (v3term o iv) = 3 ∧
    (∀ q < 3, fYU (v3term o iv) q < 2 ^ 29 ∧ fXV (v3term o iv) q < 2 ^ 29) ∧ fA (v3term o iv) < 512

/-- completeness for rank 1: every valid rank-1 state compatible with the anchor is a pair of parts of its group -/
def R1Complete (d : ℕ) (T0 : State) (r1 : R1) (PB1 PC1 : ℕ) : Prop :=
  ∀ s : State, Valid d s → Compat d T0 s → rk s.a = 1 → ∃ gi b c, gi < r1.gs.length ∧
    (grpAt r1 gi).lb ≤ b ∧ b < (grpAt r1 gi).lb + (grpAt r1 gi).nb ∧ (grpAt r1 gi).lc ≤ c ∧ c < (grpAt r1 gi).lc + (grpAt r1 gi).nc ∧
    fld PB1 b = fXV (pkState d s) 0 ∧ fld PC1 c = fYU (pkState d s) 0 ∧ (grpAt r1 gi).a = s.a

/-- completeness for rank 2: every valid rank-2 state compatible with the anchor is a vertex -/
def RecComplete (d : ℕ) (T0 : State) (o : Orb2) (nRec : ℕ) : Prop :=
  ∀ s : State, Valid d s → Compat d T0 s → rk s.a = 2 → ∃ c j, Vert o nRec c j ∧ vt o c j = pkState d s

/-- completeness for rank 3 -/
def V3Complete (d : ℕ) (T0 : State) (o : Orb2) (nV3 : ℕ) : Prop :=
  ∀ s : State, Valid d s → Compat d T0 s → rk s.a = 3 → ∃ iv < nV3, v3term o iv = pkState d s

/-! ## the statements of the tracks -/

/-- **phase A** (track A) -/
def PhaseAThm : Prop :=
  ∀ (d : ℕ) (T0 : State) (v3 : Bool) (A : PhaseA d (pkState d T0) v3), d ≤ 2 → Valid d T0 →
    R1Data A.o.r1 A.PB1 A.PC1 A.B1.length A.C1.length ∧ R1Complete d T0 A.o.r1 A.PB1 A.PC1 ∧
    OrbFacts A.o A.PY0 A.PY1 A.nB2 A.nRec A.nV3 v3 ∧ RecComplete d T0 A.o A.nRec ∧
    (v3 = true → V3Complete d T0 A.o A.nV3)

/-- **phase D** (track D) -/
def PhaseDThm : Prop :=
  ∀ (r1 : R1) (PB1 PC1 nB nC : ℕ), R1Data r1 PB1 PC1 nB nC →
    ∀ (need okb okc : ℕ) (cert : CoreCert), coreOK r1 need okb okc cert = true → NoClique r1 PB1 PC1 need okb okc

/-- d = 2, (17,3,2): triangles in the rank-2 neighbourhood of a rank-3 vertex -/
def ShapeC3 (o : Orb2) (nRec nV3 : ℕ) : Prop :=
  ∀ iv < nV3, ∀ c1 j1 c2 j2 c3 j3, Vert o nRec c1 j1 → Vert o nRec c2 j2 → Vert o nRec c3 j3 →
    CP (v3term o iv) (vt o c1 j1) → CP (v3term o iv) (vt o c2 j2) → CP (v3term o iv) (vt o c3 j3) →
    CP (vt o c1 j1) (vt o c2 j2) → CP (vt o c1 j1) (vt o c3 j3) → CP (vt o c2 j2) (vt o c3 j3) →
    Refuted o.r1 17 [v3term o iv, vt o c1 j1, vt o c2 j2, vt o c3 j3]

/-- d = 2, (18,1,3): a rank-3 partner and one rank-2 vertex -/
def ShapeQ (o : Orb2) (nRec nV3 : ℕ) : Prop :=
  ∀ iv < nV3, ∀ iw < nV3, iv < iw → CP (v3term o iv) (v3term o iw) → ∀ c j, Vert o nRec c j →
    CP (v3term o iv) (vt o c j) → CP (v3term o iw) (vt o c j) →
    Refuted o.r1 18 [v3term o iv, v3term o iw, vt o c j]

/-- d = 1, (18,2,2): edges in the rank-2 neighbourhood of a rank-3 vertex -/
def ShapeC2 (o : Orb2) (nRec nV3 : ℕ) : Prop :=
  ∀ iv < nV3, ∀ c1 j1 c2 j2, Vert o nRec c1 j1 → Vert o nRec c2 j2 →
    CP (v3term o iv) (vt o c1 j1) → CP (v3term o iv) (vt o c2 j2) → CP (vt o c1 j1) (vt o c2 j2) →
    Refuted o.r1 18 [v3term o iv, vt o c1 j1, vt o c2 j2]

/-- d = 1, (19,0,3): two compatible rank-3 vertices -/
def ShapeW (o : Orb2) (nV3 : ℕ) : Prop :=
  ∀ iv < nV3, ∀ iw < nV3, iv < iw → CP (v3term o iv) (v3term o iw) → Refuted o.r1 19 [v3term o iv, v3term o iw]

/-- d ≤ 1, (17,4,1) and (17,5,0): a rank-2 base vertex and three vertices of larger record index -/
def ShapeS (o : Orb2) (nRec : ℕ) : Prop :=
  ∀ c j c1 j1 c2 j2 c3 j3, Vert o nRec c j → Vert o nRec c1 j1 → Vert o nRec c2 j2 → Vert o nRec c3 j3 →
    c < c1 → c < c2 → c < c3 →
    CP (vt o c j) (vt o c1 j1) → CP (vt o c j) (vt o c2 j2) → CP (vt o c j) (vt o c3 j3) →
    CP (vt o c1 j1) (vt o c2 j2) → CP (vt o c1 j1) (vt o c3 j3) → CP (vt o c2 j2) (vt o c3 j3) →
    Refuted o.r1 17 [vt o c j, vt o c1 j1, vt o c2 j2, vt o c3 j3]

/-- **shapes, d = 2** (track V2) -/
def ShapeThm2 : Prop :=
  ∀ (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ), OrbFacts o PY0 PY1 nB2 nRec nV3 true → VOK2 o nV3 →
    ShapeC3 o nRec nV3 ∧ ShapeQ o nRec nV3

/-- **shapes, d = 1, rank-3 base** (track V1) -/
def ShapeThm1 : Prop :=
  ∀ (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ), OrbFacts o PY0 PY1 nB2 nRec nV3 true → VOK1 o nV3 →
    ShapeC2 o nRec nV3 ∧ ShapeW o nV3

/-- **shape S, d ≤ 1, rank-2 base** (track V1) -/
def ShapeThmS : Prop :=
  ∀ (o : Orb2) (PY0 PY1 nB2 nRec nV3 : ℕ) (v3 : Bool), OrbFacts o PY0 PY1 nB2 nRec nV3 v3 → SOK o nRec → ShapeS o nRec

end GS
