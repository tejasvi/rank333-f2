module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S172 "data/lean/90618e27d65d1cde9a94257a60e2490f/E284S172.bin"
namespace E284S172
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 372], [42], 4)], 0, E284S172.L1),
([(8, true, false, [254, 372], [42], 41)], 0, E284S172.L2),
([(8, true, false, [254, 372], [42], 43)], 0, E284S172.L3),
([(8, true, false, [254, 372], [42], 44)], 0, E284S172.L4),
([(8, true, false, [254, 372], [42], 74)], 0, E284S172.L5),
([(8, true, false, [254, 372], [42], 75)], 0, E284S172.L6),
([(8, true, false, [254, 372], [42], 76)], 0, E284S172.L7),
([(8, true, false, [254, 372], [42], 77)], 0, E284S172.L8),
([(8, true, false, [254, 372], [42], 127)], 0, E284S172.L9),
([(8, true, false, [254, 372], [42], 130)], 0, E284S172.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S172
