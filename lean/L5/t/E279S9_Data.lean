module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S9 "data/lean/297a6937a3491a651aa15a91bf5f588b/E279S9.bin"
namespace E279S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [110, 494], [], 21)], 0, E279S9.L1),
([(7, true, false, [110, 494], [], 88)], 0, E279S9.L2),
([(7, true, false, [110, 494], [], 89)], 0, E279S9.L3),
([(7, true, false, [110, 494], [], 90)], 0, E279S9.L4),
([(7, true, false, [110, 494], [], 91)], 0, E279S9.L5),
([(7, true, false, [110, 494], [], 92)], 0, E279S9.L6),
([(7, true, false, [110, 494], [], 93)], 0, E279S9.L7),
([(7, true, false, [110, 494], [], 94)], 0, E279S9.L8),
([(7, true, false, [110, 494], [], 95)], 0, E279S9.L9),
([(7, true, false, [110, 494], [], 96)], 0, E279S9.L10),
([(7, true, false, [110, 494], [], 97)], 0, E279S9.L11),
([(7, true, false, [110, 494], [], 98)], 0, E279S9.L12),
([(7, true, false, [110, 494], [], 118)], 0, E279S9.L13),
([(7, true, false, [110, 494], [], 122)], 0, E279S9.L14),
([(7, true, false, [110, 494], [], 244)], 0, E279S9.L15),
([(7, true, false, [110, 494], [], 248)], 0, E279S9.L16),
([(7, true, false, [110, 494], [], 340)], 0, E279S9.L17),
([(7, true, false, [110, 494], [], 344)], 0, E279S9.L18),
([(7, true, false, [110, 494], [], 388)], 0, E279S9.L19),
([(7, true, false, [110, 494], [], 396)], 0, E279S9.L20),
([(7, true, false, [110, 494], [], 480)], 0, E279S9.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E279S9
