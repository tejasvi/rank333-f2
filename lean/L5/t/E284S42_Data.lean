module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S42 "data/lean/847695e4bde203fba785ac8e3da6e1ee/E284S42.bin"
namespace E284S42
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [], [256], 0)], 0, E284S42.L1),
([(7, true, false, [], [256], 4)], 0, E284S42.L2),
([(7, true, false, [], [256], 7)], 0, E284S42.L3),
([(7, true, false, [], [256], 8)], 0, E284S42.L4),
([(7, true, false, [], [256], 10)], 0, E284S42.L5),
([(7, true, false, [], [256], 12)], 0, E284S42.L6),
([(7, true, false, [], [256], 14)], 0, E284S42.L7),
([(7, true, false, [], [256], 16)], 0, E284S42.L8),
([(7, true, false, [], [256], 19)], 0, E284S42.L9),
([(7, true, false, [], [256], 25)], 0, E284S42.L10),
([(7, true, false, [], [256], 27)], 0, E284S42.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E284S42
