module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S65 "data/lean/e4d68f2e160fb45168a9eeb58310e00b/E212S65.bin"
namespace E212S65
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254, 122], [362], 4)], 0, E212S65.L1),
([(7, true, false, [254, 122], [362], 5)], 0, E212S65.L2),
([(7, true, false, [254, 122], [362], 6)], 0, E212S65.L3),
([(7, true, false, [254, 122], [362], 7)], 0, E212S65.L4),
([(7, true, false, [254, 122], [362], 10)], 0, E212S65.L5),
([(7, true, false, [254, 122], [362], 12)], 0, E212S65.L6),
([(7, true, false, [254, 122], [362], 17)], 0, E212S65.L7),
([(7, true, false, [254, 122], [362], 19)], 0, E212S65.L8),
([(7, true, false, [254, 122], [362], 24)], 0, E212S65.L9),
([(7, true, false, [254, 122], [362], 44)], 0, E212S65.L10),
([(7, true, false, [254, 122], [362], 45)], 0, E212S65.L11),
([(7, true, false, [254, 122], [362], 48)], 0, E212S65.L12),
([(7, true, false, [254, 122], [362], 50)], 0, E212S65.L13),
([(7, true, false, [254, 122], [362], 78)], 0, E212S65.L14),
([(7, true, false, [254, 122], [362], 80)], 0, E212S65.L15),
([(7, true, false, [254, 122], [362], 126)], 0, E212S65.L16),
([(7, true, false, [254, 122], [362], 127)], 0, E212S65.L17),
([(7, true, false, [254, 122], [362], 132)], 0, E212S65.L18),
([(7, true, false, [254, 122], [362], 140)], 0, E212S65.L19),
([(7, true, false, [254, 122], [362], 151)], 0, E212S65.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E212S65
