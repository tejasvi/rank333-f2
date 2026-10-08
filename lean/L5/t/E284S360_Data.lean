module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S360 "data/lean/e0d0eb81832ad064be10ba576bf44cdd/E284S360.bin"
namespace E284S360
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [212, 372, 382, 84, 94, 500], [], 5)], 0, E284S360.L1),
([(14, true, false, [212, 372, 382, 84, 94, 500], [], 6)], 0, E284S360.L2),
([(14, true, false, [212, 372, 382, 84, 94, 500], [], 7)], 0, E284S360.L3),
([(14, true, false, [212, 372, 382, 84, 94, 500], [], 31)], 0, E284S360.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S360
