module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E404S2 "data/lean/4dbb03b06227a1d891de4ca05c902e33/E404S2.bin"
namespace E404S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [], [], 50)], 0, E404S2.L1),
([(2, true, false, [], [], 51)], 0, E404S2.L2),
([(2, true, false, [], [], 54)], 0, E404S2.L3),
([(2, true, false, [], [], 103)], 0, E404S2.L4),
([(2, true, false, [], [], 371)], 0, E404S2.L5),
([(2, true, false, [], [], 596)], 0, E404S2.L6),
([(2, true, false, [], [], 600)], 0, E404S2.L7),
([(2, true, false, [], [], 601)], 0, E404S2.L8),
([(2, true, false, [], [], 645)], 0, E404S2.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E404S2
