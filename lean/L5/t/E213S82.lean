module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S82_C0
public import L5.t.E213S82_C1
public import L5.t.E213S82_C2
public import L5.t.E213S82_C3
public import L5.t.E213S82_C4
public import L5.t.E213S82_C5
public import L5.t.E213S82_C6
public import L5.t.E213S82_C7
public import L5.t.E213S82_C8
public import L5.t.E213S82_C9
public import L5.t.E213S82_C10
public import L5.t.E213S82_C11
public import L5.t.E213S82_C12
public import L5.t.E213S82_C13
public import L5.t.E213S82_C14
public import L5.t.E213S82_C15
public import L5.t.E213S82_C16
public import L5.t.E213S82_C17
public import L5.t.E213S82_C18
public import L5.t.E213S82_C19
public import L5.t.E213S82_C20
public import L5.t.E213S82_C21
public import L5.t.E213S82_C22
public import L5.t.E213S82_C23
public import L5.t.E213S82_C24
public import L5.t.E213S82_C25
public import L5.t.E213S82_C26
public import L5.t.E213S82_C27
public import L5.t.E213S82_C28
public import L5.t.E213S82_C29
public import L5.t.E213S82_C30
public import L5.t.E213S82_C31
public import L5.t.E213S82_C32
public import L5.t.E213S82_C33
public import L5.t.E213S82_C34
public import L5.t.E213S82_C35
public import L5.t.E213S82_C36
public import L5.t.E213S82_C37
public import L5.t.E213S82_C38
public import L5.t.E213S82_C39
public import L5.t.E213S82_C40
public import L5.t.E213S82_C41
public import L5.t.E213S82_C42
public import L5.t.E213S82_C43
public import L5.t.E213S82_C44
public import L5.t.E213S82_C45
public import L5.t.E213S82_C46
public import L5.t.E213S82_C47
public import L5.t.E213S82_C48
public import L5.t.E213S82_C49
public import L5.t.E213S82_C50
public import L5.t.E213S82_C51
public import L5.t.E213S82_C52
public import L5.t.E213S82_C53
public import L5.t.E213S82_C54
public import L5.t.E213S82_C55
public import L5.t.E213S82_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S82
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2881 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2881 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 49 3 m0 969 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 52 1 m0 969 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 53 21 m0 2467 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 74 24 m0 2467 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 101 m0 = true :=
    chunkT_join _ _ _ 0 98 3 m0 2467 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 102 m0 = true :=
    chunkT_join _ _ _ 0 101 1 m0 2467 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 119 m0 = true :=
    chunkT_join _ _ _ 0 102 17 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 141 m0 = true :=
    chunkT_join _ _ _ 0 119 22 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 141 34 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 191 m0 = true :=
    chunkT_join _ _ _ 0 175 16 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 255 m0 = true :=
    chunkT_join _ _ _ 0 191 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 319 m0 = true :=
    chunkT_join _ _ _ 0 255 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 331 m0 = true :=
    chunkT_join _ _ _ 0 319 12 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 379 m0 = true :=
    chunkT_join _ _ _ 0 331 48 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 379 55 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 447 m0 = true :=
    chunkT_join _ _ _ 0 434 13 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 497 m0 = true :=
    chunkT_join _ _ _ 0 447 50 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 561 m0 = true :=
    chunkT_join _ _ _ 0 497 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 625 m0 = true :=
    chunkT_join _ _ _ 0 561 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 689 m0 = true :=
    chunkT_join _ _ _ 0 625 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 753 m0 = true :=
    chunkT_join _ _ _ 0 689 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 817 m0 = true :=
    chunkT_join _ _ _ 0 753 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 881 m0 = true :=
    chunkT_join _ _ _ 0 817 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 945 m0 = true :=
    chunkT_join _ _ _ 0 881 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1009 m0 = true :=
    chunkT_join _ _ _ 0 945 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1073 m0 = true :=
    chunkT_join _ _ _ 0 1009 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1137 m0 = true :=
    chunkT_join _ _ _ 0 1073 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1201 m0 = true :=
    chunkT_join _ _ _ 0 1137 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1265 m0 = true :=
    chunkT_join _ _ _ 0 1201 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1329 m0 = true :=
    chunkT_join _ _ _ 0 1265 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1393 m0 = true :=
    chunkT_join _ _ _ 0 1329 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1457 m0 = true :=
    chunkT_join _ _ _ 0 1393 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1521 m0 = true :=
    chunkT_join _ _ _ 0 1457 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1585 m0 = true :=
    chunkT_join _ _ _ 0 1521 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1649 m0 = true :=
    chunkT_join _ _ _ 0 1585 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1713 m0 = true :=
    chunkT_join _ _ _ 0 1649 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1777 m0 = true :=
    chunkT_join _ _ _ 0 1713 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1841 m0 = true :=
    chunkT_join _ _ _ 0 1777 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1905 m0 = true :=
    chunkT_join _ _ _ 0 1841 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1969 m0 = true :=
    chunkT_join _ _ _ 0 1905 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 2033 m0 = true :=
    chunkT_join _ _ _ 0 1969 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 2097 m0 = true :=
    chunkT_join _ _ _ 0 2033 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 2161 m0 = true :=
    chunkT_join _ _ _ 0 2097 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 2225 m0 = true :=
    chunkT_join _ _ _ 0 2161 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 2289 m0 = true :=
    chunkT_join _ _ _ 0 2225 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2353 m0 = true :=
    chunkT_join _ _ _ 0 2289 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 2417 m0 = true :=
    chunkT_join _ _ _ 0 2353 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 2481 m0 = true :=
    chunkT_join _ _ _ 0 2417 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 2545 m0 = true :=
    chunkT_join _ _ _ 0 2481 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 2609 m0 = true :=
    chunkT_join _ _ _ 0 2545 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 2673 m0 = true :=
    chunkT_join _ _ _ 0 2609 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 2737 m0 = true :=
    chunkT_join _ _ _ 0 2673 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 2801 m0 = true :=
    chunkT_join _ _ _ 0 2737 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 2865 m0 = true :=
    chunkT_join _ _ _ 0 2801 64 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 2881 m0 = true :=
    chunkT_join _ _ _ 0 2865 16 m0 2881 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  exact h55
/-- **the leaf has no decomposition** (nested split leaf: main record and 2881 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S82
#print axioms E213S82.leaf
