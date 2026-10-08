module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S238 "data/lean/41247c0106e5752fd1072cf707030285/E213S238.bin"
namespace E213S238
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [494, 106], [272], 4)], 0, E213S238.L1),
([(15, true, false, [494, 106], [272], 44)], 0, E213S238.L2),
([(15, true, false, [494, 106], [272], 45)], 0, E213S238.L3),
([(15, true, false, [494, 106], [272], 50)], 0, E213S238.L4),
([(15, true, false, [494, 106], [272], 51)], 0, E213S238.L5),
([(15, true, false, [494, 106], [272], 83)], 0, E213S238.L6),
([(15, true, false, [494, 106], [272], 91)], 0, E213S238.L7),
([(15, true, false, [494, 106], [272], 118)], 0, E213S238.L8),
([(15, true, false, [494, 106], [272], 119)], 0, E213S238.L9),
([(15, true, false, [494, 106], [272], 147)], 0, E213S238.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S238
