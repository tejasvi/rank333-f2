module
public import R22Port.U_d41d8cd98f00
public import L5.t.E150S6_C0
public import L5.t.E150S6_C1
public import L5.t.E150S6_C2
public import L5.t.E150S6_C3
public import L5.t.E150S6_C4
public import L5.t.E150S6_C5
public import L5.t.E150S6_C6
public import L5.t.E150S6_C7
public import L5.t.E150S6_C8
public import L5.t.E150S6_C9
public import L5.t.E150S6_C10
public import L5.t.E150S6_C11
public import L5.t.E150S6_C12
public import L5.t.E150S6_C13
public import L5.t.E150S6_C14
public import L5.t.E150S6_C15
public import L5.t.E150S6_C16
public import L5.t.E150S6_C17
public import L5.t.E150S6_C18
public import L5.t.E150S6_C19
public import L5.t.E150S6_C20
public import L5.t.E150S6_C21
public import L5.t.E150S6_C22
public import L5.t.E150S6_C23
public import L5.t.E150S6_C24
public import L5.t.E150S6_C25
public import L5.t.E150S6_C26
public import L5.t.E150S6_C27
public import L5.t.E150S6_C28
public import L5.t.E150S6_C29
public import L5.t.E150S6_C30
public import L5.t.E150S6_C31
public import L5.t.E150S6_C32
public import L5.t.E150S6_C33
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace E150S6
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) paths = true := by decide +kernel
theorem subsAll : subsChk (lits.getD 0 0) paths lits.tail 0 2079 = true := by
  have h0 : subsChk (lits.getD 0 0) paths lits.tail 0 25 = true := ok0
  have h1 : subsChk (lits.getD 0 0) paths lits.tail 0 101 = true := subsChk_join _ _ _ 0 25 76 h0 ok1
  have h2 : subsChk (lits.getD 0 0) paths lits.tail 0 127 = true := subsChk_join _ _ _ 0 101 26 h1 ok2
  have h3 : subsChk (lits.getD 0 0) paths lits.tail 0 203 = true := subsChk_join _ _ _ 0 127 76 h2 ok3
  have h4 : subsChk (lits.getD 0 0) paths lits.tail 0 324 = true := subsChk_join _ _ _ 0 203 121 h3 ok4
  have h5 : subsChk (lits.getD 0 0) paths lits.tail 0 327 = true := subsChk_join _ _ _ 0 324 3 h4 ok5
  have h6 : subsChk (lits.getD 0 0) paths lits.tail 0 330 = true := subsChk_join _ _ _ 0 327 3 h5 ok6
  have h7 : subsChk (lits.getD 0 0) paths lits.tail 0 337 = true := subsChk_join _ _ _ 0 330 7 h6 ok7
  have h8 : subsChk (lits.getD 0 0) paths lits.tail 0 346 = true := subsChk_join _ _ _ 0 337 9 h7 ok8
  have h9 : subsChk (lits.getD 0 0) paths lits.tail 0 353 = true := subsChk_join _ _ _ 0 346 7 h8 ok9
  have h10 : subsChk (lits.getD 0 0) paths lits.tail 0 357 = true := subsChk_join _ _ _ 0 353 4 h9 ok10
  have h11 : subsChk (lits.getD 0 0) paths lits.tail 0 364 = true := subsChk_join _ _ _ 0 357 7 h10 ok11
  have h12 : subsChk (lits.getD 0 0) paths lits.tail 0 374 = true := subsChk_join _ _ _ 0 364 10 h11 ok12
  have h13 : subsChk (lits.getD 0 0) paths lits.tail 0 402 = true := subsChk_join _ _ _ 0 374 28 h12 ok13
  have h14 : subsChk (lits.getD 0 0) paths lits.tail 0 455 = true := subsChk_join _ _ _ 0 402 53 h13 ok14
  have h15 : subsChk (lits.getD 0 0) paths lits.tail 0 549 = true := subsChk_join _ _ _ 0 455 94 h14 ok15
  have h16 : subsChk (lits.getD 0 0) paths lits.tail 0 598 = true := subsChk_join _ _ _ 0 549 49 h15 ok16
  have h17 : subsChk (lits.getD 0 0) paths lits.tail 0 608 = true := subsChk_join _ _ _ 0 598 10 h16 ok17
  have h18 : subsChk (lits.getD 0 0) paths lits.tail 0 620 = true := subsChk_join _ _ _ 0 608 12 h17 ok18
  have h19 : subsChk (lits.getD 0 0) paths lits.tail 0 632 = true := subsChk_join _ _ _ 0 620 12 h18 ok19
  have h20 : subsChk (lits.getD 0 0) paths lits.tail 0 654 = true := subsChk_join _ _ _ 0 632 22 h19 ok20
  have h21 : subsChk (lits.getD 0 0) paths lits.tail 0 701 = true := subsChk_join _ _ _ 0 654 47 h20 ok21
  have h22 : subsChk (lits.getD 0 0) paths lits.tail 0 762 = true := subsChk_join _ _ _ 0 701 61 h21 ok22
  have h23 : subsChk (lits.getD 0 0) paths lits.tail 0 890 = true := subsChk_join _ _ _ 0 762 128 h22 ok23
  have h24 : subsChk (lits.getD 0 0) paths lits.tail 0 1048 = true := subsChk_join _ _ _ 0 890 158 h23 ok24
  have h25 : subsChk (lits.getD 0 0) paths lits.tail 0 1191 = true := subsChk_join _ _ _ 0 1048 143 h24 ok25
  have h26 : subsChk (lits.getD 0 0) paths lits.tail 0 1258 = true := subsChk_join _ _ _ 0 1191 67 h25 ok26
  have h27 : subsChk (lits.getD 0 0) paths lits.tail 0 1365 = true := subsChk_join _ _ _ 0 1258 107 h26 ok27
  have h28 : subsChk (lits.getD 0 0) paths lits.tail 0 1424 = true := subsChk_join _ _ _ 0 1365 59 h27 ok28
  have h29 : subsChk (lits.getD 0 0) paths lits.tail 0 1529 = true := subsChk_join _ _ _ 0 1424 105 h28 ok29
  have h30 : subsChk (lits.getD 0 0) paths lits.tail 0 1603 = true := subsChk_join _ _ _ 0 1529 74 h29 ok30
  have h31 : subsChk (lits.getD 0 0) paths lits.tail 0 1810 = true := subsChk_join _ _ _ 0 1603 207 h30 ok31
  have h32 : subsChk (lits.getD 0 0) paths lits.tail 0 1907 = true := subsChk_join _ _ _ 0 1810 97 h31 ok32
  have h33 : subsChk (lits.getD 0 0) paths lits.tail 0 2079 = true := subsChk_join _ _ _ 0 1907 172 h32 ok33
  exact h33
theorem lenP : paths.length = 2079 := by decide
theorem lenC : lits.tail.length = 2079 := by decide
/-- **the leaf has no decomposition** (split leaf: main record and 2079 sub-records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  leafSplit_sound' _ paths lits.tail (by rw [lenP, lenC]) main (by rw [lenP]; exact subsAll)
end E150S6
#print axioms E150S6.leaf
