module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S3 "data/lean/3a406e022ff2a56c645a02942d1cd04e/E213S3.bin"
namespace E213S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [244], [148, 484], 7)], 0, E213S3.L1),
([(5, true, false, [244], [148, 484], 8)], 0, E213S3.L2),
([(5, true, false, [244], [148, 484], 10)], 23, E213S3.L3),
([(5, true, false, [244], [148, 484], 20)], 0, E213S3.L4),
([(5, true, false, [244], [148, 484], 22)], 0, E213S3.L5),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 142)], 0, E213S3.L6),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 144)], 0, E213S3.L7),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 150)], 0, E213S3.L8),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 190)], 0, E213S3.L9),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 192)], 0, E213S3.L10),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 206)], 0, E213S3.L11),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 208)], 0, E213S3.L12),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 234)], 0, E213S3.L13),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 237)], 0, E213S3.L14),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 250)], 0, E213S3.L15),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 262)], 0, E213S3.L16),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 478)], 0, E213S3.L17),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 480)], 0, E213S3.L18),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 490)], 0, E213S3.L19),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 492)], 0, E213S3.L20),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 542)], 0, E213S3.L21),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 570)], 0, E213S3.L22),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 758)], 0, E213S3.L23),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 760)], 0, E213S3.L24),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 766)], 0, E213S3.L25),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 802)], 0, E213S3.L26),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 804)], 0, E213S3.L27),
([(5, true, false, [244], [148, 484], 10), (6, false, false, [], [148, 484], 866)], 0, E213S3.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S3
