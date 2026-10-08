module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S235_C0
public import L5.t.E284S235_C1
public import L5.t.E284S235_C2
public import L5.t.E284S235_C3
public import L5.t.E284S235_C4
public import L5.t.E284S235_C5
public import L5.t.E284S235_C6
public import L5.t.E284S235_C7
public import L5.t.E284S235_C8
public import L5.t.E284S235_C9
public import L5.t.E284S235_C10
public import L5.t.E284S235_C11
public import L5.t.E284S235_C12
public import L5.t.E284S235_C13
public import L5.t.E284S235_C14
public import L5.t.E284S235_C15
public import L5.t.E284S235_C16
public import L5.t.E284S235_C17
public import L5.t.E284S235_C18
public import L5.t.E284S235_C19
public import L5.t.E284S235_C20
public import L5.t.E284S235_C21
public import L5.t.E284S235_C22
public import L5.t.E284S235_C23
public import L5.t.E284S235_C24
public import L5.t.E284S235_C25
public import L5.t.E284S235_C26
public import L5.t.E284S235_C27
public import L5.t.E284S235_C28
public import L5.t.E284S235_C29
public import L5.t.E284S235_C30
public import L5.t.E284S235_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S235
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1732 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1732 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 64 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 128 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 256 m0 = true :=
    chunkT_join _ _ _ 0 192 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 289 m0 = true :=
    chunkT_join _ _ _ 0 256 33 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 321 m0 = true :=
    chunkT_join _ _ _ 0 289 32 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 321 57 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 442 m0 = true :=
    chunkT_join _ _ _ 0 378 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 491 m0 = true :=
    chunkT_join _ _ _ 0 442 49 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 525 m0 = true :=
    chunkT_join _ _ _ 0 491 34 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 566 m0 = true :=
    chunkT_join _ _ _ 0 525 41 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 630 m0 = true :=
    chunkT_join _ _ _ 0 566 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 694 m0 = true :=
    chunkT_join _ _ _ 0 630 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 758 m0 = true :=
    chunkT_join _ _ _ 0 694 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 822 m0 = true :=
    chunkT_join _ _ _ 0 758 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 886 m0 = true :=
    chunkT_join _ _ _ 0 822 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 918 m0 = true :=
    chunkT_join _ _ _ 0 886 32 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 946 m0 = true :=
    chunkT_join _ _ _ 0 918 28 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 1010 m0 = true :=
    chunkT_join _ _ _ 0 946 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1050 m0 = true :=
    chunkT_join _ _ _ 0 1010 40 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1114 m0 = true :=
    chunkT_join _ _ _ 0 1050 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1178 m0 = true :=
    chunkT_join _ _ _ 0 1114 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 1242 m0 = true :=
    chunkT_join _ _ _ 0 1178 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1306 m0 = true :=
    chunkT_join _ _ _ 0 1242 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1370 m0 = true :=
    chunkT_join _ _ _ 0 1306 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 1434 m0 = true :=
    chunkT_join _ _ _ 0 1370 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 1498 m0 = true :=
    chunkT_join _ _ _ 0 1434 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1562 m0 = true :=
    chunkT_join _ _ _ 0 1498 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1626 m0 = true :=
    chunkT_join _ _ _ 0 1562 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1690 m0 = true :=
    chunkT_join _ _ _ 0 1626 64 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1732 m0 = true :=
    chunkT_join _ _ _ 0 1690 42 m0 1732 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  exact h30
/-- **the leaf has no decomposition** (nested split leaf: main record and 1732 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S235
#print axioms E284S235.leaf
