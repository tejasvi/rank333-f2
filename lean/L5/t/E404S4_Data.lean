module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E404S4 "data/lean/d4baed246e8aa02e6b54986ce44c5e9c/E404S4.bin"
namespace E404S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [], [58, 222], 2)], 0, E404S4.L1),
([(0, true, false, [], [58, 222], 3)], 0, E404S4.L2),
([(0, true, false, [], [58, 222], 28)], 0, E404S4.L3),
([(0, true, false, [], [58, 222], 29)], 0, E404S4.L4),
([(0, true, false, [], [58, 222], 33)], 0, E404S4.L5),
([(0, true, false, [], [58, 222], 36)], 0, E404S4.L6),
([(0, true, false, [], [58, 222], 40)], 0, E404S4.L7),
([(0, true, false, [], [58, 222], 81)], 0, E404S4.L8),
([(0, true, false, [], [58, 222], 82)], 0, E404S4.L9),
([(0, true, false, [], [58, 222], 112)], 0, E404S4.L10),
([(0, true, false, [], [58, 222], 144)], 0, E404S4.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E404S4
