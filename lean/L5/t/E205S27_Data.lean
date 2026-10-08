module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S27 "data/lean/ee70b7c6701a8bf36b7e237206061c87/E205S27.bin"
namespace E205S27
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [116, 212], [], 0)], 0, E205S27.L1),
([(2, true, false, [116, 212], [], 20)], 0, E205S27.L2),
([(2, true, false, [116, 212], [], 74)], 0, E205S27.L3),
([(2, true, false, [116, 212], [], 75)], 0, E205S27.L4),
([(2, true, false, [116, 212], [], 76)], 0, E205S27.L5),
([(2, true, false, [116, 212], [], 77)], 0, E205S27.L6),
([(2, true, false, [116, 212], [], 95)], 0, E205S27.L7),
([(2, true, false, [116, 212], [], 163)], 0, E205S27.L8),
([(2, true, false, [116, 212], [], 175)], 0, E205S27.L9),
([(2, true, false, [116, 212], [], 186)], 0, E205S27.L10),
([(2, true, false, [116, 212], [], 189)], 0, E205S27.L11),
([(2, true, false, [116, 212], [], 367)], 0, E205S27.L12),
([(2, true, false, [116, 212], [], 368)], 0, E205S27.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E205S27
