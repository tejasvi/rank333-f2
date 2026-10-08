module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S407 "data/lean/2cf1a9510e1d5d0b644183891c2a2bef/E236S407.bin"
namespace E236S407
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [254, 412, 394], [96], 10)], 0, E236S407.L1),
([(9, true, false, [254, 412, 394], [96], 11)], 0, E236S407.L2),
([(9, true, false, [254, 412, 394], [96], 14)], 0, E236S407.L3),
([(9, true, false, [254, 412, 394], [96], 17)], 0, E236S407.L4),
([(9, true, false, [254, 412, 394], [96], 18)], 0, E236S407.L5),
([(9, true, false, [254, 412, 394], [96], 32)], 0, E236S407.L6),
([(9, true, false, [254, 412, 394], [96], 35)], 0, E236S407.L7),
([(9, true, false, [254, 412, 394], [96], 46)], 0, E236S407.L8),
([(9, true, false, [254, 412, 394], [96], 49)], 0, E236S407.L9),
([(9, true, false, [254, 412, 394], [96], 50)], 0, E236S407.L10),
([(9, true, false, [254, 412, 394], [96], 71)], 0, E236S407.L11),
([(9, true, false, [254, 412, 394], [96], 85)], 0, E236S407.L12),
([(9, true, false, [254, 412, 394], [96], 86)], 0, E236S407.L13),
([(9, true, false, [254, 412, 394], [96], 90)], 0, E236S407.L14),
([(9, true, false, [254, 412, 394], [96], 92)], 0, E236S407.L15),
([(9, true, false, [254, 412, 394], [96], 96)], 0, E236S407.L16),
([(9, true, false, [254, 412, 394], [96], 98)], 0, E236S407.L17),
([(9, true, false, [254, 412, 394], [96], 99)], 0, E236S407.L18),
([(9, true, false, [254, 412, 394], [96], 100)], 0, E236S407.L19),
([(9, true, false, [254, 412, 394], [96], 101)], 0, E236S407.L20),
([(9, true, false, [254, 412, 394], [96], 103)], 0, E236S407.L21),
([(9, true, false, [254, 412, 394], [96], 104)], 0, E236S407.L22),
([(9, true, false, [254, 412, 394], [96], 105)], 0, E236S407.L23),
([(9, true, false, [254, 412, 394], [96], 109)], 0, E236S407.L24),
([(9, true, false, [254, 412, 394], [96], 116)], 0, E236S407.L25),
([(9, true, false, [254, 412, 394], [96], 117)], 0, E236S407.L26),
([(9, true, false, [254, 412, 394], [96], 119)], 0, E236S407.L27),
([(9, true, false, [254, 412, 394], [96], 120)], 0, E236S407.L28),
([(9, true, false, [254, 412, 394], [96], 122)], 0, E236S407.L29),
([(9, true, false, [254, 412, 394], [96], 128)], 0, E236S407.L30),
([(9, true, false, [254, 412, 394], [96], 130)], 0, E236S407.L31),
([(9, true, false, [254, 412, 394], [96], 131)], 0, E236S407.L32),
([(9, true, false, [254, 412, 394], [96], 136)], 0, E236S407.L33),
([(9, true, false, [254, 412, 394], [96], 137)], 0, E236S407.L34)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 34
end E236S407
