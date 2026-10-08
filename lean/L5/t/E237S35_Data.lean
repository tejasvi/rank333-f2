module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S35 "data/lean/684720bccd208b01966ffc08eef13148/E237S35.bin"
namespace E237S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [354, 412], [392], 0)], 0, E237S35.L1),
([(8, true, false, [354, 412], [392], 1)], 0, E237S35.L2),
([(8, true, false, [354, 412], [392], 6)], 0, E237S35.L3),
([(8, true, false, [354, 412], [392], 10)], 0, E237S35.L4),
([(8, true, false, [354, 412], [392], 12)], 0, E237S35.L5),
([(8, true, false, [354, 412], [392], 13)], 0, E237S35.L6),
([(8, true, false, [354, 412], [392], 21)], 0, E237S35.L7),
([(8, true, false, [354, 412], [392], 52)], 0, E237S35.L8),
([(8, true, false, [354, 412], [392], 103)], 0, E237S35.L9),
([(8, true, false, [354, 412], [392], 110)], 0, E237S35.L10),
([(8, true, false, [354, 412], [392], 120)], 0, E237S35.L11),
([(8, true, false, [354, 412], [392], 122)], 0, E237S35.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E237S35
