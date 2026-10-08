module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S3 "data/lean/4c3a1e4eb454ebb1ab9b4051dfd02ad7/E207S3.bin"
namespace E207S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [], [20, 80], 11)], 0, E207S3.L1),
([(5, true, false, [], [20, 80], 12)], 0, E207S3.L2),
([(5, true, false, [], [20, 80], 16)], 0, E207S3.L3),
([(5, true, false, [], [20, 80], 34)], 0, E207S3.L4),
([(5, true, false, [], [20, 80], 38)], 0, E207S3.L5),
([(5, true, false, [], [20, 80], 60)], 0, E207S3.L6),
([(5, true, false, [], [20, 80], 61)], 0, E207S3.L7),
([(5, true, false, [], [20, 80], 63)], 0, E207S3.L8),
([(5, true, false, [], [20, 80], 64)], 0, E207S3.L9),
([(5, true, false, [], [20, 80], 71)], 0, E207S3.L10),
([(5, true, false, [], [20, 80], 97)], 0, E207S3.L11),
([(5, true, false, [], [20, 80], 98)], 0, E207S3.L12),
([(5, true, false, [], [20, 80], 100)], 0, E207S3.L13),
([(5, true, false, [], [20, 80], 101)], 0, E207S3.L14),
([(5, true, false, [], [20, 80], 113)], 0, E207S3.L15),
([(5, true, false, [], [20, 80], 122)], 0, E207S3.L16),
([(5, true, false, [], [20, 80], 129)], 0, E207S3.L17),
([(5, true, false, [], [20, 80], 137)], 0, E207S3.L18),
([(5, true, false, [], [20, 80], 160)], 0, E207S3.L19),
([(5, true, false, [], [20, 80], 161)], 0, E207S3.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E207S3
