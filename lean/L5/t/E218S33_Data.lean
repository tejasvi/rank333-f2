module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S33 "data/lean/c74e93ac47c5b8e097d2915be2d4bc45/E218S33.bin"
namespace E218S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [500, 266], [112], 2)], 0, E218S33.L1),
([(8, true, false, [500, 266], [112], 78)], 0, E218S33.L2),
([(8, true, false, [500, 266], [112], 80)], 0, E218S33.L3),
([(8, true, false, [500, 266], [112], 86)], 0, E218S33.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S33
