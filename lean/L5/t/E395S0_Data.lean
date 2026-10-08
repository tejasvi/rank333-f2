module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E395S0 "data/lean/7ff0dfeba3b6cfd7e3cd6c0c4d3eba76/E395S0.bin"
namespace E395S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [267, 501], [], 21)], 0, E395S0.L1),
([(4, true, false, [267, 501], [], 344)], 0, E395S0.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E395S0
