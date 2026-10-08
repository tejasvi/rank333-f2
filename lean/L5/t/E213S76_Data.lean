module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S76 "data/lean/88ff0cf64b0d8797a670768d04c1b7a4/E213S76.bin"
namespace E213S76
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254], [272, 388], 1)], 0, E213S76.L1),
([(2, true, false, [254], [272, 388], 13)], 0, E213S76.L2),
([(2, true, false, [254], [272, 388], 26)], 0, E213S76.L3),
([(2, true, false, [254], [272, 388], 48)], 0, E213S76.L4),
([(2, true, false, [254], [272, 388], 69)], 0, E213S76.L5),
([(2, true, false, [254], [272, 388], 74)], 0, E213S76.L6),
([(2, true, false, [254], [272, 388], 89)], 0, E213S76.L7),
([(2, true, false, [254], [272, 388], 144)], 0, E213S76.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S76
