module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S71 "data/lean/a187fc41cb35a3e49254b976a5c6fcc2/E236S71.bin"
namespace E236S71
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [372, 412, 354], [508], 0)], 0, E236S71.L1),
([(6, true, false, [372, 412, 354], [508], 23)], 0, E236S71.L2),
([(6, true, false, [372, 412, 354], [508], 24)], 0, E236S71.L3),
([(6, true, false, [372, 412, 354], [508], 26)], 0, E236S71.L4),
([(6, true, false, [372, 412, 354], [508], 29)], 0, E236S71.L5),
([(6, true, false, [372, 412, 354], [508], 34)], 0, E236S71.L6),
([(6, true, false, [372, 412, 354], [508], 36)], 0, E236S71.L7),
([(6, true, false, [372, 412, 354], [508], 38)], 0, E236S71.L8),
([(6, true, false, [372, 412, 354], [508], 53)], 0, E236S71.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E236S71
