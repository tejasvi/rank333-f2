module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S385 "data/lean/97e43f8834a7afb9f5f3efa5152011c7/E236S385.bin"
namespace E236S385
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158, 412], [118], 0)], 0, E236S385.L1),
([(4, true, false, [158, 412], [118], 1)], 0, E236S385.L2),
([(4, true, false, [158, 412], [118], 5)], 0, E236S385.L3),
([(4, true, false, [158, 412], [118], 12)], 0, E236S385.L4),
([(4, true, false, [158, 412], [118], 33)], 0, E236S385.L5),
([(4, true, false, [158, 412], [118], 35)], 0, E236S385.L6),
([(4, true, false, [158, 412], [118], 37)], 0, E236S385.L7),
([(4, true, false, [158, 412], [118], 39)], 0, E236S385.L8),
([(4, true, false, [158, 412], [118], 43)], 0, E236S385.L9),
([(4, true, false, [158, 412], [118], 53)], 0, E236S385.L10),
([(4, true, false, [158, 412], [118], 60)], 0, E236S385.L11),
([(4, true, false, [158, 412], [118], 88)], 0, E236S385.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E236S385
