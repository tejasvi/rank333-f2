module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S283 "data/lean/f9d5acedcd59bb54c8518bb962bb3ced/E284S283.bin"
namespace E284S283
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [32], [], 0), (9, false, false, [244, 372], [], 0)], 0, E284S283.L1),
([(8, true, false, [32], [], 0), (9, false, false, [244, 372], [], 1)], 0, E284S283.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S283
