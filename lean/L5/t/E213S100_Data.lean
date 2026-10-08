module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S100 "data/lean/87454f94ec262f381ff51686adb7ab74/E213S100.bin"
namespace E213S100
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [494], [484], 43)], 0, E213S100.L1),
([(6, true, false, [494], [484], 51)], 0, E213S100.L2),
([(6, true, false, [494], [484], 53)], 0, E213S100.L3),
([(6, true, false, [494], [484], 85)], 0, E213S100.L4),
([(6, true, false, [494], [484], 147)], 0, E213S100.L5),
([(6, true, false, [494], [484], 162)], 0, E213S100.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S100
