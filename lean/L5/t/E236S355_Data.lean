module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S355 "data/lean/3464c0f43ff99192e569800e3934e406/E236S355.bin"
namespace E236S355
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 254], [136, 232], 4)], 0, E236S355.L1),
([(8, true, false, [158, 254], [136, 232], 8)], 0, E236S355.L2),
([(8, true, false, [158, 254], [136, 232], 23)], 0, E236S355.L3),
([(8, true, false, [158, 254], [136, 232], 24)], 0, E236S355.L4),
([(8, true, false, [158, 254], [136, 232], 60)], 0, E236S355.L5),
([(8, true, false, [158, 254], [136, 232], 63)], 0, E236S355.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S355
