module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S54 "data/lean/bc0b31d4851a3f1adec36fda7c8c0512/E213S54.bin"
namespace E213S54
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 494], [96, 272], 0)], 0, E213S54.L1),
([(7, true, false, [158, 494], [96, 272], 1)], 0, E213S54.L2),
([(7, true, false, [158, 494], [96, 272], 2)], 0, E213S54.L3),
([(7, true, false, [158, 494], [96, 272], 5)], 0, E213S54.L4),
([(7, true, false, [158, 494], [96, 272], 8)], 0, E213S54.L5),
([(7, true, false, [158, 494], [96, 272], 10)], 0, E213S54.L6),
([(7, true, false, [158, 494], [96, 272], 17)], 0, E213S54.L7),
([(7, true, false, [158, 494], [96, 272], 20)], 0, E213S54.L8),
([(7, true, false, [158, 494], [96, 272], 30)], 0, E213S54.L9),
([(7, true, false, [158, 494], [96, 272], 32)], 0, E213S54.L10),
([(7, true, false, [158, 494], [96, 272], 35)], 0, E213S54.L11),
([(7, true, false, [158, 494], [96, 272], 37)], 0, E213S54.L12),
([(7, true, false, [158, 494], [96, 272], 39)], 0, E213S54.L13),
([(7, true, false, [158, 494], [96, 272], 42)], 0, E213S54.L14),
([(7, true, false, [158, 494], [96, 272], 46)], 0, E213S54.L15),
([(7, true, false, [158, 494], [96, 272], 48)], 0, E213S54.L16),
([(7, true, false, [158, 494], [96, 272], 49)], 0, E213S54.L17),
([(7, true, false, [158, 494], [96, 272], 50)], 0, E213S54.L18),
([(7, true, false, [158, 494], [96, 272], 54)], 0, E213S54.L19),
([(7, true, false, [158, 494], [96, 272], 61)], 0, E213S54.L20),
([(7, true, false, [158, 494], [96, 272], 63)], 0, E213S54.L21),
([(7, true, false, [158, 494], [96, 272], 64)], 0, E213S54.L22),
([(7, true, false, [158, 494], [96, 272], 65)], 0, E213S54.L23),
([(7, true, false, [158, 494], [96, 272], 66)], 0, E213S54.L24),
([(7, true, false, [158, 494], [96, 272], 67)], 0, E213S54.L25),
([(7, true, false, [158, 494], [96, 272], 80)], 0, E213S54.L26),
([(7, true, false, [158, 494], [96, 272], 82)], 0, E213S54.L27),
([(7, true, false, [158, 494], [96, 272], 89)], 0, E213S54.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E213S54
