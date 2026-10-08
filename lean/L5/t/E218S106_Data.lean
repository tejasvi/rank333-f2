module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S106 "data/lean/01d4b46ffb50dd82121a0dbae3bf3f43/E218S106.bin"
namespace E218S106
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254, 494], [112, 352], 11)], 0, E218S106.L1),
([(7, true, false, [254, 494], [112, 352], 24)], 0, E218S106.L2),
([(7, true, false, [254, 494], [112, 352], 27)], 0, E218S106.L3),
([(7, true, false, [254, 494], [112, 352], 30)], 0, E218S106.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S106
