module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S6 "data/lean/fcfd0d0915a0e5dfe578c52d76a08bb0/E203S6.bin"
namespace E203S6
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [410, 468], [400], 2)], 0, E203S6.L1),
([(12, true, false, [410, 468], [400], 42)], 0, E203S6.L2),
([(12, true, false, [410, 468], [400], 46)], 0, E203S6.L3),
([(12, true, false, [410, 468], [400], 65)], 0, E203S6.L4),
([(12, true, false, [410, 468], [400], 73)], 0, E203S6.L5),
([(12, true, false, [410, 468], [400], 92)], 0, E203S6.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E203S6
