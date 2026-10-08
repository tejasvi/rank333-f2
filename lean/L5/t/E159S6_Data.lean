module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S6 "data/lean/199c60bff3b2c1621feb019bcbf8f78b/E159S6.bin"
namespace E159S6
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [84, 500, 426], [350], 2)], 21, 0, E159S6.L1),
([(0, true, false, [84, 500, 426], [350], 4)], 21, 0, E159S6.L2),
([(0, true, false, [84, 500, 426], [350], 5)], 21, 0, E159S6.L3),
([(0, true, false, [84, 500, 426], [350], 8)], 21, 0, E159S6.L4),
([(0, true, false, [84, 500, 426], [350], 11)], 21, 0, E159S6.L5),
([(0, true, false, [84, 500, 426], [350], 21)], 21, 0, E159S6.L6),
([(0, true, false, [84, 500, 426], [350], 22)], 21, 0, E159S6.L7),
([(0, true, false, [84, 500, 426], [350], 23)], 21, 0, E159S6.L8),
([(0, true, false, [84, 500, 426], [350], 24)], 21, 0, E159S6.L9),
([(0, true, false, [84, 500, 426], [350], 26)], 21, 0, E159S6.L10),
([(0, true, false, [84, 500, 426], [350], 42)], 21, 0, E159S6.L11),
([(0, true, false, [84, 500, 426], [350], 43)], 21, 0, E159S6.L12),
([(0, true, false, [84, 500, 426], [350], 46)], 21, 0, E159S6.L13),
([(0, true, false, [84, 500, 426], [350], 48)], 21, 0, E159S6.L14),
([(0, true, false, [84, 500, 426], [350], 58)], 21, 0, E159S6.L15),
([(0, true, false, [84, 500, 426], [350], 60)], 21, 0, E159S6.L16),
([(0, true, false, [84, 500, 426], [350], 79)], 21, 0, E159S6.L17),
([(0, true, false, [84, 500, 426], [350], 84)], 21, 0, E159S6.L18),
([(0, true, false, [84, 500, 426], [350], 86)], 21, 0, E159S6.L19),
([(0, true, false, [84, 500, 426], [350], 90)], 21, 0, E159S6.L20),
([(0, true, false, [84, 500, 426], [350], 120)], 21, 0, E159S6.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E159S6
