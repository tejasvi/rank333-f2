module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S26 "data/lean/cb1114f7fadafd67ccda43d97d54ee61/E218S26.bin"
namespace E218S26
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266], [26, 148], 4)], 0, E218S26.L1),
([(13, true, false, [266], [26, 148], 5)], 0, E218S26.L2),
([(13, true, false, [266], [26, 148], 6)], 0, E218S26.L3),
([(13, true, false, [266], [26, 148], 7)], 0, E218S26.L4),
([(13, true, false, [266], [26, 148], 8)], 0, E218S26.L5),
([(13, true, false, [266], [26, 148], 10)], 0, E218S26.L6),
([(13, true, false, [266], [26, 148], 11)], 0, E218S26.L7),
([(13, true, false, [266], [26, 148], 14)], 0, E218S26.L8),
([(13, true, false, [266], [26, 148], 15)], 0, E218S26.L9),
([(13, true, false, [266], [26, 148], 17)], 0, E218S26.L10),
([(13, true, false, [266], [26, 148], 18)], 0, E218S26.L11),
([(13, true, false, [266], [26, 148], 25)], 0, E218S26.L12),
([(13, true, false, [266], [26, 148], 43)], 0, E218S26.L13),
([(13, true, false, [266], [26, 148], 46)], 0, E218S26.L14),
([(13, true, false, [266], [26, 148], 53)], 0, E218S26.L15),
([(13, true, false, [266], [26, 148], 56)], 0, E218S26.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E218S26
