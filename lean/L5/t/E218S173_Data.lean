module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S173 "data/lean/9e711039bfc5c2fbc06ce1039c567189/E218S173.bin"
namespace E218S173
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 266, 494], [], 5)], 0, E218S173.L1),
([(0, true, false, [254, 266, 494], [], 6)], 0, E218S173.L2),
([(0, true, false, [254, 266, 494], [], 11)], 0, E218S173.L3),
([(0, true, false, [254, 266, 494], [], 12)], 0, E218S173.L4),
([(0, true, false, [254, 266, 494], [], 18)], 0, E218S173.L5),
([(0, true, false, [254, 266, 494], [], 42)], 0, E218S173.L6),
([(0, true, false, [254, 266, 494], [], 43)], 0, E218S173.L7),
([(0, true, false, [254, 266, 494], [], 44)], 0, E218S173.L8),
([(0, true, false, [254, 266, 494], [], 45)], 0, E218S173.L9),
([(0, true, false, [254, 266, 494], [], 46)], 0, E218S173.L10),
([(0, true, false, [254, 266, 494], [], 70)], 0, E218S173.L11),
([(0, true, false, [254, 266, 494], [], 75)], 0, E218S173.L12),
([(0, true, false, [254, 266, 494], [], 79)], 0, E218S173.L13),
([(0, true, false, [254, 266, 494], [], 81)], 0, E218S173.L14),
([(0, true, false, [254, 266, 494], [], 132)], 0, E218S173.L15),
([(0, true, false, [254, 266, 494], [], 137)], 0, E218S173.L16),
([(0, true, false, [254, 266, 494], [], 145)], 0, E218S173.L17),
([(0, true, false, [254, 266, 494], [], 155)], 0, E218S173.L18),
([(0, true, false, [254, 266, 494], [], 174)], 0, E218S173.L19),
([(0, true, false, [254, 266, 494], [], 177)], 0, E218S173.L20),
([(0, true, false, [254, 266, 494], [], 179)], 0, E218S173.L21),
([(0, true, false, [254, 266, 494], [], 180)], 0, E218S173.L22),
([(0, true, false, [254, 266, 494], [], 191)], 0, E218S173.L23),
([(0, true, false, [254, 266, 494], [], 192)], 0, E218S173.L24),
([(0, true, false, [254, 266, 494], [], 197)], 0, E218S173.L25),
([(0, true, false, [254, 266, 494], [], 245)], 0, E218S173.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E218S173
