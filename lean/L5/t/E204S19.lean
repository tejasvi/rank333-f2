module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S19_C0
public import L5.t.E204S19_C1
public import L5.t.E204S19_C2
public import L5.t.E204S19_C3
public import L5.t.E204S19_C4
public import L5.t.E204S19_C5
public import L5.t.E204S19_C6
public import L5.t.E204S19_C7
public import L5.t.E204S19_C8
public import L5.t.E204S19_C9
public import L5.t.E204S19_C10
public import L5.t.E204S19_C11
public import L5.t.E204S19_C12
public import L5.t.E204S19_C13
public import L5.t.E204S19_C14
public import L5.t.E204S19_C15
public import L5.t.E204S19_C16
public import L5.t.E204S19_C17
public import L5.t.E204S19_C18
public import L5.t.E204S19_C19
public import L5.t.E204S19_C20
public import L5.t.E204S19_C21
public import L5.t.E204S19_C22
public import L5.t.E204S19_C23
public import L5.t.E204S19_C24
public import L5.t.E204S19_C25
public import L5.t.E204S19_C26
public import L5.t.E204S19_C27
public import L5.t.E204S19_C28
public import L5.t.E204S19_C29
public import L5.t.E204S19_C30
public import L5.t.E204S19_C31
public import L5.t.E204S19_C32
public import L5.t.E204S19_C33
public import L5.t.E204S19_C34
public import L5.t.E204S19_C35
public import L5.t.E204S19_C36
public import L5.t.E204S19_C37
public import L5.t.E204S19_C38
public import L5.t.E204S19_C39
public import L5.t.E204S19_C40
public import L5.t.E204S19_C41
public import L5.t.E204S19_C42
public import L5.t.E204S19_C43
public import L5.t.E204S19_C44
public import L5.t.E204S19_C45
public import L5.t.E204S19_C46
public import L5.t.E204S19_C47
public import L5.t.E204S19_C48
public import L5.t.E204S19_C49
public import L5.t.E204S19_C50
public import L5.t.E204S19_C51
public import L5.t.E204S19_C52
public import L5.t.E204S19_C53
public import L5.t.E204S19_C54
public import L5.t.E204S19_C55
public import L5.t.E204S19_C56
public import L5.t.E204S19_C57
public import L5.t.E204S19_C58
public import L5.t.E204S19_C59
public import L5.t.E204S19_C60
public import L5.t.E204S19_C61
public import L5.t.E204S19_C62
public import L5.t.E204S19_C63
public import L5.t.E204S19_C64
public import L5.t.E204S19_C65
public import L5.t.E204S19_C66
public import L5.t.E204S19_C67
public import L5.t.E204S19_C68
public import L5.t.E204S19_C69
public import L5.t.E204S19_C70
public import L5.t.E204S19_C71
public import L5.t.E204S19_C72
public import L5.t.E204S19_C73
public import L5.t.E204S19_C74
public import L5.t.E204S19_C75
public import L5.t.E204S19_C76
public import L5.t.E204S19_C77
public import L5.t.E204S19_C78
public import L5.t.E204S19_C79
public import L5.t.E204S19_C80
public import L5.t.E204S19_C81
public import L5.t.E204S19_C82
public import L5.t.E204S19_C83
public import L5.t.E204S19_C84
public import L5.t.E204S19_C85
public import L5.t.E204S19_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S19
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 4926 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 4 6 m0 428 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 428 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 1591 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 1591 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 13 3 m0 1777 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 16 1 m0 1777 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 17 1 m0 2792 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 19 m0 = true :=
    chunkT_join _ _ _ 0 18 1 m0 2978 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 19 1 m0 2978 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 20 4 m0 3127 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 24 6 m0 3127 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 30 1 m0 3127 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 31 11 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 42 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 46 15 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 65 m0 = true :=
    chunkT_join _ _ _ 0 61 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 65 9 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 82 m0 = true :=
    chunkT_join _ _ _ 0 74 8 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 82 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 96 m0 = true :=
    chunkT_join _ _ _ 0 86 10 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 110 m0 = true :=
    chunkT_join _ _ _ 0 96 14 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 120 m0 = true :=
    chunkT_join _ _ _ 0 110 10 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 120 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 122 m0 = true :=
    chunkT_join _ _ _ 0 121 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 123 m0 = true :=
    chunkT_join _ _ _ 0 122 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 124 m0 = true :=
    chunkT_join _ _ _ 0 123 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 127 m0 = true :=
    chunkT_join _ _ _ 0 124 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 129 m0 = true :=
    chunkT_join _ _ _ 0 127 2 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 129 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 136 m0 = true :=
    chunkT_join _ _ _ 0 132 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 139 m0 = true :=
    chunkT_join _ _ _ 0 136 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 139 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 156 m0 = true :=
    chunkT_join _ _ _ 0 142 14 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 167 m0 = true :=
    chunkT_join _ _ _ 0 156 11 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 167 9 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 178 m0 = true :=
    chunkT_join _ _ _ 0 176 2 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 178 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 180 m0 = true :=
    chunkT_join _ _ _ 0 179 1 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 184 m0 = true :=
    chunkT_join _ _ _ 0 180 4 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 186 m0 = true :=
    chunkT_join _ _ _ 0 184 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 186 1 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 189 m0 = true :=
    chunkT_join _ _ _ 0 187 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 189 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 192 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 194 5 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 199 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 204 m0 = true :=
    chunkT_join _ _ _ 0 202 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 207 m0 = true :=
    chunkT_join _ _ _ 0 204 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 207 5 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 212 4 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 217 m0 = true :=
    chunkT_join _ _ _ 0 216 1 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 221 m0 = true :=
    chunkT_join _ _ _ 0 217 4 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 221 5 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 227 m0 = true :=
    chunkT_join _ _ _ 0 226 1 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 238 m0 = true :=
    chunkT_join _ _ _ 0 227 11 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 252 m0 = true :=
    chunkT_join _ _ _ 0 238 14 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 261 m0 = true :=
    chunkT_join _ _ _ 0 252 9 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 261 9 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 285 m0 = true :=
    chunkT_join _ _ _ 0 270 15 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 294 m0 = true :=
    chunkT_join _ _ _ 0 285 9 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 305 m0 = true :=
    chunkT_join _ _ _ 0 294 11 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 317 m0 = true :=
    chunkT_join _ _ _ 0 305 12 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 318 m0 = true :=
    chunkT_join _ _ _ 0 317 1 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 323 m0 = true :=
    chunkT_join _ _ _ 0 318 5 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 332 m0 = true :=
    chunkT_join _ _ _ 0 323 9 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 356 m0 = true :=
    chunkT_join _ _ _ 0 332 24 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 356 29 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 399 m0 = true :=
    chunkT_join _ _ _ 0 385 14 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 407 m0 = true :=
    chunkT_join _ _ _ 0 399 8 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 416 m0 = true :=
    chunkT_join _ _ _ 0 407 9 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 576 m0 = true :=
    chunkT_join _ _ _ 0 416 160 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 842 m0 = true :=
    chunkT_join _ _ _ 0 576 266 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 1113 m0 = true :=
    chunkT_join _ _ _ 0 842 271 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 1316 m0 = true :=
    chunkT_join _ _ _ 0 1113 203 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 1526 m0 = true :=
    chunkT_join _ _ _ 0 1316 210 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 1826 m0 = true :=
    chunkT_join _ _ _ 0 1526 300 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 2260 m0 = true :=
    chunkT_join _ _ _ 0 1826 434 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2586 m0 = true :=
    chunkT_join _ _ _ 0 2260 326 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 2928 m0 = true :=
    chunkT_join _ _ _ 0 2586 342 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 3223 m0 = true :=
    chunkT_join _ _ _ 0 2928 295 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 3695 m0 = true :=
    chunkT_join _ _ _ 0 3223 472 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 4014 m0 = true :=
    chunkT_join _ _ _ 0 3695 319 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 4313 m0 = true :=
    chunkT_join _ _ _ 0 4014 299 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 4657 m0 = true :=
    chunkT_join _ _ _ 0 4313 344 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true :=
    chunkT_join _ _ _ 0 4657 269 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  exact h85
/-- **the leaf has no decomposition** (nested split leaf: main record and 4926 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S19
#print axioms E204S19.leaf
