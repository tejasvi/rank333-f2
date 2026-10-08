module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S185 "data/lean/00632ca42b32eeb5861d5ae3a03456e9/E212S185.bin"
namespace E212S185
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 500, 122], [], 37)], 0, E212S185.L1),
([(3, true, false, [158, 254, 500, 122], [], 39)], 0, E212S185.L2),
([(3, true, false, [158, 254, 500, 122], [], 71)], 0, E212S185.L3),
([(3, true, false, [158, 254, 500, 122], [], 72)], 0, E212S185.L4),
([(3, true, false, [158, 254, 500, 122], [], 75)], 0, E212S185.L5),
([(3, true, false, [158, 254, 500, 122], [], 76)], 0, E212S185.L6),
([(3, true, false, [158, 254, 500, 122], [], 77)], 0, E212S185.L7),
([(3, true, false, [158, 254, 500, 122], [], 81)], 0, E212S185.L8),
([(3, true, false, [158, 254, 500, 122], [], 83)], 0, E212S185.L9),
([(3, true, false, [158, 254, 500, 122], [], 84)], 0, E212S185.L10),
([(3, true, false, [158, 254, 500, 122], [], 86)], 0, E212S185.L11),
([(3, true, false, [158, 254, 500, 122], [], 87)], 0, E212S185.L12),
([(3, true, false, [158, 254, 500, 122], [], 92)], 0, E212S185.L13),
([(3, true, false, [158, 254, 500, 122], [], 93)], 0, E212S185.L14),
([(3, true, false, [158, 254, 500, 122], [], 105)], 0, E212S185.L15),
([(3, true, false, [158, 254, 500, 122], [], 107)], 0, E212S185.L16),
([(3, true, false, [158, 254, 500, 122], [], 108)], 0, E212S185.L17),
([(3, true, false, [158, 254, 500, 122], [], 119)], 0, E212S185.L18),
([(3, true, false, [158, 254, 500, 122], [], 141)], 0, E212S185.L19),
([(3, true, false, [158, 254, 500, 122], [], 154)], 0, E212S185.L20),
([(3, true, false, [158, 254, 500, 122], [], 156)], 0, E212S185.L21),
([(3, true, false, [158, 254, 500, 122], [], 161)], 0, E212S185.L22),
([(3, true, false, [158, 254, 500, 122], [], 170)], 0, E212S185.L23),
([(3, true, false, [158, 254, 500, 122], [], 183)], 0, E212S185.L24),
([(3, true, false, [158, 254, 500, 122], [], 207)], 0, E212S185.L25),
([(3, true, false, [158, 254, 500, 122], [], 263)], 0, E212S185.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E212S185
