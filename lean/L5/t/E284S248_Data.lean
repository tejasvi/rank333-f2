module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S248 "data/lean/a8555df8e1274017d1f9de44a53be79f/E284S248.bin"
namespace E284S248
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [84, 372], [], 0)], 0, E284S248.L1),
([(14, true, false, [84, 372], [], 10)], 0, E284S248.L2),
([(14, true, false, [84, 372], [], 11)], 0, E284S248.L3),
([(14, true, false, [84, 372], [], 14)], 0, E284S248.L4),
([(14, true, false, [84, 372], [], 16)], 0, E284S248.L5),
([(14, true, false, [84, 372], [], 22)], 0, E284S248.L6),
([(14, true, false, [84, 372], [], 48)], 0, E284S248.L7),
([(14, true, false, [84, 372], [], 49)], 0, E284S248.L8),
([(14, true, false, [84, 372], [], 108)], 0, E284S248.L9),
([(14, true, false, [84, 372], [], 128)], 0, E284S248.L10),
([(14, true, false, [84, 372], [], 178)], 0, E284S248.L11),
([(14, true, false, [84, 372], [], 204)], 0, E284S248.L12),
([(14, true, false, [84, 372], [], 205)], 0, E284S248.L13),
([(14, true, false, [84, 372], [], 292)], 0, E284S248.L14),
([(14, true, false, [84, 372], [], 300)], 0, E284S248.L15),
([(14, true, false, [84, 372], [], 356)], 0, E284S248.L16),
([(14, true, false, [84, 372], [], 542)], 0, E284S248.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E284S248
