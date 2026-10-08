module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S263 "data/lean/a050d71e418dd9f6ab6fadefaae9d126/E236S263.bin"
namespace E236S263
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [354, 394], [276], 81)], 0, E236S263.L1),
([(15, true, false, [354, 394], [276], 82)], 0, E236S263.L2),
([(15, true, false, [354, 394], [276], 88)], 0, E236S263.L3),
([(15, true, false, [354, 394], [276], 120)], 0, E236S263.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S263
