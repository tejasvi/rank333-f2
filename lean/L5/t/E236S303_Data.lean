module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S303 "data/lean/183284a20b605cfbe820099aa225737b/E236S303.bin"
namespace E236S303
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354, 372, 394, 158], [], 5)], 0, E236S303.L1),
([(6, true, false, [354, 372, 394, 158], [], 12)], 0, E236S303.L2),
([(6, true, false, [354, 372, 394, 158], [], 44)], 0, E236S303.L3),
([(6, true, false, [354, 372, 394, 158], [], 83)], 0, E236S303.L4),
([(6, true, false, [354, 372, 394, 158], [], 88)], 0, E236S303.L5),
([(6, true, false, [354, 372, 394, 158], [], 89)], 0, E236S303.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S303
