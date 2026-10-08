module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S2 "data/lean/353a0899fbf696c762bce0949acc6222/E284S2.bin"
namespace E284S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [212, 254, 266], [510], 30)], 0, E284S2.L1),
([(0, true, false, [212, 254, 266], [510], 37)], 0, E284S2.L2),
([(0, true, false, [212, 254, 266], [510], 41)], 0, E284S2.L3),
([(0, true, false, [212, 254, 266], [510], 43)], 0, E284S2.L4),
([(0, true, false, [212, 254, 266], [510], 63)], 0, E284S2.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S2
