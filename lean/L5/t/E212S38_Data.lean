module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S38 "data/lean/6f077191ed6e9a0a1964aa6ce73806ff/E212S38.bin"
namespace E212S38
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [266, 122], [398], 0)], 0, E212S38.L1),
([(15, true, false, [266, 122], [398], 2)], 0, E212S38.L2),
([(15, true, false, [266, 122], [398], 46)], 0, E212S38.L3),
([(15, true, false, [266, 122], [398], 64)], 0, E212S38.L4),
([(15, true, false, [266, 122], [398], 65)], 0, E212S38.L5),
([(15, true, false, [266, 122], [398], 67)], 0, E212S38.L6),
([(15, true, false, [266, 122], [398], 70)], 0, E212S38.L7),
([(15, true, false, [266, 122], [398], 71)], 0, E212S38.L8),
([(15, true, false, [266, 122], [398], 79)], 0, E212S38.L9),
([(15, true, false, [266, 122], [398], 85)], 0, E212S38.L10),
([(15, true, false, [266, 122], [398], 107)], 0, E212S38.L11),
([(15, true, false, [266, 122], [398], 112)], 0, E212S38.L12),
([(15, true, false, [266, 122], [398], 113)], 0, E212S38.L13),
([(15, true, false, [266, 122], [398], 128)], 0, E212S38.L14),
([(15, true, false, [266, 122], [398], 204)], 0, E212S38.L15),
([(15, true, false, [266, 122], [398], 206)], 0, E212S38.L16),
([(15, true, false, [266, 122], [398], 221)], 0, E212S38.L17),
([(15, true, false, [266, 122], [398], 232)], 0, E212S38.L18),
([(15, true, false, [266, 122], [398], 253)], 0, E212S38.L19),
([(15, true, false, [266, 122], [398], 255)], 0, E212S38.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E212S38
