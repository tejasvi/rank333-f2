module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S53 "data/lean/9f1f555426adb1cc6b0a3fd2daa32ec3/E237S53.bin"
namespace E237S53
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 234, 412], [], 5)], 0, E237S53.L1),
([(3, true, false, [116, 234, 412], [], 8)], 0, E237S53.L2),
([(3, true, false, [116, 234, 412], [], 15)], 0, E237S53.L3),
([(3, true, false, [116, 234, 412], [], 37)], 0, E237S53.L4),
([(3, true, false, [116, 234, 412], [], 38)], 0, E237S53.L5),
([(3, true, false, [116, 234, 412], [], 39)], 0, E237S53.L6),
([(3, true, false, [116, 234, 412], [], 41)], 0, E237S53.L7),
([(3, true, false, [116, 234, 412], [], 76)], 0, E237S53.L8),
([(3, true, false, [116, 234, 412], [], 109)], 0, E237S53.L9),
([(3, true, false, [116, 234, 412], [], 155)], 0, E237S53.L10),
([(3, true, false, [116, 234, 412], [], 156)], 0, E237S53.L11),
([(3, true, false, [116, 234, 412], [], 201)], 0, E237S53.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E237S53
