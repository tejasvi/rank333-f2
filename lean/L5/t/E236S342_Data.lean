module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S342 "data/lean/d7ae167adfacaacfee3b5795c4f76586/E236S342.bin"
namespace E236S342
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [254, 354, 394], [22], 3)], 0, E236S342.L1),
([(3, true, false, [254, 354, 394], [22], 4)], 0, E236S342.L2),
([(3, true, false, [254, 354, 394], [22], 7)], 0, E236S342.L3),
([(3, true, false, [254, 354, 394], [22], 8)], 0, E236S342.L4),
([(3, true, false, [254, 354, 394], [22], 10)], 0, E236S342.L5),
([(3, true, false, [254, 354, 394], [22], 27)], 0, E236S342.L6),
([(3, true, false, [254, 354, 394], [22], 28)], 0, E236S342.L7),
([(3, true, false, [254, 354, 394], [22], 29)], 0, E236S342.L8),
([(3, true, false, [254, 354, 394], [22], 30)], 0, E236S342.L9),
([(3, true, false, [254, 354, 394], [22], 31)], 0, E236S342.L10),
([(3, true, false, [254, 354, 394], [22], 43)], 0, E236S342.L11),
([(3, true, false, [254, 354, 394], [22], 60)], 0, E236S342.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E236S342
