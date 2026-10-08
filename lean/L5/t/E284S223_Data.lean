module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S223 "data/lean/225a4469db44c55725059d017390f3de/E284S223.bin"
namespace E284S223
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266, 340, 382, 394, 84, 254], [], 0)], 0, E284S223.L1),
([(4, true, false, [266, 340, 382, 394, 84, 254], [], 37)], 0, E284S223.L2),
([(4, true, false, [266, 340, 382, 394, 84, 254], [], 45)], 0, E284S223.L3),
([(4, true, false, [266, 340, 382, 394, 84, 254], [], 107)], 0, E284S223.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S223
