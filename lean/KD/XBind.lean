module
public import R22Port.U_d41d8cd98f00
public meta import Lean
public import KD.Cuts
public import K2.XNode
public import K2.XDict
public import L5.Swar
public import L5.Sem5
/-! # KD.XBind: bulk-peel X kills bound to the L1 frame (G4; DESIGN 32.4)

kill2's child check `K2.childL` (27.11 form, the frozen rerun's `--pcxp`, X choice 5) is sound for a completion `L` of the child
when its inputs hold only valid conflicts and valid demands (`K2.childL_sound_label`).  This file binds those inputs to the node's
L1 frame `(S, D, N, U, d)` (`FrameOK`, the frame `node5` passes to its continuation):

* **Dictionary** (`dictB`): a packed literal `DICT` of 512-bit row masks, 8-bit caps `CAPS` and claimed counts `E`; L1's `blocks`
  proves `E_k = |S ∩ row_k|` (`L5.blocks_sound`), and `cap_k ≤ E_k + r_k` with `r_k = 1` for the first `n1` rows, 2 after.
  **`dictSemB_of`**: every row meets every decomposition below the node in at most `r_k` labels above `last`.
* **Node matrix** (`K2.nodeAOK` on the frame's `N` and residual-1 rows): **`anode_sound'`**.
* **Child** `u` (`xchild`): `F_u` contains `abv u \ D \ Anode[u]`; child rows are dictionary rows of residual 1 or through `u`;
  the tree's demands are `(X, d)` with `d ≤ 3 rk X - hits(S, X) - [u ∈ H_X]` (counters `U`, `deficit_fact`) or the degree test
  `X = 0`, `d ≤ 21 - d_S`; in-branch rows are dictionary rows; in-branch slices and `C2u` are L1's cap-2 tables, the window
  constants are literals (`KD.XConstN`): both are facts the caller supplies from existing theorems (`KidOK`).
* **`xnode_sound`**: an accepted node record kills every listed child, `∀ A, ¬ Continues A S last u` (the `hXP` class of
  `R3RT.Spec.ComposedNodeSpec`).  Hypotheses: `FrameOK`, `S >>> last = 1`, `RowOK` of the dictionary rows (the row table),
  `KidOK` per child. -/
@[expose] public section
set_option exponentiation.threshold 1024
set_option maxRecDepth 10000
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical MisF

/-! ## Window constants -/

/-- packing on the meta side -/
meta def pkMeta (S n : Nat) (f : Nat → Nat) : Nat := Id.run do
  let mut a := 0
  for i in [0:n] do a := a ||| (f i <<< (S * i))
  return a

open Lean in
meta def defLit (nm : Name) (v : Nat) : CoreM Unit := do
  let dv : DefinitionVal := { name := nm, levelParams := [], type := mkConst ``Nat, value := mkRawNatLit v, hints := ReducibilityHints.abbrev, safety := DefinitionSafety.safe }
  addDecl (Declaration.defnDecl dv) (forceExpose := true)
  compileDecl (Declaration.defnDecl dv)

open Lean Elab Command in
/-- `REPF = pk 512 (·↦1) 511`, `REPmF = pk 511 (·↦1) 511`, `DIAGF = pk 512 (i↦2^i) 511` as literal definitions -/
elab "#kdxconst" : command => do
  liftCoreM <| defLit `KD.REPF (pkMeta 512 511 (fun _ => 1))
  liftCoreM <| defLit `KD.REPmF (pkMeta 511 511 (fun _ => 1))
  liftCoreM <| defLit `KD.DIAGF (pkMeta 512 511 (fun i => 2 ^ i))

#kdxconst

theorem REPF_eq : REPF = pk 512 (fun _ => 1) 511 := by rw [← pkL_eq]; decide +kernel
theorem REPmF_eq : REPmF = pk 511 (fun _ => 1) 511 := by rw [← pkL_eq]; decide +kernel
theorem DIAGF_eq : DIAGF = pk 512 (fun i => 2 ^ i) 511 := by rw [← pkL_eq]; decide +kernel

/-- the low `n` fields of a packed number -/
theorem trunc_pk (S N n : ℕ) (a : ℕ → ℕ) (ha : ∀ i < N, a i < 2 ^ S) (hS : 0 < S) (hn : n ≤ N) :
    pk S a N &&& (2 ^ (S * n) - 1) = pk S a n := by
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_and, K2.testBit_pk S N a ha hS p, Nat.testBit_two_pow_sub_one,
    K2.testBit_pk S n a (fun i hi => ha i (by omega)) hS p]
  have e : p < S * n ↔ p / S < n := by rw [Nat.div_lt_iff_lt_mul hS, mul_comm]
  by_cases h1 : p / S < n
  · have h2 : p / S < N := by omega
    simp [h1, h2, e.mpr h1]
  · have h3 : ¬ p < S * n := fun h => h1 (e.mp h)
    simp [h1, h3]

/-- the window constants of `n` fields (stride 512) -/
def REPn (n : ℕ) : ℕ := Nat.land REPF (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft n 9)) 1)
def REPmn (n : ℕ) : ℕ := Nat.land REPmF (Nat.sub (Nat.shiftLeft 1 (Nat.mul 511 n)) 1)
def DIAGn (n : ℕ) : ℕ := Nat.land DIAGF (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft n 9)) 1)
def GRDn (n : ℕ) : ℕ := Nat.shiftLeft (REPn n) 511
def LOWSn (n : ℕ) : ℕ := Nat.sub (Nat.shiftLeft (REPn n) 511) (REPn n)

theorem shl9 (n : ℕ) : Nat.shiftLeft n 9 = 512 * n := by
  rw [show Nat.shiftLeft n 9 = n <<< 9 from rfl, Nat.shiftLeft_eq]; ring

theorem REPn_eq (n : ℕ) (hn : n ≤ 511) : REPn n = pk 512 (fun _ => 1) n := by
  unfold REPn
  rw [shl9, show Nat.shiftLeft 1 (512 * n) = 2 ^ (512 * n) by rw [show Nat.shiftLeft 1 (512 * n) = 1 <<< (512 * n) from rfl,
    Nat.one_shiftLeft], REPF_eq]
  exact trunc_pk 512 511 n _ (fun _ _ => by norm_num) (by norm_num) hn

theorem REPmn_eq (n : ℕ) (hn : n ≤ 511) : REPmn n = pk (512 - 1) (fun _ => 1) n := by
  unfold REPmn
  rw [show Nat.shiftLeft 1 (Nat.mul 511 n) = 2 ^ (511 * n) by rw [show Nat.shiftLeft 1 (Nat.mul 511 n) = 1 <<< (511 * n) from rfl,
    Nat.one_shiftLeft], REPmF_eq]
  exact trunc_pk 511 511 n _ (fun _ _ => by norm_num) (by norm_num) hn

theorem DIAGn_eq (n : ℕ) (hn : n ≤ 511) : DIAGn n = pk 512 (fun i => 2 ^ i) n := by
  unfold DIAGn
  rw [shl9, show Nat.shiftLeft 1 (512 * n) = 2 ^ (512 * n) by rw [show Nat.shiftLeft 1 (512 * n) = 1 <<< (512 * n) from rfl,
    Nat.one_shiftLeft], DIAGF_eq]
  exact trunc_pk 512 511 n _ (fun i hi => Nat.pow_lt_pow_right (by norm_num) (by omega)) (by norm_num) hn

theorem GRDn_eq (n : ℕ) (hn : n ≤ 511) : GRDn n = pk 512 (fun _ => 2 ^ (512 - 1)) n := by
  unfold GRDn
  rw [show Nat.shiftLeft (REPn n) 511 = REPn n <<< 511 from rfl, Nat.shiftLeft_eq, REPn_eq n hn,
    show (fun _ : ℕ => 2 ^ (512 - 1)) = (fun v : ℕ => 2 ^ 511 * (fun _ : ℕ => 1) v) by funext v; norm_num, pk_mul, mul_comm]

theorem LOWSn_eq (n : ℕ) (hn : n ≤ 511) : LOWSn n = pk 512 (fun _ => 2 ^ (512 - 1) - 1) n := by
  unfold LOWSn
  rw [show Nat.shiftLeft (REPn n) 511 = REPn n <<< 511 from rfl, Nat.shiftLeft_eq, REPn_eq n hn,
    show (fun _ : ℕ => 2 ^ (512 - 1) - 1) = (fun v : ℕ => (2 ^ 511 - 1) * (fun _ : ℕ => 1) v) by funext v; norm_num, pk_mul]
  show pk 512 (fun _ => 1) n * 2 ^ 511 - pk 512 (fun _ => 1) n = (2 ^ 511 - 1) * pk 512 (fun _ => 1) n
  rw [Nat.sub_mul, one_mul, mul_comm]

/-! ## The dictionary -/

/-- the label mask of dictionary entry `k` (entries in table layout `mask | cap << 511`) -/
def dslot (dt : ℕ → ℕ) (k : ℕ) : ℕ := Nat.land (dt k) M511

/-- the residual of dictionary position `k`: 1 below `n1`, 2 from `n1` on -/
def dres (n1 k : ℕ) : ℕ := Nat.succ (Nat.sub 1 (Nat.sub n1 k))

/-- the meaning of a checked dictionary -/
def DictSem (S last n1 : ℕ) (dt : ℕ → ℕ) (nd : ℕ) : Prop :=
  ∀ k, k < nd → ∀ A : Dec22, Below A S last →
    ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (dslot dt k).testBit l = true)).card ≤ dres n1 k

theorem dslot_lt (dt : ℕ → ℕ) (k : ℕ) : dslot dt k < 2 ^ 511 := land_M511_lt _ _ m511_lt

theorem dres_lt {n1 k : ℕ} (h : k < n1) : dres n1 k = 1 := by
  show (1 - (n1 - k)) + 1 = 1; omega
theorem dres_le {n1 k : ℕ} : dres n1 k ≤ 2 := by
  show (1 - (n1 - k)) + 1 ≤ 2; omega

/-! ## The node matrix -/

def mapD (dt : ℕ → ℕ) (ks : List ℕ) : List ℕ :=
  List.rec (motive := fun _ => List ℕ) [] (fun k _ ih => dslot dt k :: ih) ks

theorem mem_mapD {dt : ℕ → ℕ} {m : ℕ} {ks : List ℕ} (h : m ∈ mapD dt ks) : ∃ k ∈ ks, m = dslot dt k := by
  induction ks with
  | nil => cases h
  | cons a ks ih =>
    change m ∈ (dslot dt a :: mapD dt ks) at h
    rcases List.mem_cons.mp h with rfl | h
    · exact ⟨a, List.mem_cons_self .., rfl⟩
    · obtain ⟨k, hk, e⟩ := ih h
      exact ⟨k, List.mem_cons_of_mem _ hk, e⟩

/-- the meaning of the node matrix: no pair of labels of a decomposition below the node, above `last` -/
def AnodeSem (S last Anode : ℕ) : Prop :=
  ∀ A : Dec22, Below A S last → ∀ a b, last < a → a < 511 → last < b → b < 511 → a ≠ b → A.Has a → A.Has b →
    (dig 512 Anode a).testBit b = false

theorem frame_conf {S D N U d last : ℕ} (hF : FrameOK S D N U d) (hS : S >>> last = 1) (A : Dec22) (hA : Below A S last)
    (v w : ℕ) (hv : last < v) (hv5 : v < 511) (hw : last < w) (hw5 : w < 511) (hvw : v ≠ w) (hAv : A.Has v) (hAw : A.Has w) :
    (dig 512 N v).testBit w = false := by
  obtain ⟨_, _, _, _, hfr⟩ := hF
  have hlast := shr_one_lastOf hS
  have hbel : Below A S (lastOf S) := by rw [hlast]; exact hA
  have hSv : S.testBit v = false := by rw [shr_one_bit hS v (by omega)]; simp; omega
  have hSw : S.testBit w = false := by rw [shr_one_bit hS w (by omega)]; simp; omega
  rw [testBit_dig 512 N v w (by omega)]
  cases hb : N.testBit (512 * v + w) with
  | false => rfl
  | true =>
    exfalso
    have hb' : (N >>> (512 * v)).testBit w = true := by rw [Nat.testBit_shiftRight]; exact hb
    exact (hfr A hbel).2 v w hv5 hw5 hSv hSw hvw hb' hAv hAw

theorem anode_sound' {S D N U d last n1 nd Anode : ℕ} {dt : ℕ → ℕ} {nodeIdx : List ℕ} (hF : FrameOK S D N U d)
    (hS : S >>> last = 1) (hD : DictSem S last n1 dt nd) (hn1 : n1 ≤ nd) (hidx : ∀ k ∈ nodeIdx, k < n1)
    (h4 : K2.nodeAOK REPmF REPF DIAGF N Anode (mapD dt nodeIdx) = true) : AnodeSem S last Anode := by
  intro A hA a b ha ha5 hb hb5 hab hAa hAb
  set C := (Finset.range 511).filter (fun l => last < l ∧ A.Has l) with hC
  have hmem : ∀ x, x ∈ C ↔ x < 511 ∧ last < x ∧ A.Has x := by intro x; rw [hC, Finset.mem_filter, Finset.mem_range]
  refine K2.nodeA_sound REPmF REPF DIAGF N Anode (mapD dt nodeIdx) h4 REPF_eq REPmF_eq DIAGF_eq
    (fun m hm => by obtain ⟨k, _, rfl⟩ := mem_mapD hm; exact dslot_lt dt k) C
    (fun v hv => ((hmem v).mp hv).1) ?_ ?_ a ((hmem a).mpr ⟨ha5, ha, hAa⟩) b ((hmem b).mpr ⟨hb5, hb, hAb⟩) hab
  · intro v hv w hw hvw
    obtain ⟨hv5, hv1, hAv⟩ := (hmem v).mp hv
    obtain ⟨hw5, hw1, hAw⟩ := (hmem w).mp hw
    exact frame_conf hF hS A hA v w hv1 hv5 hw1 hw5 hvw hAv hAw
  · intro m hm
    obtain ⟨k, hk, rfl⟩ := mem_mapD hm
    have hk1 : k < n1 := hidx k hk
    have := hD k (by omega) A hA
    rw [dres_lt hk1] at this
    refine le_trans (le_of_eq ?_) this
    rw [hC, Finset.filter_filter]
    apply card_filter_congr; intro l _; tauto

/-! ## The dictionary as one packed literal, residuals by L1's block popcounts (`L1.blocks`, `L5.blocks_sound`) -/

/-- field `k` of 8-bit packed numbers -/
def byteAt (x k : ℕ) : ℕ := Nat.land (Nat.shiftRight x (Nat.shiftLeft k 3)) 255

/-- the dictionary function of a packed literal of 512-bit slots (`dslot (shr9 DICT) k` = slot `k`, labels 0..510) -/
def shr9 (DICT k : ℕ) : ℕ := Nat.shiftRight DICT (Nat.shiftLeft k 9)

/-- caps against the claimed counts: `cap_k ≤ E_k + r_k` for every position `k < nd` -/
def capsOK (CAPS E n1 nd : ℕ) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun k ih => Nat.ble (byteAt CAPS k) (Nat.add (byteAt E k) (dres n1 k)) && ih) nd

/-- the dictionary check: `E_k = |S ∩ slot_k|` for every slot (L1's `blocks`, 63 slots per block) and `cap_k ≤ E_k + r_k` -/
def dictB (S DICT CAPS E n1 nd nb : ℕ) : Bool :=
  Nat.ble nd (Nat.mul 63 nb) && L1.blocks DICT E (Nat.mul S L1.REP63) nb && capsOK CAPS E n1 nd

theorem byteAt_eq (x k : ℕ) : byteAt x k = E1S.dig 8 x k := by
  unfold byteAt E1S.dig
  rw [show Nat.land (Nat.shiftRight x (Nat.shiftLeft k 3)) 255 = (x >>> (k <<< 3)) &&& (2 ^ 8 - 1) from rfl,
    Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow, Nat.shiftLeft_eq, mul_comm k]

theorem capsOK_spec {CAPS E n1 : ℕ} : ∀ nd, capsOK CAPS E n1 nd = true → ∀ k, k < nd → byteAt CAPS k ≤ byteAt E k + dres n1 k := by
  intro nd
  induction nd with
  | zero => intro _ k hk; exact absurd hk (Nat.not_lt_zero k)
  | succ nd ih =>
    intro h k hk
    have h' : (Nat.ble (byteAt CAPS nd) (Nat.add (byteAt E nd) (dres n1 nd)) && capsOK CAPS E n1 nd) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hk with hk | rfl
    · exact ih h'.2 k hk
    · exact Nat.le_of_ble_eq_true h'.1

theorem testBit_dslot_shr9 (DICT k l : ℕ) (hl : l < 511) :
    (dslot (shr9 DICT) k).testBit l = (E1S.dig 512 DICT k).testBit l := by
  rw [E1S.testBit_dig 512 DICT k l (by omega)]
  unfold dslot shr9
  rw [show Nat.land (Nat.shiftRight DICT (Nat.shiftLeft k 9)) M511 = (DICT >>> (k <<< 9)) &&& M511 from rfl, Nat.testBit_and,
    m511_bit, Nat.testBit_shiftRight, Nat.shiftLeft_eq]
  simp only [hl, decide_true, Bool.and_true]
  congr 1; ring

theorem dictSemB_of {S last du n1 nd nb DICT CAPS E : ℕ} (hS : S >>> last = 1) (hS511 : S < 2 ^ 511)
    (hcard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = du) (hdu : du ≤ 127)
    (hrows : ∀ k, k < nd → RowOK (dslot (shr9 DICT) k) (byteAt CAPS k))
    (h : dictB S DICT CAPS E n1 nd nb = true) : DictSem S last n1 (shr9 DICT) nd := by
  intro k hk A hA
  unfold dictB at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  have hk63 : k < 63 * nb := lt_of_lt_of_le hk (Nat.le_of_ble_eq_true h1)
  have hpc : L5.pcnt 512 S ≤ 127 := by
    have e := L5.pcnt_and_eq S S hS511
    rw [Nat.and_self] at e
    rw [e]
    refine le_trans (le_of_eq ?_) hdu
    rw [← hcard]; apply card_filter_congr; intro l _; tauto
  have hb := L5.blocks_sound S hS511 hpc nb DICT E h2 k hk63
  rw [L5.pcnt_and_eq _ S hS511, ← byteAt_eq] at hb
  have hcnt : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ (dslot (shr9 DICT) k).testBit l = true)).card =
      byteAt E k := by
    rw [hb]; apply card_filter_congr; intro l hl
    rw [testBit_dslot_shr9 DICT k l (Finset.mem_range.mp hl)]; tauto
  have hrow := hrows k hk A
  have hinm : (inMask A (dslot (shr9 DICT) k)).card =
      ((Finset.range 511).filter (fun l => A.Has l ∧ (dslot (shr9 DICT) k).testBit l = true)).card := by
    unfold inMask; apply card_filter_congr; intro l _; tauto
  have hsp := below_split hS hA (fun l => (dslot (shr9 DICT) k).testBit l = true)
  have hcap := capsOK_spec nd h3 k hk
  omega

/-- the node part with the packed dictionary -/
def xnodePartB (S N du DICT CAPS E n1 nd nb Anode : ℕ) (nodeIdx : List ℕ) : Bool :=
  Nat.blt du 22 && Nat.ble n1 nd && dictB S DICT CAPS E n1 nd nb && K2.allLt n1 nodeIdx &&
  K2.nodeAOK REPmF REPF DIAGF N Anode (mapD (shr9 DICT) nodeIdx)

/-! ## The child -/

/-- the tree of a child certificate with demands `(X, d)` (`X = 0`: the degree test) and in-branch rows as dictionary positions -/
inductive XB where
  | leaf : List (ℕ × ℕ) → ℕ × ℕ → XB
  /-- steps, window index `v`, static slice `C2` of the pick `o + v` (L1's cap-2 table, or 0), in-branch rows (dictionary
  positions), left (in), right (out) -/
  | node : List (ℕ × ℕ) → ℕ → ℕ → List ℕ → XB → XB → XB

/-- the demand mask of `X`: the labels with odd pairing (`nperpL`), all labels for `X = 0` -/
def smask (X : ℕ) : ℕ := bif Nat.beq X 0 then M511 else nperpL X
def stepM (st : ℕ × ℕ) : ℕ × ℕ := (smask st.1, st.2)
def stepsM (sts : List (ℕ × ℕ)) : List (ℕ × ℕ) :=
  List.rec (motive := fun _ => List (ℕ × ℕ)) [] (fun st _ ih => stepM st :: ih) sts
/-- kill2's tree (`K2.XT`) of a bound tree: demand masks from `smask`, rows from the dictionary -/
def toXT (dt : ℕ → ℕ) (t : XB) : K2.XT :=
  XB.rec (motive := fun _ => K2.XT)
    (fun sts fin => K2.XT.leaf (stepsM sts) (stepM fin))
    (fun sts v C2 rows _ _ ihl ihr => K2.XT.node (stepsM sts) v C2 (mapD dt rows) ihl ihr) t

def bitAt (m u : ℕ) : ℕ := Nat.land (Nat.shiftRight m u) 1

/-- a valid demand of child `u` at the node (counters `U`, `du` prefix labels) -/
def stepOK (U du u : ℕ) (st : ℕ × ℕ) : Bool :=
  Nat.blt 0 st.2 && Nat.blt st.1 512 &&
  (bif Nat.beq st.1 0 then Nat.ble st.2 (Nat.sub 21 du)
   else Nat.ble (Nat.add (Nat.add st.2 (fld7 U st.1)) (bitAt (nperpL st.1) u)) (Nat.mul 3 (rkOf st.1)))

def stepsOK (U du u : ℕ) (sts : List (ℕ × ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun st _ ih => stepOK U du u st && ih) sts

def xbOK (U du u nd : ℕ) (t : XB) : Bool :=
  XB.rec (motive := fun _ => Bool)
    (fun sts fin => stepsOK U du u sts && stepOK U du u fin)
    (fun sts _ _ rows _ _ ihl ihr => stepsOK U du u sts && K2.allLt nd rows && ihl && ihr) t

/-- the in-branch slices of a tree are L1's cap-2 tables of their picks (or 0) -/
def XBC2 (o : ℕ) : XB → Prop
  | .leaf _ _ => True
  | .node _ v C2 _ l r => (C2 = 0 ∨ C2OK (o + v) C2) ∧ XBC2 o l ∧ XBC2 o r

/-- child rows: dictionary positions of residual 1, or through `u` -/
def crOK (dt : ℕ → ℕ) (n1 nd u : ℕ) (cr : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun k _ ih => Nat.blt k nd && (Nat.blt k n1 || Nat.beq (bitAt (dslot dt k) u) 1) && ih) cr
/-- the labels above `u` outside `D` and outside the conflict slot `N[u]` (the child check uses the node matrix for `N`) -/
def fcalc (D N u : ℕ) : ℕ :=
  Nat.land (Nat.land (abv u) (Nat.xor M511 (Nat.land M511 D)))
    (Nat.xor M511 (Nat.land M511 (Nat.shiftRight N (Nat.shiftLeft u 9))))

/-- the window constants `cs = (REP, REPm, GRD, LOWS, DIAG)` of `n` fields, as kill2's `childL` needs them -/
def CPn (n : ℕ) (cs : ℕ × ℕ × ℕ × ℕ × ℕ) : Prop :=
  cs.1 = pk 512 (fun _ => 1) n ∧ cs.2.1 = pk (512 - 1) (fun _ => 1) n ∧ cs.2.2.1 = pk 512 (fun _ => 2 ^ (512 - 1)) n ∧
    cs.2.2.2.1 = pk 512 (fun _ => 2 ^ (512 - 1) - 1) n ∧ cs.2.2.2.2 = pk 512 (fun i => 2 ^ i) n

/-- one kernel evaluation proves `CPn n cs` for literal constants (`KD.XConstN`) -/
def constBeq (n : ℕ) (cs : ℕ × ℕ × ℕ × ℕ × ℕ) : Bool :=
  Nat.beq cs.1 (REPn n) && Nat.beq cs.2.1 (REPmn n) && Nat.beq cs.2.2.1 (GRDn n) && Nat.beq cs.2.2.2.1 (LOWSn n) &&
    Nat.beq cs.2.2.2.2 (DIAGn n)

theorem cpn_of_beq {n : ℕ} {cs : ℕ × ℕ × ℕ × ℕ × ℕ} (hn : n ≤ 510) (h : constBeq n cs = true) : CPn n cs := by
  unfold constBeq at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩ := h
  exact ⟨(Nat.eq_of_beq_eq_true h1).trans (REPn_eq n (by omega)), (Nat.eq_of_beq_eq_true h2).trans (REPmn_eq n (by omega)),
    (Nat.eq_of_beq_eq_true h3).trans (GRDn_eq n (by omega)), (Nat.eq_of_beq_eq_true h4).trans (LOWSn_eq n (by omega)),
    (Nat.eq_of_beq_eq_true h5).trans (DIAGn_eq n (by omega))⟩

/-- **The child check** of child `u`: free set `Fu` (it must contain every label above `u` outside `D` and outside the node
matrix's slot `u`), child rows `cr`, tree `t`, the cap-2 table `C2u` of `u`, window constants `cs` -/
def xchild (D U du last n1 nd Anode : ℕ) (dt : ℕ → ℕ) (u Fu : ℕ) (cr : List ℕ) (t : XB) (C2u : ℕ)
    (cs : ℕ × ℕ × ℕ × ℕ × ℕ) : Bool :=
  Nat.blt last u && Nat.blt u 511 && Nat.beq (K2.andn (fcalc D Anode u) Fu) 0 &&
  crOK dt n1 nd u cr && xbOK U du u nd t &&
  K2.childL cs.2.1 cs.1 cs.2.2.1 cs.2.2.2.1 M511 cs.2.2.2.2 512 (Nat.shiftLeft 1 (Nat.sub 510 u)) (Nat.succ u) Anode C2u Fu
    (mapD dt cr) (toXT dt t)

theorem bitAt_eq (m u : ℕ) : bitAt m u = if m.testBit u then 1 else 0 := by
  unfold bitAt
  rw [show Nat.land (Nat.shiftRight m u) 1 = (m >>> u) &&& 1 from rfl, Nat.and_one_is_mod, Nat.testBit_eq_decide_div_mod_eq,
    Nat.shiftRight_eq_div_pow]
  rcases Nat.mod_two_eq_zero_or_one (m / 2 ^ u) with h | h <;> simp [h]

theorem bitAt_one {m u : ℕ} (h : Nat.beq (bitAt m u) 1 = true) : m.testBit u = true := by
  have := Nat.eq_of_beq_eq_true h
  rw [bitAt_eq] at this
  by_contra hc; simp [hc] at this

theorem crOK_mem {dt : ℕ → ℕ} {n1 nd u : ℕ} : ∀ {cr : List ℕ}, crOK dt n1 nd u cr = true →
    ∀ k ∈ cr, k < nd ∧ (k < n1 ∨ (dslot dt k).testBit u = true)
  | [], _ => fun _ hk => by cases hk
  | k :: ks, h => by
    have h' : (Nat.blt k nd && (Nat.blt k n1 || Nat.beq (bitAt (dslot dt k) u) 1) && crOK dt n1 nd u ks) = true := h
    simp only [Bool.and_eq_true, Bool.or_eq_true] at h'
    obtain ⟨⟨h1, h2⟩, h3⟩ := h'
    intro k' hk'
    rcases List.mem_cons.mp hk' with rfl | hk'
    · refine ⟨Nat.blt_eq.mp h1, ?_⟩
      rcases h2 with h2 | h2
      · exact Or.inl (Nat.blt_eq.mp h2)
      · exact Or.inr (bitAt_one h2)
    · exact crOK_mem h3 k' hk'

theorem stepsOK_mem {U du u : ℕ} : ∀ {sts : List (ℕ × ℕ)}, stepsOK U du u sts = true → ∀ st ∈ sts, stepOK U du u st = true
  | [], _ => fun _ h => by cases h
  | s :: ss, h => by
    have h' : (stepOK U du u s && stepsOK U du u ss) = true := h
    rw [Bool.and_eq_true] at h'
    intro st hst
    rcases List.mem_cons.mp hst with rfl | hst
    · exact h'.1
    · exact stepsOK_mem h'.2 st hst

theorem mem_stepsM {st : ℕ × ℕ} : ∀ {sts : List (ℕ × ℕ)}, st ∈ stepsM sts → ∃ s ∈ sts, st = stepM s
  | [], h => by cases h
  | s :: ss, h => by
    change st ∈ (stepM s :: stepsM ss) at h
    rcases List.mem_cons.mp h with rfl | h
    · exact ⟨s, List.mem_cons_self .., rfl⟩
    · obtain ⟨s', hs', e⟩ := mem_stepsM h
      exact ⟨s', List.mem_cons_of_mem _ hs', e⟩

/-- the tree's data are valid once every demand, row and slice is -/
theorem xb_valid (U du u nd : ℕ) (dt : ℕ → ℕ) (o : ℕ) (L : Finset ℕ)
    (hstep : ∀ st : ℕ × ℕ, stepOK U du u st = true → 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => (smask st.1).testBit a = true)).card)
    (hrow : ∀ k, k < nd → (L.filter (fun a => (dslot dt k).testBit a = true)).card ≤ 2)
    (hc2 : ∀ v C2, C2OK (o + v) C2 → o + v ∈ L → ∀ a ∈ L, ∀ b ∈ L, a ≠ o + v → b ≠ o + v → a ≠ b →
      (dig 512 C2 a).testBit b = false) :
    ∀ t : XB, XBC2 o t → xbOK U du u nd t = true → K2.XTValidL 512 o L (toXT dt t) := by
  have hsts : ∀ sts : List (ℕ × ℕ), stepsOK U du u sts = true →
      ∀ st ∈ stepsM sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card := by
    intro sts h st hst
    obtain ⟨s, hs, rfl⟩ := mem_stepsM hst
    exact hstep s (stepsOK_mem h s hs)
  intro t
  induction t with
  | leaf sts fin =>
    intro _ h
    have h' : (stepsOK U du u sts && stepOK U du u fin) = true := h
    rw [Bool.and_eq_true] at h'
    show K2.XTValidL 512 o L (K2.XT.leaf (stepsM sts) (stepM fin))
    simp only [K2.XTValidL]
    exact ⟨hsts sts h'.1, hstep fin h'.2⟩
  | node sts v C2 rows l r ihl ihr =>
    intro hT h
    obtain ⟨hC, hTl, hTr⟩ := hT
    have h' : (stepsOK U du u sts && K2.allLt nd rows && xbOK U du u nd l && xbOK U du u nd r) = true := h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨⟨h1, h3⟩, h4⟩, h5⟩ := h'
    show K2.XTValidL 512 o L (K2.XT.node (stepsM sts) v C2 (mapD dt rows) (toXT dt l) (toXT dt r))
    simp only [K2.XTValidL]
    refine ⟨hsts sts h1, ?_, ?_, ihl hTl h4, ihr hTr h5⟩
    · intro hv a ha b hb hav hbv hab
      rcases hC with rfl | hC
      · unfold dig; simp
      · exact hc2 v C2 hC hv a ha b hb hav hbv hab
    · intro m hm
      obtain ⟨k, hk, rfl⟩ := mem_mapD hm
      exact hrow k (K2.allLt_mem _ _ h3 k hk)

/-- **Soundness of the child check.** -/
theorem xchild_sound {S D N U du last n1 nd Anode : ℕ} {dt : ℕ → ℕ} {u Fu : ℕ} {cr : List ℕ} {t : XB} {C2u : ℕ}
    {cs : ℕ × ℕ × ℕ × ℕ × ℕ}
    (hF : FrameOK S D N U du) (hS : S >>> last = 1) (hD : DictSem S last n1 dt nd) (hn1 : n1 ≤ nd)
    (hA : AnodeSem S last Anode) (hC2u : C2OK u C2u) (hT : XBC2 (Nat.succ u) t) (hcs : CPn (Nat.sub 510 u) cs)
    (h : xchild D U du last n1 nd Anode dt u Fu cr t C2u cs = true) :
    ∀ A : Dec22, ¬ Continues A S last u := by
  intro A hcont
  have hlu : last < u := hcont.1
  have hu : u < 511 := hcont.2.1
  have hlast := shr_one_lastOf hS
  have hbelL : Below A S (lastOf S) := cont_below hS hcont
  have hbel : Below A S last := by rw [← hlast]; exact hbelL
  have hAu : A.Has u := cont_has hcont
  have hF' := hF
  obtain ⟨_, _, hcard, hU, hfr⟩ := hF'
  obtain ⟨hdead, _⟩ := hfr A hbelL
  unfold xchild at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨_, _⟩, hFc⟩, hcr⟩, hxb⟩, hch⟩ := h
  have hcrm := crOK_mem hcr
  set L := (Finset.range 511).filter (fun l => u < l ∧ A.Has l) with hLdef
  have hmemL : ∀ x, x ∈ L ↔ x < 511 ∧ u < x ∧ A.Has x := by intro x; rw [hLdef, Finset.mem_filter, Finset.mem_range]
  -- a dictionary slot through `u` meets `L` one label less than its residual
  have hslotL : ∀ k, k < nd → (L.filter (fun a => (dslot dt k).testBit a = true)).card +
      (if (dslot dt k).testBit u = true then 1 else 0) ≤ dres n1 k := by
    intro k hk
    have h0 := hD k hk A hbel
    refine le_trans (le_of_eq ?_) h0
    rw [show (Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (dslot dt k).testBit l = true) =
        (L.filter (fun a => (dslot dt k).testBit a = true)) ∪
          ((Finset.range 511).filter (fun l => l = u ∧ (dslot dt k).testBit l = true)) by
      ext l; simp only [Finset.mem_union, Finset.mem_filter, Finset.mem_range, hLdef]
      constructor
      · rintro ⟨hl, h1, h2, h3⟩
        by_cases hlu' : u < l
        · exact Or.inl ⟨⟨hl, hlu', h2⟩, h3⟩
        · have hle : l ≤ u := by omega
          have : l = u := by
            by_contra hne
            have := (cont_le hS hcont l hle).1 h2
            rcases this with h4 | h4
            · rw [shr_one_bit hS l (by omega)] at h4; simp at h4; omega
            · exact hne h4
          exact Or.inr ⟨hl, this, h3⟩
      · rintro (⟨⟨hl, h1, h2⟩, h3⟩ | ⟨hl, rfl, h3⟩)
        · exact ⟨hl, by omega, h2, h3⟩
        · exact ⟨hl, hlu, hAu, h3⟩]
    have hcu : ((Finset.range 511).filter (fun l => l = u ∧ (dslot dt k).testBit l = true)).card =
        if (dslot dt k).testBit u = true then 1 else 0 := by
      by_cases hb : (dslot dt k).testBit u = true
      · rw [if_pos hb, Finset.card_eq_one]; refine ⟨u, ?_⟩; ext l
        simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_singleton]
        constructor
        · rintro ⟨_, h1, _⟩; exact h1
        · rintro rfl; exact ⟨hu, rfl, hb⟩
      · rw [if_neg hb, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨rfl, h3⟩; exact hb h3
    have hdis : Disjoint (L.filter (fun a => (dslot dt k).testBit a = true))
        ((Finset.range 511).filter (fun l => l = u ∧ (dslot dt k).testBit l = true)) := by
      rw [Finset.disjoint_left]; intro l h1 h2
      rw [Finset.mem_filter, hmemL] at h1
      rw [Finset.mem_filter] at h2
      omega
    rw [Finset.card_union_of_disjoint hdis, hcu]
  -- the free set contains `L`
  have hFu : ∀ a ∈ L, Fu.testBit a = true := by
    intro a ha
    obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
    have hzero := Nat.eq_of_beq_eq_true hFc
    have hb := congrArg (fun x => Nat.testBit x a) hzero
    simp only [K2.testBit_andn, Nat.zero_testBit] at hb
    have hfc : (fcalc D Anode u).testBit a = true := by
      unfold fcalc
      rw [show Nat.land (Nat.land (abv u) (Nat.xor M511 (Nat.land M511 D)))
          (Nat.xor M511 (Nat.land M511 (Nat.shiftRight Anode (Nat.shiftLeft u 9)))) =
          (abv u &&& (M511 ^^^ (M511 &&& D))) &&& (M511 ^^^ (M511 &&& (Anode >>> (u <<< 9)))) from rfl]
      rw [Nat.testBit_and, Nat.testBit_and, Nat.testBit_xor, Nat.testBit_xor, Nat.testBit_and, Nat.testBit_and, testBit_abv,
        m511_bit, Nat.testBit_shiftRight]
      have hDa : D.testBit a = false := by
        cases hd : D.testBit a
        · rfl
        · exact absurd hAa (hdead a (by rw [hlast]; omega) ha5 hd)
      have hNa : Anode.testBit ((u <<< 9) + a) = false := by
        have := hA A hbel u a hlu hu (by omega) ha5 (by omega) hAu hAa
        rw [testBit_dig 512 Anode u a (by omega)] at this
        rw [Nat.shiftLeft_eq, show u * 2 ^ 9 = 512 * u by ring]; exact this
      rw [hDa, hNa]; simp [ha5, hua]
    rw [hfc] at hb
    cases hfu : Fu.testBit a
    · rw [hfu] at hb; simp at hb
    · rfl
  -- the demands
  have hdu : du + 1 ≤ 22 := by
    have h1 := cont_split hS hcont (fun _ => True)
    simp only [and_true, if_true] at h1
    rw [has_card A, hcard] at h1
    omega
  have hstep : ∀ st : ℕ × ℕ, stepOK U du u st = true →
      1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => (smask st.1).testBit a = true)).card := by
    intro st hst
    unfold stepOK at hst
    simp only [Bool.and_eq_true] at hst
    obtain ⟨⟨h1, h2⟩, h3⟩ := hst
    have hd1 := Nat.blt_eq.mp h1
    have hX5 := Nat.blt_eq.mp h2
    refine ⟨hd1, ?_⟩
    cases hX : Nat.beq st.1 0
    · rw [hX] at h3; simp only [cond_false] at h3
      have h3' := Nat.le_of_ble_eq_true h3
      have hX0 : st.1 ≠ 0 := Nat.ne_of_beq_eq_false hX
      have hsm : smask st.1 = nperpL st.1 := by unfold smask; rw [hX]; rfl
      rw [hsm]
      have hfl : fld7 U st.1 = hits S st.1 := by rw [hU]; exact fld7_packU S st.1 du hX5 hcard (by omega)
      have hbit : bitAt (nperpL st.1) u = if par (vecL u &&& st.1) = true then 1 else 0 := by
        rw [bitAt_eq, nperpL_bit st.1 u hX5 hu]
      have hdef := deficit_lab A st.1 (Nat.pos_of_ne_zero hX0) hX5
      have hsp := cont_split hS hcont (fun l => par (vecL l &&& st.1) = true)
      have hLX : (L.filter (fun a => (nperpL st.1).testBit a = true)).card =
          ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ par (vecL l &&& st.1) = true)).card := by
        rw [hLdef, Finset.filter_filter]; apply card_filter_congr; intro l hl
        rw [nperpL_bit st.1 l hX5 (Finset.mem_range.mp hl)]; tauto
      have hh : hits S st.1 = ((Finset.range 511).filter (fun l => S.testBit l = true ∧ par (vecL l &&& st.1) = true)).card := rfl
      simp only [Nat.add_eq, Nat.mul_eq] at h3'
      rw [hfl, hbit] at h3'
      rw [hLX]
      split_ifs at h3' hsp with hq <;> omega
    · rw [hX] at h3; simp only [cond_true] at h3
      have h3' := Nat.le_of_ble_eq_true h3
      have hX0 : st.1 = 0 := Nat.eq_of_beq_eq_true hX
      have hsm : smask st.1 = M511 := by unfold smask; rw [hX]; rfl
      rw [hsm]
      have hLc : L.card = 22 - (du + 1) := by rw [hLdef]; exact above_card hS hcont du hcard
      have : L.filter (fun a => M511.testBit a = true) = L := by
        apply Finset.filter_true_of_mem; intro a ha; rw [m511_bit]; simp [((hmemL a).mp ha).1]
      rw [this, hLc]
      have h3'' : st.2 ≤ 21 - du := h3'
      omega
  -- assemble kill2's hypotheses
  obtain ⟨hcR, hcRm, hcG, hcL, hcD⟩ := hcs
  refine K2.childL_sound_label cs.2.1 cs.1 cs.2.2.1 cs.2.2.2.1
    M511 cs.2.2.2.2 512 (Nat.shiftLeft 1 (Nat.sub 510 u)) (Nat.sub 510 u) (Nat.succ u) Anode C2u Fu
    (mapD dt cr) (toXT dt t)
    (by simp only [Nat.sub_eq]; omega) hcR hcRm hcG hcL (by rw [m511_eq]) hcD
    (by rw [show Nat.shiftLeft 1 (Nat.sub 510 u) = 1 <<< (Nat.sub 510 u) from rfl, Nat.one_shiftLeft])
    (by simp only [Nat.sub_eq]; omega) hch L ?_ ?_ ?_ ?_ ?_
  · intro a ha
    obtain ⟨ha5, hua, _⟩ := (hmemL a).mp ha
    exact ⟨by omega, by simp only [Nat.sub_eq]; omega, hFu a ha⟩
  · intro a ha b hb hab
    obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
    obtain ⟨hb5, hub, hAb⟩ := (hmemL b).mp hb
    exact hA A hbel a b (by omega) ha5 (by omega) hb5 hab hAa hAb
  · intro a ha b hb hab
    obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
    obtain ⟨hb5, hub, hAb⟩ := (hmemL b).mp hb
    rw [testBit_dig 512 C2u a b (by omega)]
    cases hx : C2u.testBit (512 * a + b) with
    | false => rfl
    | true =>
      exfalso
      have hx' : (C2u >>> (512 * a)).testBit b = true := by rw [Nat.testBit_shiftRight]; exact hx
      obtain ⟨m, hm, hmu, hma, hmb⟩ := hC2u a b ha5 hb5 (by omega) (Ne.symm hab) hx'
      have hsub : ({u, a, b} : Finset ℕ) ⊆ inMask A m := by
        intro x hx2
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx2
        unfold inMask; rw [Finset.mem_filter, Finset.mem_range]
        rcases hx2 with rfl | rfl | rfl
        · exact ⟨hu, hmu, hAu⟩
        · exact ⟨ha5, hma, hAa⟩
        · exact ⟨hb5, hmb, hAb⟩
      have h3 : ({u, a, b} : Finset ℕ).card = 3 := by
        rw [Finset.card_insert_of_notMem (by simp; omega), Finset.card_pair hab]
      have := Finset.card_le_card hsub
      have := hm A
      omega
  · intro m hm
    obtain ⟨k, hk, rfl⟩ := mem_mapD hm
    obtain ⟨hknd, hk1⟩ := hcrm k hk
    have := hslotL k hknd
    rcases hk1 with hk1 | hk1
    · have hr : dres n1 k = 1 := dres_lt (by omega)
      rw [hr] at this; split_ifs at this <;> omega
    · rw [if_pos hk1] at this
      have : dres n1 k ≤ 2 := dres_le
      omega
  · refine xb_valid U du u nd dt (Nat.succ u) L hstep ?_ ?_ t hT hxb
    · intro k hk
      have := hslotL k hk
      have : dres n1 k ≤ 2 := dres_le
      omega
    · intro v C2 hC2 hv a ha b hb hav hbv hab
      obtain ⟨hv5, huv, hAv⟩ := (hmemL _).mp hv
      obtain ⟨ha5, hua, hAa⟩ := (hmemL a).mp ha
      obtain ⟨hb5, hub, hAb⟩ := (hmemL b).mp hb
      rw [testBit_dig 512 _ a b (by omega)]
      cases hx : C2.testBit (512 * a + b) with
      | false => rfl
      | true =>
        exfalso
        have hx' : (C2 >>> (512 * a)).testBit b = true := by rw [Nat.testBit_shiftRight]; exact hx
        obtain ⟨m, hm, hmp, hma, hmb⟩ := hC2 a b ha5 hb5 hbv (Ne.symm hab) hx'
        have hsub : ({Nat.succ u + v, a, b} : Finset ℕ) ⊆ inMask A m := by
          intro x hx2
          simp only [Finset.mem_insert, Finset.mem_singleton] at hx2
          unfold inMask; rw [Finset.mem_filter, Finset.mem_range]
          rcases hx2 with rfl | rfl | rfl
          · exact ⟨hv5, hmp, hAv⟩
          · exact ⟨ha5, hma, hAa⟩
          · exact ⟨hb5, hmb, hAb⟩
        have h3 : ({Nat.succ u + v, a, b} : Finset ℕ).card = 3 := by
          rw [Finset.card_insert_of_notMem (by simp; omega), Finset.card_pair hab]
        have := Finset.card_le_card hsub
        have := hm A
        omega

/-! ## The node record -/

/-- a child certificate: `(u, F_u, child rows, tree, C2u, window constants)` -/
abbrev XKid := ℕ × ℕ × List ℕ × XB × ℕ × (ℕ × ℕ × ℕ × ℕ × ℕ)

/-- the per-child facts the composer supplies from existing theorems: L1's cap-2 table of `u`, those of the in-branch picks,
the window constants of `510 - u` fields (`KD.XConstN`) -/
def KidOK (c : XKid) : Prop :=
  C2OK c.1 c.2.2.2.2.1 ∧ XBC2 (Nat.succ c.1) c.2.2.2.1 ∧ CPn (Nat.sub 510 c.1) c.2.2.2.2.2

def xkidsOK (D U du last n1 nd Anode : ℕ) (dt : ℕ → ℕ) (ks : List XKid) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun c _ ih => xchild D U du last n1 nd Anode dt c.1 c.2.1 c.2.2.1 c.2.2.2.1 c.2.2.2.2.1 c.2.2.2.2.2 && ih) ks

theorem xkidsOK_mem {D U du last n1 nd Anode : ℕ} {dt : ℕ → ℕ} : ∀ {ks : List XKid},
    xkidsOK D U du last n1 nd Anode dt ks = true →
      ∀ c ∈ ks, xchild D U du last n1 nd Anode dt c.1 c.2.1 c.2.2.1 c.2.2.2.1 c.2.2.2.2.1 c.2.2.2.2.2 = true
  | [], _ => fun _ h => by cases h
  | c :: cs, h => by
    have h' : (xchild D U du last n1 nd Anode dt c.1 c.2.1 c.2.2.1 c.2.2.2.1 c.2.2.2.2.1 c.2.2.2.2.2 &&
      xkidsOK D U du last n1 nd Anode dt cs) = true := h
    rw [Bool.and_eq_true] at h'
    intro c' hc'
    rcases List.mem_cons.mp hc' with rfl | hc'
    · exact h'.1
    · exact xkidsOK_mem h'.2 c' hc'

/-- **The bound node record of a node's bulk-peel X kills**: packed dictionary `DICT` (512-bit slots), caps `CAPS` and claimed
counts `E` (8-bit fields), `n1` residual-1 positions first, `nd` entries in `nb` blocks of 63; node rows `nodeIdx`; node matrix
`Anode`; the children -/
def xnodeOK (S D N U du last DICT CAPS E n1 nd nb Anode : ℕ) (nodeIdx : List ℕ) (ks : List XKid) : Bool :=
  xnodePartB S N du DICT CAPS E n1 nd nb Anode nodeIdx && xkidsOK D U du last n1 nd Anode (shr9 DICT) ks

/-- **Soundness of the bound node record**: every listed child is dead (the class `hXP` of `R3RT.Spec.ComposedNodeSpec`).
`hF`: the node's L1 frame (`node5`'s contract); `hrows`: the dictionary's rows (table facts); `hkids`: per child, existing
theorems (L1's cap-2 tables, `KD.XConstN`). -/
theorem xnode_sound {S D N U du last DICT CAPS E n1 nd nb Anode : ℕ} {nodeIdx : List ℕ} {ks : List XKid}
    (hF : FrameOK S D N U du) (hS : S >>> last = 1)
    (hrows : ∀ k, k < nd → RowOK (dslot (shr9 DICT) k) (byteAt CAPS k))
    (hkids : ∀ c ∈ ks, KidOK c)
    (h : xnodeOK S D N U du last DICT CAPS E n1 nd nb Anode nodeIdx ks = true) :
    ∀ c ∈ ks, ∀ A : Dec22, ¬ Continues A S last c.1 := by
  unfold xnodeOK at h
  rw [Bool.and_eq_true] at h
  obtain ⟨hp, hk⟩ := h
  unfold xnodePartB at hp
  simp only [Bool.and_eq_true] at hp
  obtain ⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩ := hp
  have hdu : du < 22 := Nat.blt_eq.mp h0
  have hD := dictSemB_of (last := last) hS hF.2.1 hF.2.2.1 (by omega) hrows h2
  have hAn := anode_sound' hF hS hD (Nat.le_of_ble_eq_true h1) (K2.allLt_mem _ _ h3) h4
  intro c hc
  obtain ⟨hc1, hc2, hc3⟩ := hkids c hc
  exact xchild_sound hF hS hD (Nat.le_of_ble_eq_true h1) hAn hc1 hc2 hc3 (xkidsOK_mem hk c hc)

end KD
