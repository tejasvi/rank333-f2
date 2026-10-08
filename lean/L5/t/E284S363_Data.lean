module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S363 "data/lean/f194e711cd79f3be66d1ddcc1f8623af/E284S363.bin"
namespace E284S363
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 5)], 0, E284S363.L1),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 20)], 0, E284S363.L2),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 89)], 0, E284S363.L3),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 104)], 0, E284S363.L4),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 124)], 0, E284S363.L5),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 125)], 0, E284S363.L6),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 169)], 0, E284S363.L7),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 213)], 0, E284S363.L8),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 232)], 0, E284S363.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S363
