module
public import R22Port.U_d41d8cd98f00
public import E1.C336X_Lits
public import E1.AsmG
@[expose] public section
set_option maxRecDepth 10000000
set_option maxHeartbeats 0
/-! # Glue witnesses of the chain `C336X`: header record `j` of block `i` is glued to block `W[i][j]` -/
namespace E1.C336X
def W : List (List Nat) := [[1], [2], [3], [4, 8], [5], [6], [7], [], [9], [10], []]
end E1.C336X
