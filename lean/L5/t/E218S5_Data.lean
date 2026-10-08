module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S5 "data/lean/7e764051d59510b450e77990b33aaa59/E218S5.bin"
namespace E218S5
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [500], [112, 272], 4)], 0, E218S5.L1),
([(3, true, false, [500], [112, 272], 5)], 0, E218S5.L2),
([(3, true, false, [500], [112, 272], 6)], 0, E218S5.L3),
([(3, true, false, [500], [112, 272], 7)], 0, E218S5.L4),
([(3, true, false, [500], [112, 272], 31)], 0, E218S5.L5),
([(3, true, false, [500], [112, 272], 42)], 0, E218S5.L6),
([(3, true, false, [500], [112, 272], 44)], 0, E218S5.L7),
([(3, true, false, [500], [112, 272], 50)], 0, E218S5.L8),
([(3, true, false, [500], [112, 272], 54)], 0, E218S5.L9),
([(3, true, false, [500], [112, 272], 62)], 0, E218S5.L10),
([(3, true, false, [500], [112, 272], 64)], 0, E218S5.L11),
([(3, true, false, [500], [112, 272], 71)], 0, E218S5.L12),
([(3, true, false, [500], [112, 272], 74)], 0, E218S5.L13),
([(3, true, false, [500], [112, 272], 76)], 0, E218S5.L14),
([(3, true, false, [500], [112, 272], 80)], 0, E218S5.L15),
([(3, true, false, [500], [112, 272], 81)], 0, E218S5.L16),
([(3, true, false, [500], [112, 272], 84)], 0, E218S5.L17),
([(3, true, false, [500], [112, 272], 85)], 0, E218S5.L18),
([(3, true, false, [500], [112, 272], 88)], 0, E218S5.L19),
([(3, true, false, [500], [112, 272], 90)], 0, E218S5.L20),
([(3, true, false, [500], [112, 272], 91)], 0, E218S5.L21),
([(3, true, false, [500], [112, 272], 92)], 0, E218S5.L22),
([(3, true, false, [500], [112, 272], 93)], 0, E218S5.L23),
([(3, true, false, [500], [112, 272], 118)], 0, E218S5.L24),
([(3, true, false, [500], [112, 272], 140)], 0, E218S5.L25),
([(3, true, false, [500], [112, 272], 141)], 0, E218S5.L26),
([(3, true, false, [500], [112, 272], 150)], 0, E218S5.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E218S5
