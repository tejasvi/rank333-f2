module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S5 "data/lean/089e46d10e236d0dfa7bce970f01f4a1/E185S5.bin"
namespace E185S5
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(9, true, false, [384], [], 0), (10, false, false, [], [], 0)], 4, 0, E185S5.L1),
([(9, true, false, [384], [], 0), (10, false, false, [], [], 1)], 4, 0, E185S5.L2),
([(9, true, false, [384], [], 0), (10, false, false, [], [], 2)], 4, 0, E185S5.L3),
([(9, true, false, [384], [], 0), (10, false, false, [], [], 3)], 4, 0, E185S5.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E185S5
