module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S237_C0
public import L5.t.E284S237_C1
public import L5.t.E284S237_C2
public import L5.t.E284S237_C3
public import L5.t.E284S237_C4
public import L5.t.E284S237_C5
public import L5.t.E284S237_C6
public import L5.t.E284S237_C7
public import L5.t.E284S237_C8
public import L5.t.E284S237_C9
public import L5.t.E284S237_C10
public import L5.t.E284S237_C11
public import L5.t.E284S237_C12
public import L5.t.E284S237_C13
public import L5.t.E284S237_C14
public import L5.t.E284S237_C15
public import L5.t.E284S237_C16
public import L5.t.E284S237_C17
public import L5.t.E284S237_C18
public import L5.t.E284S237_C19
public import L5.t.E284S237_C20
public import L5.t.E284S237_C21
public import L5.t.E284S237_C22
public import L5.t.E284S237_C23
public import L5.t.E284S237_C24
public import L5.t.E284S237_C25
public import L5.t.E284S237_C26
public import L5.t.E284S237_C27
public import L5.t.E284S237_C28
public import L5.t.E284S237_C29
public import L5.t.E284S237_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S237
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1732 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1732 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 64 34 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 137 m0 = true :=
    chunkT_join _ _ _ 0 98 39 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 137 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 265 m0 = true :=
    chunkT_join _ _ _ 0 201 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 320 m0 = true :=
    chunkT_join _ _ _ 0 265 55 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 352 m0 = true :=
    chunkT_join _ _ _ 0 320 32 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 403 m0 = true :=
    chunkT_join _ _ _ 0 352 51 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 467 m0 = true :=
    chunkT_join _ _ _ 0 403 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 531 m0 = true :=
    chunkT_join _ _ _ 0 467 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 595 m0 = true :=
    chunkT_join _ _ _ 0 531 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 659 m0 = true :=
    chunkT_join _ _ _ 0 595 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 723 m0 = true :=
    chunkT_join _ _ _ 0 659 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 787 m0 = true :=
    chunkT_join _ _ _ 0 723 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 851 m0 = true :=
    chunkT_join _ _ _ 0 787 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 915 m0 = true :=
    chunkT_join _ _ _ 0 851 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 979 m0 = true :=
    chunkT_join _ _ _ 0 915 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 1043 m0 = true :=
    chunkT_join _ _ _ 0 979 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 1107 m0 = true :=
    chunkT_join _ _ _ 0 1043 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1171 m0 = true :=
    chunkT_join _ _ _ 0 1107 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1204 m0 = true :=
    chunkT_join _ _ _ 0 1171 33 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1255 m0 = true :=
    chunkT_join _ _ _ 0 1204 51 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1300 m0 = true :=
    chunkT_join _ _ _ 0 1255 45 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1364 m0 = true :=
    chunkT_join _ _ _ 0 1300 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1428 m0 = true :=
    chunkT_join _ _ _ 0 1364 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1492 m0 = true :=
    chunkT_join _ _ _ 0 1428 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1556 m0 = true :=
    chunkT_join _ _ _ 0 1492 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1620 m0 = true :=
    chunkT_join _ _ _ 0 1556 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1684 m0 = true :=
    chunkT_join _ _ _ 0 1620 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1732 m0 = true :=
    chunkT_join _ _ _ 0 1684 48 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  exact h29
/-- **the leaf has no decomposition** (nested split leaf: main record and 1732 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S237
#print axioms E284S237.leaf
