module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S104 "data/lean/8751d0cdac22b2b6190a2147992c2169/E284S104.bin"
namespace E284S104
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 394], [42], 2)], 0, E284S104.L1),
([(8, true, false, [254, 266, 394], [42], 5)], 0, E284S104.L2),
([(8, true, false, [254, 266, 394], [42], 26)], 0, E284S104.L3),
([(8, true, false, [254, 266, 394], [42], 27)], 0, E284S104.L4),
([(8, true, false, [254, 266, 394], [42], 40)], 0, E284S104.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S104
