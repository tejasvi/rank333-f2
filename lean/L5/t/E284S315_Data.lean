module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S315 "data/lean/bd5b3d7978ccc633dfde3d7674a9b13c/E284S315.bin"
namespace E284S315
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 212], [10, 138], 0)], 0, E284S315.L1),
([(2, true, false, [84, 212], [10, 138], 4)], 0, E284S315.L2),
([(2, true, false, [84, 212], [10, 138], 10)], 0, E284S315.L3),
([(2, true, false, [84, 212], [10, 138], 11)], 0, E284S315.L4),
([(2, true, false, [84, 212], [10, 138], 12)], 0, E284S315.L5),
([(2, true, false, [84, 212], [10, 138], 13)], 0, E284S315.L6),
([(2, true, false, [84, 212], [10, 138], 14)], 0, E284S315.L7),
([(2, true, false, [84, 212], [10, 138], 15)], 0, E284S315.L8),
([(2, true, false, [84, 212], [10, 138], 16)], 0, E284S315.L9),
([(2, true, false, [84, 212], [10, 138], 19)], 0, E284S315.L10),
([(2, true, false, [84, 212], [10, 138], 30)], 0, E284S315.L11),
([(2, true, false, [84, 212], [10, 138], 32)], 0, E284S315.L12),
([(2, true, false, [84, 212], [10, 138], 34)], 0, E284S315.L13),
([(2, true, false, [84, 212], [10, 138], 36)], 0, E284S315.L14),
([(2, true, false, [84, 212], [10, 138], 38)], 0, E284S315.L15),
([(2, true, false, [84, 212], [10, 138], 41)], 0, E284S315.L16),
([(2, true, false, [84, 212], [10, 138], 43)], 0, E284S315.L17),
([(2, true, false, [84, 212], [10, 138], 45)], 0, E284S315.L18),
([(2, true, false, [84, 212], [10, 138], 57)], 0, E284S315.L19),
([(2, true, false, [84, 212], [10, 138], 65)], 0, E284S315.L20),
([(2, true, false, [84, 212], [10, 138], 75)], 0, E284S315.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E284S315
