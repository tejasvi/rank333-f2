module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S175 "data/lean/ef5033e9028f1634127103f8eaefa910/E218S175.bin"
namespace E218S175
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [142, 254], [414], 2)], 0, E218S175.L1),
([(0, true, false, [142, 254], [414], 3)], 0, E218S175.L2),
([(0, true, false, [142, 254], [414], 56)], 0, E218S175.L3),
([(0, true, false, [142, 254], [414], 73)], 0, E218S175.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S175
