module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S90 "data/lean/9f98f7b091137722d107fb8af5a4b121/E284S90.bin"
namespace E284S90
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266], [42], 0)], 0, E284S90.L1),
([(3, true, false, [84, 266], [42], 1)], 0, E284S90.L2),
([(3, true, false, [84, 266], [42], 2)], 0, E284S90.L3),
([(3, true, false, [84, 266], [42], 4)], 0, E284S90.L4),
([(3, true, false, [84, 266], [42], 10)], 0, E284S90.L5),
([(3, true, false, [84, 266], [42], 12)], 0, E284S90.L6),
([(3, true, false, [84, 266], [42], 14)], 0, E284S90.L7),
([(3, true, false, [84, 266], [42], 17)], 0, E284S90.L8),
([(3, true, false, [84, 266], [42], 18)], 0, E284S90.L9),
([(3, true, false, [84, 266], [42], 20)], 0, E284S90.L10),
([(3, true, false, [84, 266], [42], 36)], 0, E284S90.L11),
([(3, true, false, [84, 266], [42], 38)], 0, E284S90.L12),
([(3, true, false, [84, 266], [42], 39)], 0, E284S90.L13),
([(3, true, false, [84, 266], [42], 68)], 0, E284S90.L14),
([(3, true, false, [84, 266], [42], 72)], 0, E284S90.L15),
([(3, true, false, [84, 266], [42], 74)], 0, E284S90.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E284S90
