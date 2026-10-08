module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S41_C0
public import L5.t.E212S41_C1
public import L5.t.E212S41_C2
public import L5.t.E212S41_C3
public import L5.t.E212S41_C4
public import L5.t.E212S41_C5
public import L5.t.E212S41_C6
public import L5.t.E212S41_C7
public import L5.t.E212S41_C8
public import L5.t.E212S41_C9
public import L5.t.E212S41_C10
public import L5.t.E212S41_C11
public import L5.t.E212S41_C12
public import L5.t.E212S41_C13
public import L5.t.E212S41_C14
public import L5.t.E212S41_C15
public import L5.t.E212S41_C16
public import L5.t.E212S41_C17
public import L5.t.E212S41_C18
public import L5.t.E212S41_C19
public import L5.t.E212S41_C20
public import L5.t.E212S41_C21
public import L5.t.E212S41_C22
public import L5.t.E212S41_C23
public import L5.t.E212S41_C24
public import L5.t.E212S41_C25
public import L5.t.E212S41_C26
public import L5.t.E212S41_C27
public import L5.t.E212S41_C28
public import L5.t.E212S41_C29
public import L5.t.E212S41_C30
public import L5.t.E212S41_C31
public import L5.t.E212S41_C32
public import L5.t.E212S41_C33
public import L5.t.E212S41_C34
public import L5.t.E212S41_C35
public import L5.t.E212S41_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S41
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2344 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2344 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true :=
    chunkT_join _ _ _ 0 4 4 m0 111 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 8 7 m0 111 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 15 1 m0 111 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 19 m0 = true :=
    chunkT_join _ _ _ 0 16 3 m0 813 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 19 1 m0 813 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 20 4 m0 817 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 24 8 m0 817 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 32 1 m0 817 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 33 2 m0 1445 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 35 1 m0 1445 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 36 6 m0 1447 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 42 1 m0 1447 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 43 7 m0 1913 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 50 1 m0 1913 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 59 m0 = true :=
    chunkT_join _ _ _ 0 51 8 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 59 9 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 68 3 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 71 2 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 73 3 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 76 7 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 83 9 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 102 m0 = true :=
    chunkT_join _ _ _ 0 92 10 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 146 m0 = true :=
    chunkT_join _ _ _ 0 102 44 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 348 m0 = true :=
    chunkT_join _ _ _ 0 146 202 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 533 m0 = true :=
    chunkT_join _ _ _ 0 348 185 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 711 m0 = true :=
    chunkT_join _ _ _ 0 533 178 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 900 m0 = true :=
    chunkT_join _ _ _ 0 711 189 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1114 m0 = true :=
    chunkT_join _ _ _ 0 900 214 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1291 m0 = true :=
    chunkT_join _ _ _ 0 1114 177 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1457 m0 = true :=
    chunkT_join _ _ _ 0 1291 166 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1684 m0 = true :=
    chunkT_join _ _ _ 0 1457 227 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1872 m0 = true :=
    chunkT_join _ _ _ 0 1684 188 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 2114 m0 = true :=
    chunkT_join _ _ _ 0 1872 242 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 2273 m0 = true :=
    chunkT_join _ _ _ 0 2114 159 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 2344 m0 = true :=
    chunkT_join _ _ _ 0 2273 71 m0 2344 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  exact h35
/-- **the leaf has no decomposition** (nested split leaf: main record and 2344 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S41
#print axioms E212S41.leaf
