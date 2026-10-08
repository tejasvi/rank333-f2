module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S316 "data/lean/82518f728ebaf8b169b32f94e759b081/E236S316.bin"
namespace E236S316
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158, 354], [118], 58)], 0, E236S316.L1),
([(4, true, false, [158, 354], [118], 59)], 0, E236S316.L2),
([(4, true, false, [158, 354], [118], 61)], 0, E236S316.L3),
([(4, true, false, [158, 354], [118], 64)], 0, E236S316.L4),
([(4, true, false, [158, 354], [118], 69)], 0, E236S316.L5),
([(4, true, false, [158, 354], [118], 71)], 0, E236S316.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S316
