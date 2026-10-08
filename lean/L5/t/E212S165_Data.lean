module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S165 "data/lean/a7d36df57269ff91786753de79caab99/E212S165.bin"
namespace E212S165
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 254], [398], 0)], 0, E212S165.L1),
([(0, true, false, [158, 254], [398], 7)], 0, E212S165.L2),
([(0, true, false, [158, 254], [398], 10)], 0, E212S165.L3),
([(0, true, false, [158, 254], [398], 11)], 0, E212S165.L4),
([(0, true, false, [158, 254], [398], 14)], 0, E212S165.L5),
([(0, true, false, [158, 254], [398], 28)], 0, E212S165.L6),
([(0, true, false, [158, 254], [398], 31)], 0, E212S165.L7),
([(0, true, false, [158, 254], [398], 48)], 0, E212S165.L8),
([(0, true, false, [158, 254], [398], 50)], 0, E212S165.L9),
([(0, true, false, [158, 254], [398], 54)], 0, E212S165.L10),
([(0, true, false, [158, 254], [398], 55)], 0, E212S165.L11),
([(0, true, false, [158, 254], [398], 62)], 0, E212S165.L12),
([(0, true, false, [158, 254], [398], 63)], 0, E212S165.L13),
([(0, true, false, [158, 254], [398], 113)], 0, E212S165.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E212S165
