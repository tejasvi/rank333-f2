module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S296 "data/lean/65933c44fabb54db090be122f5fa2332/E284S296.bin"
namespace E284S296
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [244, 254, 266, 394, 468], [], 8)], 0, E284S296.L1),
([(14, true, false, [244, 254, 266, 394, 468], [], 10)], 0, E284S296.L2),
([(14, true, false, [244, 254, 266, 394, 468], [], 11)], 0, E284S296.L3),
([(14, true, false, [244, 254, 266, 394, 468], [], 13)], 0, E284S296.L4),
([(14, true, false, [244, 254, 266, 394, 468], [], 14)], 0, E284S296.L5),
([(14, true, false, [244, 254, 266, 394, 468], [], 15)], 0, E284S296.L6),
([(14, true, false, [244, 254, 266, 394, 468], [], 17)], 0, E284S296.L7),
([(14, true, false, [244, 254, 266, 394, 468], [], 19)], 0, E284S296.L8),
([(14, true, false, [244, 254, 266, 394, 468], [], 26)], 0, E284S296.L9),
([(14, true, false, [244, 254, 266, 394, 468], [], 31)], 0, E284S296.L10),
([(14, true, false, [244, 254, 266, 394, 468], [], 179)], 0, E284S296.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E284S296
