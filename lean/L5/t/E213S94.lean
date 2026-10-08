module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S94_C0
public import L5.t.E213S94_C1
public import L5.t.E213S94_C2
public import L5.t.E213S94_C3
public import L5.t.E213S94_C4
public import L5.t.E213S94_C5
public import L5.t.E213S94_C6
public import L5.t.E213S94_C7
public import L5.t.E213S94_C8
public import L5.t.E213S94_C9
public import L5.t.E213S94_C10
public import L5.t.E213S94_C11
public import L5.t.E213S94_C12
public import L5.t.E213S94_C13
public import L5.t.E213S94_C14
public import L5.t.E213S94_C15
public import L5.t.E213S94_C16
public import L5.t.E213S94_C17
public import L5.t.E213S94_C18
public import L5.t.E213S94_C19
public import L5.t.E213S94_C20
public import L5.t.E213S94_C21
public import L5.t.E213S94_C22
public import L5.t.E213S94_C23
public import L5.t.E213S94_C24
public import L5.t.E213S94_C25
public import L5.t.E213S94_C26
public import L5.t.E213S94_C27
public import L5.t.E213S94_C28
public import L5.t.E213S94_C29
public import L5.t.E213S94_C30
public import L5.t.E213S94_C31
public import L5.t.E213S94_C32
public import L5.t.E213S94_C33
public import L5.t.E213S94_C34
public import L5.t.E213S94_C35
public import L5.t.E213S94_C36
public import L5.t.E213S94_C37
public import L5.t.E213S94_C38
public import L5.t.E213S94_C39
public import L5.t.E213S94_C40
public import L5.t.E213S94_C41
public import L5.t.E213S94_C42
public import L5.t.E213S94_C43
public import L5.t.E213S94_C44
public import L5.t.E213S94_C45
public import L5.t.E213S94_C46
public import L5.t.E213S94_C47
public import L5.t.E213S94_C48
public import L5.t.E213S94_C49
public import L5.t.E213S94_C50
public import L5.t.E213S94_C51
public import L5.t.E213S94_C52
public import L5.t.E213S94_C53
public import L5.t.E213S94_C54
public import L5.t.E213S94_C55
public import L5.t.E213S94_C56
public import L5.t.E213S94_C57
public import L5.t.E213S94_C58
public import L5.t.E213S94_C59
public import L5.t.E213S94_C60
public import L5.t.E213S94_C61
public import L5.t.E213S94_C62
public import L5.t.E213S94_C63
public import L5.t.E213S94_C64
public import L5.t.E213S94_C65
public import L5.t.E213S94_C66
public import L5.t.E213S94_C67
public import L5.t.E213S94_C68
public import L5.t.E213S94_C69
public import L5.t.E213S94_C70
public import L5.t.E213S94_C71
public import L5.t.E213S94_C72
public import L5.t.E213S94_C73
public import L5.t.E213S94_C74
public import L5.t.E213S94_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S94
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 4520 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 4520 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 44 36 m0 742 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 144 m0 = true :=
    chunkT_join _ _ _ 0 80 64 m0 742 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 144 64 m0 742 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 208 20 m0 742 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 262 m0 = true :=
    chunkT_join _ _ _ 0 228 34 m0 742 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 263 m0 = true :=
    chunkT_join _ _ _ 0 262 1 m0 742 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 288 m0 = true :=
    chunkT_join _ _ _ 0 263 25 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 352 m0 = true :=
    chunkT_join _ _ _ 0 288 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 416 m0 = true :=
    chunkT_join _ _ _ 0 352 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 480 m0 = true :=
    chunkT_join _ _ _ 0 416 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 544 m0 = true :=
    chunkT_join _ _ _ 0 480 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 608 m0 = true :=
    chunkT_join _ _ _ 0 544 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 672 m0 = true :=
    chunkT_join _ _ _ 0 608 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 736 m0 = true :=
    chunkT_join _ _ _ 0 672 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 800 m0 = true :=
    chunkT_join _ _ _ 0 736 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 864 m0 = true :=
    chunkT_join _ _ _ 0 800 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 928 m0 = true :=
    chunkT_join _ _ _ 0 864 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 992 m0 = true :=
    chunkT_join _ _ _ 0 928 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1056 m0 = true :=
    chunkT_join _ _ _ 0 992 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1120 m0 = true :=
    chunkT_join _ _ _ 0 1056 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1184 m0 = true :=
    chunkT_join _ _ _ 0 1120 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1248 m0 = true :=
    chunkT_join _ _ _ 0 1184 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1312 m0 = true :=
    chunkT_join _ _ _ 0 1248 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1376 m0 = true :=
    chunkT_join _ _ _ 0 1312 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1440 m0 = true :=
    chunkT_join _ _ _ 0 1376 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1504 m0 = true :=
    chunkT_join _ _ _ 0 1440 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1568 m0 = true :=
    chunkT_join _ _ _ 0 1504 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1632 m0 = true :=
    chunkT_join _ _ _ 0 1568 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1696 m0 = true :=
    chunkT_join _ _ _ 0 1632 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1760 m0 = true :=
    chunkT_join _ _ _ 0 1696 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1824 m0 = true :=
    chunkT_join _ _ _ 0 1760 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1888 m0 = true :=
    chunkT_join _ _ _ 0 1824 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1952 m0 = true :=
    chunkT_join _ _ _ 0 1888 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 2016 m0 = true :=
    chunkT_join _ _ _ 0 1952 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 2080 m0 = true :=
    chunkT_join _ _ _ 0 2016 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 2144 m0 = true :=
    chunkT_join _ _ _ 0 2080 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 2208 m0 = true :=
    chunkT_join _ _ _ 0 2144 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 2272 m0 = true :=
    chunkT_join _ _ _ 0 2208 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 2336 m0 = true :=
    chunkT_join _ _ _ 0 2272 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 2400 m0 = true :=
    chunkT_join _ _ _ 0 2336 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 2464 m0 = true :=
    chunkT_join _ _ _ 0 2400 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 2528 m0 = true :=
    chunkT_join _ _ _ 0 2464 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 2592 m0 = true :=
    chunkT_join _ _ _ 0 2528 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 2656 m0 = true :=
    chunkT_join _ _ _ 0 2592 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 2720 m0 = true :=
    chunkT_join _ _ _ 0 2656 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2784 m0 = true :=
    chunkT_join _ _ _ 0 2720 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 2848 m0 = true :=
    chunkT_join _ _ _ 0 2784 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 2912 m0 = true :=
    chunkT_join _ _ _ 0 2848 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 2976 m0 = true :=
    chunkT_join _ _ _ 0 2912 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 3040 m0 = true :=
    chunkT_join _ _ _ 0 2976 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 3104 m0 = true :=
    chunkT_join _ _ _ 0 3040 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 3168 m0 = true :=
    chunkT_join _ _ _ 0 3104 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 3232 m0 = true :=
    chunkT_join _ _ _ 0 3168 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 3296 m0 = true :=
    chunkT_join _ _ _ 0 3232 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 3360 m0 = true :=
    chunkT_join _ _ _ 0 3296 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 3424 m0 = true :=
    chunkT_join _ _ _ 0 3360 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 3488 m0 = true :=
    chunkT_join _ _ _ 0 3424 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 3552 m0 = true :=
    chunkT_join _ _ _ 0 3488 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 3616 m0 = true :=
    chunkT_join _ _ _ 0 3552 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 3680 m0 = true :=
    chunkT_join _ _ _ 0 3616 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 3744 m0 = true :=
    chunkT_join _ _ _ 0 3680 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 3808 m0 = true :=
    chunkT_join _ _ _ 0 3744 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 3872 m0 = true :=
    chunkT_join _ _ _ 0 3808 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 3936 m0 = true :=
    chunkT_join _ _ _ 0 3872 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 4000 m0 = true :=
    chunkT_join _ _ _ 0 3936 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 4064 m0 = true :=
    chunkT_join _ _ _ 0 4000 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 4128 m0 = true :=
    chunkT_join _ _ _ 0 4064 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 4192 m0 = true :=
    chunkT_join _ _ _ 0 4128 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 4256 m0 = true :=
    chunkT_join _ _ _ 0 4192 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 4320 m0 = true :=
    chunkT_join _ _ _ 0 4256 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 4384 m0 = true :=
    chunkT_join _ _ _ 0 4320 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 4448 m0 = true :=
    chunkT_join _ _ _ 0 4384 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 4512 m0 = true :=
    chunkT_join _ _ _ 0 4448 64 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 4520 m0 = true :=
    chunkT_join _ _ _ 0 4512 8 m0 4520 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  exact h74
/-- **the leaf has no decomposition** (nested split leaf: main record and 4520 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S94
#print axioms E213S94.leaf
