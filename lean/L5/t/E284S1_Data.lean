module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S1 "data/lean/b47358c68840b953a2bf7b9b59494c30/E284S1.bin"
namespace E284S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [340, 382, 266], [126], 1)], 0, E284S1.L1),
([(0, true, false, [340, 382, 266], [126], 5)], 0, E284S1.L2),
([(0, true, false, [340, 382, 266], [126], 19)], 0, E284S1.L3),
([(0, true, false, [340, 382, 266], [126], 29)], 0, E284S1.L4),
([(0, true, false, [340, 382, 266], [126], 30)], 0, E284S1.L5),
([(0, true, false, [340, 382, 266], [126], 34)], 0, E284S1.L6),
([(0, true, false, [340, 382, 266], [126], 40)], 0, E284S1.L7),
([(0, true, false, [340, 382, 266], [126], 46)], 0, E284S1.L8),
([(0, true, false, [340, 382, 266], [126], 50)], 0, E284S1.L9),
([(0, true, false, [340, 382, 266], [126], 55)], 0, E284S1.L10),
([(0, true, false, [340, 382, 266], [126], 61)], 0, E284S1.L11),
([(0, true, false, [340, 382, 266], [126], 83)], 0, E284S1.L12),
([(0, true, false, [340, 382, 266], [126], 84)], 0, E284S1.L13),
([(0, true, false, [340, 382, 266], [126], 90)], 0, E284S1.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S1
