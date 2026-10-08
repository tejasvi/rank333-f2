module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S11 "data/lean/84691304f9820e3079cb47eb32772623/E203S11.bin"
namespace E203S11
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [468, 478], [400], 2)], 0, E203S11.L1),
([(12, true, false, [468, 478], [400], 8)], 0, E203S11.L2),
([(12, true, false, [468, 478], [400], 22)], 0, E203S11.L3),
([(12, true, false, [468, 478], [400], 64)], 0, E203S11.L4),
([(12, true, false, [468, 478], [400], 65)], 0, E203S11.L5),
([(12, true, false, [468, 478], [400], 99)], 0, E203S11.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E203S11
