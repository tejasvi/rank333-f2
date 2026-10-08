module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S86 "data/lean/e38d86f5e4128d398abf48f62385aa43/E284S86.bin"
namespace E284S86
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [426, 478], [10, 42], 2)], 0, E284S86.L1),
([(8, true, false, [426, 478], [10, 42], 5)], 0, E284S86.L2),
([(8, true, false, [426, 478], [10, 42], 12)], 0, E284S86.L3),
([(8, true, false, [426, 478], [10, 42], 16)], 0, E284S86.L4),
([(8, true, false, [426, 478], [10, 42], 18)], 0, E284S86.L5),
([(8, true, false, [426, 478], [10, 42], 22)], 0, E284S86.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S86
