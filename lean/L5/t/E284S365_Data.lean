module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S365 "data/lean/101da3c7f2a3a5d11a4a5d2363f4a124/E284S365.bin"
namespace E284S365
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 5)], 0, E284S365.L1),
([(3, true, false, [116, 212, 340, 500, 84, 244, 372, 468], [], 89)], 0, E284S365.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S365
