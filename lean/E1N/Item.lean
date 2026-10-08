module
public import E1N.Job
public import R22N.Glue
/-! # E1N.Item: E1-family items and chunk batches (core only; infra form (B), PROOF_OBJECT.md R2-R4)

An **item** is one job: a chain of blocks from a start state, whose frontier records are glued to later blocks of the chain or
to external children (other items).  Its **key** is certificate-free: the start key and the external children's start keys.
* key fields: `[0, 192)` the start key `S` (the mode-0 header of the first block, bits `[0, 14 + lb d)`); `[192, 208)` the number
  `m` of external children; `[208 + 192 j, 400 + 192 j)` (`j < m`) child `j`'s start key.  A root chain has `S = 0`.
* `item D k s`: the job `s` (`R22N.Bin7`) is accepted from `keyS k` with external children `keyExt k` (`E1N.jobOK`).
* `batchL D ks ss`: every item of a chunk (`#nchunk` shape: keys as a `List Nat`, data as a `List String`).
* `batchL_sound`: `batchL D ks ss = true → R22N.KeysOK (Checked D) ks`.
Semantics (non-module, `R/Item.lean`): `Checked D k → (∀ c ∈ keyExt k, JobOK C sl UB c) → JobOK C sl UB (keyS k)`, the `step` of
`R22N.covG_sound` with `root := keyS`, `kids := keyExt`; and `JobOK C sl UB 0` gives the IP's E1 conclusion. -/
@[expose] public section
namespace E1N

/-- the start key of an item key -/
def keyS (k : Nat) : Nat := k % 2 ^ 192

/-- the number of external children of an item key -/
def keyM (k : Nat) : Nat := k / 2 ^ 192 % 2 ^ 16

/-- `m` consecutive 192-bit fields of `r`, low first -/
def keyExtGo (r : Nat) : Nat → List Nat
  | 0 => []
  | m + 1 => r % 2 ^ 192 :: keyExtGo (r / 2 ^ 192) m

/-- the external children's start keys of an item key -/
def keyExt (k : Nat) : List Nat := keyExtGo (k / 2 ^ 208) (keyM k)

/-- one item: the job `s` (`Bin7`) from start `keyS k`, glued to the external children `keyExt k` -/
def item (D : IPD) (k : Nat) (s : String) : Bool := jobOK D (keyS k) (keyExt k).toArray s

/-- an item key was checked (the chunk statement's predicate) -/
def Checked (D : IPD) (k : Nat) : Prop := ∃ s, item D k s = true

/-- the items of a chunk -/
def batchL (D : IPD) : List Nat → List String → Bool
  | [], [] => true
  | k :: ks, s :: ss => item D k s && batchL D ks ss
  | _, _ => false

theorem batchL_sound (D : IPD) : ∀ (ks : List Nat) (ss : List String), batchL D ks ss = true → R22N.KeysOK (Checked D) ks
  | [], [], _ => trivial
  | k :: ks, s :: ss, h => by
    simp only [batchL, Bool.and_eq_true] at h
    exact ⟨⟨s, h.1⟩, batchL_sound D ks ss h.2⟩
  | [], _ :: _, h => nomatch h
  | _ :: _, [], h => nomatch h

end E1N

/-! ## Items with wider start keys (mode-1 starts and children)

A job may also start in mode 1 (a delegated literal: its header carries the budgets), and its external children may be
mode-1 starts glued by `glue`.  Such headers have up to `6 + lb + 31 lb + 3 nl` bits (611 for E1G/E1, 1027 for E1P), so these
items use start-key fields of `W` bits (`W = 640` for E1G/E1, `1088` for E1P):
`[0, W)` the start key, `[W, W + 16)` the child count `m`, then `m × [W]` the children's start keys. -/
namespace E1N

/-- the start key of a `W`-bit item key -/
def keySW (W k : Nat) : Nat := k % 2 ^ W

/-- the number of external children of a `W`-bit item key -/
def keyMW (W k : Nat) : Nat := k / 2 ^ W % 2 ^ 16

/-- `m` consecutive `W`-bit fields of `r`, low first -/
def keyExtGoW (W r : Nat) : Nat → List Nat
  | 0 => []
  | m + 1 => r % 2 ^ W :: keyExtGoW W (r / 2 ^ W) m

/-- the external children's start keys of a `W`-bit item key -/
def keyExtW (W k : Nat) : List Nat := keyExtGoW W (k / 2 ^ (W + 16)) (keyMW W k)

/-- one item with `W`-bit start keys -/
def itemW (D : IPD) (W k : Nat) (s : String) : Bool := jobOK D (keySW W k) (keyExtW W k).toArray s

/-- a `W`-bit item key was checked -/
def CheckedW (D : IPD) (W k : Nat) : Prop := ∃ s, itemW D W k s = true

/-- the items of a chunk, `W`-bit keys -/
def batchLW (D : IPD) (W : Nat) : List Nat → List String → Bool
  | [], [] => true
  | k :: ks, s :: ss => itemW D W k s && batchLW D W ks ss
  | _, _ => false

theorem batchLW_sound (D : IPD) (W : Nat) : ∀ (ks : List Nat) (ss : List String), batchLW D W ks ss = true →
    R22N.KeysOK (CheckedW D W) ks
  | [], [], _ => trivial
  | k :: ks, s :: ss, h => by
    simp only [batchLW, Bool.and_eq_true] at h
    exact ⟨⟨s, h.1⟩, batchLW_sound D W ks ss h.2⟩
  | [], _ :: _, h => nomatch h
  | _ :: _, [], h => nomatch h

end E1N
