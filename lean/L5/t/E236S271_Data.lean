module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S271 "data/lean/95178478cd60b897bde456fd6e9a8d7c/E236S271.bin"
namespace E236S271
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [158, 354], [96], 2)], 0, E236S271.L1),
([(14, true, false, [158, 354], [96], 21)], 0, E236S271.L2),
([(14, true, false, [158, 354], [96], 23)], 0, E236S271.L3),
([(14, true, false, [158, 354], [96], 44)], 0, E236S271.L4),
([(14, true, false, [158, 354], [96], 45)], 0, E236S271.L5),
([(14, true, false, [158, 354], [96], 50)], 0, E236S271.L6),
([(14, true, false, [158, 354], [96], 51)], 0, E236S271.L7),
([(14, true, false, [158, 354], [96], 63)], 0, E236S271.L8),
([(14, true, false, [158, 354], [96], 98)], 0, E236S271.L9),
([(14, true, false, [158, 354], [96], 186)], 0, E236S271.L10),
([(14, true, false, [158, 354], [96], 187)], 0, E236S271.L11),
([(14, true, false, [158, 354], [96], 188)], 0, E236S271.L12),
([(14, true, false, [158, 354], [96], 189)], 0, E236S271.L13),
([(14, true, false, [158, 354], [96], 191)], 0, E236S271.L14),
([(14, true, false, [158, 354], [96], 192)], 0, E236S271.L15),
([(14, true, false, [158, 354], [96], 193)], 0, E236S271.L16),
([(14, true, false, [158, 354], [96], 196)], 0, E236S271.L17),
([(14, true, false, [158, 354], [96], 197)], 0, E236S271.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E236S271
