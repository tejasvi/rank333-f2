module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S104 "data/lean/2a0f03a307e1044af7a75c10d79ef6e8/E236S104.bin"
namespace E236S104
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254], [96, 118], 1)], 0, E236S104.L1),
([(10, true, false, [254], [96, 118], 4)], 0, E236S104.L2),
([(10, true, false, [254], [96, 118], 14)], 0, E236S104.L3),
([(10, true, false, [254], [96, 118], 18)], 0, E236S104.L4),
([(10, true, false, [254], [96, 118], 25)], 0, E236S104.L5),
([(10, true, false, [254], [96, 118], 29)], 0, E236S104.L6),
([(10, true, false, [254], [96, 118], 37)], 0, E236S104.L7),
([(10, true, false, [254], [96, 118], 48)], 0, E236S104.L8),
([(10, true, false, [254], [96, 118], 60)], 0, E236S104.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E236S104
