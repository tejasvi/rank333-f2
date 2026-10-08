module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E335S5 "data/lean/cfe41679516286dc3ec42e7092367035/E335S5.bin"
namespace E335S5
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [], [], 51)], 0, E335S5.L1),
([(2, true, false, [], [], 53)], 0, E335S5.L2),
([(2, true, false, [], [], 55)], 0, E335S5.L3),
([(2, true, false, [], [], 71)], 0, E335S5.L4),
([(2, true, false, [], [], 80)], 0, E335S5.L5),
([(2, true, false, [], [], 83)], 0, E335S5.L6),
([(2, true, false, [], [], 322)], 0, E335S5.L7),
([(2, true, false, [], [], 326)], 0, E335S5.L8),
([(2, true, false, [], [], 328)], 0, E335S5.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E335S5
