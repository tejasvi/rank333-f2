module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S85 "data/lean/0839832ddb9ecb8a1cf1397d618d4537/E218S85.bin"
namespace E218S85
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 254], [378], 1)], 0, E218S85.L1),
([(0, true, false, [106, 254], [378], 5)], 0, E218S85.L2),
([(0, true, false, [106, 254], [378], 6)], 0, E218S85.L3),
([(0, true, false, [106, 254], [378], 7)], 0, E218S85.L4),
([(0, true, false, [106, 254], [378], 8)], 0, E218S85.L5),
([(0, true, false, [106, 254], [378], 9)], 0, E218S85.L6),
([(0, true, false, [106, 254], [378], 11)], 0, E218S85.L7),
([(0, true, false, [106, 254], [378], 12)], 0, E218S85.L8),
([(0, true, false, [106, 254], [378], 13)], 0, E218S85.L9),
([(0, true, false, [106, 254], [378], 14)], 0, E218S85.L10),
([(0, true, false, [106, 254], [378], 18)], 0, E218S85.L11),
([(0, true, false, [106, 254], [378], 19)], 0, E218S85.L12),
([(0, true, false, [106, 254], [378], 27)], 0, E218S85.L13),
([(0, true, false, [106, 254], [378], 28)], 0, E218S85.L14),
([(0, true, false, [106, 254], [378], 29)], 0, E218S85.L15),
([(0, true, false, [106, 254], [378], 30)], 0, E218S85.L16),
([(0, true, false, [106, 254], [378], 32)], 0, E218S85.L17),
([(0, true, false, [106, 254], [378], 51)], 0, E218S85.L18),
([(0, true, false, [106, 254], [378], 52)], 0, E218S85.L19),
([(0, true, false, [106, 254], [378], 56)], 0, E218S85.L20),
([(0, true, false, [106, 254], [378], 75)], 0, E218S85.L21),
([(0, true, false, [106, 254], [378], 78)], 0, E218S85.L22),
([(0, true, false, [106, 254], [378], 87)], 0, E218S85.L23),
([(0, true, false, [106, 254], [378], 108)], 0, E218S85.L24),
([(0, true, false, [106, 254], [378], 109)], 0, E218S85.L25),
([(0, true, false, [106, 254], [378], 126)], 0, E218S85.L26),
([(0, true, false, [106, 254], [378], 128)], 0, E218S85.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E218S85
