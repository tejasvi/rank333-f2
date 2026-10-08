module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S262 "data/lean/fff1fd3810e17a0ee951a19ccb3459f2/E284S262.bin"
namespace E284S262
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [128], [], 0), (13, false, false, [426], [], 0)], 0, E284S262.L1),
([(12, true, false, [128], [], 0), (13, false, false, [426], [], 1)], 0, E284S262.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S262
