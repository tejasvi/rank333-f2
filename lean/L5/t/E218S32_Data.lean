module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S32 "data/lean/69977c54c79aba5cef8c1906e3001ce7/E218S32.bin"
namespace E218S32
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [], [112, 378], 55)], 0, E218S32.L1),
([(8, true, false, [], [112, 378], 57)], 0, E218S32.L2),
([(8, true, false, [], [112, 378], 68)], 0, E218S32.L3),
([(8, true, false, [], [112, 378], 83)], 0, E218S32.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S32
