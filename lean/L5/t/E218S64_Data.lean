module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S64 "data/lean/d5559ebf47469d9c64ddd1c47a026978/E218S64.bin"
namespace E218S64
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [266], [352], 0)], 0, E218S64.L1),
([(9, true, false, [266], [352], 2)], 0, E218S64.L2),
([(9, true, false, [266], [352], 3)], 0, E218S64.L3),
([(9, true, false, [266], [352], 12)], 0, E218S64.L4),
([(9, true, false, [266], [352], 20)], 0, E218S64.L5),
([(9, true, false, [266], [352], 21)], 0, E218S64.L6),
([(9, true, false, [266], [352], 24)], 0, E218S64.L7),
([(9, true, false, [266], [352], 25)], 0, E218S64.L8),
([(9, true, false, [266], [352], 28)], 0, E218S64.L9),
([(9, true, false, [266], [352], 29)], 0, E218S64.L10),
([(9, true, false, [266], [352], 31)], 0, E218S64.L11),
([(9, true, false, [266], [352], 34)], 0, E218S64.L12),
([(9, true, false, [266], [352], 35)], 0, E218S64.L13),
([(9, true, false, [266], [352], 38)], 0, E218S64.L14),
([(9, true, false, [266], [352], 46)], 0, E218S64.L15),
([(9, true, false, [266], [352], 78)], 0, E218S64.L16),
([(9, true, false, [266], [352], 84)], 0, E218S64.L17),
([(9, true, false, [266], [352], 174)], 0, E218S64.L18),
([(9, true, false, [266], [352], 175)], 0, E218S64.L19),
([(9, true, false, [266], [352], 200)], 0, E218S64.L20),
([(9, true, false, [266], [352], 212)], 0, E218S64.L21),
([(9, true, false, [266], [352], 213)], 0, E218S64.L22),
([(9, true, false, [266], [352], 224)], 0, E218S64.L23),
([(9, true, false, [266], [352], 226)], 0, E218S64.L24),
([(9, true, false, [266], [352], 246)], 0, E218S64.L25),
([(9, true, false, [266], [352], 247)], 0, E218S64.L26),
([(9, true, false, [266], [352], 248)], 0, E218S64.L27),
([(9, true, false, [266], [352], 249)], 0, E218S64.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E218S64
