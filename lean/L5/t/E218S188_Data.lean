module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S188 "data/lean/71949211bc784c24dcb5e44381eb0eab/E218S188.bin"
namespace E218S188
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 254, 500], [], 0)], 0, E218S188.L1),
([(0, true, false, [106, 142, 254, 500], [], 5)], 0, E218S188.L2),
([(0, true, false, [106, 142, 254, 500], [], 7)], 0, E218S188.L3),
([(0, true, false, [106, 142, 254, 500], [], 69)], 0, E218S188.L4),
([(0, true, false, [106, 142, 254, 500], [], 79)], 0, E218S188.L5),
([(0, true, false, [106, 142, 254, 500], [], 86)], 0, E218S188.L6),
([(0, true, false, [106, 142, 254, 500], [], 141)], 0, E218S188.L7),
([(0, true, false, [106, 142, 254, 500], [], 142)], 0, E218S188.L8),
([(0, true, false, [106, 142, 254, 500], [], 147)], 0, E218S188.L9),
([(0, true, false, [106, 142, 254, 500], [], 148)], 0, E218S188.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E218S188
