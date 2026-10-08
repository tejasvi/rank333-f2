module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S345 "data/lean/c782db89be876804e6d5c81328dd1d65/E236S345.bin"
namespace E236S345
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [254, 354, 372, 158], [], 0)], 0, E236S345.L1),
([(11, true, false, [254, 354, 372, 158], [], 30)], 0, E236S345.L2),
([(11, true, false, [254, 354, 372, 158], [], 36)], 0, E236S345.L3),
([(11, true, false, [254, 354, 372, 158], [], 38)], 0, E236S345.L4),
([(11, true, false, [254, 354, 372, 158], [], 51)], 0, E236S345.L5),
([(11, true, false, [254, 354, 372, 158], [], 88)], 0, E236S345.L6),
([(11, true, false, [254, 354, 372, 158], [], 130)], 0, E236S345.L7),
([(11, true, false, [254, 354, 372, 158], [], 199)], 0, E236S345.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S345
