module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S163 "data/lean/6c60c262f67f73df240aa85f584f1395/E212S163.bin"
namespace E212S163
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 494], [404], 22)], 0, E212S163.L1),
([(3, true, false, [158, 254, 494], [404], 30)], 0, E212S163.L2),
([(3, true, false, [158, 254, 494], [404], 49)], 0, E212S163.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E212S163
