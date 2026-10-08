module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S216 "data/lean/79d3a23b1149d13e03009c101497399b/E213S216.bin"
namespace E213S216
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [244, 494], [96], 1)], 0, E213S216.L1),
([(4, true, false, [244, 494], [96], 4)], 0, E213S216.L2),
([(4, true, false, [244, 494], [96], 31)], 0, E213S216.L3),
([(4, true, false, [244, 494], [96], 35)], 0, E213S216.L4),
([(4, true, false, [244, 494], [96], 45)], 0, E213S216.L5),
([(4, true, false, [244, 494], [96], 49)], 0, E213S216.L6),
([(4, true, false, [244, 494], [96], 85)], 0, E213S216.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S216
