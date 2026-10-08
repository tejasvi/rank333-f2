module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S189 "data/lean/bd827140aebc517a36498673999b3c9a/E218S189.bin"
namespace E218S189
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [142, 254, 494, 500], [], 0)], 0, E218S189.L1),
([(0, true, false, [142, 254, 494, 500], [], 3)], 0, E218S189.L2),
([(0, true, false, [142, 254, 494, 500], [], 5)], 0, E218S189.L3),
([(0, true, false, [142, 254, 494, 500], [], 10)], 0, E218S189.L4),
([(0, true, false, [142, 254, 494, 500], [], 13)], 0, E218S189.L5),
([(0, true, false, [142, 254, 494, 500], [], 21)], 0, E218S189.L6),
([(0, true, false, [142, 254, 494, 500], [], 34)], 0, E218S189.L7),
([(0, true, false, [142, 254, 494, 500], [], 63)], 0, E218S189.L8),
([(0, true, false, [142, 254, 494, 500], [], 88)], 0, E218S189.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E218S189
