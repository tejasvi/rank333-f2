module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S65 "data/lean/278a7e253012be8abebfc11fcfc2a469/E284S65.bin"
namespace E284S65
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [212, 426], [10], 0)], 0, E284S65.L1),
([(3, true, false, [212, 426], [10], 2)], 0, E284S65.L2),
([(3, true, false, [212, 426], [10], 10)], 0, E284S65.L3),
([(3, true, false, [212, 426], [10], 11)], 0, E284S65.L4),
([(3, true, false, [212, 426], [10], 12)], 0, E284S65.L5),
([(3, true, false, [212, 426], [10], 14)], 0, E284S65.L6),
([(3, true, false, [212, 426], [10], 15)], 0, E284S65.L7),
([(3, true, false, [212, 426], [10], 16)], 0, E284S65.L8),
([(3, true, false, [212, 426], [10], 30)], 0, E284S65.L9),
([(3, true, false, [212, 426], [10], 34)], 0, E284S65.L10),
([(3, true, false, [212, 426], [10], 46)], 0, E284S65.L11),
([(3, true, false, [212, 426], [10], 48)], 0, E284S65.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S65
