module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S24 "data/lean/b6c26d6bcc7fced41a272963753352de/E284S24.bin"
namespace E284S24
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [94, 394, 84], [138], 0)], 0, E284S24.L1),
([(9, true, false, [94, 394, 84], [138], 2)], 0, E284S24.L2),
([(9, true, false, [94, 394, 84], [138], 4)], 0, E284S24.L3),
([(9, true, false, [94, 394, 84], [138], 5)], 0, E284S24.L4),
([(9, true, false, [94, 394, 84], [138], 6)], 0, E284S24.L5),
([(9, true, false, [94, 394, 84], [138], 8)], 0, E284S24.L6),
([(9, true, false, [94, 394, 84], [138], 11)], 0, E284S24.L7),
([(9, true, false, [94, 394, 84], [138], 14)], 0, E284S24.L8),
([(9, true, false, [94, 394, 84], [138], 21)], 0, E284S24.L9),
([(9, true, false, [94, 394, 84], [138], 31)], 0, E284S24.L10),
([(9, true, false, [94, 394, 84], [138], 42)], 0, E284S24.L11),
([(9, true, false, [94, 394, 84], [138], 43)], 0, E284S24.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S24
