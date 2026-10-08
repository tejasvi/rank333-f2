module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S126 "data/lean/7352a4926af40ac54ee222bc77d07182/E236S126.bin"
namespace E236S126
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [254, 372, 412], [22], 0)], 0, E236S126.L1),
([(5, true, false, [254, 372, 412], [22], 11)], 0, E236S126.L2),
([(5, true, false, [254, 372, 412], [22], 17)], 0, E236S126.L3),
([(5, true, false, [254, 372, 412], [22], 25)], 0, E236S126.L4),
([(5, true, false, [254, 372, 412], [22], 26)], 0, E236S126.L5),
([(5, true, false, [254, 372, 412], [22], 27)], 0, E236S126.L6),
([(5, true, false, [254, 372, 412], [22], 28)], 0, E236S126.L7),
([(5, true, false, [254, 372, 412], [22], 30)], 0, E236S126.L8),
([(5, true, false, [254, 372, 412], [22], 31)], 0, E236S126.L9),
([(5, true, false, [254, 372, 412], [22], 32)], 0, E236S126.L10),
([(5, true, false, [254, 372, 412], [22], 33)], 0, E236S126.L11),
([(5, true, false, [254, 372, 412], [22], 43)], 0, E236S126.L12),
([(5, true, false, [254, 372, 412], [22], 64)], 0, E236S126.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S126
