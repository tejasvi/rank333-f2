module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S241 "data/lean/0d7e21d0ebddd133226221a1c3e35f25/E236S241.bin"
namespace E236S241
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 412], [136], 0)], 0, E236S241.L1),
([(2, true, false, [158, 412], [136], 20)], 0, E236S241.L2),
([(2, true, false, [158, 412], [136], 22)], 0, E236S241.L3),
([(2, true, false, [158, 412], [136], 28)], 0, E236S241.L4),
([(2, true, false, [158, 412], [136], 30)], 0, E236S241.L5),
([(2, true, false, [158, 412], [136], 40)], 0, E236S241.L6),
([(2, true, false, [158, 412], [136], 68)], 0, E236S241.L7),
([(2, true, false, [158, 412], [136], 70)], 0, E236S241.L8),
([(2, true, false, [158, 412], [136], 148)], 0, E236S241.L9),
([(2, true, false, [158, 412], [136], 186)], 0, E236S241.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S241
