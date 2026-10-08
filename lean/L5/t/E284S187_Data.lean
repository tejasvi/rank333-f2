module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S187 "data/lean/49440f361afe7b20615e0a55f8a4fd3a/E284S187.bin"
namespace E284S187
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 116], [510], 2)], 0, E284S187.L1),
([(0, true, false, [84, 94, 116], [510], 6)], 0, E284S187.L2),
([(0, true, false, [84, 94, 116], [510], 36)], 0, E284S187.L3),
([(0, true, false, [84, 94, 116], [510], 37)], 0, E284S187.L4),
([(0, true, false, [84, 94, 116], [510], 55)], 0, E284S187.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S187
