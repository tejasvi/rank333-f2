module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S406 "data/lean/b44dc5eed91630611aaa9adcd8f40b03/E236S406.bin"
namespace E236S406
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372, 412, 254], [96, 136], 1)], 0, E236S406.L1),
([(0, true, false, [372, 412, 254], [96, 136], 12)], 0, E236S406.L2),
([(0, true, false, [372, 412, 254], [96, 136], 15)], 0, E236S406.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S406
