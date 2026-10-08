module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S47 "data/lean/12583d7bd9b8d004c974b22e6ee4a10c/E284S47.bin"
namespace E284S47
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [372, 426], [10], 10)], 0, E284S47.L1),
([(3, true, false, [372, 426], [10], 11)], 0, E284S47.L2),
([(3, true, false, [372, 426], [10], 13)], 0, E284S47.L3),
([(3, true, false, [372, 426], [10], 14)], 0, E284S47.L4),
([(3, true, false, [372, 426], [10], 20)], 0, E284S47.L5),
([(3, true, false, [372, 426], [10], 24)], 0, E284S47.L6),
([(3, true, false, [372, 426], [10], 40)], 0, E284S47.L7),
([(3, true, false, [372, 426], [10], 44)], 0, E284S47.L8),
([(3, true, false, [372, 426], [10], 57)], 0, E284S47.L9),
([(3, true, false, [372, 426], [10], 66)], 0, E284S47.L10),
([(3, true, false, [372, 426], [10], 100)], 0, E284S47.L11),
([(3, true, false, [372, 426], [10], 119)], 0, E284S47.L12),
([(3, true, false, [372, 426], [10], 128)], 0, E284S47.L13),
([(3, true, false, [372, 426], [10], 129)], 0, E284S47.L14),
([(3, true, false, [372, 426], [10], 153)], 0, E284S47.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S47
