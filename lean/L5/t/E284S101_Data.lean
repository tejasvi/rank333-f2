module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S101 "data/lean/447c898c2e2478cf0765723d1a284fcd/E284S101.bin"
namespace E284S101
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [382, 426], [10, 138], 1)], 0, E284S101.L1),
([(8, true, false, [382, 426], [10, 138], 2)], 0, E284S101.L2),
([(8, true, false, [382, 426], [10, 138], 10)], 0, E284S101.L3),
([(8, true, false, [382, 426], [10, 138], 12)], 0, E284S101.L4),
([(8, true, false, [382, 426], [10, 138], 34)], 0, E284S101.L5),
([(8, true, false, [382, 426], [10, 138], 48)], 0, E284S101.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E284S101
