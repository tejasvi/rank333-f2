module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S51 "data/lean/d630e69e3733a581bd1fff7b839cb195/E284S51.bin"
namespace E284S51
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [384], [], 0), (5, false, false, [], [], 0)], 0, E284S51.L1),
([(14, true, false, [384], [], 0), (5, false, false, [], [], 1)], 0, E284S51.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S51
