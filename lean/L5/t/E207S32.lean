module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S32_C0
public import L5.t.E207S32_C1
public import L5.t.E207S32_C2
public import L5.t.E207S32_C3
public import L5.t.E207S32_C4
public import L5.t.E207S32_C5
public import L5.t.E207S32_C6
public import L5.t.E207S32_C7
public import L5.t.E207S32_C8
public import L5.t.E207S32_C9
public import L5.t.E207S32_C10
public import L5.t.E207S32_C11
public import L5.t.E207S32_C12
public import L5.t.E207S32_C13
public import L5.t.E207S32_C14
public import L5.t.E207S32_C15
public import L5.t.E207S32_C16
public import L5.t.E207S32_C17
public import L5.t.E207S32_C18
public import L5.t.E207S32_C19
public import L5.t.E207S32_C20
public import L5.t.E207S32_C21
public import L5.t.E207S32_C22
public import L5.t.E207S32_C23
public import L5.t.E207S32_C24
public import L5.t.E207S32_C25
public import L5.t.E207S32_C26
public import L5.t.E207S32_C27
public import L5.t.E207S32_C28
public import L5.t.E207S32_C29
public import L5.t.E207S32_C30
public import L5.t.E207S32_C31
public import L5.t.E207S32_C32
public import L5.t.E207S32_C33
public import L5.t.E207S32_C34
public import L5.t.E207S32_C35
public import L5.t.E207S32_C36
public import L5.t.E207S32_C37
public import L5.t.E207S32_C38
public import L5.t.E207S32_C39
public import L5.t.E207S32_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S32
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1658 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1658 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 3 15 m0 864 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 18 63 m0 864 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 81 61 m0 864 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 165 m0 = true :=
    chunkT_join _ _ _ 0 142 23 m0 864 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 189 m0 = true :=
    chunkT_join _ _ _ 0 165 24 m0 864 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 189 1 m0 864 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 190 24 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 252 m0 = true :=
    chunkT_join _ _ _ 0 214 38 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 254 m0 = true :=
    chunkT_join _ _ _ 0 252 2 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 294 m0 = true :=
    chunkT_join _ _ _ 0 254 40 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 358 m0 = true :=
    chunkT_join _ _ _ 0 294 64 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 412 m0 = true :=
    chunkT_join _ _ _ 0 358 54 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 413 m0 = true :=
    chunkT_join _ _ _ 0 412 1 m0 1261 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 416 m0 = true :=
    chunkT_join _ _ _ 0 413 3 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 419 m0 = true :=
    chunkT_join _ _ _ 0 416 3 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 423 m0 = true :=
    chunkT_join _ _ _ 0 419 4 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 430 m0 = true :=
    chunkT_join _ _ _ 0 423 7 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 438 m0 = true :=
    chunkT_join _ _ _ 0 430 8 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 443 m0 = true :=
    chunkT_join _ _ _ 0 438 5 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 462 m0 = true :=
    chunkT_join _ _ _ 0 443 19 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 515 m0 = true :=
    chunkT_join _ _ _ 0 462 53 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 579 m0 = true :=
    chunkT_join _ _ _ 0 515 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 643 m0 = true :=
    chunkT_join _ _ _ 0 579 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 707 m0 = true :=
    chunkT_join _ _ _ 0 643 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 771 m0 = true :=
    chunkT_join _ _ _ 0 707 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 835 m0 = true :=
    chunkT_join _ _ _ 0 771 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 899 m0 = true :=
    chunkT_join _ _ _ 0 835 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 963 m0 = true :=
    chunkT_join _ _ _ 0 899 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1027 m0 = true :=
    chunkT_join _ _ _ 0 963 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1091 m0 = true :=
    chunkT_join _ _ _ 0 1027 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1155 m0 = true :=
    chunkT_join _ _ _ 0 1091 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1219 m0 = true :=
    chunkT_join _ _ _ 0 1155 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1283 m0 = true :=
    chunkT_join _ _ _ 0 1219 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1347 m0 = true :=
    chunkT_join _ _ _ 0 1283 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1411 m0 = true :=
    chunkT_join _ _ _ 0 1347 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1475 m0 = true :=
    chunkT_join _ _ _ 0 1411 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1539 m0 = true :=
    chunkT_join _ _ _ 0 1475 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1603 m0 = true :=
    chunkT_join _ _ _ 0 1539 64 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1658 m0 = true :=
    chunkT_join _ _ _ 0 1603 55 m0 1658 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  exact h39
/-- **the leaf has no decomposition** (nested split leaf: main record and 1658 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S32
#print axioms E207S32.leaf
