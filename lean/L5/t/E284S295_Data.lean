module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S295 "data/lean/1f855e15a0f21f7ba88e73eaed8dc387/E284S295.bin"
namespace E284S295
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [84, 254, 426, 394, 468], [], 6)], 0, E284S295.L1),
([(16, true, false, [84, 254, 426, 394, 468], [], 20)], 0, E284S295.L2),
([(16, true, false, [84, 254, 426, 394, 468], [], 21)], 0, E284S295.L3),
([(16, true, false, [84, 254, 426, 394, 468], [], 74)], 0, E284S295.L4),
([(16, true, false, [84, 254, 426, 394, 468], [], 76)], 0, E284S295.L5),
([(16, true, false, [84, 254, 426, 394, 468], [], 84)], 0, E284S295.L6),
([(16, true, false, [84, 254, 426, 394, 468], [], 86)], 0, E284S295.L7),
([(16, true, false, [84, 254, 426, 394, 468], [], 98)], 0, E284S295.L8),
([(16, true, false, [84, 254, 426, 394, 468], [], 109)], 0, E284S295.L9),
([(16, true, false, [84, 254, 426, 394, 468], [], 181)], 0, E284S295.L10),
([(16, true, false, [84, 254, 426, 394, 468], [], 205)], 0, E284S295.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E284S295
