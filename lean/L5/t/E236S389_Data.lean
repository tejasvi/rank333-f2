module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S389 "data/lean/467b2d1ab4eefaba4d8109ee9efd1c40/E236S389.bin"
namespace E236S389
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [158], [96, 118], 3)], 0, E236S389.L1),
([(9, true, false, [158], [96, 118], 5)], 0, E236S389.L2),
([(9, true, false, [158], [96, 118], 68)], 0, E236S389.L3),
([(9, true, false, [158], [96, 118], 86)], 0, E236S389.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S389
