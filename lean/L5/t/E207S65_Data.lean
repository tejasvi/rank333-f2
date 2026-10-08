module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S65 "data/lean/8384b7838ad275295ac8d88446bb1425/E207S65.bin"
namespace E207S65
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 346], [160], 61)], 0, E207S65.L1),
([(2, true, false, [266, 346], [160], 70)], 0, E207S65.L2),
([(2, true, false, [266, 346], [160], 88)], 0, E207S65.L3),
([(2, true, false, [266, 346], [160], 136)], 0, E207S65.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E207S65
