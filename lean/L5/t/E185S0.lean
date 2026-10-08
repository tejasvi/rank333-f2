module
public import R22Port.U_d41d8cd98f00
public import L5.t.E185S0_C0
public import L5.t.E185S0_C1
public import L5.t.E185S0_C2
public import L5.t.E185S0_C3
public import L5.t.E185S0_C4
public import L5.t.E185S0_C5
public import L5.t.E185S0_C6
public import L5.t.E185S0_C7
public import L5.t.E185S0_C8
public import L5.t.E185S0_C9
public import L5.t.E185S0_C10
public import L5.t.E185S0_C11
public import L5.t.E185S0_C12
public import L5.t.E185S0_C13
public import L5.t.E185S0_C14
public import L5.t.E185S0_C15
public import L5.t.E185S0_C16
public import L5.t.E185S0_C17
public import L5.t.E185S0_C18
public import L5.t.E185S0_C19
public import L5.t.E185S0_C20
public import L5.t.E185S0_C21
public import L5.t.E185S0_C22
public import L5.t.E185S0_C23
public import L5.t.E185S0_C24
public import L5.t.E185S0_C25
public import L5.t.E185S0_C26
public import L5.t.E185S0_C27
public import L5.t.E185S0_C28
public import L5.t.E185S0_C29
public import L5.t.E185S0_C30
public import L5.t.E185S0_C31
public import L5.t.E185S0_C32
public import L5.t.E185S0_C33
public import L5.t.E185S0_C34
public import L5.t.E185S0_C35
public import L5.t.E185S0_C36
public import L5.t.E185S0_C37
public import L5.t.E185S0_C38
public import L5.t.E185S0_C39
public import L5.t.E185S0_C40
public import L5.t.E185S0_C41
public import L5.t.E185S0_C42
public import L5.t.E185S0_C43
public import L5.t.E185S0_C44
public import L5.t.E185S0_C45
public import L5.t.E185S0_C46
public import L5.t.E185S0_C47
public import L5.t.E185S0_C48
public import L5.t.E185S0_C49
public import L5.t.E185S0_C50
public import L5.t.E185S0_C51
public import L5.t.E185S0_C52
public import L5.t.E185S0_C53
public import L5.t.E185S0_C54
public import L5.t.E185S0_C55
public import L5.t.E185S0_C56
public import L5.t.E185S0_C57
public import L5.t.E185S0_C58
public import L5.t.E185S0_C59
public import L5.t.E185S0_C60
public import L5.t.E185S0_C61
public import L5.t.E185S0_C62
public import L5.t.E185S0_C63
public import L5.t.E185S0_C64
public import L5.t.E185S0_C65
public import L5.t.E185S0_C66
public import L5.t.E185S0_C67
public import L5.t.E185S0_C68
public import L5.t.E185S0_C69
public import L5.t.E185S0_C70
public import L5.t.E185S0_C71
public import L5.t.E185S0_C72
public import L5.t.E185S0_C73
public import L5.t.E185S0_C74
public import L5.t.E185S0_C75
public import L5.t.E185S0_C76
public import L5.t.E185S0_C77
public import L5.t.E185S0_C78
public import L5.t.E185S0_C79
public import L5.t.E185S0_C80
public import L5.t.E185S0_C81
public import L5.t.E185S0_C82
public import L5.t.E185S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E185S0
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 161 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 161 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 1 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 2 = true := nestChk_join _ _ _ 0 1 1 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 3 = true := nestChk_join _ _ _ 0 2 1 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 4 = true := nestChk_join _ _ _ 0 3 1 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 5 = true := nestChk_join _ _ _ 0 4 1 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 7 = true := nestChk_join _ _ _ 0 5 2 (by rw [lenR]; decide) h4 ok5
  have h6 : nestChkR (lits.getD 0 0) paths recs 0 9 = true := nestChk_join _ _ _ 0 7 2 (by rw [lenR]; decide) h5 ok6
  have h7 : nestChkR (lits.getD 0 0) paths recs 0 11 = true := nestChk_join _ _ _ 0 9 2 (by rw [lenR]; decide) h6 ok7
  have h8 : nestChkR (lits.getD 0 0) paths recs 0 13 = true := nestChk_join _ _ _ 0 11 2 (by rw [lenR]; decide) h7 ok8
  have h9 : nestChkR (lits.getD 0 0) paths recs 0 15 = true := nestChk_join _ _ _ 0 13 2 (by rw [lenR]; decide) h8 ok9
  have h10 : nestChkR (lits.getD 0 0) paths recs 0 17 = true := nestChk_join _ _ _ 0 15 2 (by rw [lenR]; decide) h9 ok10
  have h11 : nestChkR (lits.getD 0 0) paths recs 0 19 = true := nestChk_join _ _ _ 0 17 2 (by rw [lenR]; decide) h10 ok11
  have h12 : nestChkR (lits.getD 0 0) paths recs 0 21 = true := nestChk_join _ _ _ 0 19 2 (by rw [lenR]; decide) h11 ok12
  have h13 : nestChkR (lits.getD 0 0) paths recs 0 23 = true := nestChk_join _ _ _ 0 21 2 (by rw [lenR]; decide) h12 ok13
  have h14 : nestChkR (lits.getD 0 0) paths recs 0 25 = true := nestChk_join _ _ _ 0 23 2 (by rw [lenR]; decide) h13 ok14
  have h15 : nestChkR (lits.getD 0 0) paths recs 0 27 = true := nestChk_join _ _ _ 0 25 2 (by rw [lenR]; decide) h14 ok15
  have h16 : nestChkR (lits.getD 0 0) paths recs 0 29 = true := nestChk_join _ _ _ 0 27 2 (by rw [lenR]; decide) h15 ok16
  have h17 : nestChkR (lits.getD 0 0) paths recs 0 31 = true := nestChk_join _ _ _ 0 29 2 (by rw [lenR]; decide) h16 ok17
  have h18 : nestChkR (lits.getD 0 0) paths recs 0 33 = true := nestChk_join _ _ _ 0 31 2 (by rw [lenR]; decide) h17 ok18
  have h19 : nestChkR (lits.getD 0 0) paths recs 0 35 = true := nestChk_join _ _ _ 0 33 2 (by rw [lenR]; decide) h18 ok19
  have h20 : nestChkR (lits.getD 0 0) paths recs 0 37 = true := nestChk_join _ _ _ 0 35 2 (by rw [lenR]; decide) h19 ok20
  have h21 : nestChkR (lits.getD 0 0) paths recs 0 39 = true := nestChk_join _ _ _ 0 37 2 (by rw [lenR]; decide) h20 ok21
  have h22 : nestChkR (lits.getD 0 0) paths recs 0 41 = true := nestChk_join _ _ _ 0 39 2 (by rw [lenR]; decide) h21 ok22
  have h23 : nestChkR (lits.getD 0 0) paths recs 0 43 = true := nestChk_join _ _ _ 0 41 2 (by rw [lenR]; decide) h22 ok23
  have h24 : nestChkR (lits.getD 0 0) paths recs 0 45 = true := nestChk_join _ _ _ 0 43 2 (by rw [lenR]; decide) h23 ok24
  have h25 : nestChkR (lits.getD 0 0) paths recs 0 47 = true := nestChk_join _ _ _ 0 45 2 (by rw [lenR]; decide) h24 ok25
  have h26 : nestChkR (lits.getD 0 0) paths recs 0 49 = true := nestChk_join _ _ _ 0 47 2 (by rw [lenR]; decide) h25 ok26
  have h27 : nestChkR (lits.getD 0 0) paths recs 0 51 = true := nestChk_join _ _ _ 0 49 2 (by rw [lenR]; decide) h26 ok27
  have h28 : nestChkR (lits.getD 0 0) paths recs 0 53 = true := nestChk_join _ _ _ 0 51 2 (by rw [lenR]; decide) h27 ok28
  have h29 : nestChkR (lits.getD 0 0) paths recs 0 55 = true := nestChk_join _ _ _ 0 53 2 (by rw [lenR]; decide) h28 ok29
  have h30 : nestChkR (lits.getD 0 0) paths recs 0 57 = true := nestChk_join _ _ _ 0 55 2 (by rw [lenR]; decide) h29 ok30
  have h31 : nestChkR (lits.getD 0 0) paths recs 0 59 = true := nestChk_join _ _ _ 0 57 2 (by rw [lenR]; decide) h30 ok31
  have h32 : nestChkR (lits.getD 0 0) paths recs 0 61 = true := nestChk_join _ _ _ 0 59 2 (by rw [lenR]; decide) h31 ok32
  have h33 : nestChkR (lits.getD 0 0) paths recs 0 63 = true := nestChk_join _ _ _ 0 61 2 (by rw [lenR]; decide) h32 ok33
  have h34 : nestChkR (lits.getD 0 0) paths recs 0 65 = true := nestChk_join _ _ _ 0 63 2 (by rw [lenR]; decide) h33 ok34
  have h35 : nestChkR (lits.getD 0 0) paths recs 0 67 = true := nestChk_join _ _ _ 0 65 2 (by rw [lenR]; decide) h34 ok35
  have h36 : nestChkR (lits.getD 0 0) paths recs 0 69 = true := nestChk_join _ _ _ 0 67 2 (by rw [lenR]; decide) h35 ok36
  have h37 : nestChkR (lits.getD 0 0) paths recs 0 71 = true := nestChk_join _ _ _ 0 69 2 (by rw [lenR]; decide) h36 ok37
  have h38 : nestChkR (lits.getD 0 0) paths recs 0 73 = true := nestChk_join _ _ _ 0 71 2 (by rw [lenR]; decide) h37 ok38
  have h39 : nestChkR (lits.getD 0 0) paths recs 0 75 = true := nestChk_join _ _ _ 0 73 2 (by rw [lenR]; decide) h38 ok39
  have h40 : nestChkR (lits.getD 0 0) paths recs 0 77 = true := nestChk_join _ _ _ 0 75 2 (by rw [lenR]; decide) h39 ok40
  have h41 : nestChkR (lits.getD 0 0) paths recs 0 79 = true := nestChk_join _ _ _ 0 77 2 (by rw [lenR]; decide) h40 ok41
  have h42 : nestChkR (lits.getD 0 0) paths recs 0 81 = true := nestChk_join _ _ _ 0 79 2 (by rw [lenR]; decide) h41 ok42
  have h43 : nestChkR (lits.getD 0 0) paths recs 0 83 = true := nestChk_join _ _ _ 0 81 2 (by rw [lenR]; decide) h42 ok43
  have h44 : nestChkR (lits.getD 0 0) paths recs 0 85 = true := nestChk_join _ _ _ 0 83 2 (by rw [lenR]; decide) h43 ok44
  have h45 : nestChkR (lits.getD 0 0) paths recs 0 87 = true := nestChk_join _ _ _ 0 85 2 (by rw [lenR]; decide) h44 ok45
  have h46 : nestChkR (lits.getD 0 0) paths recs 0 89 = true := nestChk_join _ _ _ 0 87 2 (by rw [lenR]; decide) h45 ok46
  have h47 : nestChkR (lits.getD 0 0) paths recs 0 91 = true := nestChk_join _ _ _ 0 89 2 (by rw [lenR]; decide) h46 ok47
  have h48 : nestChkR (lits.getD 0 0) paths recs 0 93 = true := nestChk_join _ _ _ 0 91 2 (by rw [lenR]; decide) h47 ok48
  have h49 : nestChkR (lits.getD 0 0) paths recs 0 95 = true := nestChk_join _ _ _ 0 93 2 (by rw [lenR]; decide) h48 ok49
  have h50 : nestChkR (lits.getD 0 0) paths recs 0 97 = true := nestChk_join _ _ _ 0 95 2 (by rw [lenR]; decide) h49 ok50
  have h51 : nestChkR (lits.getD 0 0) paths recs 0 99 = true := nestChk_join _ _ _ 0 97 2 (by rw [lenR]; decide) h50 ok51
  have h52 : nestChkR (lits.getD 0 0) paths recs 0 101 = true := nestChk_join _ _ _ 0 99 2 (by rw [lenR]; decide) h51 ok52
  have h53 : nestChkR (lits.getD 0 0) paths recs 0 103 = true := nestChk_join _ _ _ 0 101 2 (by rw [lenR]; decide) h52 ok53
  have h54 : nestChkR (lits.getD 0 0) paths recs 0 105 = true := nestChk_join _ _ _ 0 103 2 (by rw [lenR]; decide) h53 ok54
  have h55 : nestChkR (lits.getD 0 0) paths recs 0 107 = true := nestChk_join _ _ _ 0 105 2 (by rw [lenR]; decide) h54 ok55
  have h56 : nestChkR (lits.getD 0 0) paths recs 0 109 = true := nestChk_join _ _ _ 0 107 2 (by rw [lenR]; decide) h55 ok56
  have h57 : nestChkR (lits.getD 0 0) paths recs 0 111 = true := nestChk_join _ _ _ 0 109 2 (by rw [lenR]; decide) h56 ok57
  have h58 : nestChkR (lits.getD 0 0) paths recs 0 113 = true := nestChk_join _ _ _ 0 111 2 (by rw [lenR]; decide) h57 ok58
  have h59 : nestChkR (lits.getD 0 0) paths recs 0 115 = true := nestChk_join _ _ _ 0 113 2 (by rw [lenR]; decide) h58 ok59
  have h60 : nestChkR (lits.getD 0 0) paths recs 0 117 = true := nestChk_join _ _ _ 0 115 2 (by rw [lenR]; decide) h59 ok60
  have h61 : nestChkR (lits.getD 0 0) paths recs 0 119 = true := nestChk_join _ _ _ 0 117 2 (by rw [lenR]; decide) h60 ok61
  have h62 : nestChkR (lits.getD 0 0) paths recs 0 121 = true := nestChk_join _ _ _ 0 119 2 (by rw [lenR]; decide) h61 ok62
  have h63 : nestChkR (lits.getD 0 0) paths recs 0 123 = true := nestChk_join _ _ _ 0 121 2 (by rw [lenR]; decide) h62 ok63
  have h64 : nestChkR (lits.getD 0 0) paths recs 0 125 = true := nestChk_join _ _ _ 0 123 2 (by rw [lenR]; decide) h63 ok64
  have h65 : nestChkR (lits.getD 0 0) paths recs 0 127 = true := nestChk_join _ _ _ 0 125 2 (by rw [lenR]; decide) h64 ok65
  have h66 : nestChkR (lits.getD 0 0) paths recs 0 129 = true := nestChk_join _ _ _ 0 127 2 (by rw [lenR]; decide) h65 ok66
  have h67 : nestChkR (lits.getD 0 0) paths recs 0 131 = true := nestChk_join _ _ _ 0 129 2 (by rw [lenR]; decide) h66 ok67
  have h68 : nestChkR (lits.getD 0 0) paths recs 0 133 = true := nestChk_join _ _ _ 0 131 2 (by rw [lenR]; decide) h67 ok68
  have h69 : nestChkR (lits.getD 0 0) paths recs 0 135 = true := nestChk_join _ _ _ 0 133 2 (by rw [lenR]; decide) h68 ok69
  have h70 : nestChkR (lits.getD 0 0) paths recs 0 137 = true := nestChk_join _ _ _ 0 135 2 (by rw [lenR]; decide) h69 ok70
  have h71 : nestChkR (lits.getD 0 0) paths recs 0 139 = true := nestChk_join _ _ _ 0 137 2 (by rw [lenR]; decide) h70 ok71
  have h72 : nestChkR (lits.getD 0 0) paths recs 0 141 = true := nestChk_join _ _ _ 0 139 2 (by rw [lenR]; decide) h71 ok72
  have h73 : nestChkR (lits.getD 0 0) paths recs 0 143 = true := nestChk_join _ _ _ 0 141 2 (by rw [lenR]; decide) h72 ok73
  have h74 : nestChkR (lits.getD 0 0) paths recs 0 145 = true := nestChk_join _ _ _ 0 143 2 (by rw [lenR]; decide) h73 ok74
  have h75 : nestChkR (lits.getD 0 0) paths recs 0 147 = true := nestChk_join _ _ _ 0 145 2 (by rw [lenR]; decide) h74 ok75
  have h76 : nestChkR (lits.getD 0 0) paths recs 0 149 = true := nestChk_join _ _ _ 0 147 2 (by rw [lenR]; decide) h75 ok76
  have h77 : nestChkR (lits.getD 0 0) paths recs 0 151 = true := nestChk_join _ _ _ 0 149 2 (by rw [lenR]; decide) h76 ok77
  have h78 : nestChkR (lits.getD 0 0) paths recs 0 153 = true := nestChk_join _ _ _ 0 151 2 (by rw [lenR]; decide) h77 ok78
  have h79 : nestChkR (lits.getD 0 0) paths recs 0 155 = true := nestChk_join _ _ _ 0 153 2 (by rw [lenR]; decide) h78 ok79
  have h80 : nestChkR (lits.getD 0 0) paths recs 0 157 = true := nestChk_join _ _ _ 0 155 2 (by rw [lenR]; decide) h79 ok80
  have h81 : nestChkR (lits.getD 0 0) paths recs 0 159 = true := nestChk_join _ _ _ 0 157 2 (by rw [lenR]; decide) h80 ok81
  have h82 : nestChkR (lits.getD 0 0) paths recs 0 161 = true := nestChk_join _ _ _ 0 159 2 (by rw [lenR]; decide) h81 ok82
  exact h82
/-- **the leaf has no decomposition** (nested split leaf: main record and 161 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E185S0
#print axioms E185S0.leaf
