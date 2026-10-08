module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S17 "data/lean/6f54ca8778887a0faa7dd2b59f5cd25a/E218S17.bin"
namespace E218S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [142, 266], [378], 4)], 30, E218S17.L1),
([(0, true, false, [142, 266], [378], 5)], 0, E218S17.L2),
([(0, true, false, [142, 266], [378], 8)], 0, E218S17.L3),
([(0, true, false, [142, 266], [378], 9)], 0, E218S17.L4),
([(0, true, false, [142, 266], [378], 10)], 0, E218S17.L5),
([(0, true, false, [142, 266], [378], 16)], 0, E218S17.L6),
([(0, true, false, [142, 266], [378], 26)], 0, E218S17.L7),
([(0, true, false, [142, 266], [378], 33)], 0, E218S17.L8),
([(0, true, false, [142, 266], [378], 46)], 0, E218S17.L9),
([(0, true, false, [142, 266], [378], 69)], 0, E218S17.L10),
([(0, true, false, [142, 266], [378], 73)], 0, E218S17.L11),
([(0, true, false, [142, 266], [378], 79)], 0, E218S17.L12),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 48)], 0, E218S17.L13),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 50)], 0, E218S17.L14),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 51)], 0, E218S17.L15),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 56)], 0, E218S17.L16),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 68)], 0, E218S17.L17),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 76)], 0, E218S17.L18),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 78)], 0, E218S17.L19),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 79)], 0, E218S17.L20),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 108)], 0, E218S17.L21),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 112)], 0, E218S17.L22),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 118)], 0, E218S17.L23),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 122)], 0, E218S17.L24),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 124)], 0, E218S17.L25),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 125)], 0, E218S17.L26),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 138)], 0, E218S17.L27),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 139)], 0, E218S17.L28),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 168)], 0, E218S17.L29),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 170)], 0, E218S17.L30),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 171)], 0, E218S17.L31),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 178)], 0, E218S17.L32),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 188)], 0, E218S17.L33),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 196)], 0, E218S17.L34),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 197)], 0, E218S17.L35),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 198)], 0, E218S17.L36),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 368)], 0, E218S17.L37),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 428)], 0, E218S17.L38),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 532)], 0, E218S17.L39),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 648)], 0, E218S17.L40),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 792)], 0, E218S17.L41),
([(0, true, false, [142, 266], [378], 4), (1, false, false, [], [378], 854)], 0, E218S17.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E218S17
