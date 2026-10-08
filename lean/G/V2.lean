module
public import R22Port.U_d41d8cd98f00
public import G.D2
/-! # Phases B and C (version 2), and the per-vertex shapes

Anchor-level data (`Orb2`, constants per anchor representative; checked in phase A):
* `r1`: rank-1 parts (phase D, `G.D2.R1`);
* rank-2 vertices: one 640-bit *record* per C-part `c` that has a vertex (chunks of 256 records, `CH`): `bstart` (bits 0-31:
  the first B-part with the first factor of `c`), `width` (32-47: the number of such B-parts), `a` (48-63), `YU_0` (64-95),
  `YU_1` (96-127), and from bit 128 the local vertex mask (bit `j`: `(c, bstart + j)` is a rank-2 state compatible with the
  anchor); the B-part fields `XV_0`, `XV_1` at stride 32 (`PB2X0`, `PB2X1`); bit-slices of the records' `YU_0`, `YU_1`
  (`SY0`, `SY1`, over records) and of the B-parts' `XV_0`, `XV_1` (`SX0`, `SX1`); `AR = 2^nRec - 1`, `AB2 = 2^nB2 - 1`;
* rank-3 vertices (`V3P`: packed terms at stride 256, and stride-32 field lists).

Per base term (a rank-3 vertex `v` at d = 1, 2, or a rank-2 vertex `s` at d = 0, 1):
* B: `okc` (records compatible with the base, stride 1) is walked chunk by chunk: the certificate lists the OK records of each
  chunk with their members = the vertices with an OK B-part (`okb`, stride 1) among the record's vertices;
* C: members in decreasing order; adjacency (stride-32 SWAR, compacted to stride 1, rows kept in blocks of 64), the claimed
  higher neighbours and, per edge, the claimed third vertices;
* D: every core (base + triangle, base + edge, base + partner (+ member)) has no `need` rank-1 extension (`G.D2.coreOK`).
-/
@[expose] public section
noncomputable section
namespace G.V2
open G.D2

structure Orb2 where
  r1 : R1
  SY0 : Sl29
  SY1 : Sl29
  SX0 : Sl29
  SX1 : Sl29
  AR : Nat
  AB2 : Nat
  PB2X0 : Nat
  PB2X1 : Nat
  CH : List Nat
  V3P : Nat
  V3Y0 : Nat
  V3Y1 : Nat
  V3Y2 : Nat
  V3X0 : Nat
  V3X1 : Nat
  V3X2 : Nat
  V3A : Nat
  RV3 : Nat

def RW : Nat := 640
def recOf (chunk off : Nat) : Nat := Nat.land (Nat.shiftRight chunk (Nat.mul RW off)) (Nat.sub (Nat.shiftLeft 1 RW) 1)
def rBstart (r : Nat) : Nat := Nat.land r 4294967295
def rWidth (r : Nat) : Nat := Nat.land (Nat.shiftRight r 32) 65535
def rA (r : Nat) : Nat := Nat.land (Nat.shiftRight r 48) 65535
def rYU0 (r : Nat) : Nat := Nat.land (Nat.shiftRight r 64) 4294967295
def rYU1 (r : Nat) : Nat := Nat.land (Nat.shiftRight r 96) 4294967295
def rLoc (r : Nat) : Nat := Nat.shiftRight r 128

/-- records `c` with `par (YU_c[f] &&& XV_t[q]) = 0` for `f < 2` and all columns `q < fR t` of `t` -/
def rowsCR (o : Orb2) (t : Nat) : Nat → Nat
  | 0 => o.AR
  | q+1 => Nat.land (rowsCR o t q) (Nat.xor o.AR (Nat.lor (sx o.SY0 (fXV t q)) (sx o.SY1 (fXV t q))))
/-- B-parts `b` with `par (YU_t[q] &&& XV_b[f]) = 0` for all rows `q < fR t` and `f < 2` -/
def rowsBR (o : Orb2) (t : Nat) : Nat → Nat
  | 0 => o.AB2
  | q+1 => Nat.land (rowsBR o t q) (Nat.xor o.AB2 (Nat.lor (sx o.SX0 (fYU t q)) (sx o.SX1 (fYU t q))))
def okcR (o : Orb2) (t : Nat) : Nat := rowsCR o t (fR t)
def okbR (o : Orb2) (t : Nat) : Nat := rowsBR o t (fR t)

/-- packed rank-2 term of the vertex `(r, bstart r + j)` -/
def vTerm (o : Orb2) (r j : Nat) : Nat :=
  let b := Nat.add (rBstart r) j
  Nat.lor (rYU0 r) (Nat.lor (Nat.shiftLeft (rYU1 r) 32) (Nat.lor (Nat.shiftLeft (get32 o.PB2X0 b) 96)
    (Nat.lor (Nat.shiftLeft (get32 o.PB2X1 b) 128) (Nat.lor (Nat.shiftLeft 2 192) (Nat.shiftLeft (rA r) 196)))))

/-- member packs: YU0, YU1, XV0, XV1, a (stride 32), and the member count -/
structure Packs where
  Y0 : Nat
  Y1 : Nat
  X0 : Nat
  X1 : Nat
  A : Nat
  m : Nat

def addMembers (o : Orb2) (r : Nat) : List Nat → Packs → Packs
  | [], p => p
  | j :: js, p =>
    let b := Nat.add (rBstart r) j
    let sh := Nat.mul 32 p.m
    addMembers o r js ⟨Nat.lor p.Y0 (Nat.shiftLeft (rYU0 r) sh), Nat.lor p.Y1 (Nat.shiftLeft (rYU1 r) sh),
      Nat.lor p.X0 (Nat.shiftLeft (get32 o.PB2X0 b) sh), Nat.lor p.X1 (Nat.shiftLeft (get32 o.PB2X1 b) sh),
      Nat.lor p.A (Nat.shiftLeft (rA r) sh), Nat.succ p.m⟩

/-- one chunk: the listed `(off, js)` are exactly the OK records of the chunk (window `w`), each with `js` = its vertices
with an OK B-part -/
def inChunk (o : Orb2) (okb ch : Nat) : List (Nat × List Nat) → Nat → Packs → Option Packs
  | [], w, p => cond (Nat.beq w 0) (some p) none
  | (off, js) :: rest, w, p =>
    cond (Nat.beq (bit w off) 1 && listChk1 js (Nat.land (rLoc (recOf ch off)) (win okb (rBstart (recOf ch off)) (rWidth (recOf ch off)))))
      (inChunk o okb ch rest (Nat.xor w (Nat.shiftLeft 1 off)) (addMembers o (recOf ch off) js p))
      none
def phaseB (o : Orb2) (okc okb : Nat) : Nat → List Nat → List (List (Nat × List Nat)) → Packs → Option Packs
  | _, [], [], p => some p
  | ci, ch :: chs, cc :: ccs, p =>
    match inChunk o okb ch cc (win okc (Nat.mul 256 ci) 256) p with
    | none => none
    | some p' => phaseB o okc okb (Nat.succ ci) chs ccs p'
  | _, _, _, _ => none

def memTerm (p : Packs) (k : Nat) : Nat :=
  Nat.lor (get32 p.Y0 k) (Nat.lor (Nat.shiftLeft (get32 p.Y1 k) 32) (Nat.lor (Nat.shiftLeft (get32 p.X0 k) 96)
    (Nat.lor (Nat.shiftLeft (get32 p.X1 k) 128) (Nat.lor (Nat.shiftLeft 2 192) (Nat.shiftLeft (get32 p.A k) 196)))))

/-- adjacency of the rank-2 term `t` to all members, stride 32 -/
def adj32 (p : Packs) (R t : Nat) : Nat :=
  let y0 := fYU t 0
  let y1 := fYU t 1
  let x0 := fXV t 0
  let x1 := fXV t 1
  Nat.land (nz32 (Nat.xor p.A (Nat.mul (fA t) R)) R)
    (Nat.xor R (Nat.lor (Nat.lor (Nat.lor (swarPar p.X0 R y0) (swarPar p.X1 R y0)) (Nat.lor (swarPar p.X0 R y1) (swarPar p.X1 R y1)))
      (Nat.lor (Nat.lor (swarPar p.Y0 R x0) (swarPar p.Y1 R x0)) (Nat.lor (swarPar p.Y0 R x1) (swarPar p.Y1 R x1)))))

/-- the stride-1 adjacency row of member `j > i` (blocks of 64 rows; `cur` = block of `i`, `done` = later blocks) -/
def rowOf (m ALL1 i j cur : Nat) (done : List Nat) : Nat :=
  let bi := Nat.shiftRight i 6
  let bj := Nat.shiftRight j 6
  let blk := cond (Nat.beq bi bj) cur (done.getD (Nat.sub (Nat.sub bj bi) 1) 0)
  Nat.land (Nat.shiftRight blk (Nat.mul m (Nat.land j 63))) ALL1

/-- `need` and the OK masks of the core so far -/
def core1 (o : Orb2) (need okb okc t : Nat) (c : CoreCert) : Bool :=
  coreOK o.r1 need (Nat.land okb (okB o.r1 t)) (Nat.land okc (okC o.r1 t)) c

abbrev EdgeRec := List Nat × List CoreCert
abbrev MemRec := List Nat × List EdgeRec

def coresOK (o : Orb2) (need : Nat) (p : Packs) (okb okc : Nat) : List Nat → List CoreCert → Bool
  | [], [] => true
  | k :: ks, c :: cs => core1 o need okb okc (memTerm p k) c && coresOK o need p okb okc ks cs
  | _, _ => false

/-- edges `(i, j)`, `j ∈ up_i`: claimed third vertices = `adj1(i) ∩ adj1(j) ∩ above(j)`; cores `(base, i, j, k)` -/
def edgesOK (o : Orb2) (need : Nat) (p : Packs) (i a1 ALL1 cur : Nat) (done : List Nat) (okb okc : Nat) :
    List Nat → List EdgeRec → Bool
  | [], [] => true
  | j :: js, (ks, cs) :: es =>
    let tj := memTerm p j
    let above := Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ j)) 1)
    listChk1 ks (Nat.land a1 (Nat.land (rowOf p.m ALL1 i j cur done) above)) &&
      coresOK o need p (Nat.land okb (okB o.r1 tj)) (Nat.land okc (okC o.r1 tj)) ks cs &&
      edgesOK o need p i a1 ALL1 cur done okb okc js es
  | _, _ => false

/-- triangles: members `i = m-1, ..., 0` with their records; `okb0`, `okc0`: OK masks of the base -/
def phaseC3 (o : Orb2) (need : Nat) (p : Packs) (okb0 okc0 R ALL1 : Nat) (CM : List Nat) :
    Nat → List MemRec → Nat → List Nat → Bool
  | _, [], _, _ => true
  | i, (up, es) :: recs, cur, done =>
    let ti := memTerm p i
    let a1 := compactL CM 0 (adj32 p R ti)
    let above := Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ i)) 1)
    let cur' := Nat.lor cur (Nat.shiftLeft a1 (Nat.mul p.m (Nat.land i 63)))
    listChk1 up (Nat.land a1 above) &&
      edgesOK o need p i a1 ALL1 cur done (Nat.land okb0 (okB o.r1 ti)) (Nat.land okc0 (okC o.r1 ti)) up es &&
      cond (Nat.beq (Nat.land i 63) 0)
        (phaseC3 o need p okb0 okc0 R ALL1 CM (Nat.pred i) recs 0 (cur' :: done))
        (phaseC3 o need p okb0 okc0 R ALL1 CM (Nat.pred i) recs cur' done)

/-- edges only: cores `(base, i, j)` -/
def edges2OK (o : Orb2) (need : Nat) (p : Packs) (okb okc : Nat) : List Nat → List CoreCert → Bool
  | [], [] => true
  | j :: js, c :: cs => core1 o need okb okc (memTerm p j) c && edges2OK o need p okb okc js cs
  | _, _ => false
def phaseC2 (o : Orb2) (need : Nat) (p : Packs) (okb0 okc0 R ALL1 : Nat) (CM : List Nat) :
    Nat → List (List Nat × List CoreCert) → Bool
  | _, [] => true
  | i, (up, cs) :: recs =>
    let ti := memTerm p i
    let a1 := compactL CM 0 (adj32 p R ti)
    let above := Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ i)) 1)
    listChk1 up (Nat.land a1 above) && edges2OK o need p (Nat.land okb0 (okB o.r1 ti)) (Nat.land okc0 (okC o.r1 ti)) up cs &&
      phaseC2 o need p okb0 okc0 R ALL1 CM (Nat.pred i) recs

/-! ### rank-3 partners -/
def v3term (o : Orb2) (w : Nat) : Nat := Nat.land (Nat.shiftRight o.V3P (Nat.mul 256 w)) (Nat.sub (Nat.shiftLeft 1 256) 1)
/-- rank-3 vertices `w` (index `> iv`) compatible with the rank-3 `v`: stride 32 over `V3` -/
def wMask (o : Orb2) (iv v : Nat) : Nat :=
  let R := o.RV3
  let rowsB := fun (q : Nat) => Nat.lor (swarPar o.V3X0 R (fYU v q)) (Nat.lor (swarPar o.V3X1 R (fYU v q)) (swarPar o.V3X2 R (fYU v q)))
  let colsC := fun (q : Nat) => Nat.lor (swarPar o.V3Y0 R (fXV v q)) (Nat.lor (swarPar o.V3Y1 R (fXV v q)) (swarPar o.V3Y2 R (fXV v q)))
  let bad := Nat.lor (Nat.lor (rowsB 0) (Nat.lor (rowsB 1) (rowsB 2))) (Nat.lor (colsC 0) (Nat.lor (colsC 1) (colsC 2)))
  let above := Nat.xor R (Nat.land R (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 (Nat.succ iv))) 1))
  Nat.land above (Nat.land (nz32 (Nat.xor o.V3A (Nat.mul (fA v) R)) R) (Nat.xor R bad))
/-- members compatible with the rank-3 `w`: stride 32 over the members -/
def sMask (p : Packs) (R w : Nat) : Nat :=
  let b := fun (q : Nat) => Nat.lor (swarPar p.X0 R (fYU w q)) (swarPar p.X1 R (fYU w q))
  let c := fun (q : Nat) => Nat.lor (swarPar p.Y0 R (fXV w q)) (swarPar p.Y1 R (fXV w q))
  Nat.xor R (Nat.land R (Nat.lor (Nat.lor (b 0) (Nat.lor (b 1) (b 2))) (Nat.lor (c 0) (Nat.lor (c 1) (c 2)))))

/-- d = 2, (18,1,3): per partner `w`, the members `s` compatible with `w` and the cores `(v, w, s)` -/
def shapeQ (o : Orb2) (need : Nat) (p : Packs) (R okb okc : Nat) : List (Nat × List Nat × List CoreCert) → Bool
  | [] => true
  | (w, ss, cs) :: rest =>
    let tw := v3term o w
    listChk32 ss (sMask p R tw) && coresOK o need p (Nat.land okb (okB o.r1 tw)) (Nat.land okc (okC o.r1 tw)) ss cs &&
      shapeQ o need p R okb okc rest
/-- d = 1, (19,0,3): per partner `w`, the core `(v, w)` -/
def shapeW (o : Orb2) (need okb okc : Nat) : List (Nat × CoreCert) → Bool
  | [] => true
  | (w, c) :: rest => core1 o need okb okc (v3term o w) c && shapeW o need okb okc rest

def p0 : Packs := ⟨0, 0, 0, 0, 0, 0⟩
abbrev Chs := List (List (Nat × List Nat))

/-- d = 2, rank-3 vertex `iv`: (17,3,2) triangles in N2(v) (need `n1`), (18,1,3) partners (need `n1 + 1`) -/
def checkV2 (o : Orb2) (n1 iv : Nat) (chs : Chs) (recs : List MemRec) (ws : List Nat) (qs : List (Nat × List Nat × List CoreCert)) :
    Bool :=
  let v := v3term o iv
  match phaseB o (okcR o v) (okbR o v) 0 o.CH chs p0 with
  | none => false
  | some p =>
    let R := rep32 p.m
    let ALL1 := Nat.sub (Nat.shiftLeft 1 p.m) 1
    let T := steps p.m
    Nat.ble p.m (Nat.shiftLeft 1 T) && Nat.beq recs.length p.m &&
      phaseC3 o n1 p (okB o.r1 v) (okC o.r1 v) R ALL1 (cmasks p.m T 0) (Nat.pred p.m) recs 0 [] &&
      listChk32 ws (wMask o iv v) && (ws == qs.map Prod.fst) && shapeQ o (Nat.succ n1) p R (okB o.r1 v) (okC o.r1 v) qs

/-- d = 1, rank-3 vertex `iv`: (18,2,2) edges in N2(v) (need `n1`), (19,0,3) partners (need `n1 + 1`) -/
def checkV1 (o : Orb2) (n1 iv : Nat) (chs : Chs) (recs : List (List Nat × List CoreCert)) (ws : List (Nat × CoreCert)) : Bool :=
  let v := v3term o iv
  match phaseB o (okcR o v) (okbR o v) 0 o.CH chs p0 with
  | none => false
  | some p =>
    let R := rep32 p.m
    let ALL1 := Nat.sub (Nat.shiftLeft 1 p.m) 1
    let T := steps p.m
    Nat.ble p.m (Nat.shiftLeft 1 T) && Nat.beq recs.length p.m &&
      phaseC2 o n1 p (okB o.r1 v) (okC o.r1 v) R ALL1 (cmasks p.m T 0) (Nat.pred p.m) recs &&
      listChk32 (ws.map Prod.fst) (wMask o iv v) && shapeW o (Nat.succ n1) (okB o.r1 v) (okC o.r1 v) ws

/-- d = 0, 1, rank-2 base vertex `(c, bstart + j)` with record `r`: triangles among the members with a larger record index -/
def checkS (o : Orb2) (n1 c r j : Nat) (chs : Chs) (recs : List MemRec) : Bool :=
  let s := vTerm o r j
  let above := Nat.xor o.AR (Nat.land o.AR (Nat.sub (Nat.shiftLeft 1 (Nat.succ c)) 1))
  match phaseB o (Nat.land (okcR o s) above) (okbR o s) 0 o.CH chs p0 with
  | none => false
  | some p =>
    let R := rep32 p.m
    let ALL1 := Nat.sub (Nat.shiftLeft 1 p.m) 1
    let T := steps p.m
    Nat.ble p.m (Nat.shiftLeft 1 T) && Nat.beq recs.length p.m &&
      phaseC3 o n1 p (okB o.r1 s) (okC o.r1 s) R ALL1 (cmasks p.m T 0) (Nat.pred p.m) recs 0 []

abbrev VCert2 := Chs × List MemRec × List Nat × List (Nat × List Nat × List CoreCert)
abbrev VCert1 := Chs × List (List Nat × List CoreCert) × List (Nat × CoreCert)
abbrev SCert := Chs × List MemRec

/-- rank-3 vertices `iv, iv+1, ...` -/
def allV2 (o : Orb2) (n1 : Nat) : Nat → List VCert2 → Bool
  | _, [] => true
  | iv, (chs, recs, ws, qs) :: cs => checkV2 o n1 iv chs recs ws qs && allV2 o n1 (Nat.succ iv) cs
def allV1 (o : Orb2) (n1 : Nat) : Nat → List VCert1 → Bool
  | _, [] => true
  | iv, (chs, recs, ws) :: cs => checkV1 o n1 iv chs recs ws && allV1 o n1 (Nat.succ iv) cs
/-- the vertices `js` of record `r` (global index `c`) with their certificates -/
def vertsS (o : Orb2) (n1 c r : Nat) : List Nat → List SCert → Bool
  | [], [] => true
  | j :: js, (chs, recs) :: cs => checkS o n1 c r j chs recs && vertsS o n1 c r js cs
  | _, _ => false
/-- the bits `[jlo, jhi)` -/
def jwin (jlo jhi : Nat) : Nat := Nat.xor (Nat.sub (Nat.shiftLeft 1 jhi) 1) (Nat.sub (Nat.shiftLeft 1 jlo) 1)
/-- entries `(off, jlo, jhi, js, certs)` of chunk `ci`: `js` = exactly the vertices of record `off` with local index in
`[jlo, jhi)`, each with its certificate -/
def allS (o : Orb2) (n1 ci ch : Nat) : List (Nat × Nat × Nat × List Nat × List SCert) → Bool
  | [] => true
  | (off, jlo, jhi, js, cs) :: rest =>
    listChk1 js (Nat.land (rLoc (recOf ch off)) (jwin jlo jhi)) && vertsS o n1 (Nat.add (Nat.mul 256 ci) off) (recOf ch off) js cs &&
      allS o n1 ci ch rest

end G.V2
end
