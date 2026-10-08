module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S5 "data/lean/2449c998ee6f22b0f0eaf85de503b5a8/E279S5.bin"
namespace E279S5
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [], [238, 462], 10)], 0, E279S5.L1),
([(0, true, false, [], [238, 462], 11)], 0, E279S5.L2),
([(0, true, false, [], [238, 462], 106)], 0, E279S5.L3),
([(0, true, false, [], [238, 462], 108)], 0, E279S5.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E279S5
