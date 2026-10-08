module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S41 "data/lean/88f226022d994ddf2f8bdff52bb495ab/E284S41.bin"
namespace E284S41
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [94, 254, 468, 266, 426], [], 30)], 0, E284S41.L1),
([(0, true, false, [94, 254, 468, 266, 426], [], 31)], 0, E284S41.L2),
([(0, true, false, [94, 254, 468, 266, 426], [], 35)], 0, E284S41.L3),
([(0, true, false, [94, 254, 468, 266, 426], [], 37)], 0, E284S41.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S41
