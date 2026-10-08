module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S146 "data/lean/51103ce41347dd602cafb5bdee783d7d/E284S146.bin"
namespace E284S146
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 0)], 0, E284S146.L1),
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 5)], 0, E284S146.L2),
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 16)], 0, E284S146.L3),
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 39)], 0, E284S146.L4),
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 45)], 0, E284S146.L5),
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 46)], 0, E284S146.L6),
([(3, true, false, [84, 116, 266, 298, 394, 426], [], 65)], 0, E284S146.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S146
