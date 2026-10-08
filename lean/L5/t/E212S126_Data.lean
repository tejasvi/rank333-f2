module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S126 "data/lean/218aa433038b9fbbe153a4e5defd56a9/E212S126.bin"
namespace E212S126
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 266], [228], 7)], 0, E212S126.L1),
([(4, true, false, [254, 266], [228], 37)], 0, E212S126.L2),
([(4, true, false, [254, 266], [228], 49)], 0, E212S126.L3),
([(4, true, false, [254, 266], [228], 72)], 0, E212S126.L4),
([(4, true, false, [254, 266], [228], 73)], 0, E212S126.L5),
([(4, true, false, [254, 266], [228], 77)], 0, E212S126.L6),
([(4, true, false, [254, 266], [228], 137)], 0, E212S126.L7),
([(4, true, false, [254, 266], [228], 149)], 0, E212S126.L8),
([(4, true, false, [254, 266], [228], 164)], 0, E212S126.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E212S126
