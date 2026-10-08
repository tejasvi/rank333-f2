module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S71 "data/lean/179a8dc211d7b7e87002d4884f06af4a/E218S71.bin"
namespace E218S71
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 266], [26], 0)], 0, E218S71.L1),
([(0, true, false, [254, 266], [26], 1)], 0, E218S71.L2),
([(0, true, false, [254, 266], [26], 2)], 0, E218S71.L3),
([(0, true, false, [254, 266], [26], 10)], 0, E218S71.L4),
([(0, true, false, [254, 266], [26], 11)], 0, E218S71.L5),
([(0, true, false, [254, 266], [26], 13)], 0, E218S71.L6),
([(0, true, false, [254, 266], [26], 14)], 0, E218S71.L7),
([(0, true, false, [254, 266], [26], 16)], 0, E218S71.L8),
([(0, true, false, [254, 266], [26], 17)], 0, E218S71.L9),
([(0, true, false, [254, 266], [26], 18)], 0, E218S71.L10),
([(0, true, false, [254, 266], [26], 19)], 0, E218S71.L11),
([(0, true, false, [254, 266], [26], 20)], 0, E218S71.L12),
([(0, true, false, [254, 266], [26], 21)], 0, E218S71.L13),
([(0, true, false, [254, 266], [26], 30)], 0, E218S71.L14),
([(0, true, false, [254, 266], [26], 34)], 0, E218S71.L15),
([(0, true, false, [254, 266], [26], 41)], 0, E218S71.L16),
([(0, true, false, [254, 266], [26], 43)], 0, E218S71.L17),
([(0, true, false, [254, 266], [26], 47)], 0, E218S71.L18),
([(0, true, false, [254, 266], [26], 57)], 0, E218S71.L19),
([(0, true, false, [254, 266], [26], 74)], 0, E218S71.L20),
([(0, true, false, [254, 266], [26], 76)], 0, E218S71.L21),
([(0, true, false, [254, 266], [26], 82)], 0, E218S71.L22),
([(0, true, false, [254, 266], [26], 83)], 0, E218S71.L23),
([(0, true, false, [254, 266], [26], 84)], 0, E218S71.L24),
([(0, true, false, [254, 266], [26], 86)], 0, E218S71.L25),
([(0, true, false, [254, 266], [26], 90)], 0, E218S71.L26),
([(0, true, false, [254, 266], [26], 105)], 0, E218S71.L27),
([(0, true, false, [254, 266], [26], 130)], 0, E218S71.L28),
([(0, true, false, [254, 266], [26], 132)], 0, E218S71.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E218S71
