module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S256 "data/lean/24d891efaab6c4c271a3e90fa605a123/E213S256.bin"
namespace E213S256
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [158, 244, 494], [388], 4)], 0, E213S256.L1),
([(15, true, false, [158, 244, 494], [388], 36)], 0, E213S256.L2),
([(15, true, false, [158, 244, 494], [388], 48)], 0, E213S256.L3),
([(15, true, false, [158, 244, 494], [388], 76)], 0, E213S256.L4),
([(15, true, false, [158, 244, 494], [388], 79)], 0, E213S256.L5),
([(15, true, false, [158, 244, 494], [388], 128)], 0, E213S256.L6),
([(15, true, false, [158, 244, 494], [388], 134)], 0, E213S256.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S256
