module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S16 "data/lean/b97bf052ad0adaf36ce5fb42893a35a8/E203S16.bin"
namespace E203S16
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [468, 478], [68], 2)], 0, E203S16.L1),
([(5, true, false, [468, 478], [68], 36)], 0, E203S16.L2),
([(5, true, false, [468, 478], [68], 37)], 0, E203S16.L3),
([(5, true, false, [468, 478], [68], 48)], 0, E203S16.L4),
([(5, true, false, [468, 478], [68], 58)], 0, E203S16.L5),
([(5, true, false, [468, 478], [68], 92)], 0, E203S16.L6),
([(5, true, false, [468, 478], [68], 94)], 0, E203S16.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E203S16
