module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S107 "data/lean/3a13577502ec7f5019511ff9de95502a/E236S107.bin"
namespace E236S107
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 412], [118], 33)], 0, E236S107.L1),
([(5, true, false, [158, 412], [118], 35)], 0, E236S107.L2),
([(5, true, false, [158, 412], [118], 39)], 0, E236S107.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S107
