module
public import R22Port.U_d41d8cd98f00
public import E1.C281X_Lits
public import E1.AsmG
@[expose] public section
set_option maxRecDepth 10000000
set_option maxHeartbeats 0
/-! # Glue witnesses of the chain `C281X`: header record `j` of block `i` is glued to block `W[i][j]` -/
namespace E1.C281X
def W : List (List Nat) := [[1], [2, 29], [3, 12], [4], [5], [6], [7], [8], [9], [10], [11], [], [13], [14, 27], [15], [16], [17, 24], [18], [19], [20], [21], [22, 23], [], [], [25, 26], [], [], [28], [], [30], [31], [32], [33], [34], []]
end E1.C281X
