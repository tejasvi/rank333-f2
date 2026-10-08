module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S21 "data/lean/51cca02d4661f1d9beb5cd5d06f6b44d/E237S21.bin"
namespace E237S21
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [412], [96, 138], 2)], 0, E237S21.L1),
([(8, true, false, [412], [96, 138], 8)], 0, E237S21.L2),
([(8, true, false, [412], [96, 138], 46)], 0, E237S21.L3),
([(8, true, false, [412], [96, 138], 53)], 0, E237S21.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E237S21
