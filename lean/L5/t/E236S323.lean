module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S323_C0
public import L5.t.E236S323_C1
public import L5.t.E236S323_C2
public import L5.t.E236S323_C3
public import L5.t.E236S323_C4
public import L5.t.E236S323_C5
public import L5.t.E236S323_C6
public import L5.t.E236S323_C7
public import L5.t.E236S323_C8
public import L5.t.E236S323_C9
public import L5.t.E236S323_C10
public import L5.t.E236S323_C11
public import L5.t.E236S323_C12
public import L5.t.E236S323_C13
public import L5.t.E236S323_C14
public import L5.t.E236S323_C15
public import L5.t.E236S323_C16
public import L5.t.E236S323_C17
public import L5.t.E236S323_C18
public import L5.t.E236S323_C19
public import L5.t.E236S323_C20
public import L5.t.E236S323_C21
public import L5.t.E236S323_C22
public import L5.t.E236S323_C23
public import L5.t.E236S323_C24
public import L5.t.E236S323_C25
public import L5.t.E236S323_C26
public import L5.t.E236S323_C27
public import L5.t.E236S323_C28
public import L5.t.E236S323_C29
public import L5.t.E236S323_C30
public import L5.t.E236S323_C31
public import L5.t.E236S323_C32
public import L5.t.E236S323_C33
public import L5.t.E236S323_C34
public import L5.t.E236S323_C35
public import L5.t.E236S323_C36
public import L5.t.E236S323_C37
public import L5.t.E236S323_C38
public import L5.t.E236S323_C39
public import L5.t.E236S323_C40
public import L5.t.E236S323_C41
public import L5.t.E236S323_C42
public import L5.t.E236S323_C43
public import L5.t.E236S323_C44
public import L5.t.E236S323_C45
public import L5.t.E236S323_C46
public import L5.t.E236S323_C47
public import L5.t.E236S323_C48
public import L5.t.E236S323_C49
public import L5.t.E236S323_C50
public import L5.t.E236S323_C51
public import L5.t.E236S323_C52
public import L5.t.E236S323_C53
public import L5.t.E236S323_C54
public import L5.t.E236S323_C55
public import L5.t.E236S323_C56
public import L5.t.E236S323_C57
public import L5.t.E236S323_C58
public import L5.t.E236S323_C59
public import L5.t.E236S323_C60
public import L5.t.E236S323_C61
public import L5.t.E236S323_C62
public import L5.t.E236S323_C63
public import L5.t.E236S323_C64
public import L5.t.E236S323_C65
public import L5.t.E236S323_C66
public import L5.t.E236S323_C67
public import L5.t.E236S323_C68
public import L5.t.E236S323_C69
public import L5.t.E236S323_C70
public import L5.t.E236S323_C71
public import L5.t.E236S323_C72
public import L5.t.E236S323_C73
public import L5.t.E236S323_C74
public import L5.t.E236S323_C75
public import L5.t.E236S323_C76
public import L5.t.E236S323_C77
public import L5.t.E236S323_C78
public import L5.t.E236S323_C79
public import L5.t.E236S323_C80
public import L5.t.E236S323_C81
public import L5.t.E236S323_C82
public import L5.t.E236S323_C83
public import L5.t.E236S323_C84
public import L5.t.E236S323_C85
public import L5.t.E236S323_C86
public import L5.t.E236S323_C87
public import L5.t.E236S323_C88
public import L5.t.E236S323_C89
public import L5.t.E236S323_C90
public import L5.t.E236S323_C91
public import L5.t.E236S323_C92
public import L5.t.E236S323_C93
public import L5.t.E236S323_C94
public import L5.t.E236S323_C95
public import L5.t.E236S323_C96
public import L5.t.E236S323_C97
public import L5.t.E236S323_C98
public import L5.t.E236S323_C99
public import L5.t.E236S323_C100
public import L5.t.E236S323_C101
public import L5.t.E236S323_C102
public import L5.t.E236S323_C103
public import L5.t.E236S323_C104
public import L5.t.E236S323_C105
public import L5.t.E236S323_C106
public import L5.t.E236S323_C107
public import L5.t.E236S323_C108
public import L5.t.E236S323_C109
public import L5.t.E236S323_C110
public import L5.t.E236S323_C111
public import L5.t.E236S323_C112
public import L5.t.E236S323_C113
public import L5.t.E236S323_C114
public import L5.t.E236S323_C115
public import L5.t.E236S323_C116
public import L5.t.E236S323_C117
public import L5.t.E236S323_C118
public import L5.t.E236S323_C119
public import L5.t.E236S323_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S323
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 5278 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 5278 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 11 4 m0 308 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 15 2 m0 308 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 17 25 m0 308 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 42 4 m0 308 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 46 5 m0 308 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 51 1 m0 308 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 52 26 m0 543 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 78 1 m0 543 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 79 1 m0 2000 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 80 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 82 m0 = true :=
    chunkT_join _ _ _ 0 81 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 82 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 83 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 84 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 85 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 86 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 87 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 89 m0 = true :=
    chunkT_join _ _ _ 0 88 1 m0 4569 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 89 1 m0 4740 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 90 1 m0 4740 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 91 1 m0 5123 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 93 m0 = true :=
    chunkT_join _ _ _ 0 92 1 m0 5123 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 93 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 94 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 96 m0 = true :=
    chunkT_join _ _ _ 0 95 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 97 m0 = true :=
    chunkT_join _ _ _ 0 96 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 108 m0 = true :=
    chunkT_join _ _ _ 0 97 11 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 108 7 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 154 m0 = true :=
    chunkT_join _ _ _ 0 115 39 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 156 m0 = true :=
    chunkT_join _ _ _ 0 154 2 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 156 5 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true :=
    chunkT_join _ _ _ 0 161 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 168 m0 = true :=
    chunkT_join _ _ _ 0 162 6 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 172 m0 = true :=
    chunkT_join _ _ _ 0 168 4 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true :=
    chunkT_join _ _ _ 0 172 16 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 193 m0 = true :=
    chunkT_join _ _ _ 0 188 5 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 193 2 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 195 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 196 6 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 250 m0 = true :=
    chunkT_join _ _ _ 0 202 48 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 314 m0 = true :=
    chunkT_join _ _ _ 0 250 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 314 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 442 m0 = true :=
    chunkT_join _ _ _ 0 378 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 506 m0 = true :=
    chunkT_join _ _ _ 0 442 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 570 m0 = true :=
    chunkT_join _ _ _ 0 506 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 634 m0 = true :=
    chunkT_join _ _ _ 0 570 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 698 m0 = true :=
    chunkT_join _ _ _ 0 634 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 762 m0 = true :=
    chunkT_join _ _ _ 0 698 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 826 m0 = true :=
    chunkT_join _ _ _ 0 762 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 890 m0 = true :=
    chunkT_join _ _ _ 0 826 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 954 m0 = true :=
    chunkT_join _ _ _ 0 890 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 1018 m0 = true :=
    chunkT_join _ _ _ 0 954 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 1082 m0 = true :=
    chunkT_join _ _ _ 0 1018 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 1146 m0 = true :=
    chunkT_join _ _ _ 0 1082 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1210 m0 = true :=
    chunkT_join _ _ _ 0 1146 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1274 m0 = true :=
    chunkT_join _ _ _ 0 1210 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1338 m0 = true :=
    chunkT_join _ _ _ 0 1274 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1402 m0 = true :=
    chunkT_join _ _ _ 0 1338 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 1466 m0 = true :=
    chunkT_join _ _ _ 0 1402 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 1530 m0 = true :=
    chunkT_join _ _ _ 0 1466 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 1594 m0 = true :=
    chunkT_join _ _ _ 0 1530 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 1658 m0 = true :=
    chunkT_join _ _ _ 0 1594 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 1722 m0 = true :=
    chunkT_join _ _ _ 0 1658 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 1786 m0 = true :=
    chunkT_join _ _ _ 0 1722 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 1850 m0 = true :=
    chunkT_join _ _ _ 0 1786 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 1914 m0 = true :=
    chunkT_join _ _ _ 0 1850 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 1978 m0 = true :=
    chunkT_join _ _ _ 0 1914 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 2042 m0 = true :=
    chunkT_join _ _ _ 0 1978 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 2106 m0 = true :=
    chunkT_join _ _ _ 0 2042 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 2170 m0 = true :=
    chunkT_join _ _ _ 0 2106 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 2234 m0 = true :=
    chunkT_join _ _ _ 0 2170 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 2298 m0 = true :=
    chunkT_join _ _ _ 0 2234 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 2362 m0 = true :=
    chunkT_join _ _ _ 0 2298 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 2426 m0 = true :=
    chunkT_join _ _ _ 0 2362 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 2490 m0 = true :=
    chunkT_join _ _ _ 0 2426 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 2554 m0 = true :=
    chunkT_join _ _ _ 0 2490 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 2618 m0 = true :=
    chunkT_join _ _ _ 0 2554 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2682 m0 = true :=
    chunkT_join _ _ _ 0 2618 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 2746 m0 = true :=
    chunkT_join _ _ _ 0 2682 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 2810 m0 = true :=
    chunkT_join _ _ _ 0 2746 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 2874 m0 = true :=
    chunkT_join _ _ _ 0 2810 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 2938 m0 = true :=
    chunkT_join _ _ _ 0 2874 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 3002 m0 = true :=
    chunkT_join _ _ _ 0 2938 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 3066 m0 = true :=
    chunkT_join _ _ _ 0 3002 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 3130 m0 = true :=
    chunkT_join _ _ _ 0 3066 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 3194 m0 = true :=
    chunkT_join _ _ _ 0 3130 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 3258 m0 = true :=
    chunkT_join _ _ _ 0 3194 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 3322 m0 = true :=
    chunkT_join _ _ _ 0 3258 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 3386 m0 = true :=
    chunkT_join _ _ _ 0 3322 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 3450 m0 = true :=
    chunkT_join _ _ _ 0 3386 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 3514 m0 = true :=
    chunkT_join _ _ _ 0 3450 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 3578 m0 = true :=
    chunkT_join _ _ _ 0 3514 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 3642 m0 = true :=
    chunkT_join _ _ _ 0 3578 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 3706 m0 = true :=
    chunkT_join _ _ _ 0 3642 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 3770 m0 = true :=
    chunkT_join _ _ _ 0 3706 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 3834 m0 = true :=
    chunkT_join _ _ _ 0 3770 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 3898 m0 = true :=
    chunkT_join _ _ _ 0 3834 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 3962 m0 = true :=
    chunkT_join _ _ _ 0 3898 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 4026 m0 = true :=
    chunkT_join _ _ _ 0 3962 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 4090 m0 = true :=
    chunkT_join _ _ _ 0 4026 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 4154 m0 = true :=
    chunkT_join _ _ _ 0 4090 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 4218 m0 = true :=
    chunkT_join _ _ _ 0 4154 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 4282 m0 = true :=
    chunkT_join _ _ _ 0 4218 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 4346 m0 = true :=
    chunkT_join _ _ _ 0 4282 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 4410 m0 = true :=
    chunkT_join _ _ _ 0 4346 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  have h106 : chunkT (lits.getD 0 0) paths recs 0 4474 m0 = true :=
    chunkT_join _ _ _ 0 4410 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h105 ok106
  have h107 : chunkT (lits.getD 0 0) paths recs 0 4538 m0 = true :=
    chunkT_join _ _ _ 0 4474 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h106 ok107
  have h108 : chunkT (lits.getD 0 0) paths recs 0 4602 m0 = true :=
    chunkT_join _ _ _ 0 4538 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h107 ok108
  have h109 : chunkT (lits.getD 0 0) paths recs 0 4666 m0 = true :=
    chunkT_join _ _ _ 0 4602 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h108 ok109
  have h110 : chunkT (lits.getD 0 0) paths recs 0 4730 m0 = true :=
    chunkT_join _ _ _ 0 4666 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h109 ok110
  have h111 : chunkT (lits.getD 0 0) paths recs 0 4794 m0 = true :=
    chunkT_join _ _ _ 0 4730 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h110 ok111
  have h112 : chunkT (lits.getD 0 0) paths recs 0 4858 m0 = true :=
    chunkT_join _ _ _ 0 4794 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h111 ok112
  have h113 : chunkT (lits.getD 0 0) paths recs 0 4922 m0 = true :=
    chunkT_join _ _ _ 0 4858 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h112 ok113
  have h114 : chunkT (lits.getD 0 0) paths recs 0 4986 m0 = true :=
    chunkT_join _ _ _ 0 4922 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h113 ok114
  have h115 : chunkT (lits.getD 0 0) paths recs 0 5050 m0 = true :=
    chunkT_join _ _ _ 0 4986 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h114 ok115
  have h116 : chunkT (lits.getD 0 0) paths recs 0 5114 m0 = true :=
    chunkT_join _ _ _ 0 5050 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h115 ok116
  have h117 : chunkT (lits.getD 0 0) paths recs 0 5178 m0 = true :=
    chunkT_join _ _ _ 0 5114 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h116 ok117
  have h118 : chunkT (lits.getD 0 0) paths recs 0 5242 m0 = true :=
    chunkT_join _ _ _ 0 5178 64 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h117 ok118
  have h119 : chunkT (lits.getD 0 0) paths recs 0 5278 m0 = true :=
    chunkT_join _ _ _ 0 5242 36 m0 5278 (by rw [lenR]; decide) (by decide +kernel) h118 ok119
  exact h119
/-- **the leaf has no decomposition** (nested split leaf: main record and 5278 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S323
#print axioms E236S323.leaf
