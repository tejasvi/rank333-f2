module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD_LabOK0
public import RT.K3eD_LabOK1
public import RT.K3eD_LabOK2
public import RT.K3eD_LabOK3
public import RT.K3eD_LabOK4
public import RT.K3eD_LabOK5
public import RT.K3eD_LabOK6
public import RT.K3eD_LabOK7
public import RT.K3eD_LabOK8
public import RT.K3eD_LabOK9
public import RT.K3eD_LabOK10
public import RT.K3eD_LabOK11
public import RT.K3eD_LabOK12
public import RT.K3eD_LabOK13
public import RT.K3eD_LabOK14
public import RT.K3eD_LabOK15
public import RT.K3eD_LabOK16
public import RT.K3eD_LabOK17
public import RT.K3eD_LabOK18
public import RT.K3eD_LabOK19
public import RT.K3eD_LabOK20
public import RT.K3eD_LabOK21
public import RT.K3eD_LabOK22
public import RT.K3eD_LabOK23
public import RT.K3eD_LabOK24
public import RT.K3eD_LabOK25
public import RT.K3eD_LabOK26
public import RT.K3eD_LabOK27
public import RT.K3eD_LabOK28
public import RT.K3eD_LabOK29
public import RT.K3eD_LabOK30
public import RT.K3eD_LabOK31
public import RT.K3eD_LabOK32
public import RT.K3eD_LabOK33
public import RT.K3eD_LabOK34
public import RT.K3eD_LabOK35
public import RT.K3eD_LabOK36
public import RT.K3eD_LabOK37
public import RT.K3eD_LabOK38
public import RT.K3eD_LabOK39
public import RT.K3eD_LabOK40
public import RT.K3eD_LabOK41
public import RT.K3eD_LabOK42
public import RT.K3eD_LabOK43
public import RT.K3eD_LabOK44
public import RT.K3eD_LabOK45
public import RT.K3eD_LabOK46
public import RT.K3eD_LabOK47
public import RT.K3eD_LabOK48
public import RT.K3eD_LabOK49
public import RT.K3eD_LabOK50
public import RT.K3eD_LabOK51
public import RT.K3eD_LabOK52
public import RT.K3eD_LabOK53
public import RT.K3eD_LabOK54
public import RT.K3eD_LabOK55
public import RT.K3eD_LabOK56
public import RT.K3eD_LabOK57
public import RT.K3eD_LabOK58
public import RT.K3eD_LabOK59
public import RT.K3eD_LabOK60
public import RT.K3eD_LabOK61
public import RT.K3eD_LabOK62
public import RT.K3eD_LabOK63
@[expose] public section
set_option maxRecDepth 100000
/-! # Stored label masks of `K3eD`: `labMask_spec` -/
namespace RT.K3eDL
open RT
theorem labOK_all : labOK 0 3781613 = true := by
  have h0 : labOK 0 59392 = true := okM0
  have h1 : labOK 0 118784 = true := labOK_join 0 59392 59392 h0 okM1
  have h2 : labOK 0 178176 = true := labOK_join 0 118784 59392 h1 okM2
  have h3 : labOK 0 237568 = true := labOK_join 0 178176 59392 h2 okM3
  have h4 : labOK 0 296960 = true := labOK_join 0 237568 59392 h3 okM4
  have h5 : labOK 0 356352 = true := labOK_join 0 296960 59392 h4 okM5
  have h6 : labOK 0 415744 = true := labOK_join 0 356352 59392 h5 okM6
  have h7 : labOK 0 475136 = true := labOK_join 0 415744 59392 h6 okM7
  have h8 : labOK 0 534528 = true := labOK_join 0 475136 59392 h7 okM8
  have h9 : labOK 0 593920 = true := labOK_join 0 534528 59392 h8 okM9
  have h10 : labOK 0 653312 = true := labOK_join 0 593920 59392 h9 okM10
  have h11 : labOK 0 712704 = true := labOK_join 0 653312 59392 h10 okM11
  have h12 : labOK 0 772096 = true := labOK_join 0 712704 59392 h11 okM12
  have h13 : labOK 0 831488 = true := labOK_join 0 772096 59392 h12 okM13
  have h14 : labOK 0 890880 = true := labOK_join 0 831488 59392 h13 okM14
  have h15 : labOK 0 950272 = true := labOK_join 0 890880 59392 h14 okM15
  have h16 : labOK 0 1009664 = true := labOK_join 0 950272 59392 h15 okM16
  have h17 : labOK 0 1069056 = true := labOK_join 0 1009664 59392 h16 okM17
  have h18 : labOK 0 1128448 = true := labOK_join 0 1069056 59392 h17 okM18
  have h19 : labOK 0 1187840 = true := labOK_join 0 1128448 59392 h18 okM19
  have h20 : labOK 0 1247232 = true := labOK_join 0 1187840 59392 h19 okM20
  have h21 : labOK 0 1306624 = true := labOK_join 0 1247232 59392 h20 okM21
  have h22 : labOK 0 1366016 = true := labOK_join 0 1306624 59392 h21 okM22
  have h23 : labOK 0 1425408 = true := labOK_join 0 1366016 59392 h22 okM23
  have h24 : labOK 0 1484800 = true := labOK_join 0 1425408 59392 h23 okM24
  have h25 : labOK 0 1544192 = true := labOK_join 0 1484800 59392 h24 okM25
  have h26 : labOK 0 1603584 = true := labOK_join 0 1544192 59392 h25 okM26
  have h27 : labOK 0 1662976 = true := labOK_join 0 1603584 59392 h26 okM27
  have h28 : labOK 0 1722368 = true := labOK_join 0 1662976 59392 h27 okM28
  have h29 : labOK 0 1781760 = true := labOK_join 0 1722368 59392 h28 okM29
  have h30 : labOK 0 1841152 = true := labOK_join 0 1781760 59392 h29 okM30
  have h31 : labOK 0 1900544 = true := labOK_join 0 1841152 59392 h30 okM31
  have h32 : labOK 0 1959936 = true := labOK_join 0 1900544 59392 h31 okM32
  have h33 : labOK 0 2019328 = true := labOK_join 0 1959936 59392 h32 okM33
  have h34 : labOK 0 2078720 = true := labOK_join 0 2019328 59392 h33 okM34
  have h35 : labOK 0 2138112 = true := labOK_join 0 2078720 59392 h34 okM35
  have h36 : labOK 0 2197504 = true := labOK_join 0 2138112 59392 h35 okM36
  have h37 : labOK 0 2256896 = true := labOK_join 0 2197504 59392 h36 okM37
  have h38 : labOK 0 2316288 = true := labOK_join 0 2256896 59392 h37 okM38
  have h39 : labOK 0 2375680 = true := labOK_join 0 2316288 59392 h38 okM39
  have h40 : labOK 0 2435072 = true := labOK_join 0 2375680 59392 h39 okM40
  have h41 : labOK 0 2494464 = true := labOK_join 0 2435072 59392 h40 okM41
  have h42 : labOK 0 2553856 = true := labOK_join 0 2494464 59392 h41 okM42
  have h43 : labOK 0 2613248 = true := labOK_join 0 2553856 59392 h42 okM43
  have h44 : labOK 0 2672640 = true := labOK_join 0 2613248 59392 h43 okM44
  have h45 : labOK 0 2732032 = true := labOK_join 0 2672640 59392 h44 okM45
  have h46 : labOK 0 2791424 = true := labOK_join 0 2732032 59392 h45 okM46
  have h47 : labOK 0 2850816 = true := labOK_join 0 2791424 59392 h46 okM47
  have h48 : labOK 0 2910208 = true := labOK_join 0 2850816 59392 h47 okM48
  have h49 : labOK 0 2969600 = true := labOK_join 0 2910208 59392 h48 okM49
  have h50 : labOK 0 3028992 = true := labOK_join 0 2969600 59392 h49 okM50
  have h51 : labOK 0 3088384 = true := labOK_join 0 3028992 59392 h50 okM51
  have h52 : labOK 0 3147776 = true := labOK_join 0 3088384 59392 h51 okM52
  have h53 : labOK 0 3207168 = true := labOK_join 0 3147776 59392 h52 okM53
  have h54 : labOK 0 3266560 = true := labOK_join 0 3207168 59392 h53 okM54
  have h55 : labOK 0 3325952 = true := labOK_join 0 3266560 59392 h54 okM55
  have h56 : labOK 0 3385344 = true := labOK_join 0 3325952 59392 h55 okM56
  have h57 : labOK 0 3444736 = true := labOK_join 0 3385344 59392 h56 okM57
  have h58 : labOK 0 3504128 = true := labOK_join 0 3444736 59392 h57 okM58
  have h59 : labOK 0 3563520 = true := labOK_join 0 3504128 59392 h58 okM59
  have h60 : labOK 0 3622912 = true := labOK_join 0 3563520 59392 h59 okM60
  have h61 : labOK 0 3682304 = true := labOK_join 0 3622912 59392 h60 okM61
  have h62 : labOK 0 3741696 = true := labOK_join 0 3682304 59392 h61 okM62
  have h63 : labOK 0 3781613 = true := labOK_join 0 3741696 39917 h62 okM63
  exact h63
/-- the stored label mask of row `i`: bit `l < 511` is bit `vecL l` (the point of label `l`) of the row's point mask -/
theorem labMask_spec (i : Nat) (hi : i < 3781613) (l : Nat) (hl : l < 511) :
    (entry i).testBit l = (dualM (RT.K3eD.entry i)).testBit (vecL l) := by
  have h := labOK_spec 0 3781613 labOK_all i hi
  rw [Nat.zero_add] at h
  rw [h, Nat.testBit_or, Nat.testBit_shiftLeft, labMain_testBit _ _ hl]
  simp [show ¬ (511 ≤ l) by omega]
/-- the stored cap of row `i` (bits 511 ..) is the row's cap -/
theorem capL_spec (i : Nat) (hi : i < 3781613) : (entry i) >>> 511 = eCap (RT.K3eD.entry i) := by
  have h := labOK_spec 0 3781613 labOK_all i hi
  rw [Nat.zero_add] at h
  rw [h, Nat.shiftRight_or_distrib, Nat.shiftLeft_shiftRight]
  have hl : labMain (RT.K3eD.entry i) >>> 511 = 0 := by
    apply Nat.shiftRight_eq_zero
    exact labMain_lt _
  rw [hl, Nat.zero_or]
end RT.K3eDL
