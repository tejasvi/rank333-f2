module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S174 "data/lean/1b2ee3793859d79d6a325fe03ea6878e/E218S174.bin"
namespace E218S174
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 494], [352, 378], 7)], 2, E218S174.L1),
([(6, true, false, [106, 494], [352, 378], 7), (7, false, false, [], [352, 378], 110)], 0, E218S174.L2),
([(6, true, false, [106, 494], [352, 378], 7), (7, false, false, [], [352, 378], 206)], 0, E218S174.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E218S174
