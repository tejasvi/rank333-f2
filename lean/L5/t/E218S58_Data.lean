module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S58 "data/lean/ef7fcf0c0c4dd13f555c27c0268f11b5/E218S58.bin"
namespace E218S58
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 500], [26], 0)], 0, E218S58.L1),
([(0, true, false, [266, 500], [26], 20)], 0, E218S58.L2),
([(0, true, false, [266, 500], [26], 22)], 0, E218S58.L3),
([(0, true, false, [266, 500], [26], 23)], 0, E218S58.L4),
([(0, true, false, [266, 500], [26], 24)], 0, E218S58.L5),
([(0, true, false, [266, 500], [26], 27)], 0, E218S58.L6),
([(0, true, false, [266, 500], [26], 28)], 0, E218S58.L7),
([(0, true, false, [266, 500], [26], 29)], 0, E218S58.L8),
([(0, true, false, [266, 500], [26], 41)], 0, E218S58.L9),
([(0, true, false, [266, 500], [26], 44)], 0, E218S58.L10),
([(0, true, false, [266, 500], [26], 50)], 0, E218S58.L11),
([(0, true, false, [266, 500], [26], 51)], 0, E218S58.L12),
([(0, true, false, [266, 500], [26], 54)], 0, E218S58.L13),
([(0, true, false, [266, 500], [26], 62)], 0, E218S58.L14),
([(0, true, false, [266, 500], [26], 68)], 0, E218S58.L15),
([(0, true, false, [266, 500], [26], 69)], 0, E218S58.L16),
([(0, true, false, [266, 500], [26], 82)], 0, E218S58.L17),
([(0, true, false, [266, 500], [26], 95)], 0, E218S58.L18),
([(0, true, false, [266, 500], [26], 114)], 0, E218S58.L19),
([(0, true, false, [266, 500], [26], 148)], 0, E218S58.L20),
([(0, true, false, [266, 500], [26], 150)], 0, E218S58.L21),
([(0, true, false, [266, 500], [26], 151)], 0, E218S58.L22),
([(0, true, false, [266, 500], [26], 169)], 0, E218S58.L23),
([(0, true, false, [266, 500], [26], 198)], 0, E218S58.L24),
([(0, true, false, [266, 500], [26], 202)], 0, E218S58.L25),
([(0, true, false, [266, 500], [26], 224)], 0, E218S58.L26),
([(0, true, false, [266, 500], [26], 225)], 0, E218S58.L27),
([(0, true, false, [266, 500], [26], 228)], 0, E218S58.L28),
([(0, true, false, [266, 500], [26], 231)], 0, E218S58.L29),
([(0, true, false, [266, 500], [26], 260)], 0, E218S58.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E218S58
