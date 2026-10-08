module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S150 "data/lean/03924f70332eb29168383a1b2d54d001/E284S150.bin"
namespace E284S150
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 266, 426, 94], [], 0)], 0, E284S150.L1),
([(3, true, false, [212, 266, 426, 94], [], 1)], 0, E284S150.L2),
([(3, true, false, [212, 266, 426, 94], [], 5)], 0, E284S150.L3),
([(3, true, false, [212, 266, 426, 94], [], 6)], 0, E284S150.L4),
([(3, true, false, [212, 266, 426, 94], [], 7)], 0, E284S150.L5),
([(3, true, false, [212, 266, 426, 94], [], 9)], 0, E284S150.L6),
([(3, true, false, [212, 266, 426, 94], [], 11)], 0, E284S150.L7),
([(3, true, false, [212, 266, 426, 94], [], 13)], 0, E284S150.L8),
([(3, true, false, [212, 266, 426, 94], [], 14)], 0, E284S150.L9),
([(3, true, false, [212, 266, 426, 94], [], 20)], 0, E284S150.L10),
([(3, true, false, [212, 266, 426, 94], [], 22)], 0, E284S150.L11),
([(3, true, false, [212, 266, 426, 94], [], 44)], 0, E284S150.L12),
([(3, true, false, [212, 266, 426, 94], [], 45)], 0, E284S150.L13),
([(3, true, false, [212, 266, 426, 94], [], 47)], 0, E284S150.L14),
([(3, true, false, [212, 266, 426, 94], [], 123)], 0, E284S150.L15),
([(3, true, false, [212, 266, 426, 94], [], 130)], 0, E284S150.L16),
([(3, true, false, [212, 266, 426, 94], [], 138)], 0, E284S150.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E284S150
