module
public import R22Port.U_916eba87bd44
public import Mathlib
public import KD.XComp
public import NNP.Core
public import XTP.W8
public import XT.Check
/-! # XTP.Views: the decoded X part as `KD.xpartC`'s arguments

For a parsed record `x : XT.XRec`, the views are the values `KD.batchX` sees in its node tuple:
`nrowsV`, `aggsV c2t mk` (label, cap-2 table `c2tV c2t x`, `B`, positions), `XLV`, `HPV`, `DEFPV`, `JV`, `kidsV c2t`
(label, `F_u`, child-row positions, tree `XCV`, cap-2 table of `u`, window constants of `510 - u`).
`B` per layout: 0 the literal's slots, 2 the `bxOK` formula over the dictionary rows (layout 1 is not covered here). -/
@[expose] public section
namespace XTP
open XT

/-- the steps of a flattened array from index `i`: `(a[i], a[i+1]), (a[i+2], a[i+3]), ...` while both exist -/
def stepsFrom (a : Array ℕ) (i : ℕ) : List (ℕ × ℕ) :=
  if i + 1 < a.size then (a[i]!, a[i + 1]!) :: stepsFrom a (i + 2) else []
termination_by a.size - i

/-- the steps of a flattened array `[j0, d0, j1, d1, ...]` -/
def stepsV (a : Array ℕ) : List (ℕ × ℕ) := stepsFrom a 0

/-- the kernel's tree of a native tree -/
def XCV : XTN → KD.XC
  | .leaf sts fj fd => .leaf (stepsV sts) (fj, fd)
  | .node sts v k l r => .node (stepsV sts) v k (XCV l) (XCV r)
  | .cut => .cut

/-- the cap-2 table of label `x` (NN.Statics' view; 0 past the tables) -/
def c2tV (c2t : Array (Array UInt64)) (x : ℕ) : ℕ := NN.natL c2t[x]! 0 4096

/-- the Nat of `n` 512-bit slots -/
def slotsV (a : Array W8) : ℕ → ℕ
  | 0 => 0
  | n + 1 => slotsV a n + a[n]!.view * 2 ^ (512 * n)

/-- the Nat of `n` bytes -/
def bytesV (a : Array ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => bytesV a n + a[n]! * 2 ^ (8 * n)

/-- `K2.bxOK`'s formula for an aggregate `(x, c2t_x, rows)` -/
def bxF (x C2x : ℕ) (rows : List ℕ) : ℕ :=
  K2.clrD (Nat.lor (K2.addClV 0 KD.REPmF KD.REPF x rows) (K2.clrV C2x KD.REPF 512 x)) KD.DIAGF

/-- the aggregate's `B` in the record's layout -/
def aggBV (c2t : Array (Array UInt64)) (mk : ℕ → ℕ) (lay : ℕ) (a : XAgg) : ℕ :=
  if lay = 0 then slotsV a.B 512 else bxF a.x (c2tV c2t a.x) (R3RT.mapL mk a.ps.toList)

def nrowsV (x : XRec) : List ℕ := x.nrows.toList
def aggsV (c2t : Array (Array UInt64)) (mk : ℕ → ℕ) (x : XRec) : List KD.Agg :=
  x.aggs.toList.map fun a => (a.x, c2tV c2t a.x, aggBV c2t mk x.lay a, a.ps.toList)
def XLV (x : XRec) : List ℕ := x.XL.toList
/-- the label order's hyperplane masks as the native table `npW` holds them (`KD.NpOK O (npV npW)` is the caller's fact) -/
def npV (npW : Array W8) (X : ℕ) : ℕ := (npW[X]!).view
def HPV (x : XRec) : ℕ := slotsV x.HP x.XL.size
def DEFPV (x : XRec) : ℕ := bytesV x.DEF x.XL.size
def JV (x : XRec) : ℕ := x.XL.size

/-- the window constants of `n` slots (`KD.CPn` holds for them) -/
def consts (n : ℕ) : ℕ × ℕ × ℕ × ℕ × ℕ := (KD.REPn n, KD.REPmn n, KD.GRDn n, KD.LOWSn n, KD.DIAGn n)

def kidV (c2t : Array (Array UInt64)) (k : XKid) : KD.KidX :=
  (k.u, k.Fu.view, k.cr.toList, XCV k.t, c2tV c2t k.u, consts (Nat.sub 510 k.u))
def kidsV (c2t : Array (Array UInt64)) (x : XRec) : List KD.KidX := x.kids.toList.map (kidV c2t)

/-! ## Basic facts -/

theorem slotsV_lt (a : Array W8) : ∀ n, slotsV a n < 2 ^ (512 * n)
  | 0 => by simp [slotsV]
  | n + 1 => by
    rw [slotsV]
    have h1 := slotsV_lt a n
    have h2 := W8.view_lt a[n]!
    calc slotsV a n + a[n]!.view * 2 ^ (512 * n) < 2 ^ (512 * n) + a[n]!.view * 2 ^ (512 * n) := by omega
      _ = (a[n]!.view + 1) * 2 ^ (512 * n) := by ring
      _ ≤ 2 ^ 512 * 2 ^ (512 * n) := Nat.mul_le_mul_right _ (by omega)
      _ = 2 ^ (512 * (n + 1)) := by rw [← pow_add]; ring_nf

/-- bit `512 i + j` of a slot Nat is bit `j` of slot `i` -/
theorem testBit_slotsV (a : Array W8) : ∀ (n i j : ℕ), j < 512 →
    (slotsV a n).testBit (512 * i + j) = (decide (i < n) && a[i]!.view.testBit j)
  | 0, i, j, _ => by simp [slotsV]
  | n + 1, i, j, hj => by
    have e : slotsV a (n + 1) = 2 ^ (512 * n) * a[n]!.view + slotsV a n := by rw [slotsV]; ring
    rw [e, Nat.testBit_two_pow_mul_add _ (slotsV_lt a n)]
    by_cases hi : i < n
    · rw [if_pos (by omega), testBit_slotsV a n i j hj, decide_eq_true hi, decide_eq_true (by omega)]
    · rw [if_neg (by omega)]
      by_cases hin : i = n
      · subst hin; simp [show 512 * i + j - 512 * i = j by omega]
      · rw [decide_eq_false (by omega), Bool.false_and]
        apply Nat.testBit_lt_two_pow
        have := W8.view_lt a[n]!
        calc a[n]!.view < 2 ^ 512 := this
          _ ≤ 2 ^ (512 * i + j - 512 * n) := Nat.pow_le_pow_right (by norm_num) (by omega)

theorem bytesV_lt (a : Array ℕ) (h : ∀ i : ℕ, a[i]! < 256) : ∀ n, bytesV a n < 2 ^ (8 * n)
  | 0 => by simp [bytesV]
  | n + 1 => by
    rw [bytesV]
    have h1 := bytesV_lt a h n
    have h2 := h n
    calc bytesV a n + a[n]! * 2 ^ (8 * n) < 2 ^ (8 * n) + a[n]! * 2 ^ (8 * n) := by omega
      _ = (a[n]! + 1) * 2 ^ (8 * n) := by ring
      _ ≤ 2 ^ 8 * 2 ^ (8 * n) := Nat.mul_le_mul_right _ (by omega)
      _ = 2 ^ (8 * (n + 1)) := by rw [← pow_add]; ring_nf

end XTP
