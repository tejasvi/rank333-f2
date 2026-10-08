module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S95 "data/lean/1b4579a8ef31b4856d41e369aa6b924c/E218S95.bin"
namespace E218S95
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [266, 500], [352], 0)], 0, E218S95.L1),
([(8, true, false, [266, 500], [352], 12)], 0, E218S95.L2),
([(8, true, false, [266, 500], [352], 37)], 0, E218S95.L3),
([(8, true, false, [266, 500], [352], 38)], 0, E218S95.L4),
([(8, true, false, [266, 500], [352], 41)], 0, E218S95.L5),
([(8, true, false, [266, 500], [352], 45)], 0, E218S95.L6),
([(8, true, false, [266, 500], [352], 46)], 0, E218S95.L7),
([(8, true, false, [266, 500], [352], 49)], 0, E218S95.L8),
([(8, true, false, [266, 500], [352], 53)], 0, E218S95.L9),
([(8, true, false, [266, 500], [352], 54)], 0, E218S95.L10),
([(8, true, false, [266, 500], [352], 58)], 0, E218S95.L11),
([(8, true, false, [266, 500], [352], 64)], 0, E218S95.L12),
([(8, true, false, [266, 500], [352], 84)], 0, E218S95.L13),
([(8, true, false, [266, 500], [352], 92)], 0, E218S95.L14),
([(8, true, false, [266, 500], [352], 102)], 0, E218S95.L15),
([(8, true, false, [266, 500], [352], 136)], 0, E218S95.L16),
([(8, true, false, [266, 500], [352], 152)], 0, E218S95.L17),
([(8, true, false, [266, 500], [352], 164)], 0, E218S95.L18),
([(8, true, false, [266, 500], [352], 172)], 0, E218S95.L19),
([(8, true, false, [266, 500], [352], 189)], 0, E218S95.L20),
([(8, true, false, [266, 500], [352], 190)], 0, E218S95.L21),
([(8, true, false, [266, 500], [352], 194)], 0, E218S95.L22),
([(8, true, false, [266, 500], [352], 195)], 0, E218S95.L23),
([(8, true, false, [266, 500], [352], 196)], 0, E218S95.L24),
([(8, true, false, [266, 500], [352], 199)], 0, E218S95.L25),
([(8, true, false, [266, 500], [352], 225)], 0, E218S95.L26),
([(8, true, false, [266, 500], [352], 242)], 0, E218S95.L27),
([(8, true, false, [266, 500], [352], 254)], 0, E218S95.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E218S95
