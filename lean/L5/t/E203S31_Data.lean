module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S31 "data/lean/349afa6ece7d7f0416b04b1ffd5d2ccb/E203S31.bin"
namespace E203S31
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [372, 468, 314, 410], [], 11)], 0, E203S31.L1),
([(13, true, false, [372, 468, 314, 410], [], 152)], 0, E203S31.L2),
([(13, true, false, [372, 468, 314, 410], [], 158)], 0, E203S31.L3),
([(13, true, false, [372, 468, 314, 410], [], 228)], 0, E203S31.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E203S31
