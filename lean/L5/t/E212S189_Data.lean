module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S189 "data/lean/972ef3be5c8778bc8c70de5f22f34809/E212S189.bin"
namespace E212S189
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [122, 158, 254, 500], [], 5)], 0, E212S189.L1),
([(8, true, false, [122, 158, 254, 500], [], 13)], 0, E212S189.L2),
([(8, true, false, [122, 158, 254, 500], [], 39)], 0, E212S189.L3),
([(8, true, false, [122, 158, 254, 500], [], 42)], 0, E212S189.L4),
([(8, true, false, [122, 158, 254, 500], [], 100)], 0, E212S189.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S189
