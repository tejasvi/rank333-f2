module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S19 "data/lean/2a1d675094b3a06f5055a74533697f33/E212S19.bin"
namespace E212S19
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266], [368, 404], 0)], 0, E212S19.L1),
([(13, true, false, [266], [368, 404], 1)], 0, E212S19.L2),
([(13, true, false, [266], [368, 404], 2)], 0, E212S19.L3),
([(13, true, false, [266], [368, 404], 3)], 0, E212S19.L4),
([(13, true, false, [266], [368, 404], 4)], 0, E212S19.L5),
([(13, true, false, [266], [368, 404], 5)], 0, E212S19.L6),
([(13, true, false, [266], [368, 404], 6)], 0, E212S19.L7),
([(13, true, false, [266], [368, 404], 7)], 0, E212S19.L8),
([(13, true, false, [266], [368, 404], 8)], 0, E212S19.L9),
([(13, true, false, [266], [368, 404], 9)], 0, E212S19.L10),
([(13, true, false, [266], [368, 404], 10)], 0, E212S19.L11),
([(13, true, false, [266], [368, 404], 11)], 0, E212S19.L12),
([(13, true, false, [266], [368, 404], 12)], 0, E212S19.L13),
([(13, true, false, [266], [368, 404], 14)], 0, E212S19.L14),
([(13, true, false, [266], [368, 404], 22)], 0, E212S19.L15),
([(13, true, false, [266], [368, 404], 23)], 0, E212S19.L16),
([(13, true, false, [266], [368, 404], 24)], 0, E212S19.L17),
([(13, true, false, [266], [368, 404], 26)], 0, E212S19.L18),
([(13, true, false, [266], [368, 404], 27)], 0, E212S19.L19),
([(13, true, false, [266], [368, 404], 29)], 0, E212S19.L20),
([(13, true, false, [266], [368, 404], 38)], 0, E212S19.L21),
([(13, true, false, [266], [368, 404], 50)], 0, E212S19.L22),
([(13, true, false, [266], [368, 404], 51)], 0, E212S19.L23),
([(13, true, false, [266], [368, 404], 52)], 0, E212S19.L24),
([(13, true, false, [266], [368, 404], 54)], 0, E212S19.L25),
([(13, true, false, [266], [368, 404], 55)], 0, E212S19.L26),
([(13, true, false, [266], [368, 404], 57)], 0, E212S19.L27),
([(13, true, false, [266], [368, 404], 58)], 0, E212S19.L28),
([(13, true, false, [266], [368, 404], 59)], 0, E212S19.L29),
([(13, true, false, [266], [368, 404], 64)], 0, E212S19.L30),
([(13, true, false, [266], [368, 404], 65)], 0, E212S19.L31),
([(13, true, false, [266], [368, 404], 72)], 0, E212S19.L32),
([(13, true, false, [266], [368, 404], 77)], 0, E212S19.L33),
([(13, true, false, [266], [368, 404], 105)], 0, E212S19.L34),
([(13, true, false, [266], [368, 404], 108)], 0, E212S19.L35),
([(13, true, false, [266], [368, 404], 109)], 0, E212S19.L36),
([(13, true, false, [266], [368, 404], 116)], 0, E212S19.L37),
([(13, true, false, [266], [368, 404], 120)], 0, E212S19.L38),
([(13, true, false, [266], [368, 404], 142)], 0, E212S19.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E212S19
