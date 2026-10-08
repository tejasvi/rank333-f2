module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S209 "data/lean/9ff9dc8689dfc5e2c3059f8a71fbc320/E236S209.bin"
namespace E236S209
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 354], [22], 1)], 0, E236S209.L1),
([(3, true, false, [158, 354], [22], 4)], 0, E236S209.L2),
([(3, true, false, [158, 354], [22], 5)], 0, E236S209.L3),
([(3, true, false, [158, 354], [22], 6)], 0, E236S209.L4),
([(3, true, false, [158, 354], [22], 11)], 0, E236S209.L5),
([(3, true, false, [158, 354], [22], 23)], 0, E236S209.L6),
([(3, true, false, [158, 354], [22], 33)], 0, E236S209.L7),
([(3, true, false, [158, 354], [22], 40)], 0, E236S209.L8),
([(3, true, false, [158, 354], [22], 41)], 0, E236S209.L9),
([(3, true, false, [158, 354], [22], 43)], 0, E236S209.L10),
([(3, true, false, [158, 354], [22], 45)], 0, E236S209.L11),
([(3, true, false, [158, 354], [22], 50)], 0, E236S209.L12),
([(3, true, false, [158, 354], [22], 55)], 0, E236S209.L13),
([(3, true, false, [158, 354], [22], 60)], 0, E236S209.L14),
([(3, true, false, [158, 354], [22], 62)], 0, E236S209.L15),
([(3, true, false, [158, 354], [22], 64)], 0, E236S209.L16),
([(3, true, false, [158, 354], [22], 88)], 0, E236S209.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S209
