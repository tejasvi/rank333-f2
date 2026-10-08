module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S8 "data/lean/3323181d03687dea2cbde8ad4a9e015c/E279S8.bin"
namespace E279S8
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [206, 494], [], 11)], 0, E279S8.L1),
([(11, true, false, [206, 494], [], 12)], 0, E279S8.L2),
([(11, true, false, [206, 494], [], 13)], 0, E279S8.L3),
([(11, true, false, [206, 494], [], 16)], 0, E279S8.L4),
([(11, true, false, [206, 494], [], 17)], 0, E279S8.L5),
([(11, true, false, [206, 494], [], 18)], 0, E279S8.L6),
([(11, true, false, [206, 494], [], 20)], 0, E279S8.L7),
([(11, true, false, [206, 494], [], 21)], 0, E279S8.L8),
([(11, true, false, [206, 494], [], 22)], 0, E279S8.L9),
([(11, true, false, [206, 494], [], 23)], 0, E279S8.L10),
([(11, true, false, [206, 494], [], 25)], 0, E279S8.L11),
([(11, true, false, [206, 494], [], 28)], 0, E279S8.L12),
([(11, true, false, [206, 494], [], 42)], 0, E279S8.L13),
([(11, true, false, [206, 494], [], 90)], 0, E279S8.L14),
([(11, true, false, [206, 494], [], 120)], 0, E279S8.L15),
([(11, true, false, [206, 494], [], 246)], 0, E279S8.L16),
([(11, true, false, [206, 494], [], 260)], 0, E279S8.L17),
([(11, true, false, [206, 494], [], 340)], 0, E279S8.L18),
([(11, true, false, [206, 494], [], 382)], 0, E279S8.L19),
([(11, true, false, [206, 494], [], 478)], 0, E279S8.L20),
([(11, true, false, [206, 494], [], 492)], 0, E279S8.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E279S8
