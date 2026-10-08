module
public import R22Port.U_d41d8cd98f00
public import E1.C379X_Lits
public import E1.AsmG
@[expose] public section
set_option maxRecDepth 10000000
set_option maxHeartbeats 0
/-! # Glue witnesses of the chain `C379X`: header record `j` of block `i` is glued to block `W[i][j]` -/
namespace E1.C379X
def W : List (List Nat) := [[1], [2, 7], [3], [4], [5], [6], [], [8, 37], [9], [10, 16], [11], [12, 15], [13], [14], [], [], [17, 34], [18], [19], [20, 30], [21], [22], [23], [24], [25], [26], [27], [28], [29], [], [31], [32], [33], [], [35], [36], [], [38], [39], [40], [41], [42], [43], [44], [45], []]
end E1.C379X
