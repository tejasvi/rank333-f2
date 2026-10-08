module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S289 "data/lean/742d9cfd2db4ff8f55e1dcb3bf022099/E284S289.bin"
namespace E284S289
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 0)], 0, E284S289.L1),
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 18)], 0, E284S289.L2),
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 23)], 0, E284S289.L3),
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 24)], 0, E284S289.L4),
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 31)], 0, E284S289.L5),
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 55)], 0, E284S289.L6),
([(0, true, false, [84, 94, 254, 372, 382, 478], [], 65)], 0, E284S289.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S289
