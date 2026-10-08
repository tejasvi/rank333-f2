module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S9 "data/lean/0a1302f7aa8b8ab562510fd077220fea/E236S9.bin"
namespace E236S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [], [22, 96, 136], 26)], 0, E236S9.L1),
([(13, true, false, [], [22, 96, 136], 28)], 0, E236S9.L2),
([(13, true, false, [], [22, 96, 136], 31)], 0, E236S9.L3),
([(13, true, false, [], [22, 96, 136], 33)], 0, E236S9.L4),
([(13, true, false, [], [22, 96, 136], 36)], 0, E236S9.L5),
([(13, true, false, [], [22, 96, 136], 38)], 0, E236S9.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S9
