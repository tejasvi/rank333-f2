module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S83 "data/lean/b27e289d709f936b9d9bdeb8abbbb250/E218S83.bin"
namespace E218S83
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [142], [112, 352], 0)], 0, E218S83.L1),
([(16, true, false, [142], [112, 352], 2)], 0, E218S83.L2),
([(16, true, false, [142], [112, 352], 8)], 0, E218S83.L3),
([(16, true, false, [142], [112, 352], 12)], 0, E218S83.L4),
([(16, true, false, [142], [112, 352], 20)], 0, E218S83.L5),
([(16, true, false, [142], [112, 352], 21)], 0, E218S83.L6),
([(16, true, false, [142], [112, 352], 22)], 0, E218S83.L7),
([(16, true, false, [142], [112, 352], 23)], 0, E218S83.L8),
([(16, true, false, [142], [112, 352], 43)], 0, E218S83.L9),
([(16, true, false, [142], [112, 352], 45)], 0, E218S83.L10),
([(16, true, false, [142], [112, 352], 47)], 0, E218S83.L11),
([(16, true, false, [142], [112, 352], 48)], 0, E218S83.L12),
([(16, true, false, [142], [112, 352], 51)], 0, E218S83.L13),
([(16, true, false, [142], [112, 352], 52)], 0, E218S83.L14),
([(16, true, false, [142], [112, 352], 54)], 0, E218S83.L15),
([(16, true, false, [142], [112, 352], 57)], 0, E218S83.L16),
([(16, true, false, [142], [112, 352], 59)], 0, E218S83.L17),
([(16, true, false, [142], [112, 352], 60)], 0, E218S83.L18),
([(16, true, false, [142], [112, 352], 62)], 0, E218S83.L19),
([(16, true, false, [142], [112, 352], 64)], 0, E218S83.L20),
([(16, true, false, [142], [112, 352], 67)], 0, E218S83.L21),
([(16, true, false, [142], [112, 352], 69)], 0, E218S83.L22),
([(16, true, false, [142], [112, 352], 71)], 0, E218S83.L23),
([(16, true, false, [142], [112, 352], 72)], 0, E218S83.L24),
([(16, true, false, [142], [112, 352], 74)], 0, E218S83.L25),
([(16, true, false, [142], [112, 352], 76)], 0, E218S83.L26),
([(16, true, false, [142], [112, 352], 79)], 0, E218S83.L27),
([(16, true, false, [142], [112, 352], 81)], 0, E218S83.L28),
([(16, true, false, [142], [112, 352], 86)], 0, E218S83.L29),
([(16, true, false, [142], [112, 352], 93)], 0, E218S83.L30),
([(16, true, false, [142], [112, 352], 96)], 0, E218S83.L31),
([(16, true, false, [142], [112, 352], 121)], 0, E218S83.L32),
([(16, true, false, [142], [112, 352], 148)], 0, E218S83.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E218S83
