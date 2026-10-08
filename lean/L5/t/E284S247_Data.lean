module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S247 "data/lean/a94d69d4b9a0236e6683e5a7888b8246/E284S247.bin"
namespace E284S247
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [382, 478, 94, 254], [350], 3)], 0, E284S247.L1),
([(4, true, false, [382, 478, 94, 254], [350], 15)], 0, E284S247.L2),
([(4, true, false, [382, 478, 94, 254], [350], 20)], 0, E284S247.L3),
([(4, true, false, [382, 478, 94, 254], [350], 31)], 0, E284S247.L4),
([(4, true, false, [382, 478, 94, 254], [350], 37)], 0, E284S247.L5),
([(4, true, false, [382, 478, 94, 254], [350], 38)], 0, E284S247.L6),
([(4, true, false, [382, 478, 94, 254], [350], 46)], 0, E284S247.L7),
([(4, true, false, [382, 478, 94, 254], [350], 50)], 0, E284S247.L8),
([(4, true, false, [382, 478, 94, 254], [350], 73)], 0, E284S247.L9),
([(4, true, false, [382, 478, 94, 254], [350], 82)], 0, E284S247.L10),
([(4, true, false, [382, 478, 94, 254], [350], 87)], 0, E284S247.L11),
([(4, true, false, [382, 478, 94, 254], [350], 98)], 0, E284S247.L12),
([(4, true, false, [382, 478, 94, 254], [350], 147)], 0, E284S247.L13),
([(4, true, false, [382, 478, 94, 254], [350], 148)], 0, E284S247.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S247
