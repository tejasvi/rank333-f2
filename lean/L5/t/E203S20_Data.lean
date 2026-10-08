module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S20 "data/lean/017878be7b60b3d1337edb24aa684399/E203S20.bin"
namespace E203S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [372, 468, 478, 410], [], 1)], 0, E203S20.L1),
([(4, true, false, [372, 468, 478, 410], [], 4)], 0, E203S20.L2),
([(4, true, false, [372, 468, 478, 410], [], 5)], 0, E203S20.L3),
([(4, true, false, [372, 468, 478, 410], [], 47)], 0, E203S20.L4),
([(4, true, false, [372, 468, 478, 410], [], 85)], 0, E203S20.L5),
([(4, true, false, [372, 468, 478, 410], [], 87)], 0, E203S20.L6),
([(4, true, false, [372, 468, 478, 410], [], 99)], 0, E203S20.L7),
([(4, true, false, [372, 468, 478, 410], [], 100)], 0, E203S20.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E203S20
