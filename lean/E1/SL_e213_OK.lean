module
public import R22Port.U_d41d8cd98f00
public import E1.SL_e213
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.SL_e213
open E1
theorem ok_0 : slOK 0 65 = true := by decide +kernel
theorem okAll : slOK 0 65 = true := by
  have h0 : slOK 0 65 = true := ok_0
  exact h0
theorem z_65 : slZero 65 2048 = true := by decide +kernel
theorem z_2113 : slZero 2113 2048 = true := by decide +kernel
theorem z_4161 : slZero 4161 2048 = true := by decide +kernel
theorem z_6209 : slZero 6209 2048 = true := by decide +kernel
theorem z_8257 : slZero 8257 2048 = true := by decide +kernel
theorem z_10305 : slZero 10305 2048 = true := by decide +kernel
theorem z_12353 : slZero 12353 2048 = true := by decide +kernel
theorem z_14401 : slZero 14401 2048 = true := by decide +kernel
theorem z_16449 : slZero 16449 2048 = true := by decide +kernel
theorem z_18497 : slZero 18497 2048 = true := by decide +kernel
theorem z_20545 : slZero 20545 2048 = true := by decide +kernel
theorem z_22593 : slZero 22593 2048 = true := by decide +kernel
theorem z_24641 : slZero 24641 2048 = true := by decide +kernel
theorem z_26689 : slZero 26689 2048 = true := by decide +kernel
theorem z_28737 : slZero 28737 2048 = true := by decide +kernel
theorem z_30785 : slZero 30785 1983 = true := by decide +kernel
theorem zAll : slZero 65 32703 = true := by
  have h0 : slZero 65 2048 = true := z_65
  have h1 : slZero 65 4096 = true := slZero_join 65 2048 2048 h0 z_2113
  have h2 : slZero 65 6144 = true := slZero_join 65 4096 2048 h1 z_4161
  have h3 : slZero 65 8192 = true := slZero_join 65 6144 2048 h2 z_6209
  have h4 : slZero 65 10240 = true := slZero_join 65 8192 2048 h3 z_8257
  have h5 : slZero 65 12288 = true := slZero_join 65 10240 2048 h4 z_10305
  have h6 : slZero 65 14336 = true := slZero_join 65 12288 2048 h5 z_12353
  have h7 : slZero 65 16384 = true := slZero_join 65 14336 2048 h6 z_14401
  have h8 : slZero 65 18432 = true := slZero_join 65 16384 2048 h7 z_16449
  have h9 : slZero 65 20480 = true := slZero_join 65 18432 2048 h8 z_18497
  have h10 : slZero 65 22528 = true := slZero_join 65 20480 2048 h9 z_20545
  have h11 : slZero 65 24576 = true := slZero_join 65 22528 2048 h10 z_22593
  have h12 : slZero 65 26624 = true := slZero_join 65 24576 2048 h11 z_24641
  have h13 : slZero 65 28672 = true := slZero_join 65 26624 2048 h12 z_26689
  have h14 : slZero 65 30720 = true := slZero_join 65 28672 2048 h13 z_28737
  have h15 : slZero 65 32703 = true := slZero_join 65 30720 1983 h14 z_30785
  exact h15
/-- every slot below `N` is the slot of the verified row-table entry, whose dual basis lies in `E^⊥` -/
theorem sl_spec (i : Nat) (hi : i < 65) : entry i = slot E1.IP_e213.LB E1.IP_e213.LBR (RT.Tab_e213.entry i) ∧ dualIn E1.IP_e213.DOM (RT.Tab_e213.entry i) = true := by
  have h := slOK_spec 0 65 okAll i hi
  rw [Nat.zero_add, Bool.and_eq_true] at h
  exact ⟨Nat.eq_of_beq_eq_true h.1, h.2⟩
/-- slots in `[N, 2^15)` are zero -/
theorem sl_zero (i : Nat) (h1 : 65 ≤ i) (h2 : i < 32768) : entry i = 0 := by
  have h := slZero_spec 65 32703 zAll (i - 65) (by omega)
  rwa [show 65 + (i - 65) = i by omega] at h
end E1.SL_e213
