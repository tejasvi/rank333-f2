module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S362 "data/lean/9656c5a9574df1e10739381c4c1af43e/E284S362.bin"
namespace E284S362
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 5)], 0, E284S362.L1),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 6)], 0, E284S362.L2),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 7)], 0, E284S362.L3),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 8)], 0, E284S362.L4),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 9)], 0, E284S362.L5),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 10)], 0, E284S362.L6),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 11)], 0, E284S362.L7),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 12)], 0, E284S362.L8),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 13)], 0, E284S362.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S362
