module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S129 "data/lean/a4ad580e4aa900c83b0b1074260aaf72/E236S129.bin"
namespace E236S129
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [394, 412, 158], [], 10)], 0, E236S129.L1),
([(6, true, false, [394, 412, 158], [], 11)], 0, E236S129.L2),
([(6, true, false, [394, 412, 158], [], 16)], 0, E236S129.L3),
([(6, true, false, [394, 412, 158], [], 17)], 0, E236S129.L4),
([(6, true, false, [394, 412, 158], [], 75)], 0, E236S129.L5),
([(6, true, false, [394, 412, 158], [], 80)], 0, E236S129.L6),
([(6, true, false, [394, 412, 158], [], 139)], 0, E236S129.L7),
([(6, true, false, [394, 412, 158], [], 140)], 0, E236S129.L8),
([(6, true, false, [394, 412, 158], [], 159)], 0, E236S129.L9),
([(6, true, false, [394, 412, 158], [], 161)], 0, E236S129.L10),
([(6, true, false, [394, 412, 158], [], 229)], 0, E236S129.L11),
([(6, true, false, [394, 412, 158], [], 275)], 0, E236S129.L12),
([(6, true, false, [394, 412, 158], [], 318)], 0, E236S129.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S129
