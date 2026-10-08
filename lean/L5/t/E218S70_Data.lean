module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S70 "data/lean/83715ae948e7c148bcdb83091f2e82e7/E218S70.bin"
namespace E218S70
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266], [26, 352], 1)], 0, E218S70.L1),
([(4, true, false, [266], [26, 352], 49)], 0, E218S70.L2),
([(4, true, false, [266], [26, 352], 50)], 0, E218S70.L3),
([(4, true, false, [266], [26, 352], 51)], 0, E218S70.L4),
([(4, true, false, [266], [26, 352], 52)], 0, E218S70.L5),
([(4, true, false, [266], [26, 352], 53)], 0, E218S70.L6),
([(4, true, false, [266], [26, 352], 54)], 0, E218S70.L7),
([(4, true, false, [266], [26, 352], 55)], 0, E218S70.L8),
([(4, true, false, [266], [26, 352], 56)], 0, E218S70.L9),
([(4, true, false, [266], [26, 352], 57)], 0, E218S70.L10),
([(4, true, false, [266], [26, 352], 58)], 0, E218S70.L11),
([(4, true, false, [266], [26, 352], 97)], 0, E218S70.L12),
([(4, true, false, [266], [26, 352], 102)], 0, E218S70.L13),
([(4, true, false, [266], [26, 352], 143)], 0, E218S70.L14),
([(4, true, false, [266], [26, 352], 144)], 0, E218S70.L15),
([(4, true, false, [266], [26, 352], 152)], 0, E218S70.L16),
([(4, true, false, [266], [26, 352], 153)], 0, E218S70.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E218S70
