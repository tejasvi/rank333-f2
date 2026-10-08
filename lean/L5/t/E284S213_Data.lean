module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S213 "data/lean/c749a8b31133c21be76c90fdf8f2bd10/E284S213.bin"
namespace E284S213
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 116, 266, 298, 254], [], 0)], 0, E284S213.L1),
([(2, true, false, [84, 116, 266, 298, 254], [], 1)], 0, E284S213.L2),
([(2, true, false, [84, 116, 266, 298, 254], [], 2)], 0, E284S213.L3),
([(2, true, false, [84, 116, 266, 298, 254], [], 3)], 0, E284S213.L4),
([(2, true, false, [84, 116, 266, 298, 254], [], 16)], 0, E284S213.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S213
