module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S292 "data/lean/6f1c495d11983ff88668af65a3d9d923/E284S292.bin"
namespace E284S292
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [382, 478, 94, 254], [350], 3)], 0, E284S292.L1),
([(4, true, false, [382, 478, 94, 254], [350], 20)], 0, E284S292.L2),
([(4, true, false, [382, 478, 94, 254], [350], 87)], 0, E284S292.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S292
