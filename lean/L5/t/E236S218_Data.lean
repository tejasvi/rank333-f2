module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S218 "data/lean/2108be1d2b2797d8c0623f85a98869a3/E236S218.bin"
namespace E236S218
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354, 412], [276], 2)], 0, E236S218.L1),
([(6, true, false, [354, 412], [276], 9)], 0, E236S218.L2),
([(6, true, false, [354, 412], [276], 23)], 0, E236S218.L3),
([(6, true, false, [354, 412], [276], 24)], 0, E236S218.L4),
([(6, true, false, [354, 412], [276], 26)], 0, E236S218.L5),
([(6, true, false, [354, 412], [276], 27)], 0, E236S218.L6),
([(6, true, false, [354, 412], [276], 28)], 0, E236S218.L7),
([(6, true, false, [354, 412], [276], 29)], 0, E236S218.L8),
([(6, true, false, [354, 412], [276], 30)], 0, E236S218.L9),
([(6, true, false, [354, 412], [276], 31)], 0, E236S218.L10),
([(6, true, false, [354, 412], [276], 32)], 0, E236S218.L11),
([(6, true, false, [354, 412], [276], 42)], 0, E236S218.L12),
([(6, true, false, [354, 412], [276], 43)], 0, E236S218.L13),
([(6, true, false, [354, 412], [276], 45)], 0, E236S218.L14),
([(6, true, false, [354, 412], [276], 46)], 0, E236S218.L15),
([(6, true, false, [354, 412], [276], 48)], 0, E236S218.L16),
([(6, true, false, [354, 412], [276], 49)], 0, E236S218.L17),
([(6, true, false, [354, 412], [276], 59)], 0, E236S218.L18),
([(6, true, false, [354, 412], [276], 65)], 0, E236S218.L19),
([(6, true, false, [354, 412], [276], 69)], 0, E236S218.L20),
([(6, true, false, [354, 412], [276], 71)], 0, E236S218.L21),
([(6, true, false, [354, 412], [276], 75)], 0, E236S218.L22),
([(6, true, false, [354, 412], [276], 85)], 0, E236S218.L23),
([(6, true, false, [354, 412], [276], 89)], 0, E236S218.L24),
([(6, true, false, [354, 412], [276], 93)], 0, E236S218.L25),
([(6, true, false, [354, 412], [276], 94)], 0, E236S218.L26),
([(6, true, false, [354, 412], [276], 117)], 0, E236S218.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E236S218
