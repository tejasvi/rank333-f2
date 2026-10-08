module
public import R22Port.U_d41d8cd98f00
public import E1.C292X_Lits
public import E1.AsmG
@[expose] public section
set_option maxRecDepth 10000000
set_option maxHeartbeats 0
/-! # Glue witnesses of the chain `C292X`: header record `j` of block `i` is glued to block `W[i][j]` -/
namespace E1.C292X
def W : List (List Nat) := [[1], [2], [3, 11], [4], [5, 10], [6], [7], [8, 9], [], [], [], [12, 15], [13, 14], [], [], []]
end E1.C292X
