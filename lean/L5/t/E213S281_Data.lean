module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S281 "data/lean/efb02761e70f84bf3b05fab6285abac5/E213S281.bin"
namespace E213S281
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [106, 158, 494], [96], 0)], 0, E213S281.L1),
([(5, true, false, [106, 158, 494], [96], 2)], 0, E213S281.L2),
([(5, true, false, [106, 158, 494], [96], 5)], 0, E213S281.L3),
([(5, true, false, [106, 158, 494], [96], 6)], 0, E213S281.L4),
([(5, true, false, [106, 158, 494], [96], 7)], 0, E213S281.L5),
([(5, true, false, [106, 158, 494], [96], 11)], 0, E213S281.L6),
([(5, true, false, [106, 158, 494], [96], 13)], 0, E213S281.L7),
([(5, true, false, [106, 158, 494], [96], 16)], 0, E213S281.L8),
([(5, true, false, [106, 158, 494], [96], 17)], 0, E213S281.L9),
([(5, true, false, [106, 158, 494], [96], 20)], 0, E213S281.L10),
([(5, true, false, [106, 158, 494], [96], 22)], 0, E213S281.L11),
([(5, true, false, [106, 158, 494], [96], 26)], 0, E213S281.L12),
([(5, true, false, [106, 158, 494], [96], 28)], 0, E213S281.L13),
([(5, true, false, [106, 158, 494], [96], 30)], 0, E213S281.L14),
([(5, true, false, [106, 158, 494], [96], 32)], 0, E213S281.L15),
([(5, true, false, [106, 158, 494], [96], 40)], 0, E213S281.L16),
([(5, true, false, [106, 158, 494], [96], 41)], 0, E213S281.L17),
([(5, true, false, [106, 158, 494], [96], 42)], 0, E213S281.L18),
([(5, true, false, [106, 158, 494], [96], 48)], 0, E213S281.L19),
([(5, true, false, [106, 158, 494], [96], 53)], 0, E213S281.L20),
([(5, true, false, [106, 158, 494], [96], 56)], 0, E213S281.L21),
([(5, true, false, [106, 158, 494], [96], 60)], 0, E213S281.L22),
([(5, true, false, [106, 158, 494], [96], 64)], 0, E213S281.L23),
([(5, true, false, [106, 158, 494], [96], 66)], 0, E213S281.L24),
([(5, true, false, [106, 158, 494], [96], 67)], 0, E213S281.L25),
([(5, true, false, [106, 158, 494], [96], 68)], 0, E213S281.L26),
([(5, true, false, [106, 158, 494], [96], 69)], 0, E213S281.L27),
([(5, true, false, [106, 158, 494], [96], 71)], 0, E213S281.L28),
([(5, true, false, [106, 158, 494], [96], 73)], 0, E213S281.L29),
([(5, true, false, [106, 158, 494], [96], 75)], 0, E213S281.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E213S281
