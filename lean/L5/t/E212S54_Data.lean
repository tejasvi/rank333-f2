module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S54 "data/lean/3b5e5d59b664d520707eaed32112e886/E212S54.bin"
namespace E212S54
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [254, 494], [96, 368], 16)], 0, E212S54.L1),
([(6, true, false, [254, 494], [96, 368], 19)], 0, E212S54.L2),
([(6, true, false, [254, 494], [96, 368], 21)], 0, E212S54.L3),
([(6, true, false, [254, 494], [96, 368], 24)], 0, E212S54.L4),
([(6, true, false, [254, 494], [96, 368], 30)], 0, E212S54.L5),
([(6, true, false, [254, 494], [96, 368], 32)], 0, E212S54.L6),
([(6, true, false, [254, 494], [96, 368], 69)], 0, E212S54.L7),
([(6, true, false, [254, 494], [96, 368], 74)], 0, E212S54.L8),
([(6, true, false, [254, 494], [96, 368], 76)], 0, E212S54.L9),
([(6, true, false, [254, 494], [96, 368], 78)], 0, E212S54.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E212S54
