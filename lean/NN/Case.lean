module
public import NN.Stat
public import NN.Cache
public import NN.DataII
public import R22D.L1Tab
public import R22D.L1Hyp
public import R22D.NStat
public import R22D.K3eD479L
public import R22D.T321
public import R22D.K3eDL321
public import R22N.Bin7
public import R22N.Glue
/-! # NN.Case: the per-case item checks on the module-land statics, and their batch form (core only; NOT in the library)

* statics: `statII` (L1's cap-2 tables, C3eDII's cap-1 table `NN.CONF1II`, L1's hyperplane tables, `--rord 123` codes) and
  `stat321` (`L1.T321`'s tables, `--rord 321` codes), with RootSound's rank table and C3's invertible matrices;
* item checks `nII`, `nI`, `nI13` (`itemR3` at `cfgII` / `cfgI` / `cfgI13`, row interfaces `R22D.rowEII` / `R22D.rowE321`, item
  data in `R22N.Bin7`), item predicates `CheckedII`, `CheckedI`, `CheckedI13`;
* batch checks `batchII`, `batchI`, `batchI13` (one `IStat` per batch, every key paired with its data; length mismatch = false)
  with `batch*_sound : batch* ks ss = true → R22N.KeysOK Checked* ks` (the chunk driver `R22N.Drv`'s `#nchunk`).  They run
  `NN.batchCached`: every distinct row chunk of the batch is fetched from the interpreted R22D table once, and the item checks
  read rows from that cache (`rowII_entryOf` / `row321_entryOf`: the R22D interfaces are `entryOf` of their chunk functions).

The refinement of `Checked*` to certified segments is `NNP.Ref` (`refII`, `refI`, `refI13`). -/
@[expose] public section
namespace NN

/-- case (II) statics -/
def statII : IStat :=
  mkIStat R22D.c2tN NN.CONF1II R22D.hN R22D.sufN (vecOf R22D.R3RT.VECL) (rk3Of R22D.RootCheck.RKT) (glOf R22D.C3.GLM)

/-- case (I) / (I13) statics (`--rord 321`) -/
def stat321 : IStat :=
  mkIStat R22D.T321.c2tN R22D.T321.CONF1T R22D.T321.hN R22D.T321.sufN (vecOf R22D.RT.O321.VECL) (rk3Of R22D.RootCheck.RKT)
    (glOf R22D.C3.GLM)

set_option exponentiation.threshold 1024 in
/-- an R22D table entry: bits `520 (i % 64) ..` of chunk `i / 64` -/
theorem K3eDL_entry (i : Nat) : R22D.K3eDL.entry i = (R22D.K3eDL.chunk (i / 64) >>> (520 * (i % 64))) % 2 ^ 520 := by
  unfold R22D.K3eDL.entry; exact Nat.and_two_pow_sub_one_eq_mod (R22D.K3eDL.chunk (i / 64) >>> (520 * (i % 64))) 520

set_option exponentiation.threshold 1024 in
theorem K3eD479L_entry (i : Nat) :
    R22D.K3eD479L.entry i = (R22D.K3eD479L.chunk (i / 64) >>> (520 * (i % 64))) % 2 ^ 520 := by
  unfold R22D.K3eD479L.entry; exact Nat.and_two_pow_sub_one_eq_mod (R22D.K3eD479L.chunk (i / 64) >>> (520 * (i % 64))) 520

set_option exponentiation.threshold 1024 in
theorem K3eDL321_entry (i : Nat) :
    R22D.K3eDL321.entry i = (R22D.K3eDL321.chunk (i / 64) >>> (520 * (i % 64))) % 2 ^ 520 := by
  unfold R22D.K3eDL321.entry; exact Nat.and_two_pow_sub_one_eq_mod (R22D.K3eDL321.chunk (i / 64) >>> (520 * (i % 64))) 520

theorem blt_false {i n : Nat} (h : ¬ i < n) : Nat.blt i n = false := by
  cases hb : Nat.blt i n
  · rfl
  · exact absurd (Nat.blt_eq.mp hb) h

/-- `R22D.rowEII` reads 520-bit entries of 64-entry chunks: K3eDL below `3781613`, then the 441 class-479 rows -/
theorem rowII_entryOf : entryOf R22D.K3eDL.chunk R22D.K3eD479L.chunk 3781613 441 = R22D.rowEII := by
  funext i
  unfold entryOf R22D.rowEII
  by_cases h1 : i < 3781613
  · rw [if_pos h1, Nat.blt_eq.mpr h1, K3eDL_entry]
  · rw [if_neg h1, blt_false h1]
    by_cases h2 : i < 3781613 + 441
    · rw [if_pos h2, Nat.blt_eq.mpr (show i < 3782054 by omega), K3eD479L_entry]
    · rw [if_neg h2, blt_false (show ¬ i < 3782054 by omega)]

/-- `R22D.rowE321` reads 520-bit entries of 64-entry chunks of K3eDL321 below `3781613`, 0 beyond -/
theorem row321_entryOf : entryOf R22D.K3eDL321.chunk (fun _ => 0) 3781613 0 = R22D.rowE321 := by
  funext i
  unfold entryOf R22D.rowE321
  by_cases h1 : i < 3781613
  · rw [if_pos h1, Nat.blt_eq.mpr h1, K3eDL321_entry]
  · rw [if_neg h1, blt_false h1, if_neg (by omega)]

/-! ## Case (II) -/

/-- case (II)'s row tables as chunk limbs, built at most once per process (only if a dead job root needs them) -/
def limbsII : Thunk (Array (Array UInt64)) := Thunk.mk fun _ => chunkLimbs R22D.K3eDL.chunk R22D.K3eD479L.chunk 3781613 441
/-- the rows full at a prefix, case (II)'s tables -/
def scanII (S0 : Array UInt64) : Array Nat := scanLimbs limbsII.get 3781613 441 S0
def nII (k : Nat) (s : String) : Bool := itemR3 statII R22D.rowEII scanII cfgII (deadR3 statII cfgII) k (R22N.Bin7.decode s)
def CheckedII (k : Nat) : Prop := ∃ s, nII k s = true
def batchII (ks : List Nat) (ss : List String) : Bool :=
  batchCached statII R22D.K3eDL.chunk R22D.K3eD479L.chunk 3781613 441 scanII cfgII ks ss
theorem batchII_sound (ks : List Nat) (ss : List String) (h : batchII ks ss = true) : R22N.KeysOK CheckedII ks :=
  batchCached_sound statII _ _ _ _ scanII R22D.rowEII rowII_entryOf cfgII ks ss h

/-! ## Case (I) -/

/-- the `--rord 321` row table as chunk limbs, built at most once per process -/
def limbs321 : Thunk (Array (Array UInt64)) := Thunk.mk fun _ => chunkLimbs R22D.K3eDL321.chunk (fun _ => 0) 3781613 0
/-- the rows full at a prefix, the `--rord 321` table -/
def scan321 (S0 : Array UInt64) : Array Nat := scanLimbs limbs321.get 3781613 0 S0
def nI (k : Nat) (s : String) : Bool := itemR3 stat321 R22D.rowE321 scan321 cfgI (deadR3 stat321 cfgI) k (R22N.Bin7.decode s)
def CheckedI (k : Nat) : Prop := ∃ s, nI k s = true
def batchI (ks : List Nat) (ss : List String) : Bool :=
  batchCached stat321 R22D.K3eDL321.chunk (fun _ => 0) 3781613 0 scan321 cfgI ks ss
theorem batchI_sound (ks : List Nat) (ss : List String) (h : batchI ks ss = true) : R22N.KeysOK CheckedI ks :=
  batchCached_sound stat321 _ _ _ _ scan321 R22D.rowE321 row321_entryOf cfgI ks ss h

/-! ## Case (I13) -/

def nI13 (k : Nat) (s : String) : Bool := itemR3 stat321 R22D.rowE321 scan321 cfgI13 (deadR3 stat321 cfgI13) k (R22N.Bin7.decode s)
def CheckedI13 (k : Nat) : Prop := ∃ s, nI13 k s = true
def batchI13 (ks : List Nat) (ss : List String) : Bool :=
  batchCached stat321 R22D.K3eDL321.chunk (fun _ => 0) 3781613 0 scan321 cfgI13 ks ss
theorem batchI13_sound (ks : List Nat) (ss : List String) (h : batchI13 ks ss = true) : R22N.KeysOK CheckedI13 ks :=
  batchCached_sound stat321 _ _ _ _ scan321 R22D.rowE321 row321_entryOf cfgI13 ks ss h

end NN
