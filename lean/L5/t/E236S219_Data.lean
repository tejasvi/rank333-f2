module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S219 "data/lean/56e28849251b73f6c88c2dba05d02880/E236S219.bin"
namespace E236S219
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372], [118, 136], 2)], 0, E236S219.L1),
([(0, true, false, [372], [118, 136], 3)], 0, E236S219.L2),
([(0, true, false, [372], [118, 136], 21)], 0, E236S219.L3),
([(0, true, false, [372], [118, 136], 30)], 0, E236S219.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S219
