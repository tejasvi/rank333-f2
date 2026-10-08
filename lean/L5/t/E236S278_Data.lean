module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S278 "data/lean/fafb357720db82457fbfaa293dcf6e4e/E236S278.bin"
namespace E236S278
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [394], [258, 276], 0)], 0, E236S278.L1),
([(6, true, false, [394], [258, 276], 2)], 0, E236S278.L2),
([(6, true, false, [394], [258, 276], 3)], 0, E236S278.L3),
([(6, true, false, [394], [258, 276], 5)], 0, E236S278.L4),
([(6, true, false, [394], [258, 276], 9)], 0, E236S278.L5),
([(6, true, false, [394], [258, 276], 12)], 0, E236S278.L6),
([(6, true, false, [394], [258, 276], 25)], 0, E236S278.L7),
([(6, true, false, [394], [258, 276], 28)], 0, E236S278.L8),
([(6, true, false, [394], [258, 276], 43)], 0, E236S278.L9),
([(6, true, false, [394], [258, 276], 44)], 0, E236S278.L10),
([(6, true, false, [394], [258, 276], 47)], 0, E236S278.L11),
([(6, true, false, [394], [258, 276], 52)], 0, E236S278.L12),
([(6, true, false, [394], [258, 276], 84)], 0, E236S278.L13),
([(6, true, false, [394], [258, 276], 86)], 0, E236S278.L14),
([(6, true, false, [394], [258, 276], 88)], 0, E236S278.L15),
([(6, true, false, [394], [258, 276], 94)], 0, E236S278.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E236S278
