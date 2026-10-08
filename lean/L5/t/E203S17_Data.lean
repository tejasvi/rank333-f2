module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S17 "data/lean/df6d689140b006fea12aaa26ce3f7e99/E203S17.bin"
namespace E203S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [468, 410], [68], 2)], 0, E203S17.L1),
([(4, true, false, [468, 410], [68], 36)], 0, E203S17.L2),
([(4, true, false, [468, 410], [68], 38)], 0, E203S17.L3),
([(4, true, false, [468, 410], [68], 41)], 0, E203S17.L4),
([(4, true, false, [468, 410], [68], 48)], 0, E203S17.L5),
([(4, true, false, [468, 410], [68], 92)], 0, E203S17.L6),
([(4, true, false, [468, 410], [68], 168)], 0, E203S17.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E203S17
