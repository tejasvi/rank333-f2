module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S20 "data/lean/97e8caa57a3ab69fd61aa7cc08a717f4/E218S20.bin"
namespace E218S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266], [378], 4)], 0, E218S20.L1),
([(13, true, false, [266], [378], 5)], 0, E218S20.L2),
([(13, true, false, [266], [378], 6)], 0, E218S20.L3),
([(13, true, false, [266], [378], 8)], 0, E218S20.L4),
([(13, true, false, [266], [378], 10)], 0, E218S20.L5),
([(13, true, false, [266], [378], 11)], 0, E218S20.L6),
([(13, true, false, [266], [378], 14)], 0, E218S20.L7),
([(13, true, false, [266], [378], 15)], 0, E218S20.L8),
([(13, true, false, [266], [378], 16)], 0, E218S20.L9),
([(13, true, false, [266], [378], 17)], 0, E218S20.L10),
([(13, true, false, [266], [378], 18)], 0, E218S20.L11),
([(13, true, false, [266], [378], 19)], 0, E218S20.L12),
([(13, true, false, [266], [378], 21)], 0, E218S20.L13),
([(13, true, false, [266], [378], 22)], 0, E218S20.L14),
([(13, true, false, [266], [378], 23)], 0, E218S20.L15),
([(13, true, false, [266], [378], 118)], 0, E218S20.L16),
([(13, true, false, [266], [378], 142)], 0, E218S20.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E218S20
