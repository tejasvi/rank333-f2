module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S272 "data/lean/3a539b7e92d7b849f74d9482898a91dd/E236S272.bin"
namespace E236S272
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [394, 372], [258], 38)], 0, E236S272.L1),
([(10, true, false, [394, 372], [258], 72)], 0, E236S272.L2),
([(10, true, false, [394, 372], [258], 110)], 0, E236S272.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S272
