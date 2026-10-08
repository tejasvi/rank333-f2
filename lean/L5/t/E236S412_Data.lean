module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S412 "data/lean/7367eaa7e6be3706f37477ce1c2e7b1f/E236S412.bin"
namespace E236S412
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [412, 158, 394], [136], 22)], 0, E236S412.L1),
([(9, true, false, [412, 158, 394], [136], 23)], 0, E236S412.L2),
([(9, true, false, [412, 158, 394], [136], 28)], 0, E236S412.L3),
([(9, true, false, [412, 158, 394], [136], 29)], 0, E236S412.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S412
