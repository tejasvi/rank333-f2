module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S33 "data/lean/165c0c7eb876e19aceef56a5e5b218a4/E236S33.bin"
namespace E236S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [394, 354], [22], 42)], 0, E236S33.L1),
([(14, true, false, [394, 354], [22], 44)], 0, E236S33.L2),
([(14, true, false, [394, 354], [22], 45)], 0, E236S33.L3),
([(14, true, false, [394, 354], [22], 49)], 0, E236S33.L4),
([(14, true, false, [394, 354], [22], 50)], 0, E236S33.L5),
([(14, true, false, [394, 354], [22], 51)], 0, E236S33.L6),
([(14, true, false, [394, 354], [22], 62)], 0, E236S33.L7),
([(14, true, false, [394, 354], [22], 143)], 0, E236S33.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S33
