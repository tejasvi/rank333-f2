module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S161 "data/lean/ca4cca8f5ecc5dc5005383c1d2df44df/E212S161.bin"
namespace E212S161
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 500, 122], [], 37)], 0, E212S161.L1),
([(3, true, false, [158, 254, 500, 122], [], 38)], 0, E212S161.L2),
([(3, true, false, [158, 254, 500, 122], [], 39)], 0, E212S161.L3),
([(3, true, false, [158, 254, 500, 122], [], 40)], 0, E212S161.L4),
([(3, true, false, [158, 254, 500, 122], [], 41)], 0, E212S161.L5),
([(3, true, false, [158, 254, 500, 122], [], 47)], 0, E212S161.L6),
([(3, true, false, [158, 254, 500, 122], [], 71)], 0, E212S161.L7),
([(3, true, false, [158, 254, 500, 122], [], 72)], 0, E212S161.L8),
([(3, true, false, [158, 254, 500, 122], [], 76)], 0, E212S161.L9),
([(3, true, false, [158, 254, 500, 122], [], 77)], 0, E212S161.L10),
([(3, true, false, [158, 254, 500, 122], [], 86)], 0, E212S161.L11),
([(3, true, false, [158, 254, 500, 122], [], 112)], 0, E212S161.L12),
([(3, true, false, [158, 254, 500, 122], [], 115)], 0, E212S161.L13),
([(3, true, false, [158, 254, 500, 122], [], 116)], 0, E212S161.L14),
([(3, true, false, [158, 254, 500, 122], [], 119)], 0, E212S161.L15),
([(3, true, false, [158, 254, 500, 122], [], 129)], 0, E212S161.L16),
([(3, true, false, [158, 254, 500, 122], [], 130)], 0, E212S161.L17),
([(3, true, false, [158, 254, 500, 122], [], 131)], 0, E212S161.L18),
([(3, true, false, [158, 254, 500, 122], [], 154)], 0, E212S161.L19),
([(3, true, false, [158, 254, 500, 122], [], 155)], 0, E212S161.L20),
([(3, true, false, [158, 254, 500, 122], [], 159)], 0, E212S161.L21),
([(3, true, false, [158, 254, 500, 122], [], 179)], 0, E212S161.L22),
([(3, true, false, [158, 254, 500, 122], [], 183)], 0, E212S161.L23),
([(3, true, false, [158, 254, 500, 122], [], 200)], 0, E212S161.L24),
([(3, true, false, [158, 254, 500, 122], [], 203)], 0, E212S161.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E212S161
