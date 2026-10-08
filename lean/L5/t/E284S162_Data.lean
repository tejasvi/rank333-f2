module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S162 "data/lean/76d85a6621a7eb65b7700cd64316e429/E284S162.bin"
namespace E284S162
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [84, 372], [], 0)], 0, E284S162.L1),
([(7, true, false, [84, 372], [], 10)], 0, E284S162.L2),
([(7, true, false, [84, 372], [], 11)], 0, E284S162.L3),
([(7, true, false, [84, 372], [], 12)], 0, E284S162.L4),
([(7, true, false, [84, 372], [], 14)], 0, E284S162.L5),
([(7, true, false, [84, 372], [], 16)], 0, E284S162.L6),
([(7, true, false, [84, 372], [], 17)], 0, E284S162.L7),
([(7, true, false, [84, 372], [], 19)], 0, E284S162.L8),
([(7, true, false, [84, 372], [], 22)], 0, E284S162.L9),
([(7, true, false, [84, 372], [], 48)], 0, E284S162.L10),
([(7, true, false, [84, 372], [], 49)], 0, E284S162.L11),
([(7, true, false, [84, 372], [], 178)], 0, E284S162.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S162
