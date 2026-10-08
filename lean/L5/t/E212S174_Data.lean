module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S174 "data/lean/bd62ab33412134739612a66b17320cf6/E212S174.bin"
namespace E212S174
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [122, 266, 158, 494], [], 11)], 0, E212S174.L1),
([(8, true, false, [122, 266, 158, 494], [], 13)], 0, E212S174.L2),
([(8, true, false, [122, 266, 158, 494], [], 14)], 0, E212S174.L3),
([(8, true, false, [122, 266, 158, 494], [], 21)], 0, E212S174.L4),
([(8, true, false, [122, 266, 158, 494], [], 23)], 0, E212S174.L5),
([(8, true, false, [122, 266, 158, 494], [], 31)], 0, E212S174.L6),
([(8, true, false, [122, 266, 158, 494], [], 270)], 0, E212S174.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E212S174
