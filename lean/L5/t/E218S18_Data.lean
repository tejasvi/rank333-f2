module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S18 "data/lean/e5895e8f849dbae27117ba2ccdd6b07a/E218S18.bin"
namespace E218S18
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [266], [148], 0)], 0, E218S18.L1),
([(10, true, false, [266], [148], 1)], 0, E218S18.L2),
([(10, true, false, [266], [148], 3)], 0, E218S18.L3),
([(10, true, false, [266], [148], 7)], 0, E218S18.L4),
([(10, true, false, [266], [148], 10)], 0, E218S18.L5),
([(10, true, false, [266], [148], 25)], 0, E218S18.L6),
([(10, true, false, [266], [148], 32)], 0, E218S18.L7),
([(10, true, false, [266], [148], 33)], 0, E218S18.L8),
([(10, true, false, [266], [148], 42)], 0, E218S18.L9),
([(10, true, false, [266], [148], 44)], 0, E218S18.L10),
([(10, true, false, [266], [148], 45)], 0, E218S18.L11),
([(10, true, false, [266], [148], 49)], 0, E218S18.L12),
([(10, true, false, [266], [148], 50)], 0, E218S18.L13),
([(10, true, false, [266], [148], 74)], 0, E218S18.L14),
([(10, true, false, [266], [148], 75)], 0, E218S18.L15),
([(10, true, false, [266], [148], 76)], 0, E218S18.L16),
([(10, true, false, [266], [148], 77)], 0, E218S18.L17),
([(10, true, false, [266], [148], 78)], 0, E218S18.L18),
([(10, true, false, [266], [148], 80)], 0, E218S18.L19),
([(10, true, false, [266], [148], 81)], 0, E218S18.L20),
([(10, true, false, [266], [148], 82)], 0, E218S18.L21),
([(10, true, false, [266], [148], 83)], 0, E218S18.L22),
([(10, true, false, [266], [148], 89)], 0, E218S18.L23),
([(10, true, false, [266], [148], 112)], 0, E218S18.L24),
([(10, true, false, [266], [148], 114)], 0, E218S18.L25),
([(10, true, false, [266], [148], 117)], 0, E218S18.L26),
([(10, true, false, [266], [148], 120)], 0, E218S18.L27),
([(10, true, false, [266], [148], 122)], 0, E218S18.L28),
([(10, true, false, [266], [148], 130)], 0, E218S18.L29),
([(10, true, false, [266], [148], 138)], 0, E218S18.L30),
([(10, true, false, [266], [148], 140)], 0, E218S18.L31),
([(10, true, false, [266], [148], 163)], 0, E218S18.L32),
([(10, true, false, [266], [148], 166)], 0, E218S18.L33),
([(10, true, false, [266], [148], 168)], 0, E218S18.L34)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 34
end E218S18
