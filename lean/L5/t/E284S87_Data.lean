module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S87 "data/lean/13fa9d132c091cd1f0fce9e1040954e6/E284S87.bin"
namespace E284S87
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 298], [138], 0)], 0, E284S87.L1),
([(8, true, false, [254, 266, 298], [138], 6)], 0, E284S87.L2),
([(8, true, false, [254, 266, 298], [138], 9)], 0, E284S87.L3),
([(8, true, false, [254, 266, 298], [138], 16)], 0, E284S87.L4),
([(8, true, false, [254, 266, 298], [138], 19)], 0, E284S87.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S87
