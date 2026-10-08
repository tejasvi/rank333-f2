module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S18 "data/lean/b938cfc3d44a4414639669fe53f60a9f/E237S18.bin"
namespace E237S18
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [116, 354], [392], 0)], 0, E237S18.L1),
([(8, true, false, [116, 354], [392], 10)], 0, E237S18.L2),
([(8, true, false, [116, 354], [392], 11)], 0, E237S18.L3),
([(8, true, false, [116, 354], [392], 16)], 0, E237S18.L4),
([(8, true, false, [116, 354], [392], 43)], 0, E237S18.L5),
([(8, true, false, [116, 354], [392], 61)], 0, E237S18.L6),
([(8, true, false, [116, 354], [392], 118)], 0, E237S18.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E237S18
