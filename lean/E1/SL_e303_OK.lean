module
public import R22Port.U_d41d8cd98f00
public import E1.SL_e303
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.SL_e303
open E1
theorem ok_0 : slOK 0 372 = true := by decide +kernel
theorem okAll : slOK 0 372 = true := by
  have h0 : slOK 0 372 = true := ok_0
  exact h0
theorem z_372 : slZero 372 2048 = true := by decide +kernel
theorem z_2420 : slZero 2420 2048 = true := by decide +kernel
theorem z_4468 : slZero 4468 2048 = true := by decide +kernel
theorem z_6516 : slZero 6516 2048 = true := by decide +kernel
theorem z_8564 : slZero 8564 2048 = true := by decide +kernel
theorem z_10612 : slZero 10612 2048 = true := by decide +kernel
theorem z_12660 : slZero 12660 2048 = true := by decide +kernel
theorem z_14708 : slZero 14708 2048 = true := by decide +kernel
theorem z_16756 : slZero 16756 2048 = true := by decide +kernel
theorem z_18804 : slZero 18804 2048 = true := by decide +kernel
theorem z_20852 : slZero 20852 2048 = true := by decide +kernel
theorem z_22900 : slZero 22900 2048 = true := by decide +kernel
theorem z_24948 : slZero 24948 2048 = true := by decide +kernel
theorem z_26996 : slZero 26996 2048 = true := by decide +kernel
theorem z_29044 : slZero 29044 2048 = true := by decide +kernel
theorem z_31092 : slZero 31092 1676 = true := by decide +kernel
theorem zAll : slZero 372 32396 = true := by
  have h0 : slZero 372 2048 = true := z_372
  have h1 : slZero 372 4096 = true := slZero_join 372 2048 2048 h0 z_2420
  have h2 : slZero 372 6144 = true := slZero_join 372 4096 2048 h1 z_4468
  have h3 : slZero 372 8192 = true := slZero_join 372 6144 2048 h2 z_6516
  have h4 : slZero 372 10240 = true := slZero_join 372 8192 2048 h3 z_8564
  have h5 : slZero 372 12288 = true := slZero_join 372 10240 2048 h4 z_10612
  have h6 : slZero 372 14336 = true := slZero_join 372 12288 2048 h5 z_12660
  have h7 : slZero 372 16384 = true := slZero_join 372 14336 2048 h6 z_14708
  have h8 : slZero 372 18432 = true := slZero_join 372 16384 2048 h7 z_16756
  have h9 : slZero 372 20480 = true := slZero_join 372 18432 2048 h8 z_18804
  have h10 : slZero 372 22528 = true := slZero_join 372 20480 2048 h9 z_20852
  have h11 : slZero 372 24576 = true := slZero_join 372 22528 2048 h10 z_22900
  have h12 : slZero 372 26624 = true := slZero_join 372 24576 2048 h11 z_24948
  have h13 : slZero 372 28672 = true := slZero_join 372 26624 2048 h12 z_26996
  have h14 : slZero 372 30720 = true := slZero_join 372 28672 2048 h13 z_29044
  have h15 : slZero 372 32396 = true := slZero_join 372 30720 1676 h14 z_31092
  exact h15
/-- every slot below `N` is the slot of the verified row-table entry, whose dual basis lies in `E^⊥` -/
theorem sl_spec (i : Nat) (hi : i < 372) : entry i = slot E1.IP_e303.LB E1.IP_e303.LBR (RT.Tab_e303.entry i) ∧ dualIn E1.IP_e303.DOM (RT.Tab_e303.entry i) = true := by
  have h := slOK_spec 0 372 okAll i hi
  rw [Nat.zero_add, Bool.and_eq_true] at h
  exact ⟨Nat.eq_of_beq_eq_true h.1, h.2⟩
/-- slots in `[N, 2^15)` are zero -/
theorem sl_zero (i : Nat) (h1 : 372 ≤ i) (h2 : i < 32768) : entry i = 0 := by
  have h := slZero_spec 372 32396 zAll (i - 372) (by omega)
  rwa [show 372 + (i - 372) = i by omega] at h
end E1.SL_e303
