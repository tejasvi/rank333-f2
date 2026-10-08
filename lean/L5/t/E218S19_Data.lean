module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S19 "data/lean/b412dfc8d20074b38e78120ca814b9ed/E218S19.bin"
namespace E218S19
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [266], [148], 0)], 0, E218S19.L1),
([(10, true, false, [266], [148], 1)], 0, E218S19.L2),
([(10, true, false, [266], [148], 2)], 0, E218S19.L3),
([(10, true, false, [266], [148], 4)], 0, E218S19.L4),
([(10, true, false, [266], [148], 5)], 0, E218S19.L5),
([(10, true, false, [266], [148], 7)], 0, E218S19.L6),
([(10, true, false, [266], [148], 8)], 0, E218S19.L7),
([(10, true, false, [266], [148], 10)], 0, E218S19.L8),
([(10, true, false, [266], [148], 11)], 0, E218S19.L9),
([(10, true, false, [266], [148], 14)], 0, E218S19.L10),
([(10, true, false, [266], [148], 16)], 0, E218S19.L11),
([(10, true, false, [266], [148], 18)], 0, E218S19.L12),
([(10, true, false, [266], [148], 19)], 0, E218S19.L13),
([(10, true, false, [266], [148], 23)], 0, E218S19.L14),
([(10, true, false, [266], [148], 25)], 0, E218S19.L15),
([(10, true, false, [266], [148], 29)], 0, E218S19.L16),
([(10, true, false, [266], [148], 32)], 0, E218S19.L17),
([(10, true, false, [266], [148], 33)], 0, E218S19.L18),
([(10, true, false, [266], [148], 42)], 0, E218S19.L19),
([(10, true, false, [266], [148], 45)], 0, E218S19.L20),
([(10, true, false, [266], [148], 49)], 0, E218S19.L21),
([(10, true, false, [266], [148], 74)], 0, E218S19.L22),
([(10, true, false, [266], [148], 75)], 0, E218S19.L23),
([(10, true, false, [266], [148], 77)], 0, E218S19.L24),
([(10, true, false, [266], [148], 83)], 0, E218S19.L25),
([(10, true, false, [266], [148], 112)], 0, E218S19.L26),
([(10, true, false, [266], [148], 117)], 0, E218S19.L27),
([(10, true, false, [266], [148], 124)], 0, E218S19.L28),
([(10, true, false, [266], [148], 127)], 0, E218S19.L29),
([(10, true, false, [266], [148], 138)], 0, E218S19.L30),
([(10, true, false, [266], [148], 176)], 0, E218S19.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E218S19
