module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S425 "data/lean/cc5e1b5c3094fec2ca15209e62c01ff9/E236S425.bin"
namespace E236S425
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [158, 254, 354, 394], [], 0)], 0, E236S425.L1),
([(1, true, false, [158, 254, 354, 394], [], 15)], 0, E236S425.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S425
