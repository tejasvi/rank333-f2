module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S24 "data/lean/56d2742f30e16f46d06338330317d0fb/E159S24.bin"
namespace E159S24
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(4, true, false, [266, 426, 340], [510], 4)], 20, 0, E159S24.L1),
([(4, true, false, [266, 426, 340], [510], 5)], 20, 0, E159S24.L2),
([(4, true, false, [266, 426, 340], [510], 6)], 20, 0, E159S24.L3),
([(4, true, false, [266, 426, 340], [510], 8)], 20, 0, E159S24.L4),
([(4, true, false, [266, 426, 340], [510], 11)], 20, 0, E159S24.L5),
([(4, true, false, [266, 426, 340], [510], 12)], 20, 0, E159S24.L6),
([(4, true, false, [266, 426, 340], [510], 15)], 20, 0, E159S24.L7),
([(4, true, false, [266, 426, 340], [510], 16)], 20, 0, E159S24.L8),
([(4, true, false, [266, 426, 340], [510], 17)], 20, 0, E159S24.L9),
([(4, true, false, [266, 426, 340], [510], 19)], 20, 0, E159S24.L10),
([(4, true, false, [266, 426, 340], [510], 40)], 20, 0, E159S24.L11),
([(4, true, false, [266, 426, 340], [510], 41)], 20, 0, E159S24.L12),
([(4, true, false, [266, 426, 340], [510], 42)], 20, 0, E159S24.L13),
([(4, true, false, [266, 426, 340], [510], 52)], 20, 0, E159S24.L14),
([(4, true, false, [266, 426, 340], [510], 54)], 20, 0, E159S24.L15),
([(4, true, false, [266, 426, 340], [510], 78)], 20, 0, E159S24.L16),
([(4, true, false, [266, 426, 340], [510], 94)], 20, 0, E159S24.L17),
([(4, true, false, [266, 426, 340], [510], 102)], 20, 0, E159S24.L18),
([(4, true, false, [266, 426, 340], [510], 109)], 20, 0, E159S24.L19),
([(4, true, false, [266, 426, 340], [510], 124)], 20, 0, E159S24.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E159S24
