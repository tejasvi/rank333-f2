module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S337 "data/lean/c82f9c3c8727a17af6e116619d135e76/E236S337.bin"
namespace E236S337
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [412, 354], [22, 258], 1)], 0, E236S337.L1),
([(9, true, false, [412, 354], [22, 258], 2)], 0, E236S337.L2),
([(9, true, false, [412, 354], [22, 258], 5)], 0, E236S337.L3),
([(9, true, false, [412, 354], [22, 258], 8)], 0, E236S337.L4),
([(9, true, false, [412, 354], [22, 258], 13)], 0, E236S337.L5),
([(9, true, false, [412, 354], [22, 258], 16)], 0, E236S337.L6),
([(9, true, false, [412, 354], [22, 258], 20)], 0, E236S337.L7),
([(9, true, false, [412, 354], [22, 258], 23)], 0, E236S337.L8),
([(9, true, false, [412, 354], [22, 258], 24)], 0, E236S337.L9),
([(9, true, false, [412, 354], [22, 258], 25)], 0, E236S337.L10),
([(9, true, false, [412, 354], [22, 258], 27)], 0, E236S337.L11),
([(9, true, false, [412, 354], [22, 258], 28)], 0, E236S337.L12),
([(9, true, false, [412, 354], [22, 258], 30)], 0, E236S337.L13),
([(9, true, false, [412, 354], [22, 258], 31)], 0, E236S337.L14),
([(9, true, false, [412, 354], [22, 258], 33)], 0, E236S337.L15),
([(9, true, false, [412, 354], [22, 258], 35)], 0, E236S337.L16),
([(9, true, false, [412, 354], [22, 258], 36)], 0, E236S337.L17),
([(9, true, false, [412, 354], [22, 258], 37)], 0, E236S337.L18),
([(9, true, false, [412, 354], [22, 258], 38)], 0, E236S337.L19),
([(9, true, false, [412, 354], [22, 258], 39)], 0, E236S337.L20),
([(9, true, false, [412, 354], [22, 258], 41)], 0, E236S337.L21),
([(9, true, false, [412, 354], [22, 258], 42)], 0, E236S337.L22),
([(9, true, false, [412, 354], [22, 258], 52)], 0, E236S337.L23),
([(9, true, false, [412, 354], [22, 258], 56)], 0, E236S337.L24),
([(9, true, false, [412, 354], [22, 258], 64)], 0, E236S337.L25),
([(9, true, false, [412, 354], [22, 258], 68)], 0, E236S337.L26),
([(9, true, false, [412, 354], [22, 258], 69)], 0, E236S337.L27),
([(9, true, false, [412, 354], [22, 258], 70)], 0, E236S337.L28),
([(9, true, false, [412, 354], [22, 258], 72)], 0, E236S337.L29),
([(9, true, false, [412, 354], [22, 258], 73)], 0, E236S337.L30),
([(9, true, false, [412, 354], [22, 258], 77)], 0, E236S337.L31),
([(9, true, false, [412, 354], [22, 258], 80)], 0, E236S337.L32),
([(9, true, false, [412, 354], [22, 258], 86)], 0, E236S337.L33),
([(9, true, false, [412, 354], [22, 258], 88)], 0, E236S337.L34),
([(9, true, false, [412, 354], [22, 258], 100)], 0, E236S337.L35),
([(9, true, false, [412, 354], [22, 258], 101)], 0, E236S337.L36),
([(9, true, false, [412, 354], [22, 258], 105)], 0, E236S337.L37),
([(9, true, false, [412, 354], [22, 258], 110)], 0, E236S337.L38),
([(9, true, false, [412, 354], [22, 258], 122)], 0, E236S337.L39),
([(9, true, false, [412, 354], [22, 258], 146)], 0, E236S337.L40),
([(9, true, false, [412, 354], [22, 258], 152)], 0, E236S337.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E236S337
