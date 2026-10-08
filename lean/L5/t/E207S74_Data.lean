module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S74 "data/lean/9a56e9830e1de16828e95d6483dc72d3/E207S74.bin"
namespace E207S74
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [286, 334, 346, 426], [506], 0)], 0, E207S74.L1),
([(0, true, false, [286, 334, 346, 426], [506], 3)], 0, E207S74.L2),
([(0, true, false, [286, 334, 346, 426], [506], 7)], 0, E207S74.L3),
([(0, true, false, [286, 334, 346, 426], [506], 8)], 0, E207S74.L4),
([(0, true, false, [286, 334, 346, 426], [506], 16)], 0, E207S74.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E207S74
