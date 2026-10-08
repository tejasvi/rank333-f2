module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S290 "data/lean/9cdd3d2670412df1ab0ffce58c254910/E284S290.bin"
namespace E284S290
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [382, 478, 94, 254], [350], 37)], 0, E284S290.L1),
([(4, true, false, [382, 478, 94, 254], [350], 38)], 0, E284S290.L2),
([(4, true, false, [382, 478, 94, 254], [350], 46)], 0, E284S290.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S290
