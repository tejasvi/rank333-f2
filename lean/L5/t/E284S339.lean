module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S339_C0
public import L5.t.E284S339_C1
public import L5.t.E284S339_C2
public import L5.t.E284S339_C3
public import L5.t.E284S339_C4
public import L5.t.E284S339_C5
public import L5.t.E284S339_C6
public import L5.t.E284S339_C7
public import L5.t.E284S339_C8
public import L5.t.E284S339_C9
public import L5.t.E284S339_C10
public import L5.t.E284S339_C11
public import L5.t.E284S339_C12
public import L5.t.E284S339_C13
public import L5.t.E284S339_C14
public import L5.t.E284S339_C15
public import L5.t.E284S339_C16
public import L5.t.E284S339_C17
public import L5.t.E284S339_C18
public import L5.t.E284S339_C19
public import L5.t.E284S339_C20
public import L5.t.E284S339_C21
public import L5.t.E284S339_C22
public import L5.t.E284S339_C23
public import L5.t.E284S339_C24
public import L5.t.E284S339_C25
public import L5.t.E284S339_C26
public import L5.t.E284S339_C27
public import L5.t.E284S339_C28
public import L5.t.E284S339_C29
public import L5.t.E284S339_C30
public import L5.t.E284S339_C31
public import L5.t.E284S339_C32
public import L5.t.E284S339_C33
public import L5.t.E284S339_C34
public import L5.t.E284S339_C35
public import L5.t.E284S339_C36
public import L5.t.E284S339_C37
public import L5.t.E284S339_C38
public import L5.t.E284S339_C39
public import L5.t.E284S339_C40
public import L5.t.E284S339_C41
public import L5.t.E284S339_C42
public import L5.t.E284S339_C43
public import L5.t.E284S339_C44
public import L5.t.E284S339_C45
public import L5.t.E284S339_C46
public import L5.t.E284S339_C47
public import L5.t.E284S339_C48
public import L5.t.E284S339_C49
public import L5.t.E284S339_C50
public import L5.t.E284S339_C51
public import L5.t.E284S339_C52
public import L5.t.E284S339_C53
public import L5.t.E284S339_C54
public import L5.t.E284S339_C55
public import L5.t.E284S339_C56
public import L5.t.E284S339_C57
public import L5.t.E284S339_C58
public import L5.t.E284S339_C59
public import L5.t.E284S339_C60
public import L5.t.E284S339_C61
public import L5.t.E284S339_C62
public import L5.t.E284S339_C63
public import L5.t.E284S339_C64
public import L5.t.E284S339_C65
public import L5.t.E284S339_C66
public import L5.t.E284S339_C67
public import L5.t.E284S339_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S339
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 4128 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 4128 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 15 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 2 8 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 10 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 74 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 138 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 266 m0 = true :=
    chunkT_join _ _ _ 0 202 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 330 m0 = true :=
    chunkT_join _ _ _ 0 266 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 394 m0 = true :=
    chunkT_join _ _ _ 0 330 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 458 m0 = true :=
    chunkT_join _ _ _ 0 394 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 522 m0 = true :=
    chunkT_join _ _ _ 0 458 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 586 m0 = true :=
    chunkT_join _ _ _ 0 522 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 650 m0 = true :=
    chunkT_join _ _ _ 0 586 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 714 m0 = true :=
    chunkT_join _ _ _ 0 650 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 778 m0 = true :=
    chunkT_join _ _ _ 0 714 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 842 m0 = true :=
    chunkT_join _ _ _ 0 778 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 906 m0 = true :=
    chunkT_join _ _ _ 0 842 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 970 m0 = true :=
    chunkT_join _ _ _ 0 906 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 1034 m0 = true :=
    chunkT_join _ _ _ 0 970 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1098 m0 = true :=
    chunkT_join _ _ _ 0 1034 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1162 m0 = true :=
    chunkT_join _ _ _ 0 1098 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1226 m0 = true :=
    chunkT_join _ _ _ 0 1162 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1290 m0 = true :=
    chunkT_join _ _ _ 0 1226 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1354 m0 = true :=
    chunkT_join _ _ _ 0 1290 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1418 m0 = true :=
    chunkT_join _ _ _ 0 1354 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1482 m0 = true :=
    chunkT_join _ _ _ 0 1418 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1546 m0 = true :=
    chunkT_join _ _ _ 0 1482 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1610 m0 = true :=
    chunkT_join _ _ _ 0 1546 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1674 m0 = true :=
    chunkT_join _ _ _ 0 1610 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1738 m0 = true :=
    chunkT_join _ _ _ 0 1674 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1802 m0 = true :=
    chunkT_join _ _ _ 0 1738 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1866 m0 = true :=
    chunkT_join _ _ _ 0 1802 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1930 m0 = true :=
    chunkT_join _ _ _ 0 1866 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1994 m0 = true :=
    chunkT_join _ _ _ 0 1930 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 2058 m0 = true :=
    chunkT_join _ _ _ 0 1994 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 2122 m0 = true :=
    chunkT_join _ _ _ 0 2058 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 2186 m0 = true :=
    chunkT_join _ _ _ 0 2122 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 2250 m0 = true :=
    chunkT_join _ _ _ 0 2186 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 2314 m0 = true :=
    chunkT_join _ _ _ 0 2250 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 2378 m0 = true :=
    chunkT_join _ _ _ 0 2314 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 2442 m0 = true :=
    chunkT_join _ _ _ 0 2378 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 2506 m0 = true :=
    chunkT_join _ _ _ 0 2442 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 2570 m0 = true :=
    chunkT_join _ _ _ 0 2506 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 2634 m0 = true :=
    chunkT_join _ _ _ 0 2570 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 2698 m0 = true :=
    chunkT_join _ _ _ 0 2634 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 2762 m0 = true :=
    chunkT_join _ _ _ 0 2698 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2826 m0 = true :=
    chunkT_join _ _ _ 0 2762 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 2890 m0 = true :=
    chunkT_join _ _ _ 0 2826 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 2954 m0 = true :=
    chunkT_join _ _ _ 0 2890 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 3018 m0 = true :=
    chunkT_join _ _ _ 0 2954 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 3082 m0 = true :=
    chunkT_join _ _ _ 0 3018 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 3146 m0 = true :=
    chunkT_join _ _ _ 0 3082 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 3210 m0 = true :=
    chunkT_join _ _ _ 0 3146 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 3274 m0 = true :=
    chunkT_join _ _ _ 0 3210 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 3338 m0 = true :=
    chunkT_join _ _ _ 0 3274 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 3402 m0 = true :=
    chunkT_join _ _ _ 0 3338 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 3466 m0 = true :=
    chunkT_join _ _ _ 0 3402 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 3530 m0 = true :=
    chunkT_join _ _ _ 0 3466 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 3594 m0 = true :=
    chunkT_join _ _ _ 0 3530 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 3658 m0 = true :=
    chunkT_join _ _ _ 0 3594 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 3722 m0 = true :=
    chunkT_join _ _ _ 0 3658 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 3786 m0 = true :=
    chunkT_join _ _ _ 0 3722 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 3850 m0 = true :=
    chunkT_join _ _ _ 0 3786 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 3914 m0 = true :=
    chunkT_join _ _ _ 0 3850 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 3978 m0 = true :=
    chunkT_join _ _ _ 0 3914 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 4042 m0 = true :=
    chunkT_join _ _ _ 0 3978 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 4106 m0 = true :=
    chunkT_join _ _ _ 0 4042 64 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 4128 m0 = true :=
    chunkT_join _ _ _ 0 4106 22 m0 4128 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  exact h67
/-- **the leaf has no decomposition** (nested split leaf: main record and 4128 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S339
#print axioms E284S339.leaf
