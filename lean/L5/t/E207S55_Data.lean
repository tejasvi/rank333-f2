module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S55 "data/lean/f72c9f38e51284e482d023bfde10f27b/E207S55.bin"
namespace E207S55
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [426, 494, 286], [80], 20)], 0, E207S55.L1),
([(5, true, false, [426, 494, 286], [80], 26)], 0, E207S55.L2),
([(5, true, false, [426, 494, 286], [80], 34)], 0, E207S55.L3),
([(5, true, false, [426, 494, 286], [80], 38)], 0, E207S55.L4),
([(5, true, false, [426, 494, 286], [80], 60)], 0, E207S55.L5),
([(5, true, false, [426, 494, 286], [80], 69)], 0, E207S55.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E207S55
