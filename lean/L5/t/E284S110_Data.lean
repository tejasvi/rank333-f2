module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S110 "data/lean/215e9463683161b8fb19ef20db66a52e/E284S110.bin"
namespace E284S110
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [266, 382, 394], [42], 4)], 0, E284S110.L1),
([(8, true, false, [266, 382, 394], [42], 29)], 0, E284S110.L2),
([(8, true, false, [266, 382, 394], [42], 30)], 0, E284S110.L3),
([(8, true, false, [266, 382, 394], [42], 43)], 0, E284S110.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S110
