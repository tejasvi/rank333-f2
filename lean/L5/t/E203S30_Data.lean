module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S30 "data/lean/1f87280449190144b5f920433fd43f39/E203S30.bin"
namespace E203S30
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [314, 410, 382, 478], [], 89)], 0, E203S30.L1),
([(15, true, false, [314, 410, 382, 478], [], 93)], 0, E203S30.L2),
([(15, true, false, [314, 410, 382, 478], [], 152)], 0, E203S30.L3),
([(15, true, false, [314, 410, 382, 478], [], 224)], 0, E203S30.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E203S30
