module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S14 "data/lean/369cc750e5978294ff79c45daab740b4/E343S14.bin"
namespace E343S14
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(2, true, false, [], [], 49)], 10, 0, E343S14.L1),
([(2, true, false, [], [], 51)], 10, 0, E343S14.L2),
([(2, true, false, [], [], 53)], 10, 0, E343S14.L3),
([(2, true, false, [], [], 55)], 10, 0, E343S14.L4),
([(2, true, false, [], [], 98)], 10, 0, E343S14.L5),
([(2, true, false, [], [], 102)], 10, 0, E343S14.L6),
([(2, true, false, [], [], 595)], 10, 0, E343S14.L7),
([(2, true, false, [], [], 599)], 10, 0, E343S14.L8),
([(2, true, false, [], [], 644)], 10, 0, E343S14.L9),
([(2, true, false, [], [], 648)], 10, 0, E343S14.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E343S14
