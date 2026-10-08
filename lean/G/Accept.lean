module
public import R22Port.U_d41d8cd98f00
public import G.A2
/-! # Acceptance statements of the Gram checkers (interface between the runs and the soundness proofs)

The loaders (`G/L3.lean`) prove many `Bool` theorems per anchor representative (phase A batches, per-vertex batches).  The
per-anchor assembly modules turn them into the statements below (`accept_*`, proved by the checker agent).  The soundness
proofs (`NoFam_*_of`, by the soundness agent) start from these statements:
* `Accept_d2 → NoFam_17_3_2` and `Accept_d2 → NoFam_18_1_3`;
* `Accept_d1V → NoFam_18_2_2` and `Accept_d1V → NoFam_19_0_3`;
* `Accept_d1S → NoFam_17_4_1`;
* `Accept_d0S → NoFam_17_5_0`.
See `SOUNDNESS.md` for the argument per type.
-/
@[expose] public section
namespace G.Acc
open G.V2 G.A2

/-- the packed term (`G/Gram.lean` layout) of a state at excess `d`: for `q < rk a`, `yvec (Rc a q) C ||| row d U q <<< 27`
at bit `32 q` and `xvec B (Lc a q) ||| row d V q <<< 27` at bit `96 + 32 q`; `rk a` at bit 192; `a` at bit 196 -/
def pkState (d : Nat) (s : State) : Nat :=
  ((List.range (rk s.a)).foldl (fun acc q =>
    acc ||| ((yvec (Rc s.a q) s.C ||| (row d s.U q <<< 27)) <<< (32 * q)) |||
      ((xvec s.B (Lc s.a q) ||| (row d s.V q <<< 27)) <<< (96 + 32 * q))) 0) ||| (rk s.a <<< 192) ||| (s.a <<< 196)

/-- phase-A data and facts of one anchor (packed anchor `t0`, excess `d`; `v3`: the rank-3 vertices are listed) -/
structure PhaseA (d t0 : Nat) (v3 : Bool) where
  o : Orb2
  PB1 : Nat
  PC1 : Nat
  PY0 : Nat
  PY1 : Nat
  B1 : List Nat
  C1 : List Nat
  nB2 : Nat
  nRec : Nat
  nV3 : Nat
  rB : List (Nat × Nat × Nat)
  rC : List (Nat × Nat × Nat)
  rV : List (Nat × Nat × Nat)
  r1 : checkR1 t0 d o.r1 PB1 PC1 B1 C1 = true
  slB : slicesOK o.r1.SB PB1 B1.length = true
  slC : slicesOK o.r1.SC PC1 C1.length = true
  slX0 : slicesOK o.SX0 o.PB2X0 nB2 = true
  slX1 : slicesOK o.SX1 o.PB2X1 nB2 = true
  slY0 : slicesOK o.SY0 PY0 nRec = true
  slY1 : slicesOK o.SY1 PY1 nRec = true
  glob : checkGlob v3 t0 o nB2 nRec nV3 rB rC rV = true
  a2 : ∀ i, i < rB.length → ∃ c, allA2 t0 d o PY0 PY1 rB rC i [c] = true
  a3 : v3 = true → ∀ i, i < rV.length → ∃ c, allA3 t0 d o rV i [c] = true

/-- the record of the global record index `c` -/
def recG (o : Orb2) (c : Nat) : Nat := recOf (o.CH.getD (c / 256) 0) (c % 256)

/-- d = 2: every rank-3 vertex passes `checkV2` (triangles need 17, partners need 18) -/
def VOK2 (o : Orb2) (nV3 : Nat) : Prop := ∀ iv, iv < nV3 → ∃ c : VCert2, allV2 o 17 iv [c] = true
/-- d = 1: every rank-3 vertex passes `checkV1` (edges need 18, partners need 19) -/
def VOK1 (o : Orb2) (nV3 : Nat) : Prop := ∀ iv, iv < nV3 → ∃ c : VCert1, allV1 o 18 iv [c] = true
/-- d = 0, 1: every rank-2 vertex `(c, j)` passes `checkS` (triangles among the members of larger record index, need 17) -/
def SOK (o : Orb2) (nRec : Nat) : Prop :=
  ∀ c, c < nRec → ∀ j, Nat.testBit (rLoc (recG o c)) j = true → ∃ cert : SCert, checkS o 17 c (recG o c) j cert.1 cert.2 = true

def Accept_d2 : Prop := ∀ t0 ∈ reps 2, ∃ A : PhaseA 2 (pkState 2 t0) true, VOK2 A.o A.nV3
def Accept_d1V : Prop := ∀ t0 ∈ reps 1, ∃ A : PhaseA 1 (pkState 1 t0) true, VOK1 A.o A.nV3
def Accept_d1S : Prop := ∀ t0 ∈ reps 1, ∃ A : PhaseA 1 (pkState 1 t0) true, SOK A.o A.nRec
def Accept_d0S : Prop := ∀ t0 ∈ reps0, ∃ A : PhaseA 0 (pkState 0 t0) false, SOK A.o A.nRec

end G.Acc
