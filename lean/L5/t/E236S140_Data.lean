module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S140 "data/lean/3689c7dc4e3dc4ba1e21a97a78c4cb47/E236S140.bin"
namespace E236S140
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 254, 354], [258], 18)], 0, E236S140.L1),
([(2, true, false, [158, 254, 354], [258], 24)], 0, E236S140.L2),
([(2, true, false, [158, 254, 354], [258], 36)], 0, E236S140.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S140
