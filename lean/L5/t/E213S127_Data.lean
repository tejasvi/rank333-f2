module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S127 "data/lean/69a2d3a7d858462d87a25e46351923b1/E213S127.bin"
namespace E213S127
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [282, 244, 254], [272], 42)], 0, E213S127.L1),
([(15, true, false, [282, 244, 254], [272], 48)], 0, E213S127.L2),
([(15, true, false, [282, 244, 254], [272], 50)], 0, E213S127.L3),
([(15, true, false, [282, 244, 254], [272], 80)], 0, E213S127.L4),
([(15, true, false, [282, 244, 254], [272], 86)], 0, E213S127.L5),
([(15, true, false, [282, 244, 254], [272], 99)], 0, E213S127.L6),
([(15, true, false, [282, 244, 254], [272], 116)], 0, E213S127.L7),
([(15, true, false, [282, 244, 254], [272], 118)], 0, E213S127.L8),
([(15, true, false, [282, 244, 254], [272], 134)], 0, E213S127.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E213S127
