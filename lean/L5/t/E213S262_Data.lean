module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S262 "data/lean/48978bfa6ea679d12b33a732494bc6c1/E213S262.bin"
namespace E213S262
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [106, 254], [272, 388], 0)], 0, E213S262.L1),
([(13, true, false, [106, 254], [272, 388], 6)], 0, E213S262.L2),
([(13, true, false, [106, 254], [272, 388], 15)], 0, E213S262.L3),
([(13, true, false, [106, 254], [272, 388], 47)], 0, E213S262.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S262
