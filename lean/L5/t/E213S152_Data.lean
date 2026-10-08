module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S152 "data/lean/d8e364319f594fc65fd806609f71d63d/E213S152.bin"
namespace E213S152
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254], [272, 368], 4)], 0, E213S152.L1),
([(8, true, false, [254], [272, 368], 27)], 0, E213S152.L2),
([(8, true, false, [254], [272, 368], 28)], 0, E213S152.L3),
([(8, true, false, [254], [272, 368], 30)], 0, E213S152.L4),
([(8, true, false, [254], [272, 368], 31)], 0, E213S152.L5),
([(8, true, false, [254], [272, 368], 32)], 0, E213S152.L6),
([(8, true, false, [254], [272, 368], 33)], 0, E213S152.L7),
([(8, true, false, [254], [272, 368], 86)], 0, E213S152.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S152
