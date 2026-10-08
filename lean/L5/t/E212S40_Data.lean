module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S40 "data/lean/b05b500797794c7a9986c8b106ed8f3a/E212S40.bin"
namespace E212S40
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266], [404], 1)], 0, E212S40.L1),
([(13, true, false, [266], [404], 4)], 0, E212S40.L2),
([(13, true, false, [266], [404], 5)], 0, E212S40.L3),
([(13, true, false, [266], [404], 8)], 0, E212S40.L4),
([(13, true, false, [266], [404], 11)], 0, E212S40.L5),
([(13, true, false, [266], [404], 16)], 0, E212S40.L6),
([(13, true, false, [266], [404], 18)], 0, E212S40.L7),
([(13, true, false, [266], [404], 19)], 0, E212S40.L8),
([(13, true, false, [266], [404], 23)], 0, E212S40.L9),
([(13, true, false, [266], [404], 24)], 0, E212S40.L10),
([(13, true, false, [266], [404], 25)], 0, E212S40.L11),
([(13, true, false, [266], [404], 34)], 0, E212S40.L12),
([(13, true, false, [266], [404], 35)], 0, E212S40.L13),
([(13, true, false, [266], [404], 43)], 0, E212S40.L14),
([(13, true, false, [266], [404], 55)], 0, E212S40.L15),
([(13, true, false, [266], [404], 62)], 0, E212S40.L16),
([(13, true, false, [266], [404], 69)], 0, E212S40.L17),
([(13, true, false, [266], [404], 80)], 0, E212S40.L18),
([(13, true, false, [266], [404], 81)], 0, E212S40.L19),
([(13, true, false, [266], [404], 83)], 0, E212S40.L20),
([(13, true, false, [266], [404], 84)], 0, E212S40.L21),
([(13, true, false, [266], [404], 87)], 0, E212S40.L22),
([(13, true, false, [266], [404], 117)], 0, E212S40.L23),
([(13, true, false, [266], [404], 124)], 0, E212S40.L24),
([(13, true, false, [266], [404], 127)], 0, E212S40.L25),
([(13, true, false, [266], [404], 138)], 0, E212S40.L26),
([(13, true, false, [266], [404], 224)], 0, E212S40.L27),
([(13, true, false, [266], [404], 226)], 0, E212S40.L28),
([(13, true, false, [266], [404], 247)], 0, E212S40.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E212S40
