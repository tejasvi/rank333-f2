module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E185S4 "data/lean/6c51058cf69b405bff955e9e885ead4b/E185S4.bin"
namespace E185S4
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(10, true, false, [384], [], 0), (7, false, false, [], [], 0)], 3, 0, E185S4.L1),
([(10, true, false, [384], [], 0), (7, false, false, [], [], 1)], 3, 0, E185S4.L2),
([(10, true, false, [384], [], 0), (7, false, false, [], [], 2)], 3, 0, E185S4.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E185S4
