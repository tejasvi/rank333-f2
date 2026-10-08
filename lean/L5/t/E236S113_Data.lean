module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S113 "data/lean/82d8b9f22db26f5162b604a0a870cfe7/E236S113.bin"
namespace E236S113
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [412], [22, 258], 1)], 0, E236S113.L1),
([(10, true, false, [412], [22, 258], 2)], 0, E236S113.L2),
([(10, true, false, [412], [22, 258], 3)], 0, E236S113.L3),
([(10, true, false, [412], [22, 258], 5)], 0, E236S113.L4),
([(10, true, false, [412], [22, 258], 9)], 0, E236S113.L5),
([(10, true, false, [412], [22, 258], 10)], 0, E236S113.L6),
([(10, true, false, [412], [22, 258], 13)], 0, E236S113.L7),
([(10, true, false, [412], [22, 258], 23)], 0, E236S113.L8),
([(10, true, false, [412], [22, 258], 24)], 0, E236S113.L9),
([(10, true, false, [412], [22, 258], 25)], 0, E236S113.L10),
([(10, true, false, [412], [22, 258], 28)], 0, E236S113.L11),
([(10, true, false, [412], [22, 258], 30)], 0, E236S113.L12),
([(10, true, false, [412], [22, 258], 45)], 0, E236S113.L13),
([(10, true, false, [412], [22, 258], 47)], 0, E236S113.L14),
([(10, true, false, [412], [22, 258], 70)], 0, E236S113.L15),
([(10, true, false, [412], [22, 258], 73)], 0, E236S113.L16),
([(10, true, false, [412], [22, 258], 77)], 0, E236S113.L17),
([(10, true, false, [412], [22, 258], 80)], 0, E236S113.L18),
([(10, true, false, [412], [22, 258], 86)], 0, E236S113.L19),
([(10, true, false, [412], [22, 258], 105)], 0, E236S113.L20),
([(10, true, false, [412], [22, 258], 110)], 0, E236S113.L21),
([(10, true, false, [412], [22, 258], 122)], 0, E236S113.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E236S113
