module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S112 "data/lean/10bc43aa2f542ad3f8aca57d38b79640/E284S112.bin"
namespace E284S112
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [266, 382, 426], [10], 0)], 0, E284S112.L1),
([(8, true, false, [266, 382, 426], [10], 1)], 0, E284S112.L2),
([(8, true, false, [266, 382, 426], [10], 5)], 0, E284S112.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S112
