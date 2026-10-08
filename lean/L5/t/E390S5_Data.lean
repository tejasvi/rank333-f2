module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E390S5 "data/lean/45fbc3bdc61d98f5052fe040a936b824/E390S5.bin"
namespace E390S5
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [94, 394, 298], [], 0)], 0, E390S5.L1),
([(7, true, false, [94, 394, 298], [], 1)], 0, E390S5.L2),
([(7, true, false, [94, 394, 298], [], 2)], 0, E390S5.L3),
([(7, true, false, [94, 394, 298], [], 3)], 0, E390S5.L4),
([(7, true, false, [94, 394, 298], [], 4)], 0, E390S5.L5),
([(7, true, false, [94, 394, 298], [], 5)], 0, E390S5.L6),
([(7, true, false, [94, 394, 298], [], 6)], 0, E390S5.L7),
([(7, true, false, [94, 394, 298], [], 8)], 0, E390S5.L8),
([(7, true, false, [94, 394, 298], [], 9)], 0, E390S5.L9),
([(7, true, false, [94, 394, 298], [], 20)], 0, E390S5.L10),
([(7, true, false, [94, 394, 298], [], 22)], 0, E390S5.L11),
([(7, true, false, [94, 394, 298], [], 26)], 0, E390S5.L12),
([(7, true, false, [94, 394, 298], [], 27)], 0, E390S5.L13),
([(7, true, false, [94, 394, 298], [], 29)], 0, E390S5.L14),
([(7, true, false, [94, 394, 298], [], 74)], 0, E390S5.L15),
([(7, true, false, [94, 394, 298], [], 77)], 0, E390S5.L16),
([(7, true, false, [94, 394, 298], [], 84)], 0, E390S5.L17),
([(7, true, false, [94, 394, 298], [], 85)], 0, E390S5.L18),
([(7, true, false, [94, 394, 298], [], 87)], 0, E390S5.L19),
([(7, true, false, [94, 394, 298], [], 98)], 0, E390S5.L20),
([(7, true, false, [94, 394, 298], [], 202)], 0, E390S5.L21),
([(7, true, false, [94, 394, 298], [], 290)], 0, E390S5.L22),
([(7, true, false, [94, 394, 298], [], 294)], 0, E390S5.L23),
([(7, true, false, [94, 394, 298], [], 317)], 0, E390S5.L24),
([(7, true, false, [94, 394, 298], [], 334)], 0, E390S5.L25),
([(7, true, false, [94, 394, 298], [], 335)], 0, E390S5.L26),
([(7, true, false, [94, 394, 298], [], 338)], 0, E390S5.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E390S5
