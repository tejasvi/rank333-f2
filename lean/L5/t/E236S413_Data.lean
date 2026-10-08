module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S413 "data/lean/287cb68cab906f15433d0afb63fa9cba/E236S413.bin"
namespace E236S413
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 412], [136], 0)], 0, E236S413.L1),
([(0, true, false, [354, 412], [136], 6)], 0, E236S413.L2),
([(0, true, false, [354, 412], [136], 20)], 0, E236S413.L3),
([(0, true, false, [354, 412], [136], 26)], 0, E236S413.L4),
([(0, true, false, [354, 412], [136], 34)], 0, E236S413.L5),
([(0, true, false, [354, 412], [136], 35)], 0, E236S413.L6),
([(0, true, false, [354, 412], [136], 68)], 0, E236S413.L7),
([(0, true, false, [354, 412], [136], 69)], 0, E236S413.L8),
([(0, true, false, [354, 412], [136], 76)], 0, E236S413.L9),
([(0, true, false, [354, 412], [136], 88)], 0, E236S413.L10),
([(0, true, false, [354, 412], [136], 113)], 0, E236S413.L11),
([(0, true, false, [354, 412], [136], 125)], 0, E236S413.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E236S413
