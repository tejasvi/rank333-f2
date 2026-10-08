module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S126 "data/lean/1ed4d91cfe9d0114489f5a2b4bab4fb2/E218S126.bin"
namespace E218S126
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 266], [378], 2)], 0, E218S126.L1),
([(0, true, false, [106, 142, 266], [378], 45)], 0, E218S126.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E218S126
