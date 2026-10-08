module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S10 "data/lean/f06519ce522336052cdc8cfb820f6bd0/E202S10.bin"
namespace E202S10
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [], [], 1)], 22, 0, E202S10.L1),
([(0, true, false, [], [], 4)], 22, 0, E202S10.L2),
([(0, true, false, [], [], 5)], 22, 0, E202S10.L3),
([(0, true, false, [], [], 49)], 22, 0, E202S10.L4),
([(0, true, false, [], [], 51)], 22, 0, E202S10.L5),
([(0, true, false, [], [], 53)], 22, 0, E202S10.L6),
([(0, true, false, [], [], 55)], 22, 0, E202S10.L7),
([(0, true, false, [], [], 99)], 22, 0, E202S10.L8),
([(0, true, false, [], [], 103)], 22, 0, E202S10.L9),
([(0, true, false, [], [], 104)], 22, 0, E202S10.L10),
([(0, true, false, [], [], 371)], 22, 0, E202S10.L11),
([(0, true, false, [], [], 372)], 22, 0, E202S10.L12),
([(0, true, false, [], [], 376)], 22, 0, E202S10.L13),
([(0, true, false, [], [], 595)], 22, 0, E202S10.L14),
([(0, true, false, [], [], 597)], 22, 0, E202S10.L15),
([(0, true, false, [], [], 599)], 22, 0, E202S10.L16),
([(0, true, false, [], [], 601)], 22, 0, E202S10.L17),
([(0, true, false, [], [], 608)], 22, 0, E202S10.L18),
([(0, true, false, [], [], 645)], 22, 0, E202S10.L19),
([(0, true, false, [], [], 646)], 22, 0, E202S10.L20),
([(0, true, false, [], [], 649)], 22, 0, E202S10.L21),
([(0, true, false, [], [], 746)], 22, 0, E202S10.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E202S10
