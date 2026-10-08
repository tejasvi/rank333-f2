module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S56 "data/lean/80284779933339716a7c1d5d168ad3ed/E284S56.bin"
namespace E284S56
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 298, 340], [10, 138], 5)], 0, E284S56.L1),
([(3, true, false, [266, 298, 340], [10, 138], 6)], 0, E284S56.L2),
([(3, true, false, [266, 298, 340], [10, 138], 7)], 0, E284S56.L3),
([(3, true, false, [266, 298, 340], [10, 138], 9)], 0, E284S56.L4),
([(3, true, false, [266, 298, 340], [10, 138], 16)], 0, E284S56.L5),
([(3, true, false, [266, 298, 340], [10, 138], 21)], 0, E284S56.L6),
([(3, true, false, [266, 298, 340], [10, 138], 26)], 0, E284S56.L7),
([(3, true, false, [266, 298, 340], [10, 138], 29)], 0, E284S56.L8),
([(3, true, false, [266, 298, 340], [10, 138], 39)], 0, E284S56.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S56
