module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S78 "data/lean/627f7892dc94d3dbe10f64c4701c865b/E207S78.bin"
namespace E207S78
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [334, 494, 346], [80], 1)], 0, E207S78.L1),
([(4, true, false, [334, 494, 346], [80], 42)], 0, E207S78.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E207S78
