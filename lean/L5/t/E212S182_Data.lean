module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S182 "data/lean/dd40b6e598b7f8f843ebcd003564f429/E212S182.bin"
namespace E212S182
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 254, 266, 122, 494], [], 10)], 0, E212S182.L1),
([(5, true, false, [158, 254, 266, 122, 494], [], 11)], 0, E212S182.L2),
([(5, true, false, [158, 254, 266, 122, 494], [], 12)], 0, E212S182.L3),
([(5, true, false, [158, 254, 266, 122, 494], [], 63)], 0, E212S182.L4),
([(5, true, false, [158, 254, 266, 122, 494], [], 67)], 0, E212S182.L5),
([(5, true, false, [158, 254, 266, 122, 494], [], 72)], 0, E212S182.L6),
([(5, true, false, [158, 254, 266, 122, 494], [], 78)], 0, E212S182.L7),
([(5, true, false, [158, 254, 266, 122, 494], [], 160)], 0, E212S182.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E212S182
