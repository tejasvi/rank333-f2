module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S428 "data/lean/b46626919973589e7d3e6c1bf4033b09/E236S428.bin"
namespace E236S428
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [354, 372, 394, 412, 158], [], 22)], 0, E236S428.L1),
([(5, true, false, [354, 372, 394, 412, 158], [], 25)], 0, E236S428.L2),
([(5, true, false, [354, 372, 394, 412, 158], [], 44)], 0, E236S428.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S428
