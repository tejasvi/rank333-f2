module
public import R22Port.U_d41d8cd98f00
public import RT.SoundN
public import RT.K3eD_Cls
public import RootSound.Bits
public import C3.Main
public import R3RT.LabT
public import R3RT.L1v5
public import R3RT.BindC2
/-! # Specification of the L1 v5 node checker and of the composed main-search node (R3)

This file states, as propositions, what the R3 checkers must imply. It contains no proofs.

Revision 5: `Frame5Spec` for `frame5` (the frame of a cut node or leaf; kinds stream REQUESTS.md 6). Nothing else changed.

Revision 4: `ClassFacts` in the `FactN` form (`L5.ClassFactsN`), so `HC.factN_492` discharges class 492. The four L1 v5 contracts
are proved against revision 3 (`L5.node5_spec`, `L5.batch5TD_spec`, `L5.table_specN`, `L5.bindQ_specN`; r22/lean/leaf2/L5,
DESIGN 26.16).

Revision 3: `ChildDead` / `NodeCovered` carry the case predicate `CaseII` (`nType`, ranks by `rkOf`), as requested by the kinds
stream (r22/lean/kinds/REQUESTS.md 2); the contracts of the L1 v5 checker are unchanged.

Revision 2 (after the leaf/RT agent's audit): `FrameOK`'s conflict part excludes prefix labels and the diagonal; `TabOK` bounds
caps below 256 (`batch5TD` packs `cap - r` into 8-bit fields). The checkers were fixed at the same time: `node5` takes at most 512
kills (`kills5`), `bindQ` rejects labels `≥ 511`, `rowE3eD` is 0 for ids `≥ 3781613`, and per-job chunk functions are 0 past the
last chunk (`rttableG`). The theorems to prove are
`Node5Spec`, `Batch5TDSpec`, `BindQSpec` and `TableSpec` (assigned to the leaf/RT agent). `ComposedNodeSpec` is stated with them as
hypotheses. Change any definition here only by agreement: the proofs are written against this file.

## Semantics

* A decomposition is `Dec22`: 22 distinct nonzero first factors, given by 9-bit codes (`toM3` coordinates, as `RT.FactN`), with
  `IsDecomp`.
* Labels are prof7's `--rord 123` order. Label `l < 511` has code `vecL l` (`R3RT.LabT`; `vecL_inj`, `vecL_ne_zero`).
* The main search enumerates first-factor label sets in increasing label order. The node with prefix mask `S` (labels `≤ last`) covers
  the decompositions whose labels `≤ last` are exactly `S` (`Below A S last`).
* A frame `(S, D, N, U, d)` of L1's stack is valid (`FrameOK`) when:
  - `S` is a `d`-label prefix and `U` its packed hyperplane counts;
  - for every decomposition below the node, no label of `D` above `last` is a first factor;
  - for each pair `(v, w)` in slot `v` of `N` with `v, w ∉ S` and `v ≠ w`, `v` and `w` are not both first factors.
* A row (label mask `m`, cap `c`) is valid (`RowOK m c`) when every decomposition has at most `c` first factors in `m`. That is
  `RT.FactN 22 (dualM e) (22 - eCap e)` in label coordinates.

## The checkers' contracts

* `Node5Spec`: one `R3RT.node5` call. From a valid parent frame, valid rows and valid static data for the node's label `last`, it
  yields a valid child frame. No decomposition below `S ∪ {last}` continues with a killed child `u` (`KillsOK`).
* `Batch5TDSpec`: `R3RT.batch5TD` on a batch whose table rows are valid and whose initial stack frames are valid. Every node's kills
  hold (`BatchOK`, which follows the stack exactly as `batch5TD` does).
* `TableSpec`: a per-job table that passes `tabOKQ` against `RT.K3eDL` has valid rows. Hypothesis: RT's class facts.
* `BindQSpec`: a table that passes `bindQ` has the semantics `C2OK` (cap 2) or `Conf1OK` (cap 1). Hypothesis: RT's class facts.

## The composed node

`ComposedNodeSpec`: every child label `u` above `last` that is not an OPEN child is accounted for (`ChildDead`). The hypotheses
are the contracts above, kill2's soundness theorems, L3's canonicity witnesses, and the per-kind facts not yet checked in Lean.
R3.md 5.10 lists them all. -/
@[expose] public section
noncomputable section
namespace R3RT.Spec
open RootSound BC4 BC5 Classical

/-! ## Decompositions in label coordinates -/

/-- a decomposition of `<3,3,3>` over F2 with 22 distinct nonzero first factors (9-bit codes) -/
structure Dec22 where
  av : Fin 22 → ℕ
  b : Fin 22 → M3
  c : Fin 22 → M3
  lt : ∀ s, av s < 512
  ne : ∀ s, av s ≠ 0
  inj : Function.Injective av
  dec : IsDecomp (fun s => toM3 (av s)) b c

/-- label `l` is a first factor of `A` -/
def Dec22.Has (A : Dec22) (l : ℕ) : Prop := l < 511 ∧ ∃ s, A.av s = vecL l

/-- `A`'s first-factor codes are canonical for L3 (no group element makes them lex-smaller in the label order) -/
def Dec22.Canon (A : Dec22) : Prop := C3.Canon C3.labK C3.Gset (Finset.univ.image A.av)

/-- the labels of `A` in a label mask `m` -/
def inMask (A : Dec22) (m : ℕ) : Finset ℕ := (Finset.range 511).filter (fun l => m.testBit l = true ∧ A.Has l)

/-- `A` lies below the node with prefix mask `S` and last label `last`: its labels `≤ last` are exactly the bits of `S` -/
def Below (A : Dec22) (S last : ℕ) : Prop := ∀ l, l < 511 → l ≤ last → (A.Has l ↔ S.testBit l = true)

/-- `A` continues the node (prefix `S`, last label `last`) with child `u`: below `S ∪ {u}` at `u` -/
def Continues (A : Dec22) (S last u : ℕ) : Prop := last < u ∧ u < 511 ∧ Below A (S ||| 2 ^ u) u

/-! ## Rows, static tables, counters -/

/-- a valid row: every decomposition has at most `cap` first factors among the labels of `m` -/
def RowOK (m cap : ℕ) : Prop := ∀ A : Dec22, (inMask A m).card ≤ cap

/-- L1's cap-2 table of label `l`: slot `v` bit `w` (`w ≠ l`, `w ≠ v`) lies in a valid cap-2 row with `l` and `v` -/
def C2OK (l c2 : ℕ) : Prop :=
  ∀ v w, v < 511 → w < 511 → w ≠ l → w ≠ v → (c2 >>> (512 * v)).testBit w = true →
    ∃ m, RowOK m 2 ∧ m.testBit l = true ∧ m.testBit v = true ∧ m.testBit w = true

/-- L1's cap-1 table: slot `v` bit `w` (`w ≠ v`) lies in a valid cap-1 row with `v` -/
def Conf1OK (c1 : ℕ) : Prop :=
  ∀ v w, v < 511 → w < 511 → w ≠ v → (c1 >>> (512 * v)).testBit w = true →
    ∃ m, RowOK m 1 ∧ m.testBit v = true ∧ m.testBit w = true

/-- the number of prefix labels of `S` with odd pairing against the functional `X` -/
def hits (S X : ℕ) : ℕ := ((Finset.range 511).filter (fun p => S.testBit p = true ∧ par (vecL p &&& X) = true)).card

/-- L1's packed hyperplane counters (7-bit fields, one per functional `X < 512`) -/
def packU (S : ℕ) : ℕ := ∑ X ∈ Finset.range 512, hits S X * 2 ^ (7 * X)

/-- L1's per-label increment `h` of label `l`: the packed parities of `vecL l` -/
def HOK (l h : ℕ) : Prop := h = ∑ X ∈ Finset.range 512, (if par (vecL l &&& X) = true then 1 else 0) * 2 ^ (7 * X)

/-- the last (highest) label of a nonempty prefix mask -/
def lastOf (S : ℕ) : ℕ := Nat.log2 S

/-! ## Frames -/

/-- a valid frame of L1's stack: node with prefix `S` (`d` labels, last label `lastOf S`), dead mask `D`, conflict table `N`,
counters `U` -/
def FrameOK (S D N U d : ℕ) : Prop :=
  0 < S ∧ S < 2 ^ 511 ∧ ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d ∧ U = packU S ∧
  ∀ A : Dec22, Below A S (lastOf S) →
    (∀ l, lastOf S < l → l < 511 → D.testBit l = true → ¬ A.Has l) ∧
    (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
      (N >>> (512 * v)).testBit w = true → A.Has v → ¬ A.Has w)

/-! ## Records -/

/-- field `i` of width `w` -/
def fld (x w i : ℕ) : ℕ := (x >>> (w * i)) % 2 ^ w

/-- the rows of an L1 v5 record `rec` are valid: row `i` (mask = 512-bit slot `i` of the body) with cap `E_i + r_i`, where
`r_i` is 0 for the V rows, 1 for R1, 2 for R2 (counts from the header) -/
def RecRowsOK (rec : ℕ) : Prop :=
  let hdr := rec % 2 ^ 64
  let nV := (hdr >>> 22) % 1024
  let n1 := (hdr >>> 32) % 1024
  let n2 := (hdr >>> 52) % 1024
  let m := nV + n1 + n2
  let body := rec >>> 64
  ∀ i, i < m →
    RowOK (fld body 512 i % 2 ^ 511) (fld (body >>> (512 * m)) 8 i + (if i < nV then 0 else if i < nV + n1 then 1 else 2))

/-- the kill list `ks` of the node with prefix `S'` (last label `last`) is valid: no decomposition continues with a killed child -/
def KillsOK (S' last : ℕ) (ks : List ℕ) : Prop := ∀ kr ∈ ks, ∀ A : Dec22, ¬ Continues A S' last (kr % 512)

/-! ## Contracts of the L1 v5 checker -/

/-- **`node5`'s contract.** -/
def Node5Spec : Prop :=
  ∀ (S D N U dP c2 h suf rec : ℕ) (ks : List ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool),
    FrameOK S D N U dP → C2OK ((rec >>> 8) % 512) c2 → HOK ((rec >>> 8) % 512) h → RecRowsOK rec →
    node5 S D N U dP c2 h suf rec ks k = true →
      let last := (rec >>> 8) % 512
      ∃ D', FrameOK (S ||| 2 ^ last) D' (N ||| c2) (U + h) (dP + 1) ∧ KillsOK (S ||| 2 ^ last) last ks ∧
        k (S ||| 2 ^ last) D' (N ||| c2) (U + h) = true

/-- **`frame5`'s contract** (cut nodes and leaves): the node's frame is valid -/
def Frame5Spec : Prop :=
  ∀ (S D N U dP c2 h rec : ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool),
    FrameOK S D N U dP → C2OK ((rec >>> 8) % 512) c2 → HOK ((rec >>> 8) % 512) h → RecRowsOK rec →
    frame5 S D N U dP c2 h rec k = true →
      let last := (rec >>> 8) % 512
      ∃ D', FrameOK (S ||| 2 ^ last) D' (N ||| c2) (U + h) (dP + 1) ∧ k (S ||| 2 ^ last) D' (N ||| c2) (U + h) = true

/-- a per-job table with valid rows: entry `i` = label mask (bits 0..510) | cap << 511 (| id << 520) -/
def TabOK (tab : ℕ → ℕ) : Prop := ∀ i, (tab i >>> 511) % 512 < 256 ∧ RowOK (tab i % 2 ^ 511) ((tab i >>> 511) % 512)

/-- the node tuples of `batch5TD`: `(c2, h, suf, hdr, R2 ids, R1 ids, V ids, kills)` -/
abbrev Node5 := ℕ × ℕ × ℕ × ℕ × List ℕ × List ℕ × List ℕ × List ℕ

/-- the kills of every node of a batch hold, following the stack as `batch5TD` does (`D'` is the child frame's dead mask) -/
def BatchOK : List (ℕ × ℕ × ℕ × ℕ × ℕ) → List Node5 → Prop
  | _, [] => True
  | st, (c2, h, _suf, hdr, _r2, _r1, _r0, ks) :: rest =>
    match st.drop (hdr % 256) with
    | [] => False
    | (S, _D, N, U, dP) :: st' =>
      let last := (hdr >>> 8) % 512
      KillsOK (S ||| 2 ^ last) last ks ∧
      ∃ D', FrameOK (S ||| 2 ^ last) D' (N ||| c2) (U + h) (dP + 1) ∧
        BatchOK ((S ||| 2 ^ last, D', N ||| c2, U + h, dP + 1) :: st.drop (hdr % 256)) rest

/-- **`batch5TD`'s contract.** -/
def Batch5TDSpec : Prop :=
  ∀ (tab : ℕ → ℕ) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List Node5),
    TabOK tab →
    (∀ f ∈ st, FrameOK f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2) →
    (∀ x ∈ nodes, C2OK ((x.2.2.2.1 >>> 8) % 512) x.1 ∧ HOK ((x.2.2.2.1 >>> 8) % 512) x.2.1) →
    batch5TD tab st nodes = true → BatchOK st nodes

/-- RT's class facts in the `FactN` form (22 distinct nonzero first factors), the hypothesis of `RT.K3eD.row_valid` (`hclsN`);
the same shape as `L5.ClassFactsN` -/
def ClassFacts : Prop := ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)

/-- **The per-job table check.** A table that passes `tabOKQ` against `RT.K3eDL` (chunk function `chunk`, 64 entries per chunk, `N`
entries, `RTLoad.rttable`'s `entry`) has valid rows, given RT's class facts. -/
def TableSpec : Prop :=
  ∀ (chunk entry : ℕ → ℕ) (N nch : ℕ),
    (∀ i, entry i = (chunk (i / 64) >>> (552 * (i % 64))) % 2 ^ 552) → (∀ q, nch ≤ q → chunk q = 0) →
    (∀ i, N ≤ i → entry i = 0) →
    ClassFacts → tabOKQ rowE3eD chunk 64 N nch = true → TabOK entry

/-- **The static-table binding.** -/
def BindQSpec : Prop :=
  ∀ (q : ℕ) (rows : List (ℕ × List ℕ)) (stored DC : ℕ), ClassFacts →
    (q < 511 → bindQ rowE3eD q 2 rows stored DC = true → C2OK q stored) ∧
    (bindQ rowE3eD 511 1 rows stored DC = true → Conf1OK stored)

/-! ## The composed node -/

/-- deficits: every decomposition has at least `3 rk(X)` first factors with odd pairing against a nonzero functional `X`.
Proved: `KD.deficit_fact` (r22/lean/kinds). -/
def DeficitFact : Prop :=
  ∀ (A : Dec22) (X : ℕ), 0 < X → X < 512 →
    3 * rkOf X ≤ (Finset.univ.filter (fun s : Fin 22 => par (A.av s &&& X) = true)).card

/-- the number of first factors of matrix rank `r` -/
def nType (A : Dec22) (r : ℕ) : ℕ := (Finset.univ.filter (fun s : Fin 22 => rkOf (A.av s) = r)).card

/-- case (II) of the main search (`--minr1 14`): at least 14 first factors of rank 1 -/
def CaseII (A : Dec22) : Prop := 14 ≤ nType A 1

/-- child `u` of the node (prefix `S'`, last label `last`) is accounted for: no canonical case-(II) decomposition continues with it
(DOOM records and node cut 7 hold only in case (II); cases (I), (I13) take their own predicate when certified) -/
def ChildDead (S' last u : ℕ) : Prop := ∀ A : Dec22, A.Canon → CaseII A → ¬ Continues A S' last u

/-- every canonical decomposition below the node continues with an OPEN child, or with none -/
def NodeCovered (S' last : ℕ) (opens : Finset ℕ) : Prop := ∀ u, last < u → u < 511 → u ∉ opens → ChildDead S' last u

/-- **The composed node theorem (statement).** The per-child accounting is given as hypotheses, one class per stream record kind.
* `hT` (L1 v5): T/C kills, from `Node5Spec` / `Batch5TDSpec` (`KillsOK`).
* `hD` (L1 v5): children in the child frame's dead mask, from `FrameOK`.
* `hX6`: X kills with a check6 certificate, from `K2.check6_sound`. Supply bounds come from `RowOK` and the record's residuals,
  demand bounds from `DeficitFact` and the counters, and the free set `F` must contain the labels of every continuing
  decomposition above `u`.
* `hXP`: X kills with a bulk-peel certificate, from `K2.childL_sound_label` with `K2.dictOK_sound` / `K2.nodeA_sound`.
* `hL3`: CANON records (`C3.nodeOK_sound`): `S' ∪ {u}` is not a prefix of a canonical set.
* `hOther`: the other record kinds. PREFF, DOOM, TYPE and the suffix break have proved checkers (`KD.kindsNode_sound`, r22/lean/kinds;
  TYPE needs `KD.TypeFacts`, the type lemmas, as one hypothesis). WB / ADDF 3-5 / leaf code 1 disappear with Lemma W off. BLK never
  occurs. Still assumptions: ADDF 1/2, the node-level cuts without a checker, leaf codes, expanded children (choice 2: their own records
  follow), replayed X kills.
The conclusion follows from the union of these classes. Making each hypothesis a proved instance is the remaining work. -/
def ComposedNodeSpec : Prop :=
  ∀ (S' last : ℕ) (opens dead tc x6 xp l3 other : Finset ℕ),
    (∀ u ∈ tc, ∀ A : Dec22, ¬ Continues A S' last u) →
    (∀ u ∈ dead, ∀ A : Dec22, ¬ Continues A S' last u) →
    (∀ u ∈ x6, ∀ A : Dec22, ¬ Continues A S' last u) →
    (∀ u ∈ xp, ∀ A : Dec22, ¬ Continues A S' last u) →
    (∀ u ∈ l3, ChildDead S' last u) →
    (∀ u ∈ other, ChildDead S' last u) →
    (∀ u, last < u → u < 511 → u ∈ opens ∨ u ∈ dead ∨ u ∈ tc ∨ u ∈ x6 ∨ u ∈ xp ∨ u ∈ l3 ∨ u ∈ other) →
    NodeCovered S' last opens

end R3RT.Spec
end
