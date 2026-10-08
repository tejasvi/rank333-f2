module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import RT.LabM
public import RT.K3eD_Data
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # Stored label masks of the row table `K3eD` (511 bits, prof7 `--rord 123` labels; label order md5 7032e3f4b1969cd3ea1975ae7d13d79e)

source r22/lean/leaf2/rt/kept3eD_lab.bin (md5 c2624c174a573a8334132808166253b2) -/
#rttablew RT.K3eDL "data/lean/c2624c174a573a8334132808166253b2/kept3eD_lab.bin" 64 520
namespace RT.K3eDL
open RT
def LAB_MD5 : String := "c2624c174a573a8334132808166253b2"
def LABORDER_MD5 : String := "7032e3f4b1969cd3ea1975ae7d13d79e"
noncomputable def labOK (a m : Nat) : Bool := Nat.rec (motive := fun _ => Bool) true (fun i b => b && entry (a + i) == (labMain (RT.K3eD.entry (a + i)) ||| (eCap (RT.K3eD.entry (a + i)) <<< 511))) m
theorem labOK_join (a m k : Nat) (h1 : labOK a m = true) (h2 : labOK (a + m) k = true) : labOK a (m + k) = true := by
  induction k with
  | zero => exact h1
  | succ k ih =>
    have h2' : (labOK (a + m) k && entry (a + m + k) == (labMain (RT.K3eD.entry (a + m + k)) ||| (eCap (RT.K3eD.entry (a + m + k)) <<< 511))) = true := h2
    rw [Bool.and_eq_true] at h2'
    show (labOK a (m + k) && entry (a + (m + k)) == (labMain (RT.K3eD.entry (a + (m + k))) ||| (eCap (RT.K3eD.entry (a + (m + k))) <<< 511))) = true
    rw [Bool.and_eq_true, ← Nat.add_assoc]; exact ⟨ih h2'.1, h2'.2⟩
theorem labOK_spec (a m : Nat) (h : labOK a m = true) : ∀ i < m, entry (a + i) = (labMain (RT.K3eD.entry (a + i)) ||| (eCap (RT.K3eD.entry (a + i)) <<< 511)) := by
  induction m with
  | zero => intro i hi; exact absurd hi (Nat.not_lt_zero i)
  | succ m ih =>
    intro i hi
    have h' : (labOK a m && entry (a + m) == (labMain (RT.K3eD.entry (a + m)) ||| (eCap (RT.K3eD.entry (a + m)) <<< 511))) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | heq
    · exact ih h'.1 i hlt
    · rw [heq]; exact beq_iff_eq.mp h'.2
end RT.K3eDL
