module
public import R22Port.U_d41d8cd98f00
public import R3RT.L1v5Spec
public import S5.Base
/-! # Specification revision 6a: the R3 spec over a label order and a universe of decompositions (gap G5)

Revision 5 (`R3RT/L1v5Spec.lean`, unchanged) fixes prof7's `--rord 123` label order (`vecL`), case (II), and quantifies its row,
frame and kill statements over every decomposition. This file states the same propositions for

* a **label order** `O : LabelOrder`: labels `0..510` ↦ 9-bit codes (`vec`, injective and nonzero), L3's canonical key (`key`, as
  `C3.Canon` takes it), the rank of each label (`rk`, = `rkOf ∘ vec`) and the prefix counts of each rank (`cnt r u` = number of
  labels `< u` of rank `r`, for `r = 1, 2, 3`) as data with their facts. `LO123` is revision 5's order. The `--rord 321` order
  (rank 3, then 2, then 1, by code within a rank) is `r3/rt321/lab511_321.json`; its instance comes with the 321 tables;
* a **universe** `Ω : Dec22 → Prop` of the decompositions the statements are about: every "for all decompositions" of revision 5
  reads "for all decompositions in `Ω`". `Ω` must be invariant under the symmetry group (it is used through RT's class facts, which
  move a decomposition by a group element), so it is a rank condition such as `CaseK lo hi`, not `Canon`. `Ω = fun _ => True` is
  revision 5 (the `*_123` lemmas). With a table that holds only in case (II) (class 479 at bound 21: `HC.classFactsII`), case (II)
  uses `Ω = CaseK 14 22`;
* a **case predicate** `C` for the accounting (`ChildDead`, `NodeCovered`, `ComposedNodeSpec`): `CaseK lo hi A` = `lo ≤`
  (number of rank-1 first factors) `≤ hi`; case (II) `CaseK 14 22` (`caseK_II`), case (I) `CaseK 0 12`, case (I13) `CaseK 13 13`.
  `ComposedNodeSpec O Ω C` assumes `C ⊆ Ω`.

The checkers (`node5`, `frame5`, `batch5TD`, `tabOKQ`, `bindQ`) are order-free functions; only the row interface `rowE`
(revision 5: `rowE3eD`), the class lower bounds `lb` (revision 5: `RT.cLB RT.K3eD_Cls.CL`) and the static tables change.
Order-specific facts are not stated here; top/GAPS.md G5 lists them. -/
@[expose] public section
noncomputable section
namespace R3RT.SpecO
open RootSound BC4 BC5 Classical

/-- a label order -/
structure LabelOrder where
  vec : ℕ → ℕ
  key : ℕ → ℕ
  rk : ℕ → ℕ
  cnt : ℕ → ℕ → ℕ
  vec_lt : ∀ l, l < 511 → vec l < 512
  vec_ne : ∀ l, l < 511 → vec l ≠ 0
  vec_inj : ∀ k l, k < 511 → l < 511 → vec k = vec l → k = l
  rk_spec : ∀ l, l < 511 → rk l = rkOf (vec l)
  cnt_zero : ∀ r, 1 ≤ r → r ≤ 3 → cnt r 0 = 0
  cnt_succ : ∀ r, 1 ≤ r → r ≤ 3 → ∀ u, u < 511 → cnt r (u + 1) = cnt r u + if rk u = r then 1 else 0

/-- `cnt r u` counts the labels below `u` of rank `r` -/
theorem LabelOrder.cnt_spec (O : LabelOrder) (r : ℕ) (h1 : 1 ≤ r) (h3 : r ≤ 3) :
    ∀ u, u ≤ 511 → O.cnt r u = ((Finset.range u).filter (fun l => O.rk l = r)).card := by
  intro u hu
  induction u with
  | zero => simp [O.cnt_zero r h1 h3]
  | succ u ih =>
    rw [O.cnt_succ r h1 h3 u (by omega), ih (by omega), Finset.range_add_one, Finset.filter_insert]
    split_ifs with h <;> simp [Finset.card_insert_of_notMem, h]

/-! ## The `--rord 123` instance -/

/-- the ranks of `--rord 123` labels: 49 of rank 1, then 294 of rank 2, then 168 of rank 3 -/
def rk123 (l : ℕ) : ℕ := if l < 49 then 1 else if l < 343 then 2 else 3
/-- prefix counts of `rk123` -/
def cnt123 (r u : ℕ) : ℕ := if r = 1 then min u 49 else if r = 2 then min (u - 49) 294 else if r = 3 then u - 343 else 0

theorem rk123_fact : S5.allLT 511 (fun l => rk123 l == rkOf (vecL l)) = true := by decide +kernel
theorem cnt123_fact : S5.allLT 511 (fun u => (cnt123 1 (u + 1) == cnt123 1 u + if rk123 u = 1 then 1 else 0) &&
    (cnt123 2 (u + 1) == cnt123 2 u + if rk123 u = 2 then 1 else 0) &&
    (cnt123 3 (u + 1) == cnt123 3 u + if rk123 u = 3 then 1 else 0)) = true := by decide +kernel

/-- revision 5's order: prof7 `--rord 123` (`R3RT.vecL`) and L3's key `C3.labK` -/
def LO123 : LabelOrder where
  vec := vecL
  key := C3.labK
  rk := rk123
  cnt := cnt123
  vec_lt := fun l _ => vecL_lt l
  vec_ne := fun l hl => vecL_ne_zero l hl
  vec_inj := fun k l hk hl h => vecL_inj k l hk hl h
  rk_spec := fun l hl => by have := S5.allLT_spec rk123_fact l hl; simpa using this
  cnt_zero := fun r h1 h3 => by unfold cnt123; interval_cases r <;> simp
  cnt_succ := fun r h1 h3 u hu => by
    have := S5.allLT_spec cnt123_fact u hu
    simp only [Bool.and_eq_true, beq_iff_eq] at this
    interval_cases r
    · exact this.1.1
    · exact this.1.2
    · exact this.2

variable (O : LabelOrder) (Ω : Spec.Dec22 → Prop)

/-! ## Decompositions in label coordinates (no universe needed) -/

def Has (A : Spec.Dec22) (l : ℕ) : Prop := l < 511 ∧ ∃ s, A.av s = O.vec l
def Canon (A : Spec.Dec22) : Prop := C3.Canon O.key C3.Gset (Finset.univ.image A.av)
def inMask (A : Spec.Dec22) (m : ℕ) : Finset ℕ := (Finset.range 511).filter (fun l => m.testBit l = true ∧ Has O A l)
def Below (A : Spec.Dec22) (S last : ℕ) : Prop := ∀ l, l < 511 → l ≤ last → (Has O A l ↔ S.testBit l = true)
def Continues (A : Spec.Dec22) (S last u : ℕ) : Prop := last < u ∧ u < 511 ∧ Below O A (S ||| 2 ^ u) u
def hits (S X : ℕ) : ℕ := ((Finset.range 511).filter (fun p => S.testBit p = true ∧ par (O.vec p &&& X) = true)).card
def packU (S : ℕ) : ℕ := ∑ X ∈ Finset.range 512, hits O S X * 2 ^ (7 * X)
def HOK (l h : ℕ) : Prop := h = ∑ X ∈ Finset.range 512, (if par (O.vec l &&& X) = true then 1 else 0) * 2 ^ (7 * X)

/-! ## Rows, static tables, frames, records: over the universe `Ω` -/

def RowOK (m cap : ℕ) : Prop := ∀ A : Spec.Dec22, Ω A → (inMask O A m).card ≤ cap
def C2OK (l c2 : ℕ) : Prop :=
  ∀ v w, v < 511 → w < 511 → w ≠ l → w ≠ v → (c2 >>> (512 * v)).testBit w = true →
    ∃ m, RowOK O Ω m 2 ∧ m.testBit l = true ∧ m.testBit v = true ∧ m.testBit w = true
def Conf1OK (c1 : ℕ) : Prop :=
  ∀ v w, v < 511 → w < 511 → w ≠ v → (c1 >>> (512 * v)).testBit w = true →
    ∃ m, RowOK O Ω m 1 ∧ m.testBit v = true ∧ m.testBit w = true

def FrameOK (S D N U d : ℕ) : Prop :=
  0 < S ∧ S < 2 ^ 511 ∧ ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d ∧ U = packU O S ∧
  ∀ A : Spec.Dec22, Ω A → Below O A S (Spec.lastOf S) →
    (∀ l, Spec.lastOf S < l → l < 511 → D.testBit l = true → ¬ Has O A l) ∧
    (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
      (N >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w)

def RecRowsOK (rec : ℕ) : Prop :=
  let hdr := rec % 2 ^ 64
  let nV := (hdr >>> 22) % 1024
  let n1 := (hdr >>> 32) % 1024
  let n2 := (hdr >>> 52) % 1024
  let m := nV + n1 + n2
  let body := rec >>> 64
  ∀ i, i < m →
    RowOK O Ω (Spec.fld body 512 i % 2 ^ 511) (Spec.fld (body >>> (512 * m)) 8 i + (if i < nV then 0 else if i < nV + n1 then 1 else 2))

def KillsOK (S' last : ℕ) (ks : List ℕ) : Prop := ∀ kr ∈ ks, ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S' last (kr % 512)

/-! ## Contracts of the L1 v5 checker -/

def Node5Spec : Prop :=
  ∀ (S D N U dP c2 h suf rec : ℕ) (ks : List ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool),
    FrameOK O Ω S D N U dP → C2OK O Ω ((rec >>> 8) % 512) c2 → HOK O ((rec >>> 8) % 512) h → RecRowsOK O Ω rec →
    node5 S D N U dP c2 h suf rec ks k = true →
      let last := (rec >>> 8) % 512
      ∃ D', FrameOK O Ω (S ||| 2 ^ last) D' (N ||| c2) (U + h) (dP + 1) ∧ KillsOK O Ω (S ||| 2 ^ last) last ks ∧
        k (S ||| 2 ^ last) D' (N ||| c2) (U + h) = true

def Frame5Spec : Prop :=
  ∀ (S D N U dP c2 h rec : ℕ) (k : ℕ → ℕ → ℕ → ℕ → Bool),
    FrameOK O Ω S D N U dP → C2OK O Ω ((rec >>> 8) % 512) c2 → HOK O ((rec >>> 8) % 512) h → RecRowsOK O Ω rec →
    frame5 S D N U dP c2 h rec k = true →
      let last := (rec >>> 8) % 512
      ∃ D', FrameOK O Ω (S ||| 2 ^ last) D' (N ||| c2) (U + h) (dP + 1) ∧ k (S ||| 2 ^ last) D' (N ||| c2) (U + h) = true

def TabOK (tab : ℕ → ℕ) : Prop := ∀ i, (tab i >>> 511) % 512 < 256 ∧ RowOK O Ω (tab i % 2 ^ 511) ((tab i >>> 511) % 512)

def BatchOK : List (ℕ × ℕ × ℕ × ℕ × ℕ) → List Spec.Node5 → Prop
  | _, [] => True
  | st, (c2, h, _suf, hdr, _r2, _r1, _r0, ks) :: rest =>
    match st.drop (hdr % 256) with
    | [] => False
    | (S, _D, N, U, dP) :: _st' =>
      let last := (hdr >>> 8) % 512
      KillsOK O Ω (S ||| 2 ^ last) last ks ∧
      ∃ D', FrameOK O Ω (S ||| 2 ^ last) D' (N ||| c2) (U + h) (dP + 1) ∧
        BatchOK ((S ||| 2 ^ last, D', N ||| c2, U + h, dP + 1) :: st.drop (hdr % 256)) rest

def Batch5TDSpec : Prop :=
  ∀ (tab : ℕ → ℕ) (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List Spec.Node5),
    TabOK O Ω tab →
    (∀ f ∈ st, FrameOK O Ω f.1 f.2.1 f.2.2.1 f.2.2.2.1 f.2.2.2.2) →
    (∀ x ∈ nodes, C2OK O Ω ((x.2.2.2.1 >>> 8) % 512) x.1 ∧ HOK O ((x.2.2.2.1 >>> 8) % 512) x.2.1) →
    batch5TD tab st nodes = true → BatchOK O Ω st nodes

/-- RT's class facts over the universe: every decomposition of `Ω` has at least `lb c` first factors outside class `c`'s mask.
Revision 5's `ClassFacts` is the instance `Ω = True`, `lb = RT.cLB RT.K3eD_Cls.CL` (`classFactsC_true`). -/
def ClassFactsC (lb : ℕ → ℕ) : Prop :=
  ∀ A : Spec.Dec22, Ω A → ∀ c, c < 496 →
    lb c ≤ (Finset.univ.filter (fun s => (RT.kM RT.K3eD_Cls.CL c).testBit (A.av s) = false)).card

/-- the per-job table check against the order's row interface `rowE` and class bounds `lb` -/
def TableSpec (rowE lb : ℕ → ℕ) : Prop :=
  ∀ (chunk entry : ℕ → ℕ) (N nch : ℕ),
    (∀ i, entry i = (chunk (i / 64) >>> (552 * (i % 64))) % 2 ^ 552) → (∀ q, nch ≤ q → chunk q = 0) →
    (∀ i, N ≤ i → entry i = 0) →
    ClassFactsC Ω lb → tabOKQ rowE chunk 64 N nch = true → TabOK O Ω entry

def BindQSpec (rowE lb : ℕ → ℕ) : Prop :=
  ∀ (q : ℕ) (rows : List (ℕ × List ℕ)) (stored DC : ℕ), ClassFactsC Ω lb →
    (q < 511 → bindQ rowE q 2 rows stored DC = true → C2OK O Ω q stored) ∧
    (bindQ rowE 511 1 rows stored DC = true → Conf1OK O Ω stored)

/-! ## Cases and the composed node -/

/-- the rank-1 window of the case: `lo ≤` (number of rank-1 first factors) `≤ hi` (order-free, group-invariant) -/
def CaseK (lo hi : ℕ) (A : Spec.Dec22) : Prop := lo ≤ Spec.nType A 1 ∧ Spec.nType A 1 ≤ hi

/-- child `u` is accounted for in the case `C`: no canonical decomposition of the case continues with it -/
def ChildDead (C : Spec.Dec22 → Prop) (S' last u : ℕ) : Prop := ∀ A : Spec.Dec22, Canon O A → C A → ¬ Continues O A S' last u

def NodeCovered (C : Spec.Dec22 → Prop) (S' last : ℕ) (opens : Finset ℕ) : Prop :=
  ∀ u, last < u → u < 511 → u ∉ opens → ChildDead O C S' last u

/-- the composed node: the per-class hypotheses over `Ω` (rows, frames, kills) and `C` (canonicity and case records), `C ⊆ Ω` -/
def ComposedNodeSpec (C : Spec.Dec22 → Prop) : Prop :=
  (∀ A : Spec.Dec22, C A → Ω A) →
  ∀ (S' last : ℕ) (opens dead tc x6 xp l3 other : Finset ℕ),
    (∀ u ∈ tc, ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S' last u) →
    (∀ u ∈ dead, ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S' last u) →
    (∀ u ∈ x6, ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S' last u) →
    (∀ u ∈ xp, ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S' last u) →
    (∀ u ∈ l3, ChildDead O C S' last u) →
    (∀ u ∈ other, ChildDead O C S' last u) →
    (∀ u, last < u → u < 511 → u ∈ opens ∨ u ∈ dead ∨ u ∈ tc ∨ u ∈ x6 ∨ u ∈ xp ∨ u ∈ l3 ∨ u ∈ other) →
    NodeCovered O C S' last opens

/-- the composed node theorem holds for every order, universe and case (the union of the classes) -/
theorem composedNode (C : Spec.Dec22 → Prop) : ComposedNodeSpec O Ω C := by
  intro hCΩ S' last opens dead tc x6 xp l3 other htc hdead hx6 hxp hl3 hoth hcov u hlu hu huo A hcan hC hcont
  have hΩ := hCΩ A hC
  rcases hcov u hlu hu with h | h | h | h | h | h | h
  · exact huo h
  · exact hdead u h A hΩ hcont
  · exact htc u h A hΩ hcont
  · exact hx6 u h A hΩ hcont
  · exact hxp u h A hΩ hcont
  · exact hl3 u h A hcan hC hcont
  · exact hoth u h A hcan hC hcont

/-! ## Revision 5 is the instance `LO123`, `Ω = True`, case (II) -/

abbrev ΩT : Spec.Dec22 → Prop := fun _ => True

theorem has_123 (A : Spec.Dec22) (l : ℕ) : Has LO123 A l ↔ A.Has l := Iff.rfl
theorem canon_123 (A : Spec.Dec22) : Canon LO123 A ↔ A.Canon := Iff.rfl
theorem below_123 (A : Spec.Dec22) (S last : ℕ) : Below LO123 A S last ↔ Spec.Below A S last := Iff.rfl
theorem continues_123 (A : Spec.Dec22) (S last u : ℕ) : Continues LO123 A S last u ↔ Spec.Continues A S last u := Iff.rfl
theorem packU_123 (S : ℕ) : packU LO123 S = Spec.packU S := rfl
theorem hOK_123 (l h : ℕ) : HOK LO123 l h ↔ Spec.HOK l h := Iff.rfl
theorem rowOK_123 (m cap : ℕ) : RowOK LO123 ΩT m cap ↔ Spec.RowOK m cap :=
  ⟨fun h A => h A trivial, fun h A _ => h A⟩
theorem c2OK_123 (l c2 : ℕ) : C2OK LO123 ΩT l c2 ↔ Spec.C2OK l c2 := by
  unfold C2OK Spec.C2OK; simp only [rowOK_123]
theorem conf1OK_123 (c1 : ℕ) : Conf1OK LO123 ΩT c1 ↔ Spec.Conf1OK c1 := by
  unfold Conf1OK Spec.Conf1OK; simp only [rowOK_123]
theorem frameOK_123 (S D N U d : ℕ) : FrameOK LO123 ΩT S D N U d ↔ Spec.FrameOK S D N U d := by
  unfold FrameOK Spec.FrameOK
  exact and_congr Iff.rfl (and_congr Iff.rfl (and_congr Iff.rfl (and_congr Iff.rfl
    ⟨fun h A => h A trivial, fun h A _ => h A⟩)))
theorem recRowsOK_123 (rec : ℕ) : RecRowsOK LO123 ΩT rec ↔ Spec.RecRowsOK rec := by
  unfold RecRowsOK Spec.RecRowsOK; simp only [rowOK_123]
theorem killsOK_123 (S' last : ℕ) (ks : List ℕ) : KillsOK LO123 ΩT S' last ks ↔ Spec.KillsOK S' last ks :=
  ⟨fun h kr hk A => h kr hk A trivial, fun h kr hk A _ => h kr hk A⟩
theorem tabOK_123 (tab : ℕ → ℕ) : TabOK LO123 ΩT tab ↔ Spec.TabOK tab := by
  unfold TabOK Spec.TabOK; simp only [rowOK_123]
theorem node5Spec_123 : Node5Spec LO123 ΩT ↔ Spec.Node5Spec := by
  unfold Node5Spec Spec.Node5Spec; simp only [frameOK_123, c2OK_123, hOK_123, recRowsOK_123, killsOK_123]
theorem frame5Spec_123 : Frame5Spec LO123 ΩT ↔ Spec.Frame5Spec := by
  unfold Frame5Spec Spec.Frame5Spec; simp only [frameOK_123, c2OK_123, hOK_123, recRowsOK_123]
theorem batchOK_123 : ∀ (st : List (ℕ × ℕ × ℕ × ℕ × ℕ)) (nodes : List Spec.Node5),
    BatchOK LO123 ΩT st nodes ↔ Spec.BatchOK st nodes
  | _, [] => Iff.rfl
  | st, (c2, h, suf, hdr, r2, r1, r0, ks) :: rest => by
    simp only [BatchOK, Spec.BatchOK]
    generalize List.drop (hdr % 256) st = l
    cases l with
    | nil => exact Iff.rfl
    | cons f st' =>
      obtain ⟨S, D, N, U, dP⟩ := f
      exact and_congr (killsOK_123 _ _ _)
        (exists_congr fun _ => and_congr (frameOK_123 _ _ _ _ _) (batchOK_123 _ rest))
theorem batch5TDSpec_123 : Batch5TDSpec LO123 ΩT ↔ Spec.Batch5TDSpec := by
  unfold Batch5TDSpec Spec.Batch5TDSpec
  simp only [tabOK_123, frameOK_123, c2OK_123, hOK_123, batchOK_123]

theorem classFactsC_true : ClassFactsC ΩT (RT.cLB RT.K3eD_Cls.CL) ↔ Spec.ClassFacts := by
  unfold ClassFactsC Spec.ClassFacts RT.FactN
  constructor
  · intro h c hc av b c' hav hnz hinj hd
    exact h ⟨av, b, c', hav, hnz, hinj, hd⟩ trivial c hc
  · intro h A _ c hc
    exact h c hc A.av A.b A.c A.lt A.ne A.inj A.dec

theorem tableSpec_123 : TableSpec LO123 ΩT rowE3eD (RT.cLB RT.K3eD_Cls.CL) ↔ Spec.TableSpec := by
  unfold TableSpec Spec.TableSpec; simp only [classFactsC_true, tabOK_123]
theorem bindQSpec_123 : BindQSpec LO123 ΩT rowE3eD (RT.cLB RT.K3eD_Cls.CL) ↔ Spec.BindQSpec := by
  unfold BindQSpec Spec.BindQSpec; simp only [classFactsC_true, c2OK_123, conf1OK_123]

theorem nType_le (A : Spec.Dec22) (r : ℕ) : Spec.nType A r ≤ 22 := by
  unfold Spec.nType; exact (Finset.card_filter_le _ _).trans (by simp)

/-- case (II) is the window `14..22` -/
theorem caseK_II (A : Spec.Dec22) : CaseK 14 22 A ↔ Spec.CaseII A :=
  ⟨fun h => h.1, fun h => ⟨h, nType_le A 1⟩⟩

theorem childDead_123 (S' last u : ℕ) : ChildDead LO123 (CaseK 14 22) S' last u ↔ Spec.ChildDead S' last u := by
  unfold ChildDead Spec.ChildDead
  exact forall_congr' fun A => imp_congr Iff.rfl (imp_congr (caseK_II A) Iff.rfl)

theorem nodeCovered_123 (S' last : ℕ) (opens : Finset ℕ) :
    NodeCovered LO123 (CaseK 14 22) S' last opens ↔ Spec.NodeCovered S' last opens := by
  unfold NodeCovered Spec.NodeCovered
  exact forall_congr' fun u => imp_congr Iff.rfl (imp_congr Iff.rfl (imp_congr Iff.rfl (childDead_123 S' last u)))

end R3RT.SpecO
end
