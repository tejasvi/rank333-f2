module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S86 "data/lean/7a83322cf023beb4580c5a9541999a1a/E218S86.bin"
namespace E218S86
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [106, 254], [272], 12)], 0, E218S86.L1),
([(4, true, false, [106, 254], [272], 13)], 0, E218S86.L2),
([(4, true, false, [106, 254], [272], 14)], 0, E218S86.L3),
([(4, true, false, [106, 254], [272], 15)], 0, E218S86.L4),
([(4, true, false, [106, 254], [272], 17)], 0, E218S86.L5),
([(4, true, false, [106, 254], [272], 19)], 0, E218S86.L6),
([(4, true, false, [106, 254], [272], 22)], 0, E218S86.L7),
([(4, true, false, [106, 254], [272], 23)], 0, E218S86.L8),
([(4, true, false, [106, 254], [272], 25)], 0, E218S86.L9),
([(4, true, false, [106, 254], [272], 26)], 0, E218S86.L10),
([(4, true, false, [106, 254], [272], 31)], 0, E218S86.L11),
([(4, true, false, [106, 254], [272], 43)], 0, E218S86.L12),
([(4, true, false, [106, 254], [272], 67)], 0, E218S86.L13),
([(4, true, false, [106, 254], [272], 82)], 0, E218S86.L14),
([(4, true, false, [106, 254], [272], 100)], 0, E218S86.L15),
([(4, true, false, [106, 254], [272], 131)], 0, E218S86.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E218S86
