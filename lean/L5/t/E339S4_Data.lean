module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E339S4 "data/lean/3d43afa76b92d3f24081adaeda8bf998/E339S4.bin"
namespace E339S4
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(16, true, false, [], [], 5)], 13, 0, E339S4.L1),
([(16, true, false, [], [], 49)], 13, 0, E339S4.L2),
([(16, true, false, [], [], 50)], 13, 0, E339S4.L3),
([(16, true, false, [], [], 53)], 13, 0, E339S4.L4),
([(16, true, false, [], [], 54)], 13, 0, E339S4.L5),
([(16, true, false, [], [], 63)], 13, 0, E339S4.L6),
([(16, true, false, [], [], 325)], 13, 0, E339S4.L7),
([(16, true, false, [], [], 326)], 13, 0, E339S4.L8),
([(16, true, false, [], [], 347)], 13, 0, E339S4.L9),
([(16, true, false, [], [], 375)], 13, 0, E339S4.L10),
([(16, true, false, [], [], 598)], 13, 0, E339S4.L11),
([(16, true, false, [], [], 599)], 13, 0, E339S4.L12),
([(16, true, false, [], [], 601)], 13, 0, E339S4.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E339S4
