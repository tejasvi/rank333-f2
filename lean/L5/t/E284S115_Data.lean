module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S115 "data/lean/1de6ac4375ca566f9a2699101eb6580a/E284S115.bin"
namespace E284S115
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [426, 468, 254], [10], 1)], 0, E284S115.L1),
([(3, true, false, [426, 468, 254], [10], 20)], 0, E284S115.L2),
([(3, true, false, [426, 468, 254], [10], 22)], 0, E284S115.L3),
([(3, true, false, [426, 468, 254], [10], 44)], 0, E284S115.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S115
