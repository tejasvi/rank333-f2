module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S12 "data/lean/fc6af0fa4f57ff722598b448615f6480/E207S12.bin"
namespace E207S12
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 286, 346, 494], [], 16)], 0, E207S12.L1),
([(3, true, false, [266, 286, 346, 494], [], 90)], 0, E207S12.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E207S12
