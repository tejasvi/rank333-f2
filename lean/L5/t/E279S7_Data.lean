module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S7 "data/lean/bdaf58b4689fcc95911b54a3c348ecd8/E279S7.bin"
namespace E279S7
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266, 394], [], 2)], 0, E279S7.L1),
([(4, true, false, [266, 394], [], 42)], 0, E279S7.L2),
([(4, true, false, [266, 394], [], 43)], 0, E279S7.L3),
([(4, true, false, [266, 394], [], 84)], 0, E279S7.L4),
([(4, true, false, [266, 394], [], 148)], 0, E279S7.L5),
([(4, true, false, [266, 394], [], 149)], 0, E279S7.L6),
([(4, true, false, [266, 394], [], 150)], 0, E279S7.L7),
([(4, true, false, [266, 394], [], 151)], 0, E279S7.L8),
([(4, true, false, [266, 394], [], 152)], 0, E279S7.L9),
([(4, true, false, [266, 394], [], 153)], 0, E279S7.L10),
([(4, true, false, [266, 394], [], 154)], 0, E279S7.L11),
([(4, true, false, [266, 394], [], 155)], 0, E279S7.L12),
([(4, true, false, [266, 394], [], 157)], 0, E279S7.L13),
([(4, true, false, [266, 394], [], 169)], 0, E279S7.L14),
([(4, true, false, [266, 394], [], 180)], 0, E279S7.L15),
([(4, true, false, [266, 394], [], 392)], 0, E279S7.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E279S7
