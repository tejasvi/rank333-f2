module
public import R22Port.U_d41d8cd98f00
public import KD.XBind
public import R3RT.Compose
public import K2.XAgg
public import K2.XCut
public import L5.Fold
public import R3RT.SpecO
public import KD.CountO
/-! # KD.XComp: the bulk-peel part of the composed node checker, hybrid format, bound to the frame (G4; DESIGN 33)

kill2's hybrid route (`xpeel2`, DESIGN 27.12-27.13: `K2.childL3` children, per-label aggregates `K2.bxOK`, `F_u` derived from the
final node matrix) on one dictionary per node shared with L1 v5's record (as `R3RT.batchC` / `K2C.batchC2`), with what soundness
needs added:
* **Dictionary.** `mk p` = row `p` (L1's V / R1 / R2 rows, then the extra residual-1 and residual-2 rows); `DictSemX` (each row meets
  every decomposition below the node in at most its residual many labels above `last`) is proved in `KD.XBatch` from the table,
  L1's `blocks` inside `node5` and the extras' `blocks`.
* **Node matrix** `clrD (addCl N' (node rows))`: node rows must have residual ≤ 1 (`nrOK`); then no pair of labels of a
  decomposition below the node (`K2.matrix_indep`).
* **Deficit table** (`dtOK`, once per node): entries `(X_j, H_j, DEF_j)` with `H_j = nperpL X_j` (all labels for `X_j = 0`) and
  `DEF_j ≤ 3 rk X_j - hits(S', X_j)` (`22 - d'` for `X_j = 0`), i.e. every decomposition below the node has at least `DEF_j` labels
  above `last` in `H_j` (`DTSem`).  A child step `(j, d)` needs only `d + [u ∈ H_j] ≤ DEF_j` (one byte, one bit).
* **Aggregates** `(x, c2t_x, B_x, rows)` checked by `K2.bxOK`; an in-branch names its aggregate by index, and its label must be the
  pick (`xcOK`).
* **Child** `(u, F_u, child rows, tree, c2t_u, constants)`: `F_u = (above(u) \ D') \ Anode[u]` (`fuX`, one equality), child rows of
  residual ≤ 1 or through `u` (`crX`), the tree's steps and in-branches (`xcOK`), kill2's `K2.childL4X` (lean X-steps on the complement; `ALL = REP (2^n - 1)` computed per child).
**`xpartC_sound`**: an accepted X part kills every listed child. -/
@[expose] public section
set_option exponentiation.threshold 1024
set_option maxRecDepth 10000
noncomputable section
namespace KD
open R3RT.Spec RootSound BC4 BC5 Classical MisF
open R3RT (M511 nperpL vecL nperpL_bit m511_bit m511_eq)

/-! ## Semantics over a label order and a universe (spec revision 6a)

Every statement below holds for the decompositions of a universe `Ω` (case II: `CaseK 14 22`, where the L479-raised table is
valid), in the coordinates of a label order `O` (`LO123` for `--rord 123`, `Top321.O` for `--rord 321`).  The checker functions
are order-free except for the deficit table's hyperplane masks, which come from a function `np` with `NpOK O np`.  The `…U`
names are the `LO123` instances (revision 6a's `Has` / `Below` / `Continues` / `packU` at `LO123` are revision 5's by `Iff.rfl`). -/
/-- the hyperplane masks of the order: bit `l` of `np X` is `par (vec l & X)` -/
def NpOK (O : R3RT.SpecO.LabelOrder) (np : ℕ → ℕ) : Prop :=
  ∀ X, 0 < X → X < 512 → ∀ l, l < 511 → (np X).testBit l = par (O.vec l &&& X)

theorem npOK_123 : NpOK R3RT.SpecO.LO123 nperpL := fun X _ hX l hl => nperpL_bit X l hX hl

/-- the node matrix's meaning over `O` and `Ω` -/
def AnodeSemO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) (S last Anode : ℕ) : Prop :=
  ∀ A : Dec22, Ω A → R3RT.SpecO.Below O A S last → ∀ a b, last < a → a < 511 → last < b → b < 511 → a ≠ b →
    R3RT.SpecO.Has O A a → R3RT.SpecO.Has O A b → (dig 512 Anode a).testBit b = false

theorem frame_confO {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {S D N U d last : ℕ} (hF : FrameOKO O Ω S D N U d)
    (hS : S >>> last = 1) (A : Dec22) (hΩ : Ω A) (hA : R3RT.SpecO.Below O A S last) (v w : ℕ) (hv : last < v) (hv5 : v < 511)
    (hw : last < w) (hw5 : w < 511) (hvw : v ≠ w) (hAv : R3RT.SpecO.Has O A v) (hAw : R3RT.SpecO.Has O A w) :
    (dig 512 N v).testBit w = false := by
  have hlast := shr_one_lastOf hS
  have hbel : R3RT.SpecO.Below O A S (lastOf S) := by rw [hlast]; exact hA
  have hSv : S.testBit v = false := by rw [shr_one_bit hS v (by omega)]; simp; omega
  have hSw : S.testBit w = false := by rw [shr_one_bit hS w (by omega)]; simp; omega
  rw [testBit_dig 512 N v w (by omega)]
  cases hb : N.testBit (512 * v + w) with
  | false => rfl
  | true =>
    exfalso
    have hb' : (N >>> (512 * v)).testBit w = true := by rw [Nat.testBit_shiftRight]; exact hb
    exact (frameOKO_apply hF A hΩ hbel).2 v w hv5 hw5 hSv hSw hvw hb' hAv hAw

/-! ## Definitions (kernel forms) -/

/-- the residual bound of dictionary position `p`: at most 1 below `b1` (L1's V and R1 rows) and in `[m, e1)` (the extra
residual-1 rows), at most 2 otherwise -/
def rposB (b1 m e1 p : ℕ) : ℕ := if p < b1 then 1 else if p < m then 2 else if p < e1 then 1 else 2

/-- the meaning of the node's shared dictionary -/
def DictSemXO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) (S last : ℕ) (mk rp : ℕ → ℕ) : Prop :=
  ∀ p, ∀ A : Dec22, Ω A → R3RT.SpecO.Below O A S last →
    ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ (mk p).testBit l = true)).card ≤ rp p

abbrev DictSemX (Ω : Dec22 → Prop) := DictSemXO R3RT.SpecO.LO123 Ω

/-- position `p` has residual ≤ 1 -/
def r1pos (b1 m e1 p : ℕ) : Bool := Nat.blt p b1 || (Nat.ble m p && Nat.blt p e1)

/-- every node row has residual ≤ 1 -/
def nrOK (b1 m e1 : ℕ) (nrows : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun p _ ih => r1pos b1 m e1 p && ih) nrows

/-- the node matrix: `N'` and the cliques of the node rows, diagonal cleared -/
def anodeX (N : ℕ) (mk : ℕ → ℕ) (nrows : List ℕ) : ℕ := K2.clrD (K2.addCl N REPmF REPF (R3RT.mapL mk nrows)) DIAGF

/-- deficit-table entry `j`: mask slot -/
def hslot (HP j : ℕ) : ℕ := Nat.land (Nat.shiftRight HP (Nat.shiftLeft j 9)) M511

/-- one deficit-table entry `(X, H, DEF)` at the node (counters `U`, `du` prefix labels; `np` the order's hyperplane masks) -/
def dtEntry (np : ℕ → ℕ) (U du X H dv : ℕ) : Bool :=
  Nat.blt X 512 &&
  (bif Nat.beq X 0 then Nat.beq H M511 && Nat.ble (Nat.add dv du) 22
   else Nat.beq H (np X) && Nat.ble (Nat.add dv (fld7 U X)) (Nat.mul 3 (rkOf X)))

/-- the node's deficit table: functionals `XL` (entry `j` = `XL[j]`), masks `HP` (512-bit slots), bounds `DEFP` (bytes), `J` entries -/
def dtOK (np : ℕ → ℕ) (U du HP DEFP J : ℕ) (XL : List ℕ) : ℕ → Bool :=
  List.rec (motive := fun _ => ℕ → Bool) (fun j => Nat.beq j J)
    (fun X _ ih j => dtEntry np U du X (hslot HP j) (byteAt DEFP j) && ih (Nat.succ j)) XL

/-- the meaning of the deficit table -/
def DTSemO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) (S last HP DEFP J : ℕ) : Prop :=
  ∀ j, j < J → ∀ A : Dec22, Ω A → R3RT.SpecO.Below O A S last →
    byteAt DEFP j ≤ ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ (hslot HP j).testBit l = true)).card

abbrev DTSem (Ω : Dec22 → Prop) := DTSemO R3RT.SpecO.LO123 Ω

/-- a hybrid tree: steps `(j, d)` name deficit-table entries; an in-branch names its aggregate by index `k` -/
inductive XC where
  | leaf : List (ℕ × ℕ) → ℕ × ℕ → XC
  /-- steps, window index `v`, aggregate index `k`, left (in), right (out) -/
  | node : List (ℕ × ℕ) → ℕ → ℕ → XC → XC → XC
  /-- kill2's budget cut (DESIGN 27.14): the path has more than `T` in-branch picks -/
  | cut : XC

/-- an aggregate `(x, c2t_x, B_x, row positions)` -/
abbrev Agg := ℕ × ℕ × ℕ × List ℕ

/-- aggregate `k` of the node (`(0, 0, 0, [])` past the end) -/
def aggAt (aggs : List Agg) (k : ℕ) : Agg :=
  Nat.rec (motive := fun _ => List Agg → Agg) (fun l => List.headD l (0, 0, 0, [])) (fun _ ih l => ih (List.tail l)) k aggs

def stepsC (HP : ℕ) (sts : List (ℕ × ℕ)) : List (ℕ × ℕ) :=
  List.rec (motive := fun _ => List (ℕ × ℕ)) [] (fun st _ ih => (hslot HP st.1, st.2) :: ih) sts

/-- kill2's hybrid tree with budget cuts (`K2.XT3`) of a bound tree: masks from the table, aggregates from the node's list -/
def toXT3c (HP : ℕ) (aggs : List Agg) (t : XC) : K2.XT3 :=
  XC.rec (motive := fun _ => K2.XT3)
    (fun sts fin => K2.XT3.leaf (stepsC HP sts) (hslot HP fin.1, fin.2))
    (fun sts v k _ _ ihl ihr => K2.XT3.node (stepsC HP sts) v (aggAt aggs k).2.2.1 ihl ihr)
    K2.XT3.cut t

/-- a valid step `(j, d)` of child `u` -/
def stepC (HP DEFP J u : ℕ) (st : ℕ × ℕ) : Bool :=
  Nat.blt 0 st.2 && Nat.blt st.1 J && Nat.ble (Nat.add st.2 (bitAt (hslot HP st.1) u)) (byteAt DEFP st.1)

def stepsCOK (HP DEFP J u : ℕ) (sts : List (ℕ × ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun st _ ih => stepC HP DEFP J u st && ih) sts

/-- the tree's steps are valid and every in-branch's aggregate belongs to its pick -/
def xcOK (HP DEFP J u : ℕ) (aggs : List Agg) (t : XC) : Bool :=
  XC.rec (motive := fun _ => Bool)
    (fun sts fin => stepsCOK HP DEFP J u sts && stepC HP DEFP J u fin)
    (fun sts v k _ _ ihl ihr => stepsCOK HP DEFP J u sts && Nat.beq (aggAt aggs k).1 (Nat.add (Nat.succ u) v) && ihl && ihr)
    true t

/-- the node's aggregates against the shared dictionary -/
def aggsX (mk : ℕ → ℕ) (aggs : List Agg) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun ag _ ih => K2.bxOK REPmF REPF DIAGF ag.1 ag.2.1 ag.2.2.1 (R3RT.mapL mk ag.2.2.2) && ih) aggs

/-- `F_u = (above(u) \ D') \ Anode[u]` (kill2's `K2C.fuOK`) -/
def fuX (D Anode u Fu : ℕ) : Bool :=
  Nat.beq Fu (K2.andn (K2.andn (Nat.sub (Nat.shiftLeft 1 511) (Nat.shiftLeft 1 (Nat.add u 1))) D) (K2.rowA 512 Anode u))

/-- child rows: residual ≤ 1, or through `u` -/
def crX (mk : ℕ → ℕ) (b1 m e1 u : ℕ) (cr : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun p _ ih => (r1pos b1 m e1 p || Nat.beq (bitAt (mk p) u) 1) && ih) cr

/-- a child: `(u, F_u, child-row positions, tree, c2t_u, (REP, REPm, GRD, LOWS, DIAG))` -/
abbrev KidX := ℕ × ℕ × List ℕ × XC × ℕ × (ℕ × ℕ × ℕ × ℕ × ℕ)

/-- **the child check**: kill2's `K2.childL4` with the budget `T` (`21 - d'`, `d'` the labels of the node's prefix) -/
def kidX (D last b1 m e1 Anode HP DEFP J T : ℕ) (mk : ℕ → ℕ) (aggs : List Agg) (c : KidX) : Bool :=
  Nat.blt last c.1 && Nat.blt c.1 511 && fuX D Anode c.1 c.2.1 && crX mk b1 m e1 c.1 c.2.2.1 &&
  xcOK HP DEFP J c.1 aggs c.2.2.2.1 &&
  K2.childL4X c.2.2.2.2.2.2.1 c.2.2.2.2.2.1 c.2.2.2.2.2.2.2.1 c.2.2.2.2.2.2.2.2.1 M511 c.2.2.2.2.2.2.2.2.2
    (Nat.mul c.2.2.2.2.2.1 (Nat.sub (Nat.shiftLeft 1 (Nat.sub 510 c.1)) 1)) 512
    (Nat.shiftLeft 1 (Nat.sub 510 c.1)) (Nat.succ c.1) T Anode c.2.2.2.2.1 c.2.1 (R3RT.mapL mk c.2.2.1) (toXT3c HP aggs c.2.2.2.1)

def kidsX (D last b1 m e1 Anode HP DEFP J T : ℕ) (mk : ℕ → ℕ) (aggs : List Agg) (ks : List KidX) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun c _ ih => kidX D last b1 m e1 Anode HP DEFP J T mk aggs c && ih) ks

/-- **the X part of a node** (in `node5`'s continuation: frame `(S, D, N, U)`, `du` prefix labels, top label `last`) -/
def xpartC (np : ℕ → ℕ) (S D N U du last b1 m e1 : ℕ) (mk : ℕ → ℕ) (nrows : List ℕ) (aggs : List Agg) (XL : List ℕ)
    (HP DEFP J : ℕ) (kids : List KidX) : Bool :=
  nrOK b1 m e1 nrows && aggsX mk aggs && dtOK np U du HP DEFP J XL 0 &&
    kidsX D last b1 m e1 (anodeX N mk nrows) HP DEFP J (Nat.sub 21 du) mk aggs kids

/-- the per-child facts the composer supplies (existing theorems): L1's cap-2 table of `u`, the window constants -/
def KidXOKO (O : R3RT.SpecO.LabelOrder) (Ω : Dec22 → Prop) (c : KidX) : Prop :=
  C2OKO O Ω c.1 c.2.2.2.2.1 ∧ CPn (Nat.sub 510 c.1) c.2.2.2.2.2

abbrev KidXOK (Ω : Dec22 → Prop) := KidXOKO R3RT.SpecO.LO123 Ω

/-! ## Lemmas -/

theorem rposB_le2 (b1 m e1 p : ℕ) : rposB b1 m e1 p ≤ 2 := by unfold rposB; split_ifs <;> omega

theorem r1pos_le {b1 m e1 p : ℕ} (h : r1pos b1 m e1 p = true) : rposB b1 m e1 p ≤ 1 := by
  unfold r1pos at h; unfold rposB
  simp only [Bool.or_eq_true, Bool.and_eq_true, Nat.blt_eq, Nat.ble_eq] at h
  split_ifs <;> omega

theorem nrOK_mem {b1 m e1 : ℕ} : ∀ {nrows : List ℕ}, nrOK b1 m e1 nrows = true → ∀ p ∈ nrows, rposB b1 m e1 p ≤ 1
  | [], _ => fun _ h => by cases h
  | p :: ps, h => by
    have h' : (r1pos b1 m e1 p && nrOK b1 m e1 ps) = true := h
    rw [Bool.and_eq_true] at h'
    intro q hq
    rcases List.mem_cons.mp hq with rfl | hq
    · exact r1pos_le h'.1
    · exact nrOK_mem h'.2 q hq

theorem mem_mapL {mk : ℕ → ℕ} {m : ℕ} : ∀ {ks : List ℕ}, m ∈ R3RT.mapL mk ks → ∃ k ∈ ks, m = mk k
  | [], h => by cases h
  | a :: ks, h => by
    change m ∈ (mk a :: R3RT.mapL mk ks) at h
    rcases List.mem_cons.mp h with rfl | h
    · exact ⟨a, List.mem_cons_self .., rfl⟩
    · obtain ⟨k, hk, e⟩ := mem_mapL h
      exact ⟨k, List.mem_cons_of_mem _ hk, e⟩

theorem aggsX_mem {mk : ℕ → ℕ} : ∀ {aggs : List Agg}, aggsX mk aggs = true →
    ∀ ag ∈ aggs, K2.bxOK REPmF REPF DIAGF ag.1 ag.2.1 ag.2.2.1 (R3RT.mapL mk ag.2.2.2) = true
  | [], _ => fun _ h => by cases h
  | a :: as, h => by
    have h' : (K2.bxOK REPmF REPF DIAGF a.1 a.2.1 a.2.2.1 (R3RT.mapL mk a.2.2.2) && aggsX mk as) = true := h
    rw [Bool.and_eq_true] at h'
    intro ag hag
    rcases List.mem_cons.mp hag with rfl | hag
    · exact h'.1
    · exact aggsX_mem h'.2 ag hag

/-- the aggregate at any index is one of the node's, or the empty default -/
theorem aggAt_mem : ∀ (k : ℕ) (aggs : List Agg), aggAt aggs k ∈ aggs ∨ aggAt aggs k = (0, 0, 0, []) := by
  intro k
  induction k with
  | zero =>
    intro aggs
    cases aggs with
    | nil => right; rfl
    | cons a as => left; exact List.mem_cons_self ..
  | succ k ih =>
    intro aggs
    cases aggs with
    | nil =>
      right
      show aggAt [] k = _
      rcases ih [] with h | h
      · cases h
      · exact h
    | cons a as =>
      show aggAt as k ∈ a :: as ∨ aggAt as k = _
      rcases ih as with h | h
      · left; exact List.mem_cons_of_mem _ h
      · right; exact h

theorem kidsX_mem {D last b1 m e1 Anode HP DEFP J T : ℕ} {mk : ℕ → ℕ} {aggs : List Agg} : ∀ {ks : List KidX},
    kidsX D last b1 m e1 Anode HP DEFP J T mk aggs ks = true → ∀ c ∈ ks, kidX D last b1 m e1 Anode HP DEFP J T mk aggs c = true
  | [], _ => fun _ h => by cases h
  | c :: cs, h => by
    have h' : (kidX D last b1 m e1 Anode HP DEFP J T mk aggs c && kidsX D last b1 m e1 Anode HP DEFP J T mk aggs cs) = true := h
    rw [Bool.and_eq_true] at h'
    intro c' hc'
    rcases List.mem_cons.mp hc' with rfl | hc'
    · exact h'.1
    · exact kidsX_mem h'.2 c' hc'

theorem stepsCOK_mem {HP DEFP J u : ℕ} : ∀ {sts : List (ℕ × ℕ)}, stepsCOK HP DEFP J u sts = true →
    ∀ st ∈ sts, stepC HP DEFP J u st = true
  | [], _ => fun _ h => by cases h
  | s :: ss, h => by
    have h' : (stepC HP DEFP J u s && stepsCOK HP DEFP J u ss) = true := h
    rw [Bool.and_eq_true] at h'
    intro st hst
    rcases List.mem_cons.mp hst with rfl | hst
    · exact h'.1
    · exact stepsCOK_mem h'.2 st hst

theorem mem_stepsC {HP : ℕ} {st : ℕ × ℕ} : ∀ {sts : List (ℕ × ℕ)}, st ∈ stepsC HP sts → ∃ s ∈ sts, st = (hslot HP s.1, s.2)
  | [], h => by cases h
  | s :: ss, h => by
    change st ∈ ((hslot HP s.1, s.2) :: stepsC HP ss) at h
    rcases List.mem_cons.mp h with rfl | h
    · exact ⟨s, List.mem_cons_self .., rfl⟩
    · obtain ⟨s', hs', e⟩ := mem_stepsC h
      exact ⟨s', List.mem_cons_of_mem _ hs', e⟩

theorem crX_mem {mk : ℕ → ℕ} {b1 m e1 u : ℕ} : ∀ {cr : List ℕ}, crX mk b1 m e1 u cr = true →
    ∀ p ∈ cr, rposB b1 m e1 p ≤ 1 ∨ (mk p).testBit u = true
  | [], _ => fun _ h => by cases h
  | p :: ps, h => by
    have h' : ((r1pos b1 m e1 p || Nat.beq (bitAt (mk p) u) 1) && crX mk b1 m e1 u ps) = true := h
    simp only [Bool.and_eq_true, Bool.or_eq_true] at h'
    intro q hq
    rcases List.mem_cons.mp hq with rfl | hq
    · rcases h'.1 with h1 | h1
      · exact Or.inl (r1pos_le h1)
      · exact Or.inr (bitAt_one h1)
    · exact crX_mem h'.2 q hq

theorem hslot_lt (HP j : ℕ) : hslot HP j < 2 ^ 511 := land_M511_lt _ _ m511_lt

/-- **the deficit table** -/
theorem dtOK_semO {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {np : ℕ → ℕ} (hnp : NpOK O np) {S D N U du last HP DEFP J : ℕ}
    (hF : FrameOKO O Ω S D N U du) (hS : S >>> last = 1) :
    ∀ (XL : List ℕ) (j0 : ℕ), dtOK np U du HP DEFP J XL j0 = true →
      ∀ j, j0 ≤ j → j < J → ∀ A : Dec22, Ω A → R3RT.SpecO.Below O A S last →
        byteAt DEFP j ≤ ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ (hslot HP j).testBit l = true)).card := by
  obtain ⟨_, hS511, hcard, hU⟩ := frameOKO_basic hF
  intro XL
  induction XL with
  | nil =>
    intro j0 h j hj0 hjJ
    have h' : Nat.beq j0 J = true := h
    have := Nat.eq_of_beq_eq_true h'; omega
  | cons X Xs ih =>
    intro j0 h j hj0 hjJ A hΩ hA
    have h' : (dtEntry np U du X (hslot HP j0) (byteAt DEFP j0) && dtOK np U du HP DEFP J Xs (Nat.succ j0)) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.eq_or_lt_of_le hj0 with heq | hlt
    · subst heq
      have he := h'.1
      unfold dtEntry at he
      rw [Bool.and_eq_true] at he
      obtain ⟨hX5, he⟩ := he
      have hX5' := Nat.blt_eq.mp hX5
      have habove := below_above_cardO hS hA du hcard
      have hdu22 : du ≤ 22 := by
        have h1 := below_splitO hS hA (fun _ => True)
        simp only [and_true] at h1
        rw [has_cardO O A, hcard] at h1
        omega
      cases hX : Nat.beq X 0
      · rw [hX] at he; simp only [cond_false, Bool.and_eq_true] at he
        obtain ⟨hH, hdv⟩ := he
        have hH' := Nat.eq_of_beq_eq_true hH
        have hdv' := Nat.le_of_ble_eq_true hdv
        have hX0 : X ≠ 0 := Nat.ne_of_beq_eq_false hX
        have hfl : fld7 U X = R3RT.SpecO.hits O S X := by
          rw [hU]; exact fld7_packUO S X du hX5' hcard (by omega)
        have hdef := deficit_labO O A X (Nat.pos_of_ne_zero hX0) hX5'
        have hsp := below_splitO hS hA (fun l => par (O.vec l &&& X) = true)
        have hh : R3RT.SpecO.hits O S X = ((Finset.range 511).filter (fun l => S.testBit l = true ∧ par (O.vec l &&& X) = true)).card := rfl
        have hcnt : ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ (hslot HP j0).testBit l = true)).card =
            ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ par (O.vec l &&& X) = true)).card := by
          apply card_filter_congr; intro l hl
          rw [hH', hnp X (Nat.pos_of_ne_zero hX0) hX5' l (Finset.mem_range.mp hl)]
        simp only [Nat.add_eq, Nat.mul_eq] at hdv'
        rw [hcnt]; rw [hfl] at hdv'
        omega
      · rw [hX] at he; simp only [cond_true, Bool.and_eq_true] at he
        obtain ⟨hH, hdv⟩ := he
        have hH' := Nat.eq_of_beq_eq_true hH
        have hdv' := Nat.le_of_ble_eq_true hdv
        have hcnt : ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ (hslot HP j0).testBit l = true)).card =
            ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l)).card := by
          apply card_filter_congr; intro l hl
          rw [hH', m511_bit]; simp [Finset.mem_range.mp hl]
        simp only [Nat.add_eq] at hdv'
        rw [hcnt, habove]
        omega
    · exact ih (Nat.succ j0) h'.2 j hlt hjJ A hΩ hA

/-- the node matrix holds no pair of labels of a decomposition below the node above `last` -/
theorem anodeX_soundO {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {S D N U du last b1 m e1 : ℕ} {mk : ℕ → ℕ} {nrows : List ℕ}
    (hF : FrameOKO O Ω S D N U du)
    (hS : S >>> last = 1) (hD : DictSemXO O Ω S last mk (rposB b1 m e1)) (hmk : ∀ p, mk p < 2 ^ 511)
    (hnr : nrOK b1 m e1 nrows = true) : AnodeSemO O Ω S last (anodeX N mk nrows) := by
  intro A hΩ hA a b ha ha5 hb hb5 hab hAa hAb
  set C := (Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l) with hC
  have hmem : ∀ x, x ∈ C ↔ x < 511 ∧ last < x ∧ R3RT.SpecO.Has O A x := by intro x; rw [hC, Finset.mem_filter, Finset.mem_range]
  have hREPm' : REPmF = pk (512 - 1) (fun _ => 1) 511 := REPmF_eq
  refine K2.matrix_indep 512 511 N REPmF REPF DIAGF (R3RT.mapL mk nrows) (by norm_num) REPF_eq hREPm' DIAGF_eq
    (fun r hr => by obtain ⟨k, _, rfl⟩ := mem_mapL hr; exact hmk k) C (fun v hv => ((hmem v).mp hv).1) ?_ ?_
    a ((hmem a).mpr ⟨ha5, ha, hAa⟩) b ((hmem b).mpr ⟨hb5, hb, hAb⟩)
  · intro v hv w hw hvw
    obtain ⟨hv5, hv1, hAv⟩ := (hmem v).mp hv
    obtain ⟨hw5, hw1, hAw⟩ := (hmem w).mp hw
    exact frame_confO hF hS A hΩ hA v w hv1 hv5 hw1 hw5 hvw hAv hAw
  · intro r hr
    obtain ⟨k, hk, rfl⟩ := mem_mapL hr
    have hk1 := nrOK_mem hnr k hk
    have := hD k A hΩ hA
    refine le_trans (le_of_eq ?_) (le_trans this hk1)
    rw [hC, Finset.filter_filter]
    apply card_filter_congr; intro l _; tauto

/-! ## The child -/

/-- **soundness of one child** -/
theorem kidX_soundO {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {S D N U du last b1 m e1 HP DEFP J : ℕ} {mk : ℕ → ℕ} {aggs : List Agg} {c : KidX}
    (hF : FrameOKO O Ω S D N U du) (hS : S >>> last = 1) (hD : DictSemXO O Ω S last mk (rposB b1 m e1))
    (hA : AnodeSemO O Ω S last Anode) (hT : DTSemO O Ω S last HP DEFP J)
    (hagg : ∀ ag ∈ aggs, C2OKO O Ω ag.1 ag.2.1 ∧ K2.bxOK REPmF REPF DIAGF ag.1 ag.2.1 ag.2.2.1 (R3RT.mapL mk ag.2.2.2) = true)
    (hkid : KidXOKO O Ω c) (h : kidX D last b1 m e1 Anode HP DEFP J (Nat.sub 21 du) mk aggs c = true) :
    ∀ A : Dec22, Ω A → ¬ R3RT.SpecO.Continues O A S last c.1 := by
  obtain ⟨u, Fu, cr, t, C2u, cs⟩ := c
  obtain ⟨hC2u, hcs⟩ := hkid
  simp only at hC2u hcs h ⊢
  intro A hΩ hcont
  have hlu : last < u := hcont.1
  have hu : u < 511 := hcont.2.1
  have hlast := shr_one_lastOf hS
  have hbelL : R3RT.SpecO.Below O A S (lastOf S) := cont_belowO hS hcont
  have hbel : R3RT.SpecO.Below O A S last := by rw [← hlast]; exact hbelL
  have hAu : R3RT.SpecO.Has O A u := cont_hasO hcont
  have hF' := hF
  obtain ⟨_, _, hcard, hU⟩ := frameOKO_basic hF'
  obtain ⟨hdead, _⟩ := frameOKO_apply hF' A hΩ hbelL
  unfold kidX at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨_, _⟩, hFu⟩, hcr⟩, hxc⟩, hch⟩ := h
  have hcrm := crX_mem hcr
  set L := (Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l) with hLdef
  have hmemL : ∀ x, x ∈ L ↔ x < 511 ∧ u < x ∧ R3RT.SpecO.Has O A x := by intro x; rw [hLdef, Finset.mem_filter, Finset.mem_range]
  -- the labels of A above last are u and L
  have habove : ∀ (q : ℕ → Prop) [DecidablePred q],
      ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ q l)).card = (L.filter q).card + (if q u then 1 else 0) := by
    intro q _
    rw [show (Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ q l) =
        (L.filter q) ∪ ((Finset.range 511).filter (fun l => l = u ∧ q l)) by
      ext l; simp only [Finset.mem_union, Finset.mem_filter, Finset.mem_range, hLdef]
      constructor
      · rintro ⟨hl, h1, h2, h3⟩
        by_cases hlu' : u < l
        · exact Or.inl ⟨⟨hl, hlu', h2⟩, h3⟩
        · have hle : l ≤ u := by omega
          have : l = u := by
            by_contra hne
            rcases (cont_leO hS hcont l hle).1 h2 with h4 | h4
            · rw [shr_one_bit hS l (by omega)] at h4; simp at h4; omega
            · exact hne h4
          exact Or.inr ⟨hl, this, h3⟩
      · rintro (⟨⟨hl, h1, h2⟩, h3⟩ | ⟨hl, rfl, h3⟩)
        · exact ⟨hl, by omega, h2, h3⟩
        · exact ⟨hl, hlu, hAu, h3⟩]
    have hdis : Disjoint (L.filter q) ((Finset.range 511).filter (fun l => l = u ∧ q l)) := by
      rw [Finset.disjoint_left]; intro l h1 h2
      rw [Finset.mem_filter, hmemL] at h1
      rw [Finset.mem_filter] at h2
      omega
    rw [Finset.card_union_of_disjoint hdis]
    congr 1
    by_cases hq : q u
    · rw [if_pos hq, Finset.card_eq_one]; refine ⟨u, ?_⟩; ext l
      simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_singleton]
      constructor
      · rintro ⟨_, h1, _⟩; exact h1
      · rintro rfl; exact ⟨hu, rfl, hq⟩
    · rw [if_neg hq, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨rfl, h3⟩; exact hq h3
  -- dictionary rows on L
  have hslotL : ∀ p, (L.filter (fun a => (mk p).testBit a = true)).card +
      (if (mk p).testBit u = true then 1 else 0) ≤ rposB b1 m e1 p := by
    intro p
    rw [← habove (fun l => (mk p).testBit l = true)]
    exact hD p A hΩ hbel
  -- the free set is exactly the labels above u outside D and outside the node matrix's slot u, and contains L
  have hFuL : ∀ a ∈ L, Fu.testBit a = true := by
    intro a ha
    obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
    have hEq := Nat.eq_of_beq_eq_true hFu
    rw [hEq, K2.testBit_andn, K2.testBit_andn]
    have hwin : (Nat.sub (Nat.shiftLeft 1 511) (Nat.shiftLeft 1 (Nat.add u 1))).testBit a = true := by
      rw [show Nat.sub (Nat.shiftLeft 1 511) (Nat.shiftLeft 1 (Nat.add u 1)) = 2 ^ 511 - 2 ^ (u + 1) by
        rw [show Nat.shiftLeft 1 511 = 1 <<< 511 from rfl, show Nat.shiftLeft 1 (Nat.add u 1) = 1 <<< (u + 1) from rfl,
          Nat.one_shiftLeft, Nat.one_shiftLeft]; rfl]
      rw [L5.testBit_pow_sub_pow 511 (u + 1) a (by omega)]; simp; omega
    have hDa : D.testBit a = false := by
      cases hd : D.testBit a
      · rfl
      · exact absurd hAa (hdead a (by rw [hlast]; omega) ha5 hd)
    have hNa : (K2.rowA 512 Anode u).testBit a = false := by
      rw [K2.rowA_eq]
      exact hA A hΩ hbel u a hlu hu (by omega) ha5 (by omega) hAu hAa
    rw [hwin, hDa, hNa]; rfl
  -- the demands, from the deficit table
  have hstep : ∀ st : ℕ × ℕ, stepC HP DEFP J u st = true →
      1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => (hslot HP st.1).testBit a = true)).card := by
    intro st hst
    unfold stepC at hst
    simp only [Bool.and_eq_true] at hst
    obtain ⟨⟨h1, h2⟩, h3⟩ := hst
    refine ⟨Nat.blt_eq.mp h1, ?_⟩
    have hj := Nat.blt_eq.mp h2
    have h3' := Nat.le_of_ble_eq_true h3
    simp only [Nat.add_eq] at h3'
    have hdt := hT st.1 hj A hΩ hbel
    rw [habove (fun l => (hslot HP st.1).testBit l = true)] at hdt
    rw [bitAt_eq] at h3'
    split_ifs at hdt h3' <;> omega
  -- in-branches: the aggregate of the pick has no pair of L when the pick is in L
  have hagg2 : ∀ k v, (aggAt aggs k).1 = Nat.succ u + v → Nat.succ u + v ∈ L →
      ∀ a ∈ L, ∀ b ∈ L, (dig 512 (aggAt aggs k).2.2.1 a).testBit b = false := by
    intro k v hk hv a ha b hb
    rcases aggAt_mem k aggs with hmem | hdef
    · obtain ⟨hC2x, hbx⟩ := hagg _ hmem
      set ag := aggAt aggs k with hag
      obtain ⟨hv5, huv, hAv⟩ := (hmemL _).mp hv
      have hLlt : ∀ x ∈ L, x < 511 := fun x hx => ((hmemL x).mp hx).1
      refine K2.bx_sound REPmF REPF DIAGF ag.1 ag.2.1 ag.2.2.1 (R3RT.mapL mk ag.2.2.2) hbx REPF_eq REPmF_eq DIAGF_eq L hLlt
        ?_ ?_ a ha b hb
      · intro r hr
        obtain ⟨p, _, rfl⟩ := mem_mapL hr
        -- rows of the aggregate pass through its label (bxOK) and have residual ≤ 2
        have hx : (mk p).testBit ag.1 = true := by
          unfold K2.bxOK at hbx
          rw [Bool.and_eq_true] at hbx
          exact (K2.rowsOK_mem _ _ _ hbx.1 (mk p) hr).2
        have hp := hslotL p
        have h2 := rposB_le2 b1 m e1 p
        have hxL : ag.1 ∈ L := by rw [hk]; exact hv
        have hsub : insert ag.1 ((L.erase ag.1).filter (fun a => (mk p).testBit a = true)) ⊆
            L.filter (fun a => (mk p).testBit a = true) := by
          intro y hy
          rw [Finset.mem_insert] at hy
          rw [Finset.mem_filter]
          rcases hy with rfl | hy
          · exact ⟨hxL, hx⟩
          · rw [Finset.mem_filter, Finset.mem_erase] at hy; exact ⟨hy.1.2, hy.2⟩
        have hc := Finset.card_le_card hsub
        rw [Finset.card_insert_of_notMem (by simp)] at hc
        split_ifs at hp <;> omega
      · intro a' ha' b' hb' hax hbx' hab'
        rw [testBit_dig 512 _ a' b' (by have := hLlt b' hb'; omega)]
        cases hx : ag.2.1.testBit (512 * a' + b') with
        | false => rfl
        | true =>
          exfalso
          have hx' : (ag.2.1 >>> (512 * a')).testBit b' = true := by rw [Nat.testBit_shiftRight]; exact hx
          have hxL : ag.1 ∈ L := by rw [hk]; exact hv
          obtain ⟨hx5, _, hAx⟩ := (hmemL _).mp hxL
          obtain ⟨ha5', _, hAa'⟩ := (hmemL a').mp ha'
          obtain ⟨hb5', _, hAb'⟩ := (hmemL b').mp hb'
          obtain ⟨r, hr, hrx, hra, hrb⟩ := hC2x a' b' ha5' hb5' hbx' (Ne.symm hab') hx'
          have hsub : ({ag.1, a', b'} : Finset ℕ) ⊆ R3RT.SpecO.inMask O A r := by
            intro y hy
            simp only [Finset.mem_insert, Finset.mem_singleton] at hy
            unfold R3RT.SpecO.inMask; rw [Finset.mem_filter, Finset.mem_range]
            rcases hy with rfl | rfl | rfl
            · exact ⟨hx5, hrx, hAx⟩
            · exact ⟨ha5', hra, hAa'⟩
            · exact ⟨hb5', hrb, hAb'⟩
          have h3 : ({ag.1, a', b'} : Finset ℕ).card = 3 := by
            rw [Finset.card_insert_of_notMem (by simp; exact ⟨Ne.symm hax, Ne.symm hbx'⟩), Finset.card_pair hab']
          have := Finset.card_le_card hsub
          have := rowOKO_apply hr A hΩ
          omega
    · rw [hdef]; unfold dig; simp
  -- the tree is valid for L
  have hval : ∀ t' : XC, xcOK HP DEFP J u aggs t' = true → K2.XTValidL3 512 (Nat.succ u) L (toXT3c HP aggs t') := by
    have hsts : ∀ sts : List (ℕ × ℕ), stepsCOK HP DEFP J u sts = true →
        ∀ st ∈ stepsC HP sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card := by
      intro sts hs st hst
      obtain ⟨s, hsm, rfl⟩ := mem_stepsC hst
      exact hstep s (stepsCOK_mem hs s hsm)
    intro t'
    induction t' with
    | leaf sts fin =>
      intro hx
      have hx' : (stepsCOK HP DEFP J u sts && stepC HP DEFP J u fin) = true := hx
      rw [Bool.and_eq_true] at hx'
      show K2.XTValidL3 512 (Nat.succ u) L (K2.XT3.leaf (stepsC HP sts) (hslot HP fin.1, fin.2))
      simp only [K2.XTValidL3]
      exact ⟨hsts sts hx'.1, hstep fin hx'.2⟩
    | node sts v k l r ihl ihr =>
      intro hx
      have hx' : (stepsCOK HP DEFP J u sts && Nat.beq (aggAt aggs k).1 (Nat.add (Nat.succ u) v) &&
          xcOK HP DEFP J u aggs l && xcOK HP DEFP J u aggs r) = true := hx
      simp only [Bool.and_eq_true] at hx'
      obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := hx'
      show K2.XTValidL3 512 (Nat.succ u) L (K2.XT3.node (stepsC HP sts) v (aggAt aggs k).2.2.1 (toXT3c HP aggs l)
        (toXT3c HP aggs r))
      simp only [K2.XTValidL3]
      refine ⟨hsts sts h1, ?_, ihl h3, ihr h4⟩
      intro hv
      exact hagg2 k v (Nat.eq_of_beq_eq_true h2) hv
    | cut =>
      intro _
      show K2.XTValidL3 512 (Nat.succ u) L K2.XT3.cut
      simp only [K2.XTValidL3]
  -- the budget: a completion has at most 21 - d' labels above u
  have hTL : L.card ≤ Nat.sub 21 du := by
    have h1 := above_le_tailO hS hcont du hcard (fun _ => True)
    have e : (Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l ∧ True) = L := by
      rw [hLdef]; exact Finset.filter_congr (fun x _ => by simp)
    rw [e] at h1; simp only [Nat.sub_eq]; omega
  -- kill2's child check
  obtain ⟨hcR, hcRm, hcG, hcL, hcD⟩ := hcs
  have hTOP : Nat.shiftLeft 1 (Nat.sub 510 u) = 2 ^ (Nat.sub 510 u) := by
    rw [show Nat.shiftLeft 1 (Nat.sub 510 u) = 1 <<< (Nat.sub 510 u) from rfl, Nat.one_shiftLeft]
  have hALL : Nat.mul cs.1 (Nat.sub (Nat.shiftLeft 1 (Nat.sub 510 u)) 1) = pk 512 (fun _ => 2 ^ (Nat.sub 510 u) - 1) (Nat.sub 510 u) := by
    rw [hTOP, hcR, show Nat.mul (pk 512 (fun _ => 1) (Nat.sub 510 u)) (Nat.sub (2 ^ (Nat.sub 510 u)) 1) =
      (2 ^ (Nat.sub 510 u) - 1) * pk 512 (fun _ => 1) (Nat.sub 510 u) from Nat.mul_comm _ _, ← MisF.pk_mul]
    simp only [mul_one]
  refine K2.childL4X_sound_label cs.2.1 cs.1 cs.2.2.1 cs.2.2.2.1 M511 cs.2.2.2.2
    (Nat.mul cs.1 (Nat.sub (Nat.shiftLeft 1 (Nat.sub 510 u)) 1)) 512 (Nat.shiftLeft 1 (Nat.sub 510 u))
    (Nat.sub 510 u) (Nat.succ u) (Nat.sub 21 du) Anode C2u Fu (R3RT.mapL mk cr) (toXT3c HP aggs t)
    (by simp only [Nat.sub_eq]; omega) hcR hcRm hcG hcL (by rw [m511_eq]) hcD hTOP hALL
    (by simp only [Nat.sub_eq]; omega) hch L ?_ ?_ ?_ ?_ hTL (hval t hxc)
  · intro a ha
    obtain ⟨ha5, hua, _⟩ := (hmemL a).mp ha
    exact ⟨by omega, by simp only [Nat.sub_eq]; omega, hFuL a ha⟩
  · intro a ha b hb hab
    obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
    obtain ⟨hb5, hub, hAb⟩ := (hmemL b).mp hb
    exact hA A hΩ hbel a b (by omega) ha5 (by omega) hb5 hab hAa hAb
  · intro a ha b hb hab
    obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
    obtain ⟨hb5, hub, hAb⟩ := (hmemL b).mp hb
    rw [testBit_dig 512 C2u a b (by omega)]
    cases hx : C2u.testBit (512 * a + b) with
    | false => rfl
    | true =>
      exfalso
      have hx' : (C2u >>> (512 * a)).testBit b = true := by rw [Nat.testBit_shiftRight]; exact hx
      obtain ⟨r, hr, hru, hra, hrb⟩ := hC2u a b ha5 hb5 (by omega) (Ne.symm hab) hx'
      have hsub : ({u, a, b} : Finset ℕ) ⊆ R3RT.SpecO.inMask O A r := by
        intro y hy
        simp only [Finset.mem_insert, Finset.mem_singleton] at hy
        unfold R3RT.SpecO.inMask; rw [Finset.mem_filter, Finset.mem_range]
        rcases hy with rfl | rfl | rfl
        · exact ⟨hu, hru, hAu⟩
        · exact ⟨ha5, hra, hAa⟩
        · exact ⟨hb5, hrb, hAb⟩
      have h3 : ({u, a, b} : Finset ℕ).card = 3 := by
        rw [Finset.card_insert_of_notMem (by simp; omega), Finset.card_pair hab]
      have := Finset.card_le_card hsub
      have := rowOKO_apply hr A hΩ
      omega
  · intro r hr
    obtain ⟨p, hp, rfl⟩ := mem_mapL hr
    have := hslotL p
    rcases hcrm p hp with hp1 | hp1
    · split_ifs at this <;> omega
    · rw [if_pos hp1] at this
      have := rposB_le2 b1 m e1 p
      omega

/-- **Soundness of the X part of a node**: every listed child is dead (the class `hXP` of `ComposedNodeSpec`). -/
theorem xpartC_soundO {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop} {np : ℕ → ℕ} {S D N U du last b1 m e1 HP DEFP J : ℕ} {mk : ℕ → ℕ} {nrows : List ℕ}
    {aggs : List Agg} {XL : List ℕ} {kids : List KidX}
    (hF : FrameOKO O Ω S D N U du) (hS : S >>> last = 1) (hD : DictSemXO O Ω S last mk (rposB b1 m e1))
    (hmk : ∀ p, mk p < 2 ^ 511)
    (hagg : ∀ ag ∈ aggs, C2OKO O Ω ag.1 ag.2.1) (hkids : ∀ c ∈ kids, KidXOKO O Ω c)
    (hnp : NpOK O np) (h : xpartC np S D N U du last b1 m e1 mk nrows aggs XL HP DEFP J kids = true) :
    ∀ c ∈ kids, ∀ A : Dec22, Ω A → ¬ R3RT.SpecO.Continues O A S last c.1 := by
  unfold xpartC at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨hnr, hag⟩, hdt⟩, hk⟩ := h
  have hA := anodeX_soundO hF hS hD hmk hnr
  have hT : DTSemO O Ω S last HP DEFP J := fun j hj A hΩ hA' => dtOK_semO hnp hF hS XL 0 hdt j (Nat.zero_le j) hj A hΩ hA'
  have hagg' : ∀ ag ∈ aggs, C2OKO O Ω ag.1 ag.2.1 ∧ K2.bxOK REPmF REPF DIAGF ag.1 ag.2.1 ag.2.2.1 (R3RT.mapL mk ag.2.2.2) = true :=
    fun ag hag' => ⟨hagg ag hag', aggsX_mem hag ag hag'⟩
  intro c hc
  exact kidX_soundO hF hS hD hA hT hagg' (hkids c hc) (kidsX_mem hk c hc)


/-- **`xpartC_sound` at `LO123`** (`--rord 123`, the hyperplane masks `nperpL`), the instance used by `KD.batchX` -/
theorem xpartC_sound {Ω : Dec22 → Prop} {S D N U du last b1 m e1 HP DEFP J : ℕ} {mk : ℕ → ℕ} {nrows : List ℕ}
    {aggs : List Agg} {XL : List ℕ} {kids : List KidX}
    (hF : FrameOKU Ω S D N U du) (hS : S >>> last = 1) (hD : DictSemX Ω S last mk (rposB b1 m e1))
    (hmk : ∀ p, mk p < 2 ^ 511)
    (hagg : ∀ ag ∈ aggs, C2OKU Ω ag.1 ag.2.1) (hkids : ∀ c ∈ kids, KidXOK Ω c)
    (h : xpartC nperpL S D N U du last b1 m e1 mk nrows aggs XL HP DEFP J kids = true) :
    ∀ c ∈ kids, ∀ A : Dec22, Ω A → ¬ Continues A S last c.1 :=
  xpartC_soundO hF hS hD hmk hagg hkids npOK_123 h

end KD
