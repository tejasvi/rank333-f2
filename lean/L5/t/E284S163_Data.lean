module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S163 "data/lean/cf0b3739cde5af458500999306901808/E284S163.bin"
namespace E284S163
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [298], [10], 2)], 0, E284S163.L1),
([(6, true, false, [298], [10], 20)], 0, E284S163.L2),
([(6, true, false, [298], [10], 21)], 0, E284S163.L3),
([(6, true, false, [298], [10], 27)], 0, E284S163.L4),
([(6, true, false, [298], [10], 32)], 0, E284S163.L5),
([(6, true, false, [298], [10], 35)], 0, E284S163.L6),
([(6, true, false, [298], [10], 39)], 0, E284S163.L7),
([(6, true, false, [298], [10], 42)], 0, E284S163.L8),
([(6, true, false, [298], [10], 76)], 0, E284S163.L9),
([(6, true, false, [298], [10], 78)], 0, E284S163.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S163
