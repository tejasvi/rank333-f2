module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S82 "data/lean/c93a4162a3813b0b41c1e7d5c726ee1e/E207S82.bin"
namespace E207S82
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 334, 346], [160], 0)], 0, E207S82.L1),
([(2, true, false, [266, 334, 346], [160], 1)], 0, E207S82.L2),
([(2, true, false, [266, 334, 346], [160], 31)], 0, E207S82.L3),
([(2, true, false, [266, 334, 346], [160], 40)], 0, E207S82.L4),
([(2, true, false, [266, 334, 346], [160], 53)], 0, E207S82.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E207S82
