module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S327 "data/lean/f50b001e818aab2a39acfd56e48d2a33/E284S327.bin"
namespace E284S327
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [426, 266], [42], 42)], 0, E284S327.L1),
([(6, true, false, [426, 266], [42], 45)], 0, E284S327.L2),
([(6, true, false, [426, 266], [42], 48)], 0, E284S327.L3),
([(6, true, false, [426, 266], [42], 81)], 0, E284S327.L4),
([(6, true, false, [426, 266], [42], 83)], 0, E284S327.L5),
([(6, true, false, [426, 266], [42], 126)], 0, E284S327.L6),
([(6, true, false, [426, 266], [42], 128)], 0, E284S327.L7),
([(6, true, false, [426, 266], [42], 132)], 0, E284S327.L8),
([(6, true, false, [426, 266], [42], 150)], 0, E284S327.L9),
([(6, true, false, [426, 266], [42], 160)], 0, E284S327.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S327
