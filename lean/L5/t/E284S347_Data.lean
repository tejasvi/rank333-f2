module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S347 "data/lean/e033f8e8c2e650dcc80dc3f4785f10d1/E284S347.bin"
namespace E284S347
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [116, 340, 372, 84], [], 0)], 0, E284S347.L1),
([(13, true, false, [116, 340, 372, 84], [], 78)], 0, E284S347.L2),
([(13, true, false, [116, 340, 372, 84], [], 96)], 0, E284S347.L3),
([(13, true, false, [116, 340, 372, 84], [], 98)], 0, E284S347.L4),
([(13, true, false, [116, 340, 372, 84], [], 136)], 0, E284S347.L5),
([(13, true, false, [116, 340, 372, 84], [], 137)], 0, E284S347.L6),
([(13, true, false, [116, 340, 372, 84], [], 140)], 0, E284S347.L7),
([(13, true, false, [116, 340, 372, 84], [], 142)], 0, E284S347.L8),
([(13, true, false, [116, 340, 372, 84], [], 143)], 0, E284S347.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S347
