module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S178 "data/lean/213dfe292a4f0ae90db2aca49b27ec5a/E218S178.bin"
namespace E218S178
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 266], [26], 0)], 0, E218S178.L1),
([(0, true, false, [254, 266], [26], 10)], 0, E218S178.L2),
([(0, true, false, [254, 266], [26], 11)], 0, E218S178.L3),
([(0, true, false, [254, 266], [26], 12)], 0, E218S178.L4),
([(0, true, false, [254, 266], [26], 13)], 0, E218S178.L5),
([(0, true, false, [254, 266], [26], 14)], 0, E218S178.L6),
([(0, true, false, [254, 266], [26], 26)], 0, E218S178.L7),
([(0, true, false, [254, 266], [26], 34)], 0, E218S178.L8),
([(0, true, false, [254, 266], [26], 86)], 0, E218S178.L9),
([(0, true, false, [254, 266], [26], 91)], 0, E218S178.L10),
([(0, true, false, [254, 266], [26], 105)], 0, E218S178.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E218S178
