module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S427 "data/lean/6ee67dc5994ee3dbca15b65bd9fdba1e/E236S427.bin"
namespace E236S427
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [158, 254, 372, 412], [], 5)], 0, E236S427.L1),
([(1, true, false, [158, 254, 372, 412], [], 7)], 0, E236S427.L2),
([(1, true, false, [158, 254, 372, 412], [], 16)], 0, E236S427.L3),
([(1, true, false, [158, 254, 372, 412], [], 25)], 0, E236S427.L4),
([(1, true, false, [158, 254, 372, 412], [], 40)], 0, E236S427.L5),
([(1, true, false, [158, 254, 372, 412], [], 46)], 0, E236S427.L6),
([(1, true, false, [158, 254, 372, 412], [], 52)], 0, E236S427.L7),
([(1, true, false, [158, 254, 372, 412], [], 53)], 0, E236S427.L8),
([(1, true, false, [158, 254, 372, 412], [], 71)], 0, E236S427.L9),
([(1, true, false, [158, 254, 372, 412], [], 76)], 0, E236S427.L10),
([(1, true, false, [158, 254, 372, 412], [], 80)], 0, E236S427.L11),
([(1, true, false, [158, 254, 372, 412], [], 96)], 0, E236S427.L12),
([(1, true, false, [158, 254, 372, 412], [], 98)], 0, E236S427.L13),
([(1, true, false, [158, 254, 372, 412], [], 111)], 0, E236S427.L14),
([(1, true, false, [158, 254, 372, 412], [], 120)], 0, E236S427.L15),
([(1, true, false, [158, 254, 372, 412], [], 140)], 0, E236S427.L16),
([(1, true, false, [158, 254, 372, 412], [], 144)], 0, E236S427.L17),
([(1, true, false, [158, 254, 372, 412], [], 153)], 0, E236S427.L18),
([(1, true, false, [158, 254, 372, 412], [], 164)], 0, E236S427.L19),
([(1, true, false, [158, 254, 372, 412], [], 168)], 0, E236S427.L20),
([(1, true, false, [158, 254, 372, 412], [], 180)], 0, E236S427.L21),
([(1, true, false, [158, 254, 372, 412], [], 210)], 0, E236S427.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E236S427
