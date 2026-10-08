module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S132 "data/lean/732c7c1c49b937d3884c1fdd6def81e4/E236S132.bin"
namespace E236S132
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [394, 412], [258, 276], 11)], 0, E236S132.L1),
([(8, true, false, [394, 412], [258, 276], 20)], 0, E236S132.L2),
([(8, true, false, [394, 412], [258, 276], 22)], 0, E236S132.L3),
([(8, true, false, [394, 412], [258, 276], 28)], 0, E236S132.L4),
([(8, true, false, [394, 412], [258, 276], 30)], 0, E236S132.L5),
([(8, true, false, [394, 412], [258, 276], 51)], 0, E236S132.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S132
