module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S192 "data/lean/7f219824b38f0e69f24fb3e6c1c91cb7/E213S192.bin"
namespace E213S192
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254], [388], 39)], 0, E213S192.L1),
([(3, true, false, [158, 254], [388], 42)], 0, E213S192.L2),
([(3, true, false, [158, 254], [388], 75)], 0, E213S192.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S192
