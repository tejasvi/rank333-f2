module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S9 "data/lean/6fcaf1da17b8e3740f428a052e464106/E203S9.bin"
namespace E203S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [314, 372], [160], 42)], 0, E203S9.L1),
([(12, true, false, [314, 372], [160], 50)], 0, E203S9.L2),
([(12, true, false, [314, 372], [160], 80)], 0, E203S9.L3),
([(12, true, false, [314, 372], [160], 86)], 0, E203S9.L4),
([(12, true, false, [314, 372], [160], 118)], 0, E203S9.L5),
([(12, true, false, [314, 372], [160], 126)], 0, E203S9.L6),
([(12, true, false, [314, 372], [160], 132)], 0, E203S9.L7),
([(12, true, false, [314, 372], [160], 140)], 0, E203S9.L8),
([(12, true, false, [314, 372], [160], 172)], 0, E203S9.L9),
([(12, true, false, [314, 372], [160], 176)], 0, E203S9.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E203S9
