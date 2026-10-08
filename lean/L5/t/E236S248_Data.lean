module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S248 "data/lean/12805c1919f06326ba660a1d9bcf8258/E236S248.bin"
namespace E236S248
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [372, 412], [22, 258], 2)], 0, E236S248.L1),
([(10, true, false, [372, 412], [22, 258], 5)], 0, E236S248.L2),
([(10, true, false, [372, 412], [22, 258], 15)], 0, E236S248.L3),
([(10, true, false, [372, 412], [22, 258], 17)], 0, E236S248.L4),
([(10, true, false, [372, 412], [22, 258], 18)], 0, E236S248.L5),
([(10, true, false, [372, 412], [22, 258], 19)], 0, E236S248.L6),
([(10, true, false, [372, 412], [22, 258], 20)], 0, E236S248.L7),
([(10, true, false, [372, 412], [22, 258], 21)], 0, E236S248.L8),
([(10, true, false, [372, 412], [22, 258], 23)], 0, E236S248.L9),
([(10, true, false, [372, 412], [22, 258], 24)], 0, E236S248.L10),
([(10, true, false, [372, 412], [22, 258], 26)], 0, E236S248.L11),
([(10, true, false, [372, 412], [22, 258], 27)], 0, E236S248.L12),
([(10, true, false, [372, 412], [22, 258], 28)], 0, E236S248.L13),
([(10, true, false, [372, 412], [22, 258], 29)], 0, E236S248.L14),
([(10, true, false, [372, 412], [22, 258], 30)], 0, E236S248.L15),
([(10, true, false, [372, 412], [22, 258], 31)], 0, E236S248.L16),
([(10, true, false, [372, 412], [22, 258], 32)], 0, E236S248.L17),
([(10, true, false, [372, 412], [22, 258], 35)], 0, E236S248.L18),
([(10, true, false, [372, 412], [22, 258], 39)], 0, E236S248.L19),
([(10, true, false, [372, 412], [22, 258], 53)], 0, E236S248.L20),
([(10, true, false, [372, 412], [22, 258], 56)], 0, E236S248.L21),
([(10, true, false, [372, 412], [22, 258], 57)], 0, E236S248.L22),
([(10, true, false, [372, 412], [22, 258], 58)], 0, E236S248.L23),
([(10, true, false, [372, 412], [22, 258], 59)], 0, E236S248.L24),
([(10, true, false, [372, 412], [22, 258], 74)], 0, E236S248.L25),
([(10, true, false, [372, 412], [22, 258], 80)], 0, E236S248.L26),
([(10, true, false, [372, 412], [22, 258], 81)], 0, E236S248.L27),
([(10, true, false, [372, 412], [22, 258], 100)], 0, E236S248.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E236S248
