module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S74 "data/lean/62c6446f023476617ddc850bac327a46/E236S74.bin"
namespace E236S74
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372, 412, 254], [96], 1)], 0, E236S74.L1),
([(0, true, false, [372, 412, 254], [96], 41)], 0, E236S74.L2),
([(0, true, false, [372, 412, 254], [96], 59)], 0, E236S74.L3),
([(0, true, false, [372, 412, 254], [96], 61)], 0, E236S74.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S74
