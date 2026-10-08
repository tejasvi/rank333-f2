module
public import R22Port.U_d41d8cd98f00
public import E1.C232X_Lits
public import E1.AsmG
@[expose] public section
set_option maxRecDepth 10000000
set_option maxHeartbeats 0
/-! # Glue witnesses of the chain `C232X`: header record `j` of block `i` is glued to block `W[i][j]` -/
namespace E1.C232X
def W : List (List Nat) := [[1], [2], [3, 17], [4, 13, 16], [5], [6, 9], [7], [8], [], [10, 12], [11], [], [], [14, 15], [], [], [], [18, 38], [19], [20, 27], [21], [22, 26], [23], [24], [25], [], [], [28], [29, 35], [30], [31], [32], [33], [34], [], [36], [37], [], [39, 43], [40], [41], [42], [], [44], [45], [46], [47], [48], [49], [50], [51], []]
end E1.C232X
