module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD_OK0
public import RT.K3eD_OK1
public import RT.K3eD_OK2
public import RT.K3eD_OK3
public import RT.K3eD_OK4
public import RT.K3eD_OK5
public import RT.K3eD_OK6
public import RT.K3eD_OK7
public import RT.K3eD_OK8
public import RT.K3eD_OK9
public import RT.K3eD_OK10
public import RT.K3eD_OK11
public import RT.K3eD_OK12
public import RT.K3eD_OK13
public import RT.K3eD_OK14
public import RT.K3eD_OK15
public import RT.K3eD_OK16
public import RT.K3eD_OK17
public import RT.K3eD_OK18
public import RT.K3eD_OK19
public import RT.K3eD_OK20
public import RT.K3eD_OK21
public import RT.K3eD_OK22
public import RT.K3eD_OK23
public import RT.K3eD_OK24
public import RT.K3eD_OK25
public import RT.K3eD_OK26
public import RT.K3eD_OK27
public import RT.K3eD_OK28
public import RT.K3eD_OK29
public import RT.K3eD_OK30
public import RT.K3eD_OK31
public import RT.K3eD_OK32
public import RT.K3eD_OK33
public import RT.K3eD_OK34
public import RT.K3eD_OK35
public import RT.K3eD_OK36
public import RT.K3eD_OK37
public import RT.K3eD_OK38
public import RT.K3eD_OK39
public import RT.K3eD_OK40
public import RT.K3eD_OK41
public import RT.K3eD_OK42
public import RT.K3eD_OK43
public import RT.K3eD_OK44
public import RT.K3eD_OK45
public import RT.K3eD_OK46
public import RT.K3eD_OK47
public import RT.K3eD_OK48
public import RT.K3eD_OK49
public import RT.K3eD_OK50
public import RT.K3eD_OK51
public import RT.K3eD_OK52
public import RT.K3eD_OK53
public import RT.K3eD_OK54
public import RT.K3eD_OK55
public import RT.K3eD_OK56
public import RT.K3eD_OK57
public import RT.K3eD_OK58
public import RT.K3eD_OK59
public import RT.K3eD_OK60
public import RT.K3eD_OK61
public import RT.K3eD_OK62
public import RT.K3eD_OK63
@[expose] public section
set_option maxRecDepth 100000
/-! # Verified row table `K3eD`: every entry passes, every row is valid (for R distinct nonzero first factors) -/
namespace RT.K3eD
open RT
theorem allOK_all : allOK 0 N = true := by
  rw [N_eq]
  have h0 : allOK 0 59392 = true := okM0
  have h1 : allOK 0 118784 = true := allOK_join 0 59392 59392 h0 okM1
  have h2 : allOK 0 178176 = true := allOK_join 0 118784 59392 h1 okM2
  have h3 : allOK 0 237568 = true := allOK_join 0 178176 59392 h2 okM3
  have h4 : allOK 0 296960 = true := allOK_join 0 237568 59392 h3 okM4
  have h5 : allOK 0 356352 = true := allOK_join 0 296960 59392 h4 okM5
  have h6 : allOK 0 415744 = true := allOK_join 0 356352 59392 h5 okM6
  have h7 : allOK 0 475136 = true := allOK_join 0 415744 59392 h6 okM7
  have h8 : allOK 0 534528 = true := allOK_join 0 475136 59392 h7 okM8
  have h9 : allOK 0 593920 = true := allOK_join 0 534528 59392 h8 okM9
  have h10 : allOK 0 653312 = true := allOK_join 0 593920 59392 h9 okM10
  have h11 : allOK 0 712704 = true := allOK_join 0 653312 59392 h10 okM11
  have h12 : allOK 0 772096 = true := allOK_join 0 712704 59392 h11 okM12
  have h13 : allOK 0 831488 = true := allOK_join 0 772096 59392 h12 okM13
  have h14 : allOK 0 890880 = true := allOK_join 0 831488 59392 h13 okM14
  have h15 : allOK 0 950272 = true := allOK_join 0 890880 59392 h14 okM15
  have h16 : allOK 0 1009664 = true := allOK_join 0 950272 59392 h15 okM16
  have h17 : allOK 0 1069056 = true := allOK_join 0 1009664 59392 h16 okM17
  have h18 : allOK 0 1128448 = true := allOK_join 0 1069056 59392 h17 okM18
  have h19 : allOK 0 1187840 = true := allOK_join 0 1128448 59392 h18 okM19
  have h20 : allOK 0 1247232 = true := allOK_join 0 1187840 59392 h19 okM20
  have h21 : allOK 0 1306624 = true := allOK_join 0 1247232 59392 h20 okM21
  have h22 : allOK 0 1366016 = true := allOK_join 0 1306624 59392 h21 okM22
  have h23 : allOK 0 1425408 = true := allOK_join 0 1366016 59392 h22 okM23
  have h24 : allOK 0 1484800 = true := allOK_join 0 1425408 59392 h23 okM24
  have h25 : allOK 0 1544192 = true := allOK_join 0 1484800 59392 h24 okM25
  have h26 : allOK 0 1603584 = true := allOK_join 0 1544192 59392 h25 okM26
  have h27 : allOK 0 1662976 = true := allOK_join 0 1603584 59392 h26 okM27
  have h28 : allOK 0 1722368 = true := allOK_join 0 1662976 59392 h27 okM28
  have h29 : allOK 0 1781760 = true := allOK_join 0 1722368 59392 h28 okM29
  have h30 : allOK 0 1841152 = true := allOK_join 0 1781760 59392 h29 okM30
  have h31 : allOK 0 1900544 = true := allOK_join 0 1841152 59392 h30 okM31
  have h32 : allOK 0 1959936 = true := allOK_join 0 1900544 59392 h31 okM32
  have h33 : allOK 0 2019328 = true := allOK_join 0 1959936 59392 h32 okM33
  have h34 : allOK 0 2078720 = true := allOK_join 0 2019328 59392 h33 okM34
  have h35 : allOK 0 2138112 = true := allOK_join 0 2078720 59392 h34 okM35
  have h36 : allOK 0 2197504 = true := allOK_join 0 2138112 59392 h35 okM36
  have h37 : allOK 0 2256896 = true := allOK_join 0 2197504 59392 h36 okM37
  have h38 : allOK 0 2316288 = true := allOK_join 0 2256896 59392 h37 okM38
  have h39 : allOK 0 2375680 = true := allOK_join 0 2316288 59392 h38 okM39
  have h40 : allOK 0 2435072 = true := allOK_join 0 2375680 59392 h39 okM40
  have h41 : allOK 0 2494464 = true := allOK_join 0 2435072 59392 h40 okM41
  have h42 : allOK 0 2553856 = true := allOK_join 0 2494464 59392 h41 okM42
  have h43 : allOK 0 2613248 = true := allOK_join 0 2553856 59392 h42 okM43
  have h44 : allOK 0 2672640 = true := allOK_join 0 2613248 59392 h43 okM44
  have h45 : allOK 0 2732032 = true := allOK_join 0 2672640 59392 h44 okM45
  have h46 : allOK 0 2791424 = true := allOK_join 0 2732032 59392 h45 okM46
  have h47 : allOK 0 2850816 = true := allOK_join 0 2791424 59392 h46 okM47
  have h48 : allOK 0 2910208 = true := allOK_join 0 2850816 59392 h47 okM48
  have h49 : allOK 0 2969600 = true := allOK_join 0 2910208 59392 h48 okM49
  have h50 : allOK 0 3028992 = true := allOK_join 0 2969600 59392 h49 okM50
  have h51 : allOK 0 3088384 = true := allOK_join 0 3028992 59392 h50 okM51
  have h52 : allOK 0 3147776 = true := allOK_join 0 3088384 59392 h51 okM52
  have h53 : allOK 0 3207168 = true := allOK_join 0 3147776 59392 h52 okM53
  have h54 : allOK 0 3266560 = true := allOK_join 0 3207168 59392 h53 okM54
  have h55 : allOK 0 3325952 = true := allOK_join 0 3266560 59392 h54 okM55
  have h56 : allOK 0 3385344 = true := allOK_join 0 3325952 59392 h55 okM56
  have h57 : allOK 0 3444736 = true := allOK_join 0 3385344 59392 h56 okM57
  have h58 : allOK 0 3504128 = true := allOK_join 0 3444736 59392 h57 okM58
  have h59 : allOK 0 3563520 = true := allOK_join 0 3504128 59392 h58 okM59
  have h60 : allOK 0 3622912 = true := allOK_join 0 3563520 59392 h59 okM60
  have h61 : allOK 0 3682304 = true := allOK_join 0 3622912 59392 h60 okM61
  have h62 : allOK 0 3741696 = true := allOK_join 0 3682304 59392 h61 okM62
  have h63 : allOK 0 3781613 = true := allOK_join 0 3741696 39917 h62 okM63
  exact h63
theorem entry_ok (i : Nat) (hi : i < N) : entryOK R K3eD_Cls.CL (entry i) = true := by
  have := allOK_spec 0 N allOK_all i hi
  rwa [Nat.zero_add] at this
/-- **the kept rows are valid**: given the class facts for the table classes (`c < 496`) and for the closure classes
(`c ≥ 496`), both for decompositions with `R` distinct nonzero first factors (`Fact` gives `FactN` by `fact_factN`) -/
theorem row_factN (hclsN : ∀ c, c < 496 → FactN R (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c))
    (hclos : ∀ c, 496 ≤ c → FactN R (kM K3eD_Cls.CL c) (cLB K3eD_Cls.CL c)) (i : Nat) (hi : i < N) :
    FactN R (dualM (entry i)) (R - eCap (entry i)) := by
  apply entry_soundN R K3eD_Cls.CL (entry i) _ (entry_ok i hi)
  by_cases h : eCls (entry i) < 496
  · exact hclsN _ h
  · exact hclos _ (by omega)
end RT.K3eD
