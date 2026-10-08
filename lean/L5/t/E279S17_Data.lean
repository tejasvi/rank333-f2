module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S17 "data/lean/f440d2e6a2e66627b1bacfd9740e30c4/E279S17.bin"
namespace E279S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [], [], 51)], 0, E279S17.L1),
([(5, true, false, [], [], 53)], 0, E279S17.L2),
([(5, true, false, [], [], 101)], 0, E279S17.L3),
([(5, true, false, [], [], 102)], 0, E279S17.L4),
([(5, true, false, [], [], 116)], 0, E279S17.L5),
([(5, true, false, [], [], 125)], 0, E279S17.L6),
([(5, true, false, [], [], 324)], 0, E279S17.L7),
([(5, true, false, [], [], 326)], 0, E279S17.L8),
([(5, true, false, [], [], 328)], 0, E279S17.L9),
([(5, true, false, [], [], 599)], 0, E279S17.L10),
([(5, true, false, [], [], 601)], 0, E279S17.L11),
([(5, true, false, [], [], 647)], 0, E279S17.L12),
([(5, true, false, [], [], 648)], 0, E279S17.L13),
([(5, true, false, [], [], 907)], 0, E279S17.L14),
([(5, true, false, [], [], 912)], 0, E279S17.L15),
([(5, true, false, [], [], 1257)], 0, E279S17.L16),
([(5, true, false, [], [], 1262)], 0, E279S17.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E279S17
