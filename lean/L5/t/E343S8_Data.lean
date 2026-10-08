module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S8 "data/lean/087236332abb08c78fa5d6200a01fde9/E343S8.bin"
namespace E343S8
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(5, true, false, [], [], 50)], 14, 0, E343S8.L1),
([(5, true, false, [], [], 52)], 14, 0, E343S8.L2),
([(5, true, false, [], [], 53)], 14, 0, E343S8.L3),
([(5, true, false, [], [], 63)], 14, 0, E343S8.L4),
([(5, true, false, [], [], 100)], 14, 0, E343S8.L5),
([(5, true, false, [], [], 101)], 14, 0, E343S8.L6),
([(5, true, false, [], [], 102)], 14, 0, E343S8.L7),
([(5, true, false, [], [], 118)], 14, 0, E343S8.L8),
([(5, true, false, [], [], 598)], 14, 0, E343S8.L9),
([(5, true, false, [], [], 599)], 14, 0, E343S8.L10),
([(5, true, false, [], [], 600)], 14, 0, E343S8.L11),
([(5, true, false, [], [], 611)], 14, 0, E343S8.L12),
([(5, true, false, [], [], 627)], 14, 0, E343S8.L13),
([(5, true, false, [], [], 648)], 14, 0, E343S8.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E343S8
