module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S148 "data/lean/820d4ce2ff2fa4329908ecb130c01387/E284S148.bin"
namespace E284S148
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266, 426], [10], 5)], 0, E284S148.L1),
([(3, true, false, [84, 266, 426], [10], 15)], 0, E284S148.L2),
([(3, true, false, [84, 266, 426], [10], 27)], 0, E284S148.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S148
