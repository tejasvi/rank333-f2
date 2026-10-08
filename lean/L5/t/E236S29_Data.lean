module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S29 "data/lean/ea646ef0fc365b0ecb9232d86410cd3c/E236S29.bin"
namespace E236S29
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [354, 412], [22, 232], 2)], 0, E236S29.L1),
([(15, true, false, [354, 412], [22, 232], 13)], 0, E236S29.L2),
([(15, true, false, [354, 412], [22, 232], 24)], 0, E236S29.L3),
([(15, true, false, [354, 412], [22, 232], 26)], 0, E236S29.L4),
([(15, true, false, [354, 412], [22, 232], 27)], 0, E236S29.L5),
([(15, true, false, [354, 412], [22, 232], 28)], 0, E236S29.L6),
([(15, true, false, [354, 412], [22, 232], 30)], 0, E236S29.L7),
([(15, true, false, [354, 412], [22, 232], 31)], 0, E236S29.L8),
([(15, true, false, [354, 412], [22, 232], 32)], 0, E236S29.L9),
([(15, true, false, [354, 412], [22, 232], 33)], 0, E236S29.L10),
([(15, true, false, [354, 412], [22, 232], 37)], 0, E236S29.L11),
([(15, true, false, [354, 412], [22, 232], 46)], 0, E236S29.L12),
([(15, true, false, [354, 412], [22, 232], 48)], 0, E236S29.L13),
([(15, true, false, [354, 412], [22, 232], 53)], 0, E236S29.L14),
([(15, true, false, [354, 412], [22, 232], 66)], 0, E236S29.L15),
([(15, true, false, [354, 412], [22, 232], 103)], 0, E236S29.L16),
([(15, true, false, [354, 412], [22, 232], 105)], 0, E236S29.L17),
([(15, true, false, [354, 412], [22, 232], 106)], 0, E236S29.L18),
([(15, true, false, [354, 412], [22, 232], 107)], 0, E236S29.L19),
([(15, true, false, [354, 412], [22, 232], 108)], 0, E236S29.L20),
([(15, true, false, [354, 412], [22, 232], 110)], 0, E236S29.L21),
([(15, true, false, [354, 412], [22, 232], 114)], 0, E236S29.L22),
([(15, true, false, [354, 412], [22, 232], 119)], 0, E236S29.L23),
([(15, true, false, [354, 412], [22, 232], 121)], 0, E236S29.L24),
([(15, true, false, [354, 412], [22, 232], 124)], 0, E236S29.L25),
([(15, true, false, [354, 412], [22, 232], 126)], 0, E236S29.L26),
([(15, true, false, [354, 412], [22, 232], 132)], 0, E236S29.L27),
([(15, true, false, [354, 412], [22, 232], 136)], 0, E236S29.L28),
([(15, true, false, [354, 412], [22, 232], 137)], 0, E236S29.L29),
([(15, true, false, [354, 412], [22, 232], 141)], 0, E236S29.L30),
([(15, true, false, [354, 412], [22, 232], 147)], 0, E236S29.L31),
([(15, true, false, [354, 412], [22, 232], 171)], 0, E236S29.L32),
([(15, true, false, [354, 412], [22, 232], 172)], 0, E236S29.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E236S29
