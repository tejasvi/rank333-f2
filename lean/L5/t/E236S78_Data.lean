module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S78 "data/lean/2481f0d9726e8503a86167c26fcfbe0b/E236S78.bin"
namespace E236S78
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [372, 412], [276, 508], 27)], 0, E236S78.L1),
([(11, true, false, [372, 412], [276, 508], 31)], 0, E236S78.L2),
([(11, true, false, [372, 412], [276, 508], 32)], 0, E236S78.L3),
([(11, true, false, [372, 412], [276, 508], 44)], 0, E236S78.L4),
([(11, true, false, [372, 412], [276, 508], 53)], 0, E236S78.L5),
([(11, true, false, [372, 412], [276, 508], 106)], 0, E236S78.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S78
