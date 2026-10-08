module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S4 "data/lean/ff2dada0c56a98d8fe2f1d0575745fb9/E279S4.bin"
namespace E279S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [206, 494], [], 0)], 0, E279S4.L1),
([(6, true, false, [206, 494], [], 11)], 0, E279S4.L2),
([(6, true, false, [206, 494], [], 12)], 0, E279S4.L3),
([(6, true, false, [206, 494], [], 13)], 0, E279S4.L4),
([(6, true, false, [206, 494], [], 16)], 0, E279S4.L5),
([(6, true, false, [206, 494], [], 17)], 0, E279S4.L6),
([(6, true, false, [206, 494], [], 21)], 0, E279S4.L7),
([(6, true, false, [206, 494], [], 23)], 0, E279S4.L8),
([(6, true, false, [206, 494], [], 42)], 0, E279S4.L9),
([(6, true, false, [206, 494], [], 90)], 0, E279S4.L10),
([(6, true, false, [206, 494], [], 120)], 0, E279S4.L11),
([(6, true, false, [206, 494], [], 246)], 0, E279S4.L12),
([(6, true, false, [206, 494], [], 260)], 0, E279S4.L13),
([(6, true, false, [206, 494], [], 340)], 0, E279S4.L14),
([(6, true, false, [206, 494], [], 382)], 0, E279S4.L15),
([(6, true, false, [206, 494], [], 492)], 0, E279S4.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E279S4
