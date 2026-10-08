module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S201 "data/lean/2169e9d493179de225fdc938239f904e/E284S201.bin"
namespace E284S201
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 394], [126, 350], 0)], 0, E284S201.L1),
([(0, true, false, [84, 394], [126, 350], 50)], 0, E284S201.L2),
([(0, true, false, [84, 394], [126, 350], 58)], 0, E284S201.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S201
