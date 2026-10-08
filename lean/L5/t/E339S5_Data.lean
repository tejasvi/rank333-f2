module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E339S5 "data/lean/f39640a14dc77dba8bf5f40c6f7e0a80/E339S5.bin"
namespace E339S5
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(14, true, false, [], [], 323)], 7, 0, E339S5.L1),
([(14, true, false, [], [], 324)], 7, 0, E339S5.L2),
([(14, true, false, [], [], 336)], 7, 0, E339S5.L3),
([(14, true, false, [], [], 372)], 7, 0, E339S5.L4),
([(14, true, false, [], [], 373)], 7, 0, E339S5.L5),
([(14, true, false, [], [], 377)], 7, 0, E339S5.L6),
([(14, true, false, [], [], 391)], 7, 0, E339S5.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E339S5
