module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S20_C0
public import L5.t.E204S20_C1
public import L5.t.E204S20_C2
public import L5.t.E204S20_C3
public import L5.t.E204S20_C4
public import L5.t.E204S20_C5
public import L5.t.E204S20_C6
public import L5.t.E204S20_C7
public import L5.t.E204S20_C8
public import L5.t.E204S20_C9
public import L5.t.E204S20_C10
public import L5.t.E204S20_C11
public import L5.t.E204S20_C12
public import L5.t.E204S20_C13
public import L5.t.E204S20_C14
public import L5.t.E204S20_C15
public import L5.t.E204S20_C16
public import L5.t.E204S20_C17
public import L5.t.E204S20_C18
public import L5.t.E204S20_C19
public import L5.t.E204S20_C20
public import L5.t.E204S20_C21
public import L5.t.E204S20_C22
public import L5.t.E204S20_C23
public import L5.t.E204S20_C24
public import L5.t.E204S20_C25
public import L5.t.E204S20_C26
public import L5.t.E204S20_C27
public import L5.t.E204S20_C28
public import L5.t.E204S20_C29
public import L5.t.E204S20_C30
public import L5.t.E204S20_C31
public import L5.t.E204S20_C32
public import L5.t.E204S20_C33
public import L5.t.E204S20_C34
public import L5.t.E204S20_C35
public import L5.t.E204S20_C36
public import L5.t.E204S20_C37
public import L5.t.E204S20_C38
public import L5.t.E204S20_C39
public import L5.t.E204S20_C40
public import L5.t.E204S20_C41
public import L5.t.E204S20_C42
public import L5.t.E204S20_C43
public import L5.t.E204S20_C44
public import L5.t.E204S20_C45
public import L5.t.E204S20_C46
public import L5.t.E204S20_C47
public import L5.t.E204S20_C48
public import L5.t.E204S20_C49
public import L5.t.E204S20_C50
public import L5.t.E204S20_C51
public import L5.t.E204S20_C52
public import L5.t.E204S20_C53
public import L5.t.E204S20_C54
public import L5.t.E204S20_C55
public import L5.t.E204S20_C56
public import L5.t.E204S20_C57
public import L5.t.E204S20_C58
public import L5.t.E204S20_C59
public import L5.t.E204S20_C60
public import L5.t.E204S20_C61
public import L5.t.E204S20_C62
public import L5.t.E204S20_C63
public import L5.t.E204S20_C64
public import L5.t.E204S20_C65
public import L5.t.E204S20_C66
public import L5.t.E204S20_C67
public import L5.t.E204S20_C68
public import L5.t.E204S20_C69
public import L5.t.E204S20_C70
public import L5.t.E204S20_C71
public import L5.t.E204S20_C72
public import L5.t.E204S20_C73
public import L5.t.E204S20_C74
public import L5.t.E204S20_C75
public import L5.t.E204S20_C76
public import L5.t.E204S20_C77
public import L5.t.E204S20_C78
public import L5.t.E204S20_C79
public import L5.t.E204S20_C80
public import L5.t.E204S20_C81
public import L5.t.E204S20_C82
public import L5.t.E204S20_C83
public import L5.t.E204S20_C84
public import L5.t.E204S20_C85
public import L5.t.E204S20_C86
public import L5.t.E204S20_C87
public import L5.t.E204S20_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S20
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
  have h13 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 31 8 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 39 9 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 48 12 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true :=
    chunkT_join _ _ _ 0 60 9 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 69 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 73 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 74 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 75 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 76 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 79 2 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 81 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 84 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 88 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 91 3 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 108 m0 = true :=
    chunkT_join _ _ _ 0 94 14 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 119 m0 = true :=
    chunkT_join _ _ _ 0 108 11 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 119 13 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 132 6 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 138 4 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 151 m0 = true :=
    chunkT_join _ _ _ 0 142 9 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 166 m0 = true :=
    chunkT_join _ _ _ 0 151 15 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 166 8 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 174 2 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 178 m0 = true :=
    chunkT_join _ _ _ 0 176 2 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 178 1 m0 3313 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 181 m0 = true :=
    chunkT_join _ _ _ 0 179 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 183 m0 = true :=
    chunkT_join _ _ _ 0 181 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 183 4 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true :=
    chunkT_join _ _ _ 0 187 1 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 188 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 193 m0 = true :=
    chunkT_join _ _ _ 0 190 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 193 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 196 4 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 203 m0 = true :=
    chunkT_join _ _ _ 0 200 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 206 m0 = true :=
    chunkT_join _ _ _ 0 203 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 206 3 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 209 2 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 211 5 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 217 m0 = true :=
    chunkT_join _ _ _ 0 216 1 m0 4328 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 220 m0 = true :=
    chunkT_join _ _ _ 0 217 3 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 224 m0 = true :=
    chunkT_join _ _ _ 0 220 4 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 224 2 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 227 m0 = true :=
    chunkT_join _ _ _ 0 226 1 m0 4591 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 238 m0 = true :=
    chunkT_join _ _ _ 0 227 11 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 249 m0 = true :=
    chunkT_join _ _ _ 0 238 11 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 261 m0 = true :=
    chunkT_join _ _ _ 0 249 12 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 261 9 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 281 m0 = true :=
    chunkT_join _ _ _ 0 270 11 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 292 m0 = true :=
    chunkT_join _ _ _ 0 281 11 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 304 m0 = true :=
    chunkT_join _ _ _ 0 292 12 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 318 m0 = true :=
    chunkT_join _ _ _ 0 304 14 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 319 m0 = true :=
    chunkT_join _ _ _ 0 318 1 m0 4777 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 323 m0 = true :=
    chunkT_join _ _ _ 0 319 4 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 330 m0 = true :=
    chunkT_join _ _ _ 0 323 7 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 353 m0 = true :=
    chunkT_join _ _ _ 0 330 23 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 371 m0 = true :=
    chunkT_join _ _ _ 0 353 18 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 371 7 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 383 m0 = true :=
    chunkT_join _ _ _ 0 378 5 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 412 m0 = true :=
    chunkT_join _ _ _ 0 383 29 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 533 m0 = true :=
    chunkT_join _ _ _ 0 412 121 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 787 m0 = true :=
    chunkT_join _ _ _ 0 533 254 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 1069 m0 = true :=
    chunkT_join _ _ _ 0 787 282 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 1276 m0 = true :=
    chunkT_join _ _ _ 0 1069 207 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 1483 m0 = true :=
    chunkT_join _ _ _ 0 1276 207 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 1789 m0 = true :=
    chunkT_join _ _ _ 0 1483 306 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2180 m0 = true :=
    chunkT_join _ _ _ 0 1789 391 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 2546 m0 = true :=
    chunkT_join _ _ _ 0 2180 366 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 2888 m0 = true :=
    chunkT_join _ _ _ 0 2546 342 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 3183 m0 = true :=
    chunkT_join _ _ _ 0 2888 295 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 3638 m0 = true :=
    chunkT_join _ _ _ 0 3183 455 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 3952 m0 = true :=
    chunkT_join _ _ _ 0 3638 314 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 4257 m0 = true :=
    chunkT_join _ _ _ 0 3952 305 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 4600 m0 = true :=
    chunkT_join _ _ _ 0 4257 343 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 4917 m0 = true :=
    chunkT_join _ _ _ 0 4600 317 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true :=
    chunkT_join _ _ _ 0 4917 9 m0 4926 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  exact h87
/-- **the leaf has no decomposition** (nested split leaf: main record and 4926 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S20
#print axioms E204S20.leaf
