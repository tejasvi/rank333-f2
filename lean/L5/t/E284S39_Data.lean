module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S39 "data/lean/98bbc4e4580fa40b4d9b779d449735f9/E284S39.bin"
namespace E284S39
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [116, 254, 426, 94, 266], [], 36)], 0, E284S39.L1),
([(8, true, false, [116, 254, 426, 94, 266], [], 72)], 0, E284S39.L2),
([(8, true, false, [116, 254, 426, 94, 266], [], 79)], 0, E284S39.L3),
([(8, true, false, [116, 254, 426, 94, 266], [], 120)], 0, E284S39.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S39
