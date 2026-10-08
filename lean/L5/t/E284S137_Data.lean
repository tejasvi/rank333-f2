module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S137 "data/lean/9c135977d974554299cf8969a1e80fff/E284S137.bin"
namespace E284S137
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 266, 394], [42], 0)], 0, E284S137.L1),
([(3, true, false, [116, 266, 394], [42], 1)], 0, E284S137.L2),
([(3, true, false, [116, 266, 394], [42], 2)], 0, E284S137.L3),
([(3, true, false, [116, 266, 394], [42], 3)], 0, E284S137.L4),
([(3, true, false, [116, 266, 394], [42], 4)], 0, E284S137.L5),
([(3, true, false, [116, 266, 394], [42], 5)], 0, E284S137.L6),
([(3, true, false, [116, 266, 394], [42], 6)], 0, E284S137.L7),
([(3, true, false, [116, 266, 394], [42], 7)], 0, E284S137.L8),
([(3, true, false, [116, 266, 394], [42], 8)], 0, E284S137.L9),
([(3, true, false, [116, 266, 394], [42], 9)], 0, E284S137.L10),
([(3, true, false, [116, 266, 394], [42], 10)], 0, E284S137.L11),
([(3, true, false, [116, 266, 394], [42], 11)], 0, E284S137.L12),
([(3, true, false, [116, 266, 394], [42], 12)], 0, E284S137.L13),
([(3, true, false, [116, 266, 394], [42], 13)], 0, E284S137.L14),
([(3, true, false, [116, 266, 394], [42], 14)], 0, E284S137.L15),
([(3, true, false, [116, 266, 394], [42], 15)], 0, E284S137.L16),
([(3, true, false, [116, 266, 394], [42], 16)], 0, E284S137.L17),
([(3, true, false, [116, 266, 394], [42], 17)], 0, E284S137.L18),
([(3, true, false, [116, 266, 394], [42], 18)], 0, E284S137.L19),
([(3, true, false, [116, 266, 394], [42], 19)], 0, E284S137.L20),
([(3, true, false, [116, 266, 394], [42], 26)], 0, E284S137.L21),
([(3, true, false, [116, 266, 394], [42], 27)], 0, E284S137.L22),
([(3, true, false, [116, 266, 394], [42], 28)], 0, E284S137.L23),
([(3, true, false, [116, 266, 394], [42], 29)], 0, E284S137.L24),
([(3, true, false, [116, 266, 394], [42], 32)], 0, E284S137.L25),
([(3, true, false, [116, 266, 394], [42], 33)], 0, E284S137.L26),
([(3, true, false, [116, 266, 394], [42], 35)], 0, E284S137.L27),
([(3, true, false, [116, 266, 394], [42], 36)], 0, E284S137.L28),
([(3, true, false, [116, 266, 394], [42], 43)], 0, E284S137.L29),
([(3, true, false, [116, 266, 394], [42], 44)], 0, E284S137.L30),
([(3, true, false, [116, 266, 394], [42], 51)], 0, E284S137.L31),
([(3, true, false, [116, 266, 394], [42], 57)], 0, E284S137.L32),
([(3, true, false, [116, 266, 394], [42], 68)], 0, E284S137.L33),
([(3, true, false, [116, 266, 394], [42], 70)], 0, E284S137.L34),
([(3, true, false, [116, 266, 394], [42], 71)], 0, E284S137.L35),
([(3, true, false, [116, 266, 394], [42], 72)], 0, E284S137.L36),
([(3, true, false, [116, 266, 394], [42], 73)], 0, E284S137.L37),
([(3, true, false, [116, 266, 394], [42], 79)], 0, E284S137.L38),
([(3, true, false, [116, 266, 394], [42], 83)], 0, E284S137.L39),
([(3, true, false, [116, 266, 394], [42], 84)], 0, E284S137.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E284S137
