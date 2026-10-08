module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S13_C0
public import L5.t.E204S13_C1
public import L5.t.E204S13_C2
public import L5.t.E204S13_C3
public import L5.t.E204S13_C4
public import L5.t.E204S13_C5
public import L5.t.E204S13_C6
public import L5.t.E204S13_C7
public import L5.t.E204S13_C8
public import L5.t.E204S13_C9
public import L5.t.E204S13_C10
public import L5.t.E204S13_C11
public import L5.t.E204S13_C12
public import L5.t.E204S13_C13
public import L5.t.E204S13_C14
public import L5.t.E204S13_C15
public import L5.t.E204S13_C16
public import L5.t.E204S13_C17
public import L5.t.E204S13_C18
public import L5.t.E204S13_C19
public import L5.t.E204S13_C20
public import L5.t.E204S13_C21
public import L5.t.E204S13_C22
public import L5.t.E204S13_C23
public import L5.t.E204S13_C24
public import L5.t.E204S13_C25
public import L5.t.E204S13_C26
public import L5.t.E204S13_C27
public import L5.t.E204S13_C28
public import L5.t.E204S13_C29
public import L5.t.E204S13_C30
public import L5.t.E204S13_C31
public import L5.t.E204S13_C32
public import L5.t.E204S13_C33
public import L5.t.E204S13_C34
public import L5.t.E204S13_C35
public import L5.t.E204S13_C36
public import L5.t.E204S13_C37
public import L5.t.E204S13_C38
public import L5.t.E204S13_C39
public import L5.t.E204S13_C40
public import L5.t.E204S13_C41
public import L5.t.E204S13_C42
public import L5.t.E204S13_C43
public import L5.t.E204S13_C44
public import L5.t.E204S13_C45
public import L5.t.E204S13_C46
public import L5.t.E204S13_C47
public import L5.t.E204S13_C48
public import L5.t.E204S13_C49
public import L5.t.E204S13_C50
public import L5.t.E204S13_C51
public import L5.t.E204S13_C52
public import L5.t.E204S13_C53
public import L5.t.E204S13_C54
public import L5.t.E204S13_C55
public import L5.t.E204S13_C56
public import L5.t.E204S13_C57
public import L5.t.E204S13_C58
public import L5.t.E204S13_C59
public import L5.t.E204S13_C60
public import L5.t.E204S13_C61
public import L5.t.E204S13_C62
public import L5.t.E204S13_C63
public import L5.t.E204S13_C64
public import L5.t.E204S13_C65
public import L5.t.E204S13_C66
public import L5.t.E204S13_C67
public import L5.t.E204S13_C68
public import L5.t.E204S13_C69
public import L5.t.E204S13_C70
public import L5.t.E204S13_C71
public import L5.t.E204S13_C72
public import L5.t.E204S13_C73
public import L5.t.E204S13_C74
public import L5.t.E204S13_C75
public import L5.t.E204S13_C76
public import L5.t.E204S13_C77
public import L5.t.E204S13_C78
public import L5.t.E204S13_C79
public import L5.t.E204S13_C80
public import L5.t.E204S13_C81
public import L5.t.E204S13_C82
public import L5.t.E204S13_C83
public import L5.t.E204S13_C84
public import L5.t.E204S13_C85
public import L5.t.E204S13_C86
public import L5.t.E204S13_C87
public import L5.t.E204S13_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S13
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 4926 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 6 4 m0 428 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 428 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 428 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 428 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 13 2 m0 428 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 15 3 m0 428 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true :=
    chunkT_join _ _ _ 0 18 3 m0 428 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 21 3 m0 428 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true :=
    chunkT_join _ _ _ 0 24 2 m0 428 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 26 3 m0 428 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 29 4 m0 428 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 33 11 m0 428 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 44 10 m0 428 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 54 14 m0 428 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 68 8 m0 428 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 76 4 m0 428 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 80 10 m0 428 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 90 13 m0 428 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 113 m0 = true :=
    chunkT_join _ _ _ 0 103 10 m0 428 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 113 1 m0 428 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 114 1 m0 1591 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 116 m0 = true :=
    chunkT_join _ _ _ 0 115 1 m0 1591 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 117 m0 = true :=
    chunkT_join _ _ _ 0 116 1 m0 1777 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 118 m0 = true :=
    chunkT_join _ _ _ 0 117 1 m0 1777 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 119 m0 = true :=
    chunkT_join _ _ _ 0 118 1 m0 2792 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 120 m0 = true :=
    chunkT_join _ _ _ 0 119 1 m0 2792 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 120 1 m0 2978 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 122 m0 = true :=
    chunkT_join _ _ _ 0 121 1 m0 2978 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 127 m0 = true :=
    chunkT_join _ _ _ 0 122 5 m0 3127 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 133 m0 = true :=
    chunkT_join _ _ _ 0 127 6 m0 3127 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 134 m0 = true :=
    chunkT_join _ _ _ 0 133 1 m0 3127 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 134 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true :=
    chunkT_join _ _ _ 0 138 17 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 165 m0 = true :=
    chunkT_join _ _ _ 0 155 10 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 165 9 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 178 m0 = true :=
    chunkT_join _ _ _ 0 174 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 178 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 180 m0 = true :=
    chunkT_join _ _ _ 0 179 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 184 m0 = true :=
    chunkT_join _ _ _ 0 180 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 186 m0 = true :=
    chunkT_join _ _ _ 0 184 2 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 186 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true :=
    chunkT_join _ _ _ 0 187 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 188 4 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 192 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 195 4 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 199 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 203 m0 = true :=
    chunkT_join _ _ _ 0 201 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 203 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 205 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 208 1 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 209 5 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 217 m0 = true :=
    chunkT_join _ _ _ 0 214 3 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 221 m0 = true :=
    chunkT_join _ _ _ 0 217 4 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 221 7 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 242 m0 = true :=
    chunkT_join _ _ _ 0 228 14 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 250 m0 = true :=
    chunkT_join _ _ _ 0 242 8 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 269 m0 = true :=
    chunkT_join _ _ _ 0 250 19 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 274 m0 = true :=
    chunkT_join _ _ _ 0 269 5 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 284 m0 = true :=
    chunkT_join _ _ _ 0 274 10 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 285 m0 = true :=
    chunkT_join _ _ _ 0 284 1 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 303 m0 = true :=
    chunkT_join _ _ _ 0 285 18 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 309 m0 = true :=
    chunkT_join _ _ _ 0 303 6 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 317 m0 = true :=
    chunkT_join _ _ _ 0 309 8 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 322 m0 = true :=
    chunkT_join _ _ _ 0 317 5 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 324 m0 = true :=
    chunkT_join _ _ _ 0 322 2 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 325 m0 = true :=
    chunkT_join _ _ _ 0 324 1 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 341 m0 = true :=
    chunkT_join _ _ _ 0 325 16 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 348 m0 = true :=
    chunkT_join _ _ _ 0 341 7 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 358 m0 = true :=
    chunkT_join _ _ _ 0 348 10 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 388 m0 = true :=
    chunkT_join _ _ _ 0 358 30 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 410 m0 = true :=
    chunkT_join _ _ _ 0 388 22 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 482 m0 = true :=
    chunkT_join _ _ _ 0 410 72 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 639 m0 = true :=
    chunkT_join _ _ _ 0 482 157 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 894 m0 = true :=
    chunkT_join _ _ _ 0 639 255 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 1199 m0 = true :=
    chunkT_join _ _ _ 0 894 305 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 1458 m0 = true :=
    chunkT_join _ _ _ 0 1199 259 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 1755 m0 = true :=
    chunkT_join _ _ _ 0 1458 297 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2098 m0 = true :=
    chunkT_join _ _ _ 0 1755 343 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 2483 m0 = true :=
    chunkT_join _ _ _ 0 2098 385 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 2834 m0 = true :=
    chunkT_join _ _ _ 0 2483 351 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 3159 m0 = true :=
    chunkT_join _ _ _ 0 2834 325 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 3460 m0 = true :=
    chunkT_join _ _ _ 0 3159 301 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 3819 m0 = true :=
    chunkT_join _ _ _ 0 3460 359 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 4216 m0 = true :=
    chunkT_join _ _ _ 0 3819 397 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 4570 m0 = true :=
    chunkT_join _ _ _ 0 4216 354 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 4885 m0 = true :=
    chunkT_join _ _ _ 0 4570 315 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true :=
    chunkT_join _ _ _ 0 4885 41 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  exact h87
/-- **the leaf has no decomposition** (nested split leaf: main record and 4926 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S13
#print axioms E204S13.leaf
