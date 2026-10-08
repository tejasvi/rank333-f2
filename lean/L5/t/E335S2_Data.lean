module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E335S2 "data/lean/b353585140f8fe5a3f217869021aa7cb/E335S2.bin"
namespace E335S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [], [], 324)], 0, E335S2.L1),
([(16, true, false, [], [], 326)], 0, E335S2.L2),
([(16, true, false, [], [], 644)], 0, E335S2.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E335S2
