module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S256 "data/lean/154ead7b35590d9c411af55011a080c1/E284S256.bin"
namespace E284S256
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [426], [42], 46)], 0, E284S256.L1),
([(8, true, false, [426], [42], 81)], 0, E284S256.L2),
([(8, true, false, [426], [42], 106)], 0, E284S256.L3),
([(8, true, false, [426], [42], 124)], 0, E284S256.L4),
([(8, true, false, [426], [42], 132)], 0, E284S256.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S256
