module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import RT.SoundN
public import RT.K3eD479_Cls
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # Verified row table `K3eD479`: 441 entries (entry i = line i of the kept-row file)

kept kept479.txt md5 2549392f3f468a46dab98fe52d9d64eb

table data/tables/tab_C3eD479.bin md5 a4364c5ac2edfa8464fc687647caaa71

R 22

entries 441

classes 1

cap slack 0

bin md5 843162f6462afe5a60f5bf0a6e230183
-/
#rttable RT.K3eD479 "data/lean/843162f6462afe5a60f5bf0a6e230183/k479.bin" 256
namespace RT.K3eD479
open RT
/-- the source files (`#kept`, `#table` of the prof7R3 stream must match) -/
def KEPT_MD5 : String := "2549392f3f468a46dab98fe52d9d64eb"
def TABLE_MD5 : String := "a4364c5ac2edfa8464fc687647caaa71"
def BIN_MD5 : String := "843162f6462afe5a60f5bf0a6e230183"
def R : Nat := 22
theorem N_eq : N = 441 := rfl
noncomputable def allOK (a m : Nat) : Bool := Nat.rec (motive := fun _ => Bool) true (fun i b => b && entryOK R K3eD479_Cls.CL (entry (a + i))) m
theorem allOK_join (a m k : Nat) (h1 : allOK a m = true) (h2 : allOK (a + m) k = true) : allOK a (m + k) = true := by
  induction k with
  | zero => exact h1
  | succ k ih =>
    have h2' : (allOK (a + m) k && entryOK R K3eD479_Cls.CL (entry (a + m + k))) = true := h2
    rw [Bool.and_eq_true] at h2'
    show (allOK a (m + k) && entryOK R K3eD479_Cls.CL (entry (a + (m + k)))) = true
    rw [Bool.and_eq_true, ← Nat.add_assoc]; exact ⟨ih h2'.1, h2'.2⟩
theorem allOK_spec (a m : Nat) (h : allOK a m = true) : ∀ i < m, entryOK R K3eD479_Cls.CL (entry (a + i)) = true := by
  induction m with
  | zero => intro i hi; exact absurd hi (Nat.not_lt_zero i)
  | succ m ih =>
    intro i hi
    have h' : (allOK a m && entryOK R K3eD479_Cls.CL (entry (a + m))) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | heq
    · exact ih h'.1 i hlt
    · rw [heq]; exact h'.2
end RT.K3eD479
