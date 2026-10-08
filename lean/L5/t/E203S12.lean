module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S12_C0
public import L5.t.E203S12_C1
public import L5.t.E203S12_C2
public import L5.t.E203S12_C3
public import L5.t.E203S12_C4
public import L5.t.E203S12_C5
public import L5.t.E203S12_C6
public import L5.t.E203S12_C7
public import L5.t.E203S12_C8
public import L5.t.E203S12_C9
public import L5.t.E203S12_C10
public import L5.t.E203S12_C11
public import L5.t.E203S12_C12
public import L5.t.E203S12_C13
public import L5.t.E203S12_C14
public import L5.t.E203S12_C15
public import L5.t.E203S12_C16
public import L5.t.E203S12_C17
public import L5.t.E203S12_C18
public import L5.t.E203S12_C19
public import L5.t.E203S12_C20
public import L5.t.E203S12_C21
public import L5.t.E203S12_C22
public import L5.t.E203S12_C23
public import L5.t.E203S12_C24
public import L5.t.E203S12_C25
public import L5.t.E203S12_C26
public import L5.t.E203S12_C27
public import L5.t.E203S12_C28
public import L5.t.E203S12_C29
public import L5.t.E203S12_C30
public import L5.t.E203S12_C31
public import L5.t.E203S12_C32
public import L5.t.E203S12_C33
public import L5.t.E203S12_C34
public import L5.t.E203S12_C35
public import L5.t.E203S12_C36
public import L5.t.E203S12_C37
public import L5.t.E203S12_C38
public import L5.t.E203S12_C39
public import L5.t.E203S12_C40
public import L5.t.E203S12_C41
public import L5.t.E203S12_C42
public import L5.t.E203S12_C43
public import L5.t.E203S12_C44
public import L5.t.E203S12_C45
public import L5.t.E203S12_C46
public import L5.t.E203S12_C47
public import L5.t.E203S12_C48
public import L5.t.E203S12_C49
public import L5.t.E203S12_C50
public import L5.t.E203S12_C51
public import L5.t.E203S12_C52
public import L5.t.E203S12_C53
public import L5.t.E203S12_C54
public import L5.t.E203S12_C55
public import L5.t.E203S12_C56
public import L5.t.E203S12_C57
public import L5.t.E203S12_C58
public import L5.t.E203S12_C59
public import L5.t.E203S12_C60
public import L5.t.E203S12_C61
public import L5.t.E203S12_C62
public import L5.t.E203S12_C63
public import L5.t.E203S12_C64
public import L5.t.E203S12_C65
public import L5.t.E203S12_C66
public import L5.t.E203S12_C67
public import L5.t.E203S12_C68
public import L5.t.E203S12_C69
public import L5.t.E203S12_C70
public import L5.t.E203S12_C71
public import L5.t.E203S12_C72
public import L5.t.E203S12_C73
public import L5.t.E203S12_C74
public import L5.t.E203S12_C75
public import L5.t.E203S12_C76
public import L5.t.E203S12_C77
public import L5.t.E203S12_C78
public import L5.t.E203S12_C79
public import L5.t.E203S12_C80
public import L5.t.E203S12_C81
public import L5.t.E203S12_C82
public import L5.t.E203S12_C83
public import L5.t.E203S12_C84
public import L5.t.E203S12_C85
public import L5.t.E203S12_C86
public import L5.t.E203S12_C87
public import L5.t.E203S12_C88
public import L5.t.E203S12_C89
public import L5.t.E203S12_C90
public import L5.t.E203S12_C91
public import L5.t.E203S12_C92
public import L5.t.E203S12_C93
public import L5.t.E203S12_C94
public import L5.t.E203S12_C95
public import L5.t.E203S12_C96
public import L5.t.E203S12_C97
public import L5.t.E203S12_C98
public import L5.t.E203S12_C99
public import L5.t.E203S12_C100
public import L5.t.E203S12_C101
public import L5.t.E203S12_C102
public import L5.t.E203S12_C103
public import L5.t.E203S12_C104
public import L5.t.E203S12_C105
public import L5.t.E203S12_C106
public import L5.t.E203S12_C107
public import L5.t.E203S12_C108
public import L5.t.E203S12_C109
public import L5.t.E203S12_C110
public import L5.t.E203S12_C111
public import L5.t.E203S12_C112
public import L5.t.E203S12_C113
public import L5.t.E203S12_C114
public import L5.t.E203S12_C115
public import L5.t.E203S12_C116
public import L5.t.E203S12_C117
public import L5.t.E203S12_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S12
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 7110 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 7110 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 4 6 m0 468 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 468 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 2524 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 2524 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 13 3 m0 2804 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 16 1 m0 2804 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 17 1 m0 4082 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 19 m0 = true :=
    chunkT_join _ _ _ 0 18 1 m0 4362 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 19 1 m0 4362 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 20 4 m0 4623 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 24 6 m0 4623 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 30 1 m0 4623 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 31 10 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 41 3 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 44 13 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 57 7 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 64 7 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 71 2 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 73 1 m0 4903 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 74 2 m0 4936 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 76 1 m0 4936 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 77 3 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 80 3 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 83 4 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 93 m0 = true :=
    chunkT_join _ _ _ 0 87 6 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 93 11 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 104 10 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 114 7 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 121 7 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 129 m0 = true :=
    chunkT_join _ _ _ 0 128 1 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 130 m0 = true :=
    chunkT_join _ _ _ 0 129 1 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 131 m0 = true :=
    chunkT_join _ _ _ 0 130 1 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 133 m0 = true :=
    chunkT_join _ _ _ 0 131 2 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 136 m0 = true :=
    chunkT_join _ _ _ 0 133 3 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 136 2 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 141 m0 = true :=
    chunkT_join _ _ _ 0 138 3 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 144 m0 = true :=
    chunkT_join _ _ _ 0 141 3 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 147 m0 = true :=
    chunkT_join _ _ _ 0 144 3 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 149 m0 = true :=
    chunkT_join _ _ _ 0 147 2 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true :=
    chunkT_join _ _ _ 0 149 6 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 166 m0 = true :=
    chunkT_join _ _ _ 0 155 11 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true :=
    chunkT_join _ _ _ 0 166 7 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 185 m0 = true :=
    chunkT_join _ _ _ 0 173 12 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 191 m0 = true :=
    chunkT_join _ _ _ 0 185 6 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 191 1 m0 4947 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 192 2 m0 4958 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 194 1 m0 4958 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 195 1 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 196 3 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 199 3 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 203 m0 = true :=
    chunkT_join _ _ _ 0 202 1 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 204 m0 = true :=
    chunkT_join _ _ _ 0 203 1 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 207 m0 = true :=
    chunkT_join _ _ _ 0 204 3 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 207 2 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 209 3 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 212 4 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 218 m0 = true :=
    chunkT_join _ _ _ 0 216 2 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 219 m0 = true :=
    chunkT_join _ _ _ 0 218 1 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 220 m0 = true :=
    chunkT_join _ _ _ 0 219 1 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 223 m0 = true :=
    chunkT_join _ _ _ 0 220 3 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 223 3 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 230 m0 = true :=
    chunkT_join _ _ _ 0 226 4 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 232 m0 = true :=
    chunkT_join _ _ _ 0 230 2 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 233 m0 = true :=
    chunkT_join _ _ _ 0 232 1 m0 6236 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 236 m0 = true :=
    chunkT_join _ _ _ 0 233 3 m0 6569 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 239 m0 = true :=
    chunkT_join _ _ _ 0 236 3 m0 6569 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 242 m0 = true :=
    chunkT_join _ _ _ 0 239 3 m0 6569 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 243 m0 = true :=
    chunkT_join _ _ _ 0 242 1 m0 6569 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 251 m0 = true :=
    chunkT_join _ _ _ 0 243 8 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 258 m0 = true :=
    chunkT_join _ _ _ 0 251 7 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 267 m0 = true :=
    chunkT_join _ _ _ 0 258 9 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 275 m0 = true :=
    chunkT_join _ _ _ 0 267 8 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 281 m0 = true :=
    chunkT_join _ _ _ 0 275 6 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 292 m0 = true :=
    chunkT_join _ _ _ 0 281 11 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 300 m0 = true :=
    chunkT_join _ _ _ 0 292 8 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 308 m0 = true :=
    chunkT_join _ _ _ 0 300 8 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 320 m0 = true :=
    chunkT_join _ _ _ 0 308 12 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 328 m0 = true :=
    chunkT_join _ _ _ 0 320 8 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 342 m0 = true :=
    chunkT_join _ _ _ 0 328 14 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 349 m0 = true :=
    chunkT_join _ _ _ 0 342 7 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 351 m0 = true :=
    chunkT_join _ _ _ 0 349 2 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 352 m0 = true :=
    chunkT_join _ _ _ 0 351 1 m0 6849 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 357 m0 = true :=
    chunkT_join _ _ _ 0 352 5 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 360 m0 = true :=
    chunkT_join _ _ _ 0 357 3 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 360 18 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 396 m0 = true :=
    chunkT_join _ _ _ 0 378 18 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 418 m0 = true :=
    chunkT_join _ _ _ 0 396 22 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 438 m0 = true :=
    chunkT_join _ _ _ 0 418 20 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 444 m0 = true :=
    chunkT_join _ _ _ 0 438 6 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 447 m0 = true :=
    chunkT_join _ _ _ 0 444 3 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 452 m0 = true :=
    chunkT_join _ _ _ 0 447 5 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 494 m0 = true :=
    chunkT_join _ _ _ 0 452 42 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 699 m0 = true :=
    chunkT_join _ _ _ 0 494 205 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 991 m0 = true :=
    chunkT_join _ _ _ 0 699 292 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 1156 m0 = true :=
    chunkT_join _ _ _ 0 991 165 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 1378 m0 = true :=
    chunkT_join _ _ _ 0 1156 222 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 1662 m0 = true :=
    chunkT_join _ _ _ 0 1378 284 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 1832 m0 = true :=
    chunkT_join _ _ _ 0 1662 170 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 2123 m0 = true :=
    chunkT_join _ _ _ 0 1832 291 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 2322 m0 = true :=
    chunkT_join _ _ _ 0 2123 199 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 2557 m0 = true :=
    chunkT_join _ _ _ 0 2322 235 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 2836 m0 = true :=
    chunkT_join _ _ _ 0 2557 279 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 3168 m0 = true :=
    chunkT_join _ _ _ 0 2836 332 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 3482 m0 = true :=
    chunkT_join _ _ _ 0 3168 314 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 3778 m0 = true :=
    chunkT_join _ _ _ 0 3482 296 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  have h106 : chunkT (lits.getD 0 0) paths recs 0 4098 m0 = true :=
    chunkT_join _ _ _ 0 3778 320 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h105 ok106
  have h107 : chunkT (lits.getD 0 0) paths recs 0 4373 m0 = true :=
    chunkT_join _ _ _ 0 4098 275 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h106 ok107
  have h108 : chunkT (lits.getD 0 0) paths recs 0 4638 m0 = true :=
    chunkT_join _ _ _ 0 4373 265 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h107 ok108
  have h109 : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true :=
    chunkT_join _ _ _ 0 4638 288 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h108 ok109
  have h110 : chunkT (lits.getD 0 0) paths recs 0 5221 m0 = true :=
    chunkT_join _ _ _ 0 4926 295 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h109 ok110
  have h111 : chunkT (lits.getD 0 0) paths recs 0 5491 m0 = true :=
    chunkT_join _ _ _ 0 5221 270 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h110 ok111
  have h112 : chunkT (lits.getD 0 0) paths recs 0 5810 m0 = true :=
    chunkT_join _ _ _ 0 5491 319 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h111 ok112
  have h113 : chunkT (lits.getD 0 0) paths recs 0 6144 m0 = true :=
    chunkT_join _ _ _ 0 5810 334 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h112 ok113
  have h114 : chunkT (lits.getD 0 0) paths recs 0 6413 m0 = true :=
    chunkT_join _ _ _ 0 6144 269 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h113 ok114
  have h115 : chunkT (lits.getD 0 0) paths recs 0 6730 m0 = true :=
    chunkT_join _ _ _ 0 6413 317 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h114 ok115
  have h116 : chunkT (lits.getD 0 0) paths recs 0 7010 m0 = true :=
    chunkT_join _ _ _ 0 6730 280 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h115 ok116
  have h117 : chunkT (lits.getD 0 0) paths recs 0 7110 m0 = true :=
    chunkT_join _ _ _ 0 7010 100 m0 7110 (by rw [lenR]; decide) (by decide +kernel) h116 ok117
  exact h117
/-- **the leaf has no decomposition** (nested split leaf: main record and 7110 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S12
#print axioms E203S12.leaf
