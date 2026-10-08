module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S187 "data/lean/2ebe2fbf875af3acdb67f132d45e1d83/E236S187.bin"
namespace E236S187
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 412], [276], 12)], 0, E236S187.L1),
([(5, true, false, [158, 412], [276], 13)], 0, E236S187.L2),
([(5, true, false, [158, 412], [276], 14)], 0, E236S187.L3),
([(5, true, false, [158, 412], [276], 15)], 0, E236S187.L4),
([(5, true, false, [158, 412], [276], 23)], 0, E236S187.L5),
([(5, true, false, [158, 412], [276], 24)], 0, E236S187.L6),
([(5, true, false, [158, 412], [276], 25)], 0, E236S187.L7),
([(5, true, false, [158, 412], [276], 26)], 0, E236S187.L8),
([(5, true, false, [158, 412], [276], 27)], 0, E236S187.L9),
([(5, true, false, [158, 412], [276], 28)], 0, E236S187.L10),
([(5, true, false, [158, 412], [276], 29)], 0, E236S187.L11),
([(5, true, false, [158, 412], [276], 30)], 0, E236S187.L12),
([(5, true, false, [158, 412], [276], 31)], 0, E236S187.L13),
([(5, true, false, [158, 412], [276], 32)], 0, E236S187.L14),
([(5, true, false, [158, 412], [276], 44)], 0, E236S187.L15),
([(5, true, false, [158, 412], [276], 45)], 0, E236S187.L16),
([(5, true, false, [158, 412], [276], 46)], 0, E236S187.L17),
([(5, true, false, [158, 412], [276], 47)], 0, E236S187.L18),
([(5, true, false, [158, 412], [276], 48)], 0, E236S187.L19),
([(5, true, false, [158, 412], [276], 50)], 0, E236S187.L20),
([(5, true, false, [158, 412], [276], 51)], 0, E236S187.L21),
([(5, true, false, [158, 412], [276], 52)], 0, E236S187.L22),
([(5, true, false, [158, 412], [276], 53)], 0, E236S187.L23),
([(5, true, false, [158, 412], [276], 54)], 0, E236S187.L24),
([(5, true, false, [158, 412], [276], 64)], 0, E236S187.L25),
([(5, true, false, [158, 412], [276], 74)], 0, E236S187.L26),
([(5, true, false, [158, 412], [276], 75)], 0, E236S187.L27),
([(5, true, false, [158, 412], [276], 87)], 0, E236S187.L28),
([(5, true, false, [158, 412], [276], 95)], 0, E236S187.L29),
([(5, true, false, [158, 412], [276], 116)], 0, E236S187.L30),
([(5, true, false, [158, 412], [276], 128)], 0, E236S187.L31),
([(5, true, false, [158, 412], [276], 129)], 0, E236S187.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E236S187
