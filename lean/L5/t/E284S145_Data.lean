module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S145 "data/lean/811e96dd117ec1bd8ab7e281246f4727/E284S145.bin"
namespace E284S145
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 116, 266, 298, 478], [], 0)], 0, E284S145.L1),
([(3, true, false, [84, 116, 266, 298, 478], [], 1)], 0, E284S145.L2),
([(3, true, false, [84, 116, 266, 298, 478], [], 5)], 0, E284S145.L3),
([(3, true, false, [84, 116, 266, 298, 478], [], 57)], 0, E284S145.L4),
([(3, true, false, [84, 116, 266, 298, 478], [], 58)], 0, E284S145.L5),
([(3, true, false, [84, 116, 266, 298, 478], [], 97)], 0, E284S145.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S145
