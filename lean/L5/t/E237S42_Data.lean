module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S42 "data/lean/391048d98acbfd2063a60d14d9f567ab/E237S42.bin"
namespace E237S42
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [234, 354, 412], [488], 2)], 0, E237S42.L1),
([(10, true, false, [234, 354, 412], [488], 4)], 0, E237S42.L2),
([(10, true, false, [234, 354, 412], [488], 9)], 0, E237S42.L3),
([(10, true, false, [234, 354, 412], [488], 19)], 0, E237S42.L4),
([(10, true, false, [234, 354, 412], [488], 22)], 0, E237S42.L5),
([(10, true, false, [234, 354, 412], [488], 40)], 0, E237S42.L6),
([(10, true, false, [234, 354, 412], [488], 48)], 0, E237S42.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E237S42
