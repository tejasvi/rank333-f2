module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S38 "data/lean/022c444cfd38fc1c0b0f6e345d1da89b/E204S38.bin"
namespace E204S38
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [334, 372, 468, 494], [], 16)], 0, E204S38.L1),
([(3, true, false, [334, 372, 468, 494], [], 18)], 0, E204S38.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E204S38
