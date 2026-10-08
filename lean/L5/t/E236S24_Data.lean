module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S24 "data/lean/a68b01b9a79afcfe22e88da27808c456/E236S24.bin"
namespace E236S24
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [354], [22, 490], 2)], 3, E236S24.L1),
([(4, true, false, [354], [22, 490], 2), (5, false, false, [], [22, 490], 16)], 0, E236S24.L2),
([(4, true, false, [354], [22, 490], 2), (5, false, false, [], [22, 490], 64)], 0, E236S24.L3),
([(4, true, false, [354], [22, 490], 2), (5, false, false, [], [22, 490], 182)], 0, E236S24.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E236S24
