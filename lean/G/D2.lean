module
public import R22Port.U_d41d8cd98f00
public import G.Base
public import G.Slice
/-! # Phase D (version 2): the rank-1 extension of one core has no clique of `need` terms

Anchor-level rank-1 data (`R1`): the complete rank-1 B-parts and C-parts compatible with the anchor (phase A), in canonical
order (by first factor, then dirt row, then increasing `B` resp. `C`), as bit-slices `SB`, `SC` of their fields `XV`, `YU`
(stride-1 masks over all parts), and per first factor a *group* (`Grp`): its offsets and counts and the stride-32 packs of the
group's fields.

Per core (high-rank terms `t`, packed): `okb` = the B-parts with `par (YU_t[q] &&& XV_b) = 0` for all core rows,
`okc` = the C-parts with `par (YU_c &&& XV_t[q]) = 0` for all core columns (`okB`, `okC`, and-ed over the core terms).
A *candidate* is a pair (b, c) of OK parts in the same group with `par (YU_c &&& XV_b) = 1` (a valid rank-1 state).
Certificate (`CoreCert`):
* `cnt`: per group, `none` (counted as possibly non-empty) or `some (obs, ocs)` = the OK B- and C-parts of the group (local
  indices), with no candidate pair; fewer than `need` groups may be `none`;
* `col`: per group the OK parts and, per OK B-part, the positions (in `ocs`) of its candidate C-parts; every candidate gets
  the next 4 bits of `cols` as its colour; no two candidates of one colour are compatible, and the classes `≥ need - 1` are
  empty (`need ≥ 1`), so a clique has at most `need - 1` members (for `need ≥ 17` this is automatic: 16 classes);
Either way no `need` pairwise compatible candidates exist (they have distinct first factors).
-/
@[expose] public section
noncomputable section
namespace G.D2

structure Grp where
  a : Nat
  lb : Nat
  nb : Nat
  lc : Nat
  nc : Nat
  PB : Nat
  PC : Nat

structure R1 where
  SB : Sl29
  SC : Sl29
  AB : Nat
  AC : Nat
  gs : List Grp

def rowsB (o : R1) (t : Nat) : Nat → Nat
  | 0 => o.AB
  | q+1 => Nat.land (rowsB o t q) (Nat.xor o.AB (sx o.SB (fYU t q)))
def rowsC (o : R1) (t : Nat) : Nat → Nat
  | 0 => o.AC
  | q+1 => Nat.land (rowsC o t q) (Nat.xor o.AC (sx o.SC (fXV t q)))
/-- B-parts `b` with `par (YU_t[q] &&& XV_b) = 0` for all rows `q < fR t` -/
def okB (o : R1) (t : Nat) : Nat := rowsB o t (fR t)
/-- C-parts `c` with `par (YU_c &&& XV_t[q]) = 0` for all columns `q < fR t` -/
def okC (o : R1) (t : Nat) : Nat := rowsC o t (fR t)

/-- the YU fields of the listed C-parts at stride 32, and their number -/
def packC (PC : Nat) : List Nat → Nat → Nat → Nat × Nat
  | [], k, acc => (acc, k)
  | c :: cs, k, acc => packC PC cs (Nat.succ k) (Nat.lor acc (Nat.shiftLeft (get32 PC c) (Nat.mul 32 k)))

/-- no listed B-part has a candidate in the C pack `P` -/
def noCand (PB P R : Nat) : List Nat → Bool
  | [] => true
  | b :: bs => Nat.beq (swarPar P R (get32 PB b)) 0 && noCand PB P R bs

def grpEmpty (okb okc : Nat) (g : Grp) (obs ocs : List Nat) : Bool :=
  listChk1 obs (win okb g.lb g.nb) && listChk1 ocs (win okc g.lc g.nc) &&
  (match packC g.PC ocs 0 0 with
   | (P, n) => noCand g.PB P (rep32 n) obs)

def cntOK (okb okc : Nat) : List Grp → List (Option (List Nat × List Nat)) → Nat → Option Nat
  | [], [], n => some n
  | _ :: gs, none :: cs, n => cntOK okb okc gs cs (Nat.succ n)
  | g :: gs, some (obs, ocs) :: cs, n => cond (grpEmpty okb okc g obs ocs) (cntOK okb okc gs cs n) none
  | _, _, _ => none

/-- push the candidates `(b, c_j)`, `j ∈ js`, with colours from `cols` -/
def pushC (P a xv : Nat) : List Nat → Nat → List (List Nat) → Nat × List (List Nat)
  | [], cols, cl => (cols, cl)
  | j :: js, cols, cl => pushC P a xv js (Nat.shiftRight cols 4) (upd (Nat.land cols 15) (mkTerm1 (get32 P j) xv a) cl)

/-- per listed OK B-part `b`: `js` = exactly the candidate positions -/
def candsG (PB P R a : Nat) : List Nat → List (List Nat) → Nat → List (List Nat) → Option (Nat × List (List Nat))
  | [], [], cols, cl => some (cols, cl)
  | b :: bs, js :: jss, cols, cl =>
    cond (listChk32 js (swarPar P R (get32 PB b)))
      (match pushC P a (get32 PB b) js cols cl with
       | (cols', cl') => candsG PB P R a bs jss cols' cl')
      none
  | _, _, _, _ => none

def grpCol (okb okc : Nat) (g : Grp) (obs ocs : List Nat) (jss : List (List Nat)) (cols : Nat) (cl : List (List Nat)) :
    Option (Nat × List (List Nat)) :=
  cond (listChk1 obs (win okb g.lb g.nb) && listChk1 ocs (win okc g.lc g.nc))
    (match packC g.PC ocs 0 0 with
     | (P, n) => candsG g.PB P (rep32 n) g.a obs jss cols cl)
    none

def colOK (okb okc : Nat) : List Grp → List (List Nat × List Nat × List (List Nat)) → Nat → List (List Nat) →
    Option (List (List Nat))
  | [], [], _, cl => some cl
  | g :: gs, (obs, ocs, jss) :: cs, cols, cl =>
    match grpCol okb okc g obs ocs jss cols cl with
    | none => none
    | some (cols', cl') => colOK okb okc gs cs cols' cl'
  | _, _, _, _ => none

/-- the candidate terms of one group (per listed OK B-part `b`: `js` = exactly its candidate positions), reversed -/
def pushT (P a xv : Nat) : List Nat → List Nat → List Nat
  | [], acc => acc
  | j :: js, acc => pushT P a xv js (mkTerm1 (get32 P j) xv a :: acc)
def candT (PB P R a : Nat) : List Nat → List (List Nat) → List Nat → Option (List Nat)
  | [], [], acc => some acc
  | b :: bs, js :: jss, acc =>
    cond (listChk32 js (swarPar P R (get32 PB b))) (candT PB P R a bs jss (pushT P a (get32 PB b) js acc)) none
  | _, _, _ => none

inductive CoreCert where
  | cnt : List (Option (List Nat × List Nat)) → CoreCert
  | col : List (List Nat × List Nat × List (List Nat)) → Nat → CoreCert
  /-- branch on group `gi`: its OK parts and candidates; `out`: no clique member in the group (its B-parts removed);
  `ins`: one certificate per candidate `x` of the group (in order), for the core extended by `x` and `need - 1` -/
  | br : Nat → List Nat → List Nat → List (List Nat) → CoreCert → List CoreCert → CoreCert

def g0 : Grp := ⟨0, 0, 0, 0, 0, 0, 0⟩

/-- the rank-1 extension of a core with OK masks `okb`, `okc` has no `need` pairwise compatible candidates (`fuel` bounds
the branching depth) -/
def coreOKf (o : R1) : Nat → Nat → Nat → Nat → CoreCert → Bool
  | 0, _, _, _, _ => false
  | _+1, need, okb, okc, .cnt cs =>
    match cntOK okb okc o.gs cs 0 with
    | some n => Nat.blt n need
    | none => false
  | _+1, need, okb, okc, .col cs cols =>
    match colOK okb okc o.gs cs cols empty16 with
    | some cl => Nat.ble 1 need && classesOK cl && (cl.drop (Nat.pred need)).all List.isEmpty
    | none => false
  | f+1, need, okb, okc, .br gi obs ocs jss cout cins =>
    let g := o.gs.getD gi g0
    cond (listChk1 obs (win okb g.lb g.nb) && listChk1 ocs (win okc g.lc g.nc))
      (match packC g.PC ocs 0 0 with
       | (P, n) =>
         match candT g.PB P (rep32 n) g.a obs jss [] with
         | some xs =>
           coreOKf o f need (Nat.xor okb (Nat.shiftLeft (win okb g.lb g.nb) g.lb)) okc cout &&
           Nat.beq xs.length cins.length &&
           (xs.reverse.zip cins).all (fun xc => coreOKf o f (Nat.pred need) (Nat.land okb (okB o xc.1)) (Nat.land okc (okC o xc.1)) xc.2)
         | none => false)
      false

def coreOK (o : R1) (need okb okc : Nat) (c : CoreCert) : Bool := coreOKf o 64 need okb okc c

end G.D2
end
