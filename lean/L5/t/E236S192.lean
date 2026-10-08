module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S192_C0
public import L5.t.E236S192_C1
public import L5.t.E236S192_C2
public import L5.t.E236S192_C3
public import L5.t.E236S192_C4
public import L5.t.E236S192_C5
public import L5.t.E236S192_C6
public import L5.t.E236S192_C7
public import L5.t.E236S192_C8
public import L5.t.E236S192_C9
public import L5.t.E236S192_C10
public import L5.t.E236S192_C11
public import L5.t.E236S192_C12
public import L5.t.E236S192_C13
public import L5.t.E236S192_C14
public import L5.t.E236S192_C15
public import L5.t.E236S192_C16
public import L5.t.E236S192_C17
public import L5.t.E236S192_C18
public import L5.t.E236S192_C19
public import L5.t.E236S192_C20
public import L5.t.E236S192_C21
public import L5.t.E236S192_C22
public import L5.t.E236S192_C23
public import L5.t.E236S192_C24
public import L5.t.E236S192_C25
public import L5.t.E236S192_C26
public import L5.t.E236S192_C27
public import L5.t.E236S192_C28
public import L5.t.E236S192_C29
public import L5.t.E236S192_C30
public import L5.t.E236S192_C31
public import L5.t.E236S192_C32
public import L5.t.E236S192_C33
public import L5.t.E236S192_C34
public import L5.t.E236S192_C35
public import L5.t.E236S192_C36
public import L5.t.E236S192_C37
public import L5.t.E236S192_C38
public import L5.t.E236S192_C39
public import L5.t.E236S192_C40
public import L5.t.E236S192_C41
public import L5.t.E236S192_C42
public import L5.t.E236S192_C43
public import L5.t.E236S192_C44
public import L5.t.E236S192_C45
public import L5.t.E236S192_C46
public import L5.t.E236S192_C47
public import L5.t.E236S192_C48
public import L5.t.E236S192_C49
public import L5.t.E236S192_C50
public import L5.t.E236S192_C51
public import L5.t.E236S192_C52
public import L5.t.E236S192_C53
public import L5.t.E236S192_C54
public import L5.t.E236S192_C55
public import L5.t.E236S192_C56
public import L5.t.E236S192_C57
public import L5.t.E236S192_C58
public import L5.t.E236S192_C59
public import L5.t.E236S192_C60
public import L5.t.E236S192_C61
public import L5.t.E236S192_C62
public import L5.t.E236S192_C63
public import L5.t.E236S192_C64
public import L5.t.E236S192_C65
public import L5.t.E236S192_C66
public import L5.t.E236S192_C67
public import L5.t.E236S192_C68
public import L5.t.E236S192_C69
public import L5.t.E236S192_C70
public import L5.t.E236S192_C71
public import L5.t.E236S192_C72
public import L5.t.E236S192_C73
public import L5.t.E236S192_C74
public import L5.t.E236S192_C75
public import L5.t.E236S192_C76
public import L5.t.E236S192_C77
public import L5.t.E236S192_C78
public import L5.t.E236S192_C79
public import L5.t.E236S192_C80
public import L5.t.E236S192_C81
public import L5.t.E236S192_C82
public import L5.t.E236S192_C83
public import L5.t.E236S192_C84
public import L5.t.E236S192_C85
public import L5.t.E236S192_C86
public import L5.t.E236S192_C87
public import L5.t.E236S192_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S192
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 3033 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 3033 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 28 1 m0 1274 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 29 2 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 31 2 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 33 8 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 41 2 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 43 2 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 45 3 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 48 4 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 52 2 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 54 3 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 59 m0 = true :=
    chunkT_join _ _ _ 0 57 2 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 59 9 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 68 9 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 77 3 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 80 1 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 81 24 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 105 23 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true :=
    chunkT_join _ _ _ 0 128 34 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 221 m0 = true :=
    chunkT_join _ _ _ 0 162 59 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 247 m0 = true :=
    chunkT_join _ _ _ 0 221 26 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 259 m0 = true :=
    chunkT_join _ _ _ 0 247 12 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 260 m0 = true :=
    chunkT_join _ _ _ 0 259 1 m0 2208 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 264 m0 = true :=
    chunkT_join _ _ _ 0 260 4 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 276 m0 = true :=
    chunkT_join _ _ _ 0 264 12 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 290 m0 = true :=
    chunkT_join _ _ _ 0 276 14 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 333 m0 = true :=
    chunkT_join _ _ _ 0 290 43 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 374 m0 = true :=
    chunkT_join _ _ _ 0 333 41 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 376 m0 = true :=
    chunkT_join _ _ _ 0 374 2 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 376 2 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 378 11 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 400 m0 = true :=
    chunkT_join _ _ _ 0 389 11 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 405 m0 = true :=
    chunkT_join _ _ _ 0 400 5 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 423 m0 = true :=
    chunkT_join _ _ _ 0 405 18 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 427 m0 = true :=
    chunkT_join _ _ _ 0 423 4 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 438 m0 = true :=
    chunkT_join _ _ _ 0 427 11 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 490 m0 = true :=
    chunkT_join _ _ _ 0 438 52 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 542 m0 = true :=
    chunkT_join _ _ _ 0 490 52 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 556 m0 = true :=
    chunkT_join _ _ _ 0 542 14 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 584 m0 = true :=
    chunkT_join _ _ _ 0 556 28 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 590 m0 = true :=
    chunkT_join _ _ _ 0 584 6 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 640 m0 = true :=
    chunkT_join _ _ _ 0 590 50 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 687 m0 = true :=
    chunkT_join _ _ _ 0 640 47 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 692 m0 = true :=
    chunkT_join _ _ _ 0 687 5 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 693 m0 = true :=
    chunkT_join _ _ _ 0 692 1 m0 3030 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 706 m0 = true :=
    chunkT_join _ _ _ 0 693 13 m0 3031 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 708 m0 = true :=
    chunkT_join _ _ _ 0 706 2 m0 3031 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 709 m0 = true :=
    chunkT_join _ _ _ 0 708 1 m0 3031 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 740 m0 = true :=
    chunkT_join _ _ _ 0 709 31 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 797 m0 = true :=
    chunkT_join _ _ _ 0 740 57 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 811 m0 = true :=
    chunkT_join _ _ _ 0 797 14 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 855 m0 = true :=
    chunkT_join _ _ _ 0 811 44 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 906 m0 = true :=
    chunkT_join _ _ _ 0 855 51 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 946 m0 = true :=
    chunkT_join _ _ _ 0 906 40 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 976 m0 = true :=
    chunkT_join _ _ _ 0 946 30 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1040 m0 = true :=
    chunkT_join _ _ _ 0 976 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1104 m0 = true :=
    chunkT_join _ _ _ 0 1040 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1148 m0 = true :=
    chunkT_join _ _ _ 0 1104 44 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1212 m0 = true :=
    chunkT_join _ _ _ 0 1148 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 1276 m0 = true :=
    chunkT_join _ _ _ 0 1212 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 1340 m0 = true :=
    chunkT_join _ _ _ 0 1276 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 1404 m0 = true :=
    chunkT_join _ _ _ 0 1340 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 1468 m0 = true :=
    chunkT_join _ _ _ 0 1404 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 1532 m0 = true :=
    chunkT_join _ _ _ 0 1468 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 1596 m0 = true :=
    chunkT_join _ _ _ 0 1532 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 1660 m0 = true :=
    chunkT_join _ _ _ 0 1596 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 1724 m0 = true :=
    chunkT_join _ _ _ 0 1660 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 1788 m0 = true :=
    chunkT_join _ _ _ 0 1724 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 1852 m0 = true :=
    chunkT_join _ _ _ 0 1788 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 1916 m0 = true :=
    chunkT_join _ _ _ 0 1852 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 1980 m0 = true :=
    chunkT_join _ _ _ 0 1916 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 2044 m0 = true :=
    chunkT_join _ _ _ 0 1980 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 2108 m0 = true :=
    chunkT_join _ _ _ 0 2044 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 2172 m0 = true :=
    chunkT_join _ _ _ 0 2108 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 2236 m0 = true :=
    chunkT_join _ _ _ 0 2172 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 2300 m0 = true :=
    chunkT_join _ _ _ 0 2236 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 2364 m0 = true :=
    chunkT_join _ _ _ 0 2300 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 2428 m0 = true :=
    chunkT_join _ _ _ 0 2364 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2492 m0 = true :=
    chunkT_join _ _ _ 0 2428 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 2556 m0 = true :=
    chunkT_join _ _ _ 0 2492 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 2620 m0 = true :=
    chunkT_join _ _ _ 0 2556 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 2684 m0 = true :=
    chunkT_join _ _ _ 0 2620 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 2748 m0 = true :=
    chunkT_join _ _ _ 0 2684 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 2812 m0 = true :=
    chunkT_join _ _ _ 0 2748 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 2876 m0 = true :=
    chunkT_join _ _ _ 0 2812 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 2940 m0 = true :=
    chunkT_join _ _ _ 0 2876 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 3004 m0 = true :=
    chunkT_join _ _ _ 0 2940 64 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 3033 m0 = true :=
    chunkT_join _ _ _ 0 3004 29 m0 3033 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  exact h87
/-- **the leaf has no decomposition** (nested split leaf: main record and 3033 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S192
#print axioms E236S192.leaf
