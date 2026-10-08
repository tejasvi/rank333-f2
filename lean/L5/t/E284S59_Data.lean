module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S59 "data/lean/7f8f309c492f1cf41e3fd0e25f392b1e/E284S59.bin"
namespace E284S59
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 266, 394], [10, 42], 0)], 0, E284S59.L1),
([(3, true, false, [212, 266, 394], [10, 42], 1)], 0, E284S59.L2),
([(3, true, false, [212, 266, 394], [10, 42], 4)], 0, E284S59.L3),
([(3, true, false, [212, 266, 394], [10, 42], 6)], 0, E284S59.L4),
([(3, true, false, [212, 266, 394], [10, 42], 16)], 0, E284S59.L5),
([(3, true, false, [212, 266, 394], [10, 42], 21)], 0, E284S59.L6),
([(3, true, false, [212, 266, 394], [10, 42], 22)], 0, E284S59.L7),
([(3, true, false, [212, 266, 394], [10, 42], 37)], 0, E284S59.L8),
([(3, true, false, [212, 266, 394], [10, 42], 38)], 0, E284S59.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S59
