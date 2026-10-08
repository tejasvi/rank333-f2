module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S345 "data/lean/57ed5e927832b3c665904eec8df8cccb/E284S345.bin"
namespace E284S345
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [116, 340, 372, 84], [], 10)], 0, E284S345.L1),
([(13, true, false, [116, 340, 372, 84], [], 11)], 0, E284S345.L2),
([(13, true, false, [116, 340, 372, 84], [], 14)], 0, E284S345.L3),
([(13, true, false, [116, 340, 372, 84], [], 15)], 0, E284S345.L4),
([(13, true, false, [116, 340, 372, 84], [], 16)], 0, E284S345.L5),
([(13, true, false, [116, 340, 372, 84], [], 21)], 0, E284S345.L6),
([(13, true, false, [116, 340, 372, 84], [], 147)], 0, E284S345.L7),
([(13, true, false, [116, 340, 372, 84], [], 268)], 0, E284S345.L8),
([(13, true, false, [116, 340, 372, 84], [], 270)], 0, E284S345.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S345
