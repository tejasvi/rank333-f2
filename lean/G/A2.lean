module
public import R22Port.U_d41d8cd98f00
public import G.Lists
public import G.V2
/-! # Phase A (version 2): the anchor-level data of one anchor representative is complete and consistent

For an anchor `t0` (packed, rank `r0 = fR t0`, fields `YU_t0[al]`, `XV_t0[be]`), excess `d`, and a first factor `a` of rank `r`:
* `cmask a U` (stride 32 over the 512 values of `C`): `par (YU_s[al] &&& XV_t0[be]) = 0` for `al < r`, `be < r0`, where
  `YU_s[al] = yvec (Rc a al) C ||| U[al] <<< 27` (the C-direction of `Compat t0 s`);
* `bmask a V` (over `B`): `par (YU_t0[al] &&& XV_s[be]) = 0` for `al < r0`, `be < r` (the B-direction);
* `validB` (over `B`, from `bmask`): also `par (YU_s[al] &&& XV_s[be]) = [al = be]` for `al, be < r` (validity of `s`).

Checked here by walking the certificate lists in canonical order against the masks:
* rank 1: the B-part list is exactly `[(a, V, B) | a, V, B ∈ bmask a V]` (`a` increasing, then `V`, then `B` increasing),
  the C-part list likewise; their field packs, the per-first-factor groups and the masks `AB`, `AC` of `G.D2.R1`;
* rank 2, per first factor: the complete B-part list (`B` increasing inside each `(a, V)`, so that the vertex mask index
  `off a V + rank of B in bmask a V` is the B-part's position) and its fields; every `C ∈ cmask a U` with a vertex is the next
  record, whose fields and local vertex mask are recomputed;
* rank 3, per first factor: the term-1 list `V3` is exactly the rank-3 states compatible with `t0` (order `(a, U, C, V, B)`);
* the bit-slices against the stride-32 packs (`slicesOK`), the ranges and the global constants (`checkGlob`).
-/
@[expose] public section
noncomputable section
namespace G.A2
open G.LS

def M27 : Nat := 134217727
/-- parity of the low 4 bits (a dot product of two dirt rows, `d ≤ 4`) -/
def par2 (x : Nat) : Nat := Nat.land (Nat.xor x (Nat.xor (Nat.shiftRight x 1) (Nat.xor (Nat.shiftRight x 2) (Nat.shiftRight x 3)))) 1
def rowD (d W q : Nat) : Nat := Nat.land (Nat.shiftRight W (Nat.mul d q)) (Nat.sub (Nat.shiftLeft 1 d) 1)
/-- `S` if `p = 1`, its complement in `R512` if `p = 0` -/
def sel (p S : Nat) : Nat := Nat.xor S (Nat.mul R512 (Nat.xor 1 p))
/-- popcount of a stride-32 0/1 mask over at most 512 fields -/
def pc32 (M : Nat) : Nat := Nat.land (Nat.shiftRight (Nat.mul M R512) (Nat.mul 32 511)) 4294967295

/-- and over `k < r * r0` (`al = k / r0 < r`, `be = k % r0`) -/
def cmask (t0 d a U r0 : Nat) : Nat → Nat → Nat
  | 0, acc => acc
  | k+1, acc =>
    let al := Nat.div k r0
    let be := Nat.mod k r0
    cmask t0 d a U r0 k (Nat.land acc (sel (par2 (Nat.land (rowD d U al) (Nat.shiftRight (fXV t0 be) 27)))
      (swarPar (YL (G.Rc a al)) R512 (Nat.land (fXV t0 be) M27))))
/-- and over `k < r0 * r` (`al = k / r < r0`, `be = k % r`) -/
def bmask (t0 d a V r : Nat) : Nat → Nat → Nat
  | 0, acc => acc
  | k+1, acc =>
    let al := Nat.div k r
    let be := Nat.mod k r
    bmask t0 d a V r k (Nat.land acc (sel (par2 (Nat.land (Nat.shiftRight (fYU t0 al) 27) (rowD d V be)))
      (swarPar (XL (G.Lc a be)) R512 (Nat.land (fYU t0 al) M27))))
def cmaskF (t0 d a U r : Nat) : Nat := cmask t0 d a U (fR t0) (Nat.mul r (fR t0)) R512
def bmaskF (t0 d a V r : Nat) : Nat := bmask t0 d a V r (Nat.mul (fR t0) r) R512

/-- `swarPar (XL (Lc a be)) R512 (yvec (Rc a al) C)` for `k = al * r + be`, listed for decreasing `k` -/
def diagParts (a C r : Nat) : Nat → List Nat
  | 0 => []
  | k+1 => swarPar (XL (G.Lc a (Nat.mod k r))) R512 (get32 (YL (G.Rc a (Nat.div k r))) C) :: diagParts a C r k
def validB (d U V r : Nat) : List Nat → Nat → Nat → Nat
  | [], _, acc => acc
  | S :: Ss, k, acc =>
    let k' := Nat.pred k
    let al := Nat.div k' r
    let be := Nat.mod k' r
    let want := Nat.xor (cond (Nat.beq al be) 1 0) (par2 (Nat.land (rowD d U al) (rowD d V be)))
    validB d U V r Ss k' (Nat.land acc (sel want S))

/-- pairwise packing (levels halve the list) -/
def packPairs (w : Nat) : List Nat → List Nat
  | [] => []
  | [x] => [x]
  | x :: y :: rest => Nat.lor x (Nat.shiftLeft y w) :: packPairs w rest
def packAll (w : Nat) : Nat → List Nat → Nat
  | 0, _ => 0
  | f+1, L => match L with
    | [] => 0
    | [x] => x
    | _ => packAll (Nat.mul 2 w) f (packPairs w L)
def pk (w : Nat) (L : List Nat) : Nat := packAll w 25 L

/-- first factors of rank `r` other than `skip`, increasing -/
def ofRank (r skip : Nat) : List Nat := (List.range 512).filter fun a => Nat.beq (G.rk a) r && !(Nat.beq a skip) && !(Nat.beq a 0)

/-! ### complete part lists (raw entry `a | W <<< 9 | X <<< 13`) -/
def eA (e : Nat) : Nat := Nat.land e 511
def eW (e : Nat) : Nat := Nat.land (Nat.shiftRight e 9) 15
def eX (e : Nat) : Nat := Nat.shiftRight e 13

/-- consume the entries of group `(a, W)`: each `X` is the least element left in `M` (so `X` increases), cleared; at the
end `M = 0`; returns the rest -/
def group (a W : Nat) : List Nat → Nat → Option (List Nat)
  | [], M => cond (Nat.beq M 0) (some []) none
  | e :: es, M =>
    cond (Nat.beq (eA e) a && Nat.beq (eW e) W)
      (cond (Nat.beq (bit M (Nat.mul 32 (eX e))) 1 && Nat.beq (Nat.land M (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 (eX e))) 1)) 0)
        (group a W es (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 (eX e))))) none)
      (cond (Nat.beq M 0) (some (e :: es)) none)
def groupsW (mask : Nat → Nat → Nat) (a : Nat) : Nat → Nat → List Nat → Option (List Nat)
  | 0, _, es => some es
  | n+1, W, es =>
    match group a W es (mask a W) with
    | none => none
    | some es' => groupsW mask a n (Nat.succ W) es'
def groups (mask : Nat → Nat → Nat) (nW : Nat) : List Nat → List Nat → Option (List Nat)
  | [], es => some es
  | a :: as, es =>
    match groupsW mask a nW 0 es with
    | none => none
    | some es' => groups mask nW as es'

/-- packed fields from the constant lists -/
def yuF (d a C U q : Nat) : Nat := Nat.lor (get32 (YL (G.Rc a q)) C) (Nat.shiftLeft (rowD d U q) 27)
def xvF (d a B V q : Nat) : Nat := Nat.lor (get32 (XL (G.Lc a q)) B) (Nat.shiftLeft (rowD d V q) 27)
def term3 (d a B C U V : Nat) : Nat :=
  Nat.lor (yuF d a C U 0) (Nat.lor (Nat.shiftLeft (yuF d a C U 1) 32) (Nat.lor (Nat.shiftLeft (yuF d a C U 2) 64)
  (Nat.lor (Nat.shiftLeft (xvF d a B V 0) 96) (Nat.lor (Nat.shiftLeft (xvF d a B V 1) 128) (Nat.lor (Nat.shiftLeft (xvF d a B V 2) 160)
  (Nat.lor (Nat.shiftLeft 3 192) (Nat.shiftLeft a 196)))))))

/-- the vertex pairs `V | B <<< 8` with this `V`: each `B` in `M` (cleared); sets bit `off + rank of B in Bm` -/
def grpV (V : Nat) : List Nat → Nat → Nat → Nat → Nat → Option (List Nat × Nat)
  | [], M, _, _, acc => cond (Nat.beq M 0) (some ([], acc)) none
  | p :: ps, M, Bm, off, acc =>
    cond (Nat.beq (Nat.land p 255) V)
      (cond (Nat.beq (bit M (Nat.mul 32 (Nat.shiftRight p 8))) 1)
         (grpV V ps (Nat.xor M (Nat.shiftLeft 1 (Nat.mul 32 (Nat.shiftRight p 8)))) Bm off
           (Nat.lor acc (Nat.shiftLeft 1 (Nat.add off (pc32 (Nat.land Bm (Nat.sub (Nat.shiftLeft 1 (Nat.mul 32 (Nat.shiftRight p 8))) 1)))))))
         none)
      (cond (Nat.beq M 0) (some (p :: ps, acc)) none)
def recV (d U r : Nat) (parts : List Nat) : List Nat → List Nat → Nat → List Nat → Nat → Option Nat
  | [], [], _, ps, acc => cond ps.isEmpty (some acc) none
  | Bm :: BmL, off :: offL, V, ps, acc =>
    match grpV V ps (validB d U V r parts (Nat.mul r r) Bm) Bm off acc with
    | none => none
    | some (ps', acc') => recV d U r parts BmL offL (Nat.succ V) ps' acc'
  | _, _, _, _, _ => none

def bmL (t0 d a r : Nat) : Nat → Nat → List Nat
  | 0, _ => []
  | n+1, V => bmaskF t0 d a V r :: bmL t0 d a r n (Nat.succ V)
def offsL : List Nat → Nat → List Nat
  | [], _ => []
  | M :: Ms, acc => acc :: offsL Ms (Nat.add acc (pc32 M))
def sumPc : List Nat → Nat
  | [] => 0
  | M :: Ms => Nat.add (pc32 M) (sumPc Ms)

abbrev CEnt := Nat × List Nat

/-- rank 2, one `(a, U)`: the C entries (C | record flag <<< 9, pairs) are exactly `cmask a U`; records are appended -/
def cents2 (d a U bstart width : Nat) (BmL offL : List Nat) : List CEnt → Nat → List Nat → Option (List Nat)
  | [], Cm, recs => cond (Nat.beq Cm 0) (some recs) none
  | (ce, ps) :: rest, Cm, recs =>
    let C := Nat.land ce 511
    let pos := Nat.mul 32 C
    cond (Nat.beq (bit Cm pos) 1)
      (match recV d U 2 (diagParts a C 2 4) BmL offL 0 ps 0 with
       | none => none
       | some vloc =>
         cond (Nat.beq (Nat.shiftRight ce 9) 1)
           (cents2 d a U bstart width BmL offL rest (Nat.xor Cm (Nat.shiftLeft 1 pos))
             (Nat.lor bstart (Nat.lor (Nat.shiftLeft width 32) (Nat.lor (Nat.shiftLeft a 48) (Nat.lor (Nat.shiftLeft (yuF d a C U 0) 64)
               (Nat.lor (Nat.shiftLeft (yuF d a C U 1) 96) (Nat.shiftLeft vloc 128))))) :: recs))
           (cond (Nat.beq vloc 0) (cents2 d a U bstart width BmL offL rest (Nat.xor Cm (Nat.shiftLeft 1 pos)) recs) none))
      none
def us2 (t0 d a bstart width : Nat) (BmL offL : List Nat) : Nat → List (List CEnt) → List Nat → Option (List Nat)
  | _, [], recs => some recs
  | U, cs :: css, recs =>
    match cents2 d a U bstart width BmL offL cs (cmaskF t0 d a U 2) recs with
    | none => none
    | some recs' => us2 t0 d a bstart width BmL offL (Nat.succ U) css recs'

def cents3 (d a U : Nat) (BmL offL : List Nat) : List CEnt → Nat → List Nat → Option (List Nat)
  | [], Cm, vs => cond (Nat.beq Cm 0) (some vs) none
  | (ce, ps) :: rest, Cm, vs =>
    let C := Nat.land ce 511
    let pos := Nat.mul 32 C
    cond (Nat.beq (bit Cm pos) 1)
      (match recV d U 3 (diagParts a C 3 9) BmL offL 0 ps 0 with
       | none => none
       | some _ => cents3 d a U BmL offL rest (Nat.xor Cm (Nat.shiftLeft 1 pos)) (push3 d a C U ps vs))
      none
where
  push3 (d a C U : Nat) : List Nat → List Nat → List Nat
    | [], vs => vs
    | p :: ps, vs => push3 d a C U ps (term3 d a (Nat.shiftRight p 8) C U (Nat.land p 255) :: vs)
def us3 (t0 d a : Nat) (BmL offL : List Nat) : Nat → List (List CEnt) → List Nat → Option (List Nat)
  | _, [], vs => some vs
  | U, cs :: css, vs =>
    match cents3 d a U BmL offL cs (cmaskF t0 d a U 3) vs with
    | none => none
    | some vs' => us3 t0 d a BmL offL (Nat.succ U) css vs'

/-! ### rank 1 -/
/-- the next `n` entries have first factor `a`; returns the rest -/
def takeA (a : Nat) : Nat → List Nat → Option (List Nat)
  | 0, es => some es
  | n+1, e :: es => cond (Nat.beq (eA e) a) (takeA a n es) none
  | _+1, [] => none
/-- the groups: first factor, offsets, counts and field packs (windows of `PB1`, `PC1`) against the raw lists -/
def grpsOK (PB1 PC1 : Nat) : List G.D2.Grp → List Nat → List Nat → List Nat → Nat → Nat → Bool
  | [], [], [], [], _, _ => true
  | g :: gs, a :: as, B1, C1, pb, pc =>
    Nat.beq g.a a && Nat.beq g.lb pb && Nat.beq g.lc pc &&
    Nat.beq g.PB (win PB1 (Nat.mul 32 pb) (Nat.mul 32 g.nb)) && Nat.beq g.PC (win PC1 (Nat.mul 32 pc) (Nat.mul 32 g.nc)) &&
    (match takeA a g.nb B1, takeA a g.nc C1 with
     | some B1', some C1' => grpsOK PB1 PC1 gs as B1' C1' (Nat.add pb g.nb) (Nat.add pc g.nc)
     | _, _ => false)
  | _, _, _, _, _, _ => false

/-- rank 1: complete part lists, their packs `PB1`, `PC1`, the groups and the masks of `r1` -/
def checkR1 (t0 d : Nat) (r1 : G.D2.R1) (PB1 PC1 : Nat) (B1 C1 : List Nat) : Bool :=
  let nU1 := Nat.shiftLeft 1 d
  let as1 := ofRank 1 (fA t0)
  (match groups (fun a V => bmaskF t0 d a V 1) nU1 as1 B1, groups (fun a U => cmaskF t0 d a U 1) nU1 as1 C1 with
   | some [], some [] => true
   | _, _ => false) &&
  Nat.beq (pk 32 (B1.map fun e => xvF d (eA e) (eX e) (eW e) 0)) PB1 &&
  Nat.beq (pk 32 (C1.map fun e => yuF d (eA e) (eX e) (eW e) 0)) PC1 &&
  grpsOK PB1 PC1 r1.gs as1 B1 C1 0 0 &&
  Nat.beq r1.AB (Nat.sub (Nat.shiftLeft 1 B1.length) 1) && Nat.beq r1.AC (Nat.sub (Nat.shiftLeft 1 C1.length) 1)

/-! ### rank 2 and rank 3, per first factor -/
def bFields (d : Nat) (o : G.V2.Orb2) : Nat → List Nat → Bool
  | _, [] => true
  | b, e :: es => Nat.beq (get32 o.PB2X0 b) (xvF d (eA e) (eX e) (eW e) 0) &&
      Nat.beq (get32 o.PB2X1 b) (xvF d (eA e) (eX e) (eW e) 1) && bFields d o (Nat.succ b) es
/-- the records at indices `c, c+1, ...` equal `recs`, with their C-part fields in `PY0`, `PY1` -/
def cmpRecs (o : G.V2.Orb2) (PY0 PY1 : Nat) : Nat → List Nat → Bool
  | _, [] => true
  | c, r :: rs => Nat.beq (G.V2.recOf (o.CH.getD (Nat.shiftRight c 8) 0) (Nat.land c 255)) r &&
      Nat.beq (get32 PY0 c) (G.V2.rYU0 r) && Nat.beq (get32 PY1 c) (G.V2.rYU1 r) && cmpRecs o PY0 PY1 (Nat.succ c) rs
/-- rank 2, one first factor `a` with B-parts `[b0, b1)` and records `[c0, c1)` -/
def checkA2a (t0 d : Nat) (o : G.V2.Orb2) (PY0 PY1 a b0 b1 c0 c1 : Nat) (es : List Nat) (css : List (List CEnt)) : Bool :=
  let nU := Nat.shiftLeft 1 (Nat.mul 2 d)
  let BmL := bmL t0 d a 2 nU 0
  let width := sumPc BmL
  Nat.beq (Nat.add b0 width) b1 && Nat.ble width 512 && Nat.beq es.length width &&
  (match groupsW (fun a V => bmaskF t0 d a V 2) a nU 0 es with
   | some [] => true
   | _ => false) &&
  bFields d o b0 es && Nat.beq css.length nU &&
  (match us2 t0 d a b0 width BmL (offsL BmL 0) 0 css [] with
   | some recsR => let recs := recsR.reverse; Nat.beq (Nat.add c0 recs.length) c1 && cmpRecs o PY0 PY1 c0 recs
   | none => false)
def cmpV3 (o : G.V2.Orb2) : Nat → List Nat → Bool
  | _, [] => true
  | v, t :: ts => Nat.beq (G.V2.v3term o v) t &&
      Nat.beq (get32 o.V3Y0 v) (fYU t 0) && Nat.beq (get32 o.V3Y1 v) (fYU t 1) && Nat.beq (get32 o.V3Y2 v) (fYU t 2) &&
      Nat.beq (get32 o.V3X0 v) (fXV t 0) && Nat.beq (get32 o.V3X1 v) (fXV t 1) && Nat.beq (get32 o.V3X2 v) (fXV t 2) &&
      Nat.beq (get32 o.V3A v) (fA t) && cmpV3 o (Nat.succ v) ts
def checkA3a (t0 d : Nat) (o : G.V2.Orb2) (a v0 v1 : Nat) (css : List (List CEnt)) : Bool :=
  let nU := Nat.shiftLeft 1 (Nat.mul 3 d)
  let BmL := bmL t0 d a 3 nU 0
  Nat.beq css.length nU &&
  (match us3 t0 d a BmL (offsL BmL 0) 0 css [] with
   | some vsR => let vs := vsR.reverse; Nat.beq (Nat.add v0 vs.length) v1 && cmpV3 o v0 vs
   | none => false)

/-- batches: entry `i0 + j` of the range lists with certificate `j` -/
def allA2 (t0 d : Nat) (o : G.V2.Orb2) (PY0 PY1 : Nat) (rB rC : List (Nat × Nat × Nat)) : Nat → List (List Nat × List (List CEnt)) → Bool
  | _, [] => true
  | i, (es, css) :: rest =>
    (match rB.getD i (0, 0, 0), rC.getD i (0, 0, 0) with
     | (a, b0, b1), (_, c0, c1) => checkA2a t0 d o PY0 PY1 a b0 b1 c0 c1 es css) &&
    allA2 t0 d o PY0 PY1 rB rC (Nat.succ i) rest
def allA3 (t0 d : Nat) (o : G.V2.Orb2) (rV : List (Nat × Nat × Nat)) : Nat → List (List (List CEnt)) → Bool
  | _, [] => true
  | i, css :: rest =>
    (match rV.getD i (0, 0, 0) with
     | (a, v0, v1) => checkA3a t0 d o a v0 v1 css) &&
    allA3 t0 d o rV (Nat.succ i) rest

/-! ### slices and globals -/
def slice (CM : List Nat) (P R i : Nat) : Nat := compactL CM 0 (Nat.land (Nat.shiftRight P i) R)
/-- the 29 slices of the stride-32 pack `P` of `n` fields -/
def slicesOK (S : Sl29) (P n : Nat) : Bool :=
  let R := rep32 n
  let CM := cmasks n (steps n) 0
  Nat.ble n (Nat.shiftLeft 1 (steps n)) &&
  Nat.beq S.s0 (slice CM P R 0) && Nat.beq S.s1 (slice CM P R 1) && Nat.beq S.s2 (slice CM P R 2) &&
  Nat.beq S.s3 (slice CM P R 3) && Nat.beq S.s4 (slice CM P R 4) && Nat.beq S.s5 (slice CM P R 5) &&
  Nat.beq S.s6 (slice CM P R 6) && Nat.beq S.s7 (slice CM P R 7) && Nat.beq S.s8 (slice CM P R 8) &&
  Nat.beq S.s9 (slice CM P R 9) && Nat.beq S.s10 (slice CM P R 10) && Nat.beq S.s11 (slice CM P R 11) &&
  Nat.beq S.s12 (slice CM P R 12) && Nat.beq S.s13 (slice CM P R 13) && Nat.beq S.s14 (slice CM P R 14) &&
  Nat.beq S.s15 (slice CM P R 15) && Nat.beq S.s16 (slice CM P R 16) && Nat.beq S.s17 (slice CM P R 17) &&
  Nat.beq S.s18 (slice CM P R 18) && Nat.beq S.s19 (slice CM P R 19) && Nat.beq S.s20 (slice CM P R 20) &&
  Nat.beq S.s21 (slice CM P R 21) && Nat.beq S.s22 (slice CM P R 22) && Nat.beq S.s23 (slice CM P R 23) &&
  Nat.beq S.s24 (slice CM P R 24) && Nat.beq S.s25 (slice CM P R 25) && Nat.beq S.s26 (slice CM P R 26) &&
  Nat.beq S.s27 (slice CM P R 27) && Nat.beq S.s28 (slice CM P R 28)

/-- the ranges `(a, lo, hi)` cover the first factors `as` consecutively from `pos` to `total` -/
def rangesOK : List (Nat × Nat × Nat) → List Nat → Nat → Nat → Bool
  | [], [], pos, total => Nat.beq pos total
  | (a, lo, hi) :: rs, b :: bs, pos, total => Nat.beq a b && Nat.beq lo pos && Nat.ble lo hi && rangesOK rs bs hi total
  | _, _, _, _ => false
/-- globals: the ranges cover the rank-2 B-parts and records (and, if `v3`, the rank-3 vertices); the masks; the chunk count -/
def checkGlob (v3 : Bool) (t0 : Nat) (o : G.V2.Orb2) (nB2 nRec nV3 : Nat) (rB rC rV : List (Nat × Nat × Nat)) : Bool :=
  rangesOK rB (ofRank 2 (fA t0)) 0 nB2 && rangesOK rC (ofRank 2 (fA t0)) 0 nRec &&
  (!v3 || (rangesOK rV (ofRank 3 (fA t0)) 0 nV3 && Nat.beq o.RV3 (rep32 nV3))) &&
  Nat.blt nB2 16777216 && Nat.beq o.AB2 (Nat.sub (Nat.shiftLeft 1 nB2) 1) && Nat.beq o.AR (Nat.sub (Nat.shiftLeft 1 nRec) 1) &&
  Nat.beq o.CH.length (Nat.div (Nat.add nRec 255) 256)

end G.A2
end
