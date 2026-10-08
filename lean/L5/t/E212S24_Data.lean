module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S24 "data/lean/63d238bd61a013c0f29d0a6b7023e807/E212S24.bin"
namespace E212S24
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [], [96, 362], 27)], 0, E212S24.L1),
([(6, true, false, [], [96, 362], 39)], 0, E212S24.L2),
([(6, true, false, [], [96, 362], 42)], 0, E212S24.L3),
([(6, true, false, [], [96, 362], 52)], 0, E212S24.L4),
([(6, true, false, [], [96, 362], 115)], 0, E212S24.L5),
([(6, true, false, [], [96, 362], 116)], 0, E212S24.L6),
([(6, true, false, [], [96, 362], 146)], 0, E212S24.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E212S24
