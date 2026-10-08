module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S120 "data/lean/84599355cd77c4a1fc389d85063983ec/E236S120.bin"
namespace E236S120
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [394, 372], [22], 0)], 0, E236S120.L1),
([(11, true, false, [394, 372], [22], 5)], 0, E236S120.L2),
([(11, true, false, [394, 372], [22], 8)], 0, E236S120.L3),
([(11, true, false, [394, 372], [22], 10)], 0, E236S120.L4),
([(11, true, false, [394, 372], [22], 19)], 0, E236S120.L5),
([(11, true, false, [394, 372], [22], 42)], 0, E236S120.L6),
([(11, true, false, [394, 372], [22], 43)], 0, E236S120.L7),
([(11, true, false, [394, 372], [22], 44)], 0, E236S120.L8),
([(11, true, false, [394, 372], [22], 46)], 0, E236S120.L9),
([(11, true, false, [394, 372], [22], 47)], 0, E236S120.L10),
([(11, true, false, [394, 372], [22], 49)], 0, E236S120.L11),
([(11, true, false, [394, 372], [22], 50)], 0, E236S120.L12),
([(11, true, false, [394, 372], [22], 51)], 0, E236S120.L13),
([(11, true, false, [394, 372], [22], 52)], 0, E236S120.L14),
([(11, true, false, [394, 372], [22], 53)], 0, E236S120.L15),
([(11, true, false, [394, 372], [22], 54)], 0, E236S120.L16),
([(11, true, false, [394, 372], [22], 55)], 0, E236S120.L17),
([(11, true, false, [394, 372], [22], 56)], 0, E236S120.L18),
([(11, true, false, [394, 372], [22], 57)], 0, E236S120.L19),
([(11, true, false, [394, 372], [22], 58)], 0, E236S120.L20),
([(11, true, false, [394, 372], [22], 60)], 0, E236S120.L21),
([(11, true, false, [394, 372], [22], 61)], 0, E236S120.L22),
([(11, true, false, [394, 372], [22], 62)], 0, E236S120.L23),
([(11, true, false, [394, 372], [22], 68)], 0, E236S120.L24),
([(11, true, false, [394, 372], [22], 100)], 0, E236S120.L25),
([(11, true, false, [394, 372], [22], 116)], 0, E236S120.L26),
([(11, true, false, [394, 372], [22], 127)], 0, E236S120.L27),
([(11, true, false, [394, 372], [22], 128)], 0, E236S120.L28),
([(11, true, false, [394, 372], [22], 135)], 0, E236S120.L29),
([(11, true, false, [394, 372], [22], 144)], 0, E236S120.L30),
([(11, true, false, [394, 372], [22], 153)], 0, E236S120.L31),
([(11, true, false, [394, 372], [22], 166)], 0, E236S120.L32),
([(11, true, false, [394, 372], [22], 203)], 0, E236S120.L33),
([(11, true, false, [394, 372], [22], 223)], 0, E236S120.L34)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 34
end E236S120
