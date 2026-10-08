module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S45 "data/lean/8a85e7ca85fd070584261879f38bb965/E236S45.bin"
namespace E236S45
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254, 394, 412], [96], 0)], 0, E236S45.L1),
([(10, true, false, [254, 394, 412], [96], 16)], 0, E236S45.L2),
([(10, true, false, [254, 394, 412], [96], 18)], 0, E236S45.L3),
([(10, true, false, [254, 394, 412], [96], 20)], 0, E236S45.L4),
([(10, true, false, [254, 394, 412], [96], 23)], 0, E236S45.L5),
([(10, true, false, [254, 394, 412], [96], 25)], 0, E236S45.L6),
([(10, true, false, [254, 394, 412], [96], 35)], 0, E236S45.L7),
([(10, true, false, [254, 394, 412], [96], 49)], 0, E236S45.L8),
([(10, true, false, [254, 394, 412], [96], 50)], 0, E236S45.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E236S45
