module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S86_C0
public import L5.t.E236S86_C1
public import L5.t.E236S86_C2
public import L5.t.E236S86_C3
public import L5.t.E236S86_C4
public import L5.t.E236S86_C5
public import L5.t.E236S86_C6
public import L5.t.E236S86_C7
public import L5.t.E236S86_C8
public import L5.t.E236S86_C9
public import L5.t.E236S86_C10
public import L5.t.E236S86_C11
public import L5.t.E236S86_C12
public import L5.t.E236S86_C13
public import L5.t.E236S86_C14
public import L5.t.E236S86_C15
public import L5.t.E236S86_C16
public import L5.t.E236S86_C17
public import L5.t.E236S86_C18
public import L5.t.E236S86_C19
public import L5.t.E236S86_C20
public import L5.t.E236S86_C21
public import L5.t.E236S86_C22
public import L5.t.E236S86_C23
public import L5.t.E236S86_C24
public import L5.t.E236S86_C25
public import L5.t.E236S86_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S86
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1084 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1084 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 36 1 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 37 15 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 52 16 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 101 m0 = true :=
    chunkT_join _ _ _ 0 68 33 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 154 m0 = true :=
    chunkT_join _ _ _ 0 101 53 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 154 55 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 209 25 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true :=
    chunkT_join _ _ _ 0 234 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 319 m0 = true :=
    chunkT_join _ _ _ 0 298 21 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 337 m0 = true :=
    chunkT_join _ _ _ 0 319 18 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 355 m0 = true :=
    chunkT_join _ _ _ 0 337 18 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 368 m0 = true :=
    chunkT_join _ _ _ 0 355 13 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 390 m0 = true :=
    chunkT_join _ _ _ 0 368 22 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 454 m0 = true :=
    chunkT_join _ _ _ 0 390 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 518 m0 = true :=
    chunkT_join _ _ _ 0 454 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 582 m0 = true :=
    chunkT_join _ _ _ 0 518 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 624 m0 = true :=
    chunkT_join _ _ _ 0 582 42 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 688 m0 = true :=
    chunkT_join _ _ _ 0 624 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 752 m0 = true :=
    chunkT_join _ _ _ 0 688 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 816 m0 = true :=
    chunkT_join _ _ _ 0 752 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 880 m0 = true :=
    chunkT_join _ _ _ 0 816 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 944 m0 = true :=
    chunkT_join _ _ _ 0 880 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1008 m0 = true :=
    chunkT_join _ _ _ 0 944 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1072 m0 = true :=
    chunkT_join _ _ _ 0 1008 64 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1084 m0 = true :=
    chunkT_join _ _ _ 0 1072 12 m0 1084 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  exact h25
/-- **the leaf has no decomposition** (nested split leaf: main record and 1084 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S86
#print axioms E236S86.leaf
