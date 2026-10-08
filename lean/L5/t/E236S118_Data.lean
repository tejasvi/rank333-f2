module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S118 "data/lean/720f509ed6d0a733e2dd23bb581c6471/E236S118.bin"
namespace E236S118
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 354, 412], [96], 0)], 0, E236S118.L1),
([(0, true, false, [158, 354, 412], [96], 1)], 1, E236S118.L2),
([(0, true, false, [158, 354, 412], [96], 4)], 0, E236S118.L3),
([(0, true, false, [158, 354, 412], [96], 6)], 0, E236S118.L4),
([(0, true, false, [158, 354, 412], [96], 14)], 0, E236S118.L5),
([(0, true, false, [158, 354, 412], [96], 33)], 0, E236S118.L6),
([(0, true, false, [158, 354, 412], [96], 44)], 0, E236S118.L7),
([(0, true, false, [158, 354, 412], [96], 1), (1, false, false, [], [96], 2)], 0, E236S118.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S118
