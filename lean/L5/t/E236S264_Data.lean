module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S264 "data/lean/f46b2fe5f782198eb9497198b3f57ab6/E236S264.bin"
namespace E236S264
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158], [232, 490], 12)], 0, E236S264.L1),
([(8, true, false, [158], [232, 490], 14)], 11, E236S264.L2),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 190)], 0, E236S264.L3),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 286)], 0, E236S264.L4),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 346)], 0, E236S264.L5),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 394)], 0, E236S264.L6),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 590)], 0, E236S264.L7),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 614)], 0, E236S264.L8),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 648)], 0, E236S264.L9),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 716)], 0, E236S264.L10),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 822)], 0, E236S264.L11),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 906)], 0, E236S264.L12),
([(8, true, false, [158], [232, 490], 14), (9, false, false, [], [232, 490], 970)], 0, E236S264.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E236S264
