module
public import R22Port.U_d41d8cd98f00
public import L5.Pk5
public import L1.Check4
/-! # The L1 checker's constants as packings (each identity is one multiplication, checked by the kernel) -/
@[expose] public section
namespace L5
open E1S

theorem K55_eq : L1.K55 = pk 8 (fun _ => 0x55) 32768 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem K33_eq : L1.K33 = pk 8 (fun _ => 0x33) 32768 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem K0F_eq : L1.K0F = pk 8 (fun _ => 0x0F) 32768 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem K00FF_eq : L1.K00FF = pk 16 (fun _ => 255) 16384 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem SUM64_eq : L1.SUM64 = pk 8 (fun _ => 1) 64 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem SUM32_eq : L1.SUM32 = pk 16 (fun _ => 1) 32 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem LB_eq : L1.LB = pk 512 (fun _ => 255) 512 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem REP63_eq : L1.REP63 = pk 512 (fun _ => 1) 63 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem GATH_eq : L1.GATH = pk 504 (fun _ => 1) 63 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem F31_eq : L1.F31 = pk 512 (fun _ => 65535 * 2 ^ 496) 512 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem REPF31_eq : L1.REPF31 = pk 512 (fun _ => 2 ^ 496) 512 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem GUARD_eq : L1.GUARD = pk 512 (fun _ => 2 ^ 511) 512 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem REPALL_eq : L1.REPALL = pk 512 (fun _ => 1) 512 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem SP513_eq : L1.SP513 = pk 513 (fun _ => 1) 512 := pk_const_of_mul _ _ _ _ (by norm_num) (by decide +kernel)
theorem MBLK_eq : L1.MBLK = 2 ^ (512 * 63) - 1 := by decide +kernel
theorem EBLK_eq : L1.EBLK = 2 ^ 504 - 1 := by decide +kernel
theorem M512_eq : L1.M512 = 2 ^ 512 - 1 := by decide +kernel
theorem M511_eq : L1.M511 = 2 ^ 511 - 1 := by decide +kernel

end L5
