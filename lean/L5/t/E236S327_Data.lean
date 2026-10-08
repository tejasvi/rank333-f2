module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S327 "data/lean/cc866e16a9c5e13f10fa7bb138a19b85/E236S327.bin"
namespace E236S327
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [254, 354, 158], [22], 18)], 0, E236S327.L1),
([(11, true, false, [254, 354, 158], [22], 20)], 0, E236S327.L2),
([(11, true, false, [254, 354, 158], [22], 22)], 0, E236S327.L3),
([(11, true, false, [254, 354, 158], [22], 24)], 0, E236S327.L4),
([(11, true, false, [254, 354, 158], [22], 26)], 0, E236S327.L5),
([(11, true, false, [254, 354, 158], [22], 54)], 0, E236S327.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S327
