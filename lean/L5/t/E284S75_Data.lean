module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S75 "data/lean/bf05c9696ce191c956fab836788c8b64/E284S75.bin"
namespace E284S75
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 478], [10, 42], 0)], 0, E284S75.L1),
([(3, true, false, [116, 478], [10, 42], 7)], 0, E284S75.L2),
([(3, true, false, [116, 478], [10, 42], 20)], 0, E284S75.L3),
([(3, true, false, [116, 478], [10, 42], 21)], 0, E284S75.L4),
([(3, true, false, [116, 478], [10, 42], 22)], 0, E284S75.L5),
([(3, true, false, [116, 478], [10, 42], 23)], 0, E284S75.L6),
([(3, true, false, [116, 478], [10, 42], 60)], 0, E284S75.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S75
