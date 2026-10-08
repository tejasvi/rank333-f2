module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S130 "data/lean/f7494ffb6c521f8262396907760fc1af/E218S130.bin"
namespace E218S130
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494], [112], 1)], 0, E218S130.L1),
([(2, true, false, [266, 494], [112], 4)], 0, E218S130.L2),
([(2, true, false, [266, 494], [112], 11)], 0, E218S130.L3),
([(2, true, false, [266, 494], [112], 16)], 0, E218S130.L4),
([(2, true, false, [266, 494], [112], 17)], 0, E218S130.L5),
([(2, true, false, [266, 494], [112], 21)], 0, E218S130.L6),
([(2, true, false, [266, 494], [112], 25)], 0, E218S130.L7),
([(2, true, false, [266, 494], [112], 26)], 0, E218S130.L8),
([(2, true, false, [266, 494], [112], 28)], 0, E218S130.L9),
([(2, true, false, [266, 494], [112], 32)], 0, E218S130.L10),
([(2, true, false, [266, 494], [112], 36)], 0, E218S130.L11),
([(2, true, false, [266, 494], [112], 42)], 0, E218S130.L12),
([(2, true, false, [266, 494], [112], 46)], 0, E218S130.L13),
([(2, true, false, [266, 494], [112], 60)], 0, E218S130.L14),
([(2, true, false, [266, 494], [112], 64)], 0, E218S130.L15),
([(2, true, false, [266, 494], [112], 82)], 0, E218S130.L16),
([(2, true, false, [266, 494], [112], 84)], 0, E218S130.L17),
([(2, true, false, [266, 494], [112], 96)], 0, E218S130.L18),
([(2, true, false, [266, 494], [112], 99)], 0, E218S130.L19),
([(2, true, false, [266, 494], [112], 107)], 0, E218S130.L20),
([(2, true, false, [266, 494], [112], 110)], 0, E218S130.L21),
([(2, true, false, [266, 494], [112], 118)], 0, E218S130.L22),
([(2, true, false, [266, 494], [112], 122)], 0, E218S130.L23),
([(2, true, false, [266, 494], [112], 134)], 0, E218S130.L24),
([(2, true, false, [266, 494], [112], 137)], 0, E218S130.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E218S130
