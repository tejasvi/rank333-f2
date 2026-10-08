module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S33 "data/lean/43193e9295e7e54d83c14daf4451d2db/E237S33.bin"
namespace E237S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 354], [138], 0)], 0, E237S33.L1),
([(5, true, false, [158, 354], [138], 22)], 0, E237S33.L2),
([(5, true, false, [158, 354], [138], 23)], 0, E237S33.L3),
([(5, true, false, [158, 354], [138], 40)], 0, E237S33.L4),
([(5, true, false, [158, 354], [138], 42)], 0, E237S33.L5),
([(5, true, false, [158, 354], [138], 48)], 0, E237S33.L6),
([(5, true, false, [158, 354], [138], 52)], 0, E237S33.L7),
([(5, true, false, [158, 354], [138], 62)], 0, E237S33.L8),
([(5, true, false, [158, 354], [138], 68)], 0, E237S33.L9),
([(5, true, false, [158, 354], [138], 70)], 0, E237S33.L10),
([(5, true, false, [158, 354], [138], 86)], 0, E237S33.L11),
([(5, true, false, [158, 354], [138], 168)], 0, E237S33.L12),
([(5, true, false, [158, 354], [138], 212)], 0, E237S33.L13),
([(5, true, false, [158, 354], [138], 213)], 0, E237S33.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E237S33
