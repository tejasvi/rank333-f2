module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S102 "data/lean/0851e84ee87e35b74b5ab85f3eccc59b/E236S102.bin"
namespace E236S102
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [], [22, 118], 20)], 0, E236S102.L1),
([(5, true, false, [], [22, 118], 26)], 0, E236S102.L2),
([(5, true, false, [], [22, 118], 27)], 0, E236S102.L3),
([(5, true, false, [], [22, 118], 28)], 0, E236S102.L4),
([(5, true, false, [], [22, 118], 29)], 0, E236S102.L5),
([(5, true, false, [], [22, 118], 30)], 0, E236S102.L6),
([(5, true, false, [], [22, 118], 31)], 0, E236S102.L7),
([(5, true, false, [], [22, 118], 32)], 0, E236S102.L8),
([(5, true, false, [], [22, 118], 33)], 0, E236S102.L9),
([(5, true, false, [], [22, 118], 34)], 0, E236S102.L10),
([(5, true, false, [], [22, 118], 35)], 0, E236S102.L11),
([(5, true, false, [], [22, 118], 42)], 0, E236S102.L12),
([(5, true, false, [], [22, 118], 44)], 0, E236S102.L13),
([(5, true, false, [], [22, 118], 47)], 0, E236S102.L14),
([(5, true, false, [], [22, 118], 48)], 0, E236S102.L15),
([(5, true, false, [], [22, 118], 51)], 0, E236S102.L16),
([(5, true, false, [], [22, 118], 54)], 0, E236S102.L17),
([(5, true, false, [], [22, 118], 55)], 0, E236S102.L18),
([(5, true, false, [], [22, 118], 57)], 0, E236S102.L19),
([(5, true, false, [], [22, 118], 66)], 0, E236S102.L20),
([(5, true, false, [], [22, 118], 70)], 0, E236S102.L21),
([(5, true, false, [], [22, 118], 74)], 0, E236S102.L22),
([(5, true, false, [], [22, 118], 75)], 0, E236S102.L23),
([(5, true, false, [], [22, 118], 76)], 0, E236S102.L24),
([(5, true, false, [], [22, 118], 85)], 0, E236S102.L25),
([(5, true, false, [], [22, 118], 92)], 0, E236S102.L26),
([(5, true, false, [], [22, 118], 93)], 0, E236S102.L27),
([(5, true, false, [], [22, 118], 103)], 0, E236S102.L28),
([(5, true, false, [], [22, 118], 130)], 0, E236S102.L29),
([(5, true, false, [], [22, 118], 142)], 0, E236S102.L30),
([(5, true, false, [], [22, 118], 154)], 0, E236S102.L31),
([(5, true, false, [], [22, 118], 160)], 0, E236S102.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E236S102
