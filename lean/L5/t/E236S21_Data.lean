module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S21 "data/lean/bad6747f90661feb5d22565f8d5cbbe0/E236S21.bin"
namespace E236S21
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [412], [96], 1)], 0, E236S21.L1),
([(0, true, false, [412], [96], 2)], 0, E236S21.L2),
([(0, true, false, [412], [96], 8)], 0, E236S21.L3),
([(0, true, false, [412], [96], 13)], 0, E236S21.L4),
([(0, true, false, [412], [96], 20)], 0, E236S21.L5),
([(0, true, false, [412], [96], 24)], 0, E236S21.L6),
([(0, true, false, [412], [96], 28)], 0, E236S21.L7),
([(0, true, false, [412], [96], 30)], 0, E236S21.L8),
([(0, true, false, [412], [96], 32)], 0, E236S21.L9),
([(0, true, false, [412], [96], 62)], 0, E236S21.L10),
([(0, true, false, [412], [96], 64)], 0, E236S21.L11),
([(0, true, false, [412], [96], 70)], 0, E236S21.L12),
([(0, true, false, [412], [96], 74)], 0, E236S21.L13),
([(0, true, false, [412], [96], 91)], 0, E236S21.L14),
([(0, true, false, [412], [96], 93)], 0, E236S21.L15),
([(0, true, false, [412], [96], 98)], 0, E236S21.L16),
([(0, true, false, [412], [96], 100)], 0, E236S21.L17),
([(0, true, false, [412], [96], 142)], 0, E236S21.L18),
([(0, true, false, [412], [96], 143)], 0, E236S21.L19),
([(0, true, false, [412], [96], 161)], 0, E236S21.L20),
([(0, true, false, [412], [96], 170)], 0, E236S21.L21),
([(0, true, false, [412], [96], 174)], 0, E236S21.L22),
([(0, true, false, [412], [96], 177)], 0, E236S21.L23),
([(0, true, false, [412], [96], 180)], 0, E236S21.L24),
([(0, true, false, [412], [96], 181)], 0, E236S21.L25),
([(0, true, false, [412], [96], 182)], 0, E236S21.L26),
([(0, true, false, [412], [96], 205)], 0, E236S21.L27),
([(0, true, false, [412], [96], 208)], 0, E236S21.L28),
([(0, true, false, [412], [96], 231)], 0, E236S21.L29),
([(0, true, false, [412], [96], 235)], 0, E236S21.L30),
([(0, true, false, [412], [96], 246)], 0, E236S21.L31),
([(0, true, false, [412], [96], 260)], 0, E236S21.L32),
([(0, true, false, [412], [96], 262)], 0, E236S21.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E236S21
