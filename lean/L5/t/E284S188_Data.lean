module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S188 "data/lean/466f213f6443662444f4f5c670b467d4/E284S188.bin"
namespace E284S188
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 116, 382], [222], 15)], 0, E284S188.L1),
([(0, true, false, [84, 116, 382], [222], 17)], 0, E284S188.L2),
([(0, true, false, [84, 116, 382], [222], 47)], 0, E284S188.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S188
