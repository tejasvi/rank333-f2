module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S305 "data/lean/db26ceb740a3a9714d5f825e8fcf692d/E284S305.bin"
namespace E284S305
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [116, 500, 84, 468], [], 10)], 0, E284S305.L1),
([(5, true, false, [116, 500, 84, 468], [], 12)], 0, E284S305.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S305
