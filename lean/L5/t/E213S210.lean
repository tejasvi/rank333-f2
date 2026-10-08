module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S210_C0
public import L5.t.E213S210_C1
public import L5.t.E213S210_C2
public import L5.t.E213S210_C3
public import L5.t.E213S210_C4
public import L5.t.E213S210_C5
public import L5.t.E213S210_C6
public import L5.t.E213S210_C7
public import L5.t.E213S210_C8
public import L5.t.E213S210_C9
public import L5.t.E213S210_C10
public import L5.t.E213S210_C11
public import L5.t.E213S210_C12
public import L5.t.E213S210_C13
public import L5.t.E213S210_C14
public import L5.t.E213S210_C15
public import L5.t.E213S210_C16
public import L5.t.E213S210_C17
public import L5.t.E213S210_C18
public import L5.t.E213S210_C19
public import L5.t.E213S210_C20
public import L5.t.E213S210_C21
public import L5.t.E213S210_C22
public import L5.t.E213S210_C23
public import L5.t.E213S210_C24
public import L5.t.E213S210_C25
public import L5.t.E213S210_C26
public import L5.t.E213S210_C27
public import L5.t.E213S210_C28
public import L5.t.E213S210_C29
public import L5.t.E213S210_C30
public import L5.t.E213S210_C31
public import L5.t.E213S210_C32
public import L5.t.E213S210_C33
public import L5.t.E213S210_C34
public import L5.t.E213S210_C35
public import L5.t.E213S210_C36
public import L5.t.E213S210_C37
public import L5.t.E213S210_C38
public import L5.t.E213S210_C39
public import L5.t.E213S210_C40
public import L5.t.E213S210_C41
public import L5.t.E213S210_C42
public import L5.t.E213S210_C43
public import L5.t.E213S210_C44
public import L5.t.E213S210_C45
public import L5.t.E213S210_C46
public import L5.t.E213S210_C47
public import L5.t.E213S210_C48
public import L5.t.E213S210_C49
public import L5.t.E213S210_C50
public import L5.t.E213S210_C51
public import L5.t.E213S210_C52
public import L5.t.E213S210_C53
public import L5.t.E213S210_C54
public import L5.t.E213S210_C55
public import L5.t.E213S210_C56
public import L5.t.E213S210_C57
public import L5.t.E213S210_C58
public import L5.t.E213S210_C59
public import L5.t.E213S210_C60
public import L5.t.E213S210_C61
public import L5.t.E213S210_C62
public import L5.t.E213S210_C63
public import L5.t.E213S210_C64
public import L5.t.E213S210_C65
public import L5.t.E213S210_C66
public import L5.t.E213S210_C67
public import L5.t.E213S210_C68
public import L5.t.E213S210_C69
public import L5.t.E213S210_C70
public import L5.t.E213S210_C71
public import L5.t.E213S210_C72
public import L5.t.E213S210_C73
public import L5.t.E213S210_C74
public import L5.t.E213S210_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S210
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2267 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2267 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 5 6 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 11 22 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 33 19 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 52 11 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 63 12 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 139 m0 = true :=
    chunkT_join _ _ _ 0 75 64 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true :=
    chunkT_join _ _ _ 0 139 31 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 171 m0 = true :=
    chunkT_join _ _ _ 0 170 1 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true :=
    chunkT_join _ _ _ 0 171 2 m0 1312 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 173 1 m0 1312 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 180 m0 = true :=
    chunkT_join _ _ _ 0 174 6 m0 1758 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 186 m0 = true :=
    chunkT_join _ _ _ 0 180 6 m0 1758 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 186 1 m0 1758 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 187 7 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 194 4 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 198 1 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 199 3 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 202 9 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 222 m0 = true :=
    chunkT_join _ _ _ 0 211 11 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 258 m0 = true :=
    chunkT_join _ _ _ 0 222 36 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 289 m0 = true :=
    chunkT_join _ _ _ 0 258 31 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 353 m0 = true :=
    chunkT_join _ _ _ 0 289 64 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 379 m0 = true :=
    chunkT_join _ _ _ 0 353 26 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 380 m0 = true :=
    chunkT_join _ _ _ 0 379 1 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 381 m0 = true :=
    chunkT_join _ _ _ 0 380 1 m0 1760 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 382 m0 = true :=
    chunkT_join _ _ _ 0 381 1 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 386 m0 = true :=
    chunkT_join _ _ _ 0 382 4 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 391 m0 = true :=
    chunkT_join _ _ _ 0 386 5 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 393 m0 = true :=
    chunkT_join _ _ _ 0 391 2 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 394 m0 = true :=
    chunkT_join _ _ _ 0 393 1 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 397 m0 = true :=
    chunkT_join _ _ _ 0 394 3 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 404 m0 = true :=
    chunkT_join _ _ _ 0 397 7 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 409 m0 = true :=
    chunkT_join _ _ _ 0 404 5 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 416 m0 = true :=
    chunkT_join _ _ _ 0 409 7 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 424 m0 = true :=
    chunkT_join _ _ _ 0 416 8 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 462 m0 = true :=
    chunkT_join _ _ _ 0 424 38 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 505 m0 = true :=
    chunkT_join _ _ _ 0 462 43 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 559 m0 = true :=
    chunkT_join _ _ _ 0 505 54 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 623 m0 = true :=
    chunkT_join _ _ _ 0 559 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 648 m0 = true :=
    chunkT_join _ _ _ 0 623 25 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 651 m0 = true :=
    chunkT_join _ _ _ 0 648 3 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 661 m0 = true :=
    chunkT_join _ _ _ 0 651 10 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 663 m0 = true :=
    chunkT_join _ _ _ 0 661 2 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 665 m0 = true :=
    chunkT_join _ _ _ 0 663 2 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 681 m0 = true :=
    chunkT_join _ _ _ 0 665 16 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 690 m0 = true :=
    chunkT_join _ _ _ 0 681 9 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 701 m0 = true :=
    chunkT_join _ _ _ 0 690 11 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 736 m0 = true :=
    chunkT_join _ _ _ 0 701 35 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 756 m0 = true :=
    chunkT_join _ _ _ 0 736 20 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 776 m0 = true :=
    chunkT_join _ _ _ 0 756 20 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 809 m0 = true :=
    chunkT_join _ _ _ 0 776 33 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 861 m0 = true :=
    chunkT_join _ _ _ 0 809 52 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 925 m0 = true :=
    chunkT_join _ _ _ 0 861 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 989 m0 = true :=
    chunkT_join _ _ _ 0 925 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1053 m0 = true :=
    chunkT_join _ _ _ 0 989 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1117 m0 = true :=
    chunkT_join _ _ _ 0 1053 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1181 m0 = true :=
    chunkT_join _ _ _ 0 1117 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1245 m0 = true :=
    chunkT_join _ _ _ 0 1181 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 1309 m0 = true :=
    chunkT_join _ _ _ 0 1245 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 1373 m0 = true :=
    chunkT_join _ _ _ 0 1309 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 1437 m0 = true :=
    chunkT_join _ _ _ 0 1373 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 1501 m0 = true :=
    chunkT_join _ _ _ 0 1437 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 1565 m0 = true :=
    chunkT_join _ _ _ 0 1501 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 1629 m0 = true :=
    chunkT_join _ _ _ 0 1565 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 1693 m0 = true :=
    chunkT_join _ _ _ 0 1629 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 1757 m0 = true :=
    chunkT_join _ _ _ 0 1693 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 1821 m0 = true :=
    chunkT_join _ _ _ 0 1757 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 1885 m0 = true :=
    chunkT_join _ _ _ 0 1821 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 1949 m0 = true :=
    chunkT_join _ _ _ 0 1885 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 2013 m0 = true :=
    chunkT_join _ _ _ 0 1949 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 2077 m0 = true :=
    chunkT_join _ _ _ 0 2013 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 2141 m0 = true :=
    chunkT_join _ _ _ 0 2077 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 2205 m0 = true :=
    chunkT_join _ _ _ 0 2141 64 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 2267 m0 = true :=
    chunkT_join _ _ _ 0 2205 62 m0 2267 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  exact h74
/-- **the leaf has no decomposition** (nested split leaf: main record and 2267 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S210
#print axioms E213S210.leaf
