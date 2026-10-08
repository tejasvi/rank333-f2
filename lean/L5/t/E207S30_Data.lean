module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S30 "data/lean/61f2353caad0bdafe4d3cd16f22e60d5/E207S30.bin"
namespace E207S30
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [], [446, 506], 12)], 0, E207S30.L1),
([(0, true, false, [], [446, 506], 44)], 0, E207S30.L2),
([(0, true, false, [], [446, 506], 53)], 0, E207S30.L3),
([(0, true, false, [], [446, 506], 57)], 0, E207S30.L4),
([(0, true, false, [], [446, 506], 58)], 0, E207S30.L5),
([(0, true, false, [], [446, 506], 64)], 0, E207S30.L6),
([(0, true, false, [], [446, 506], 82)], 0, E207S30.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E207S30
