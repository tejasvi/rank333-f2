module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S235 "data/lean/9db7da3e9376a9521352b2af1074e0c8/E213S235.bin"
namespace E213S235
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 244], [272], 4)], 0, E213S235.L1),
([(7, true, false, [158, 244], [272], 5)], 0, E213S235.L2),
([(7, true, false, [158, 244], [272], 6)], 0, E213S235.L3),
([(7, true, false, [158, 244], [272], 8)], 0, E213S235.L4),
([(7, true, false, [158, 244], [272], 9)], 0, E213S235.L5),
([(7, true, false, [158, 244], [272], 10)], 0, E213S235.L6),
([(7, true, false, [158, 244], [272], 12)], 0, E213S235.L7),
([(7, true, false, [158, 244], [272], 14)], 0, E213S235.L8),
([(7, true, false, [158, 244], [272], 19)], 0, E213S235.L9),
([(7, true, false, [158, 244], [272], 43)], 0, E213S235.L10),
([(7, true, false, [158, 244], [272], 50)], 0, E213S235.L11),
([(7, true, false, [158, 244], [272], 69)], 0, E213S235.L12),
([(7, true, false, [158, 244], [272], 72)], 0, E213S235.L13),
([(7, true, false, [158, 244], [272], 74)], 0, E213S235.L14),
([(7, true, false, [158, 244], [272], 75)], 0, E213S235.L15),
([(7, true, false, [158, 244], [272], 81)], 0, E213S235.L16),
([(7, true, false, [158, 244], [272], 94)], 0, E213S235.L17),
([(7, true, false, [158, 244], [272], 104)], 0, E213S235.L18),
([(7, true, false, [158, 244], [272], 115)], 0, E213S235.L19),
([(7, true, false, [158, 244], [272], 122)], 0, E213S235.L20),
([(7, true, false, [158, 244], [272], 139)], 0, E213S235.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E213S235
