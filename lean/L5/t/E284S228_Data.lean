module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S228 "data/lean/8f463f0c05d18e55fdde915f15b7f5e8/E284S228.bin"
namespace E284S228
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [212, 254, 382, 394, 266, 468], [], 0)], 0, E284S228.L1),
([(6, true, false, [212, 254, 382, 394, 266, 468], [], 22)], 0, E284S228.L2),
([(6, true, false, [212, 254, 382, 394, 266, 468], [], 27)], 0, E284S228.L3),
([(6, true, false, [212, 254, 382, 394, 266, 468], [], 81)], 0, E284S228.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S228
