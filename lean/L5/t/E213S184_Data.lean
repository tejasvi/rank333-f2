module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S184 "data/lean/ca2098702375a6db0b4f9c726b3f706b/E213S184.bin"
namespace E213S184
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 244], [272], 15)], 0, E213S184.L1),
([(2, true, false, [106, 244], [272], 33)], 0, E213S184.L2),
([(2, true, false, [106, 244], [272], 35)], 0, E213S184.L3),
([(2, true, false, [106, 244], [272], 41)], 0, E213S184.L4),
([(2, true, false, [106, 244], [272], 47)], 0, E213S184.L5),
([(2, true, false, [106, 244], [272], 64)], 0, E213S184.L6),
([(2, true, false, [106, 244], [272], 72)], 0, E213S184.L7),
([(2, true, false, [106, 244], [272], 99)], 0, E213S184.L8),
([(2, true, false, [106, 244], [272], 104)], 0, E213S184.L9),
([(2, true, false, [106, 244], [272], 117)], 0, E213S184.L10),
([(2, true, false, [106, 244], [272], 120)], 0, E213S184.L11),
([(2, true, false, [106, 244], [272], 129)], 0, E213S184.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E213S184
