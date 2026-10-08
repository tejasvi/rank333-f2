module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S20 "data/lean/9daab78bc2024760b0c0352613a66b03/E159S20.bin"
namespace E159S20
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [340, 266], [350], 0)], 19, 0, E159S20.L1),
([(0, true, false, [340, 266], [350], 1)], 19, 0, E159S20.L2),
([(0, true, false, [340, 266], [350], 3)], 19, 0, E159S20.L3),
([(0, true, false, [340, 266], [350], 8)], 19, 0, E159S20.L4),
([(0, true, false, [340, 266], [350], 45)], 19, 0, E159S20.L5),
([(0, true, false, [340, 266], [350], 46)], 19, 0, E159S20.L6),
([(0, true, false, [340, 266], [350], 47)], 19, 0, E159S20.L7),
([(0, true, false, [340, 266], [350], 51)], 19, 0, E159S20.L8),
([(0, true, false, [340, 266], [350], 78)], 19, 0, E159S20.L9),
([(0, true, false, [340, 266], [350], 80)], 19, 0, E159S20.L10),
([(0, true, false, [340, 266], [350], 88)], 19, 0, E159S20.L11),
([(0, true, false, [340, 266], [350], 93)], 19, 0, E159S20.L12),
([(0, true, false, [340, 266], [350], 99)], 19, 0, E159S20.L13),
([(0, true, false, [340, 266], [350], 100)], 19, 0, E159S20.L14),
([(0, true, false, [340, 266], [350], 106)], 19, 0, E159S20.L15),
([(0, true, false, [340, 266], [350], 108)], 19, 0, E159S20.L16),
([(0, true, false, [340, 266], [350], 158)], 19, 0, E159S20.L17),
([(0, true, false, [340, 266], [350], 159)], 19, 0, E159S20.L18),
([(0, true, false, [340, 266], [350], 160)], 19, 0, E159S20.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E159S20
