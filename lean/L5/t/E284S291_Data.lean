module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S291 "data/lean/de2b56ac68c4e4128359bbcb050a5a57/E284S291.bin"
namespace E284S291
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 9)], 0, E284S291.L1),
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 10)], 0, E284S291.L2),
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 11)], 0, E284S291.L3),
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 14)], 0, E284S291.L4),
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 15)], 0, E284S291.L5),
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 16)], 0, E284S291.L6),
([(0, true, false, [84, 94, 254, 382, 468, 478], [], 17)], 0, E284S291.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S291
