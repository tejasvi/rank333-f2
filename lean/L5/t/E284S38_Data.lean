module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S38 "data/lean/6f3daa434433211ff6a10dd97354c711/E284S38.bin"
namespace E284S38
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [94, 254, 372, 266, 426], [], 0)], 0, E284S38.L1),
([(0, true, false, [94, 254, 372, 266, 426], [], 30)], 0, E284S38.L2),
([(0, true, false, [94, 254, 372, 266, 426], [], 71)], 0, E284S38.L3),
([(0, true, false, [94, 254, 372, 266, 426], [], 129)], 0, E284S38.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S38
