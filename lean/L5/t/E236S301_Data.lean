module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S301 "data/lean/ae57fd5a6dcb30ae6f7a34954562f1a4/E236S301.bin"
namespace E236S301
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354, 158], [490], 4)], 0, E236S301.L1),
([(6, true, false, [354, 158], [490], 5)], 0, E236S301.L2),
([(6, true, false, [354, 158], [490], 6)], 0, E236S301.L3),
([(6, true, false, [354, 158], [490], 7)], 0, E236S301.L4),
([(6, true, false, [354, 158], [490], 9)], 0, E236S301.L5),
([(6, true, false, [354, 158], [490], 10)], 0, E236S301.L6),
([(6, true, false, [354, 158], [490], 12)], 0, E236S301.L7),
([(6, true, false, [354, 158], [490], 14)], 0, E236S301.L8),
([(6, true, false, [354, 158], [490], 16)], 0, E236S301.L9),
([(6, true, false, [354, 158], [490], 18)], 0, E236S301.L10),
([(6, true, false, [354, 158], [490], 19)], 0, E236S301.L11),
([(6, true, false, [354, 158], [490], 20)], 0, E236S301.L12),
([(6, true, false, [354, 158], [490], 23)], 0, E236S301.L13),
([(6, true, false, [354, 158], [490], 25)], 0, E236S301.L14),
([(6, true, false, [354, 158], [490], 36)], 0, E236S301.L15),
([(6, true, false, [354, 158], [490], 39)], 0, E236S301.L16),
([(6, true, false, [354, 158], [490], 42)], 0, E236S301.L17),
([(6, true, false, [354, 158], [490], 75)], 0, E236S301.L18),
([(6, true, false, [354, 158], [490], 81)], 0, E236S301.L19),
([(6, true, false, [354, 158], [490], 89)], 0, E236S301.L20),
([(6, true, false, [354, 158], [490], 113)], 0, E236S301.L21),
([(6, true, false, [354, 158], [490], 116)], 0, E236S301.L22),
([(6, true, false, [354, 158], [490], 119)], 0, E236S301.L23),
([(6, true, false, [354, 158], [490], 128)], 0, E236S301.L24),
([(6, true, false, [354, 158], [490], 130)], 0, E236S301.L25),
([(6, true, false, [354, 158], [490], 146)], 0, E236S301.L26),
([(6, true, false, [354, 158], [490], 152)], 0, E236S301.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E236S301
