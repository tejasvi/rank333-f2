module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S344 "data/lean/159b0b4352df49b1b853534662abe8b9/E284S344.bin"
namespace E284S344
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [116, 500, 84, 468], [], 30)], 0, E284S344.L1),
([(8, true, false, [116, 500, 84, 468], [], 33)], 0, E284S344.L2),
([(8, true, false, [116, 500, 84, 468], [], 36)], 0, E284S344.L3),
([(8, true, false, [116, 500, 84, 468], [], 37)], 0, E284S344.L4),
([(8, true, false, [116, 500, 84, 468], [], 39)], 0, E284S344.L5),
([(8, true, false, [116, 500, 84, 468], [], 108)], 0, E284S344.L6),
([(8, true, false, [116, 500, 84, 468], [], 111)], 0, E284S344.L7),
([(8, true, false, [116, 500, 84, 468], [], 166)], 0, E284S344.L8),
([(8, true, false, [116, 500, 84, 468], [], 170)], 0, E284S344.L9),
([(8, true, false, [116, 500, 84, 468], [], 428)], 0, E284S344.L10),
([(8, true, false, [116, 500, 84, 468], [], 430)], 0, E284S344.L11),
([(8, true, false, [116, 500, 84, 468], [], 432)], 0, E284S344.L12),
([(8, true, false, [116, 500, 84, 468], [], 454)], 0, E284S344.L13),
([(8, true, false, [116, 500, 84, 468], [], 456)], 0, E284S344.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S344
