module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S165 "data/lean/b817256e1a5d22188fc00998542d6dcf/E284S165.bin"
namespace E284S165
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [298, 84], [222], 0)], 0, E284S165.L1),
([(8, true, false, [298, 84], [222], 1)], 0, E284S165.L2),
([(8, true, false, [298, 84], [222], 2)], 0, E284S165.L3),
([(8, true, false, [298, 84], [222], 3)], 0, E284S165.L4),
([(8, true, false, [298, 84], [222], 5)], 0, E284S165.L5),
([(8, true, false, [298, 84], [222], 7)], 0, E284S165.L6),
([(8, true, false, [298, 84], [222], 10)], 0, E284S165.L7),
([(8, true, false, [298, 84], [222], 72)], 0, E284S165.L8),
([(8, true, false, [298, 84], [222], 155)], 0, E284S165.L9),
([(8, true, false, [298, 84], [222], 178)], 0, E284S165.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S165
