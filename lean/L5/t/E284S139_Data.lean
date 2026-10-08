module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S139 "data/lean/15fb56ce74d03cdddb95e05d8f7df9f6/E284S139.bin"
namespace E284S139
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 212, 266, 394, 382], [], 0)], 0, E284S139.L1),
([(3, true, false, [84, 212, 266, 394, 382], [], 1)], 0, E284S139.L2),
([(3, true, false, [84, 212, 266, 394, 382], [], 2)], 0, E284S139.L3),
([(3, true, false, [84, 212, 266, 394, 382], [], 4)], 0, E284S139.L4),
([(3, true, false, [84, 212, 266, 394, 382], [], 15)], 0, E284S139.L5),
([(3, true, false, [84, 212, 266, 394, 382], [], 16)], 0, E284S139.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S139
