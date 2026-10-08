module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S331 "data/lean/7f3763e4ab35272087eb100e0b15589c/E236S331.bin"
namespace E236S331
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [354, 372, 158], [], 10)], 0, E236S331.L1),
([(5, true, false, [354, 372, 158], [], 11)], 0, E236S331.L2),
([(5, true, false, [354, 372, 158], [], 15)], 0, E236S331.L3),
([(5, true, false, [354, 372, 158], [], 17)], 0, E236S331.L4),
([(5, true, false, [354, 372, 158], [], 74)], 0, E236S331.L5),
([(5, true, false, [354, 372, 158], [], 75)], 0, E236S331.L6),
([(5, true, false, [354, 372, 158], [], 77)], 0, E236S331.L7),
([(5, true, false, [354, 372, 158], [], 78)], 0, E236S331.L8),
([(5, true, false, [354, 372, 158], [], 81)], 0, E236S331.L9),
([(5, true, false, [354, 372, 158], [], 153)], 0, E236S331.L10),
([(5, true, false, [354, 372, 158], [], 217)], 0, E236S331.L11),
([(5, true, false, [354, 372, 158], [], 229)], 0, E236S331.L12),
([(5, true, false, [354, 372, 158], [], 272)], 0, E236S331.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S331
