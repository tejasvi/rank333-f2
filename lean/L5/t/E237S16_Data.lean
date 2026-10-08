module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S16 "data/lean/e8233379c203e97c4c13c7fce360ed93/E237S16.bin"
namespace E237S16
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116, 354], [96], 0)], 0, E237S16.L1),
([(9, true, false, [116, 354], [96], 4)], 0, E237S16.L2),
([(9, true, false, [116, 354], [96], 6)], 0, E237S16.L3),
([(9, true, false, [116, 354], [96], 8)], 0, E237S16.L4),
([(9, true, false, [116, 354], [96], 16)], 0, E237S16.L5),
([(9, true, false, [116, 354], [96], 31)], 0, E237S16.L6),
([(9, true, false, [116, 354], [96], 35)], 0, E237S16.L7),
([(9, true, false, [116, 354], [96], 49)], 0, E237S16.L8),
([(9, true, false, [116, 354], [96], 50)], 0, E237S16.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E237S16
