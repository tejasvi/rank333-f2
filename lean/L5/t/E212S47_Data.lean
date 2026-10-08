module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S47 "data/lean/e387a10563c87c5a1c915a52cdef6a3d/E212S47.bin"
namespace E212S47
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [122, 500], [96], 0)], 0, E212S47.L1),
([(6, true, false, [122, 500], [96], 4)], 0, E212S47.L2),
([(6, true, false, [122, 500], [96], 31)], 0, E212S47.L3),
([(6, true, false, [122, 500], [96], 32)], 0, E212S47.L4),
([(6, true, false, [122, 500], [96], 33)], 0, E212S47.L5),
([(6, true, false, [122, 500], [96], 35)], 0, E212S47.L6),
([(6, true, false, [122, 500], [96], 36)], 0, E212S47.L7),
([(6, true, false, [122, 500], [96], 39)], 0, E212S47.L8),
([(6, true, false, [122, 500], [96], 45)], 0, E212S47.L9),
([(6, true, false, [122, 500], [96], 49)], 0, E212S47.L10),
([(6, true, false, [122, 500], [96], 73)], 0, E212S47.L11),
([(6, true, false, [122, 500], [96], 80)], 0, E212S47.L12),
([(6, true, false, [122, 500], [96], 87)], 0, E212S47.L13),
([(6, true, false, [122, 500], [96], 101)], 0, E212S47.L14),
([(6, true, false, [122, 500], [96], 104)], 0, E212S47.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E212S47
