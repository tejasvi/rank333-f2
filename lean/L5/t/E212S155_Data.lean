module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S155 "data/lean/767c9e25c6c81a7a3665f650951f2c03/E212S155.bin"
namespace E212S155
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [122, 158, 254, 494], [], 0)], 0, E212S155.L1),
([(0, true, false, [122, 158, 254, 494], [], 1)], 0, E212S155.L2),
([(0, true, false, [122, 158, 254, 494], [], 3)], 0, E212S155.L3),
([(0, true, false, [122, 158, 254, 494], [], 6)], 0, E212S155.L4),
([(0, true, false, [122, 158, 254, 494], [], 7)], 0, E212S155.L5),
([(0, true, false, [122, 158, 254, 494], [], 37)], 0, E212S155.L6),
([(0, true, false, [122, 158, 254, 494], [], 38)], 0, E212S155.L7),
([(0, true, false, [122, 158, 254, 494], [], 39)], 0, E212S155.L8),
([(0, true, false, [122, 158, 254, 494], [], 41)], 0, E212S155.L9),
([(0, true, false, [122, 158, 254, 494], [], 42)], 0, E212S155.L10),
([(0, true, false, [122, 158, 254, 494], [], 44)], 0, E212S155.L11),
([(0, true, false, [122, 158, 254, 494], [], 45)], 0, E212S155.L12),
([(0, true, false, [122, 158, 254, 494], [], 46)], 0, E212S155.L13),
([(0, true, false, [122, 158, 254, 494], [], 52)], 0, E212S155.L14),
([(0, true, false, [122, 158, 254, 494], [], 107)], 0, E212S155.L15),
([(0, true, false, [122, 158, 254, 494], [], 123)], 0, E212S155.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E212S155
