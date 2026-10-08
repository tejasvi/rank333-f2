module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S34 "data/lean/5cd8bbc5919f7cb38c185dbaebff08ae/E203S34.bin"
namespace E203S34
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [314, 372, 478], [400], 6)], 0, E203S34.L1),
([(0, true, false, [314, 372, 478], [400], 17)], 0, E203S34.L2),
([(0, true, false, [314, 372, 478], [400], 28)], 0, E203S34.L3),
([(0, true, false, [314, 372, 478], [400], 34)], 0, E203S34.L4),
([(0, true, false, [314, 372, 478], [400], 38)], 0, E203S34.L5),
([(0, true, false, [314, 372, 478], [400], 41)], 0, E203S34.L6),
([(0, true, false, [314, 372, 478], [400], 45)], 0, E203S34.L7),
([(0, true, false, [314, 372, 478], [400], 64)], 0, E203S34.L8),
([(0, true, false, [314, 372, 478], [400], 65)], 0, E203S34.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E203S34
