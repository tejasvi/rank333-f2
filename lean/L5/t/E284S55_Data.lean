module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S55 "data/lean/dfec46aa40b9675387a6b3eb759755db/E284S55.bin"
namespace E284S55
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266, 394], [10, 42], 0)], 0, E284S55.L1),
([(3, true, false, [84, 266, 394], [10, 42], 2)], 0, E284S55.L2),
([(3, true, false, [84, 266, 394], [10, 42], 18)], 0, E284S55.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S55
