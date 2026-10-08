module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E279S16 "data/lean/d967e3cf268329b4b338e66a5cd6e7f8/E279S16.bin"
namespace E279S16
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [], [], 99)], 0, E279S16.L1),
([(5, true, false, [], [], 101)], 0, E279S16.L2),
([(5, true, false, [], [], 324)], 0, E279S16.L3),
([(5, true, false, [], [], 328)], 0, E279S16.L4),
([(5, true, false, [], [], 372)], 0, E279S16.L5),
([(5, true, false, [], [], 373)], 0, E279S16.L6),
([(5, true, false, [], [], 374)], 0, E279S16.L7),
([(5, true, false, [], [], 376)], 0, E279S16.L8),
([(5, true, false, [], [], 377)], 0, E279S16.L9),
([(5, true, false, [], [], 389)], 0, E279S16.L10),
([(5, true, false, [], [], 395)], 0, E279S16.L11),
([(5, true, false, [], [], 398)], 0, E279S16.L12),
([(5, true, false, [], [], 399)], 0, E279S16.L13),
([(5, true, false, [], [], 647)], 0, E279S16.L14),
([(5, true, false, [], [], 649)], 0, E279S16.L15),
([(5, true, false, [], [], 891)], 0, E279S16.L16),
([(5, true, false, [], [], 894)], 0, E279S16.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E279S16
