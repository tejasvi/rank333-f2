module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S49 "data/lean/5987a45722147bdb8b7a9d8ad9085cc4/E236S49.bin"
namespace E236S49
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [], [22, 118], 18)], 0, E236S49.L1),
([(6, true, false, [], [22, 118], 26)], 0, E236S49.L2),
([(6, true, false, [], [22, 118], 27)], 0, E236S49.L3),
([(6, true, false, [], [22, 118], 28)], 3, E236S49.L4),
([(6, true, false, [], [22, 118], 29)], 0, E236S49.L5),
([(6, true, false, [], [22, 118], 30)], 0, E236S49.L6),
([(6, true, false, [], [22, 118], 31)], 0, E236S49.L7),
([(6, true, false, [], [22, 118], 32)], 0, E236S49.L8),
([(6, true, false, [], [22, 118], 33)], 0, E236S49.L9),
([(6, true, false, [], [22, 118], 34)], 0, E236S49.L10),
([(6, true, false, [], [22, 118], 35)], 0, E236S49.L11),
([(6, true, false, [], [22, 118], 44)], 0, E236S49.L12),
([(6, true, false, [], [22, 118], 47)], 0, E236S49.L13),
([(6, true, false, [], [22, 118], 48)], 0, E236S49.L14),
([(6, true, false, [], [22, 118], 49)], 0, E236S49.L15),
([(6, true, false, [], [22, 118], 55)], 0, E236S49.L16),
([(6, true, false, [], [22, 118], 74)], 0, E236S49.L17),
([(6, true, false, [], [22, 118], 85)], 0, E236S49.L18),
([(6, true, false, [], [22, 118], 130)], 0, E236S49.L19),
([(6, true, false, [], [22, 118], 28), (4, false, false, [22, 118], [], 0)], 0, E236S49.L20),
([(6, true, false, [], [22, 118], 28), (4, false, false, [22, 118], [], 1)], 0, E236S49.L21),
([(6, true, false, [], [22, 118], 28), (4, false, false, [22, 118], [], 2)], 0, E236S49.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E236S49
