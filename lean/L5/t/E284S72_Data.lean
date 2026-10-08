module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S72 "data/lean/30f86e66b6176868ec2725fa9aef89b3/E284S72.bin"
namespace E284S72
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [94, 212, 468], [510], 0)], 0, E284S72.L1),
([(0, true, false, [94, 212, 468], [510], 5)], 0, E284S72.L2),
([(0, true, false, [94, 212, 468], [510], 6)], 0, E284S72.L3),
([(0, true, false, [94, 212, 468], [510], 7)], 0, E284S72.L4),
([(0, true, false, [94, 212, 468], [510], 10)], 0, E284S72.L5),
([(0, true, false, [94, 212, 468], [510], 11)], 0, E284S72.L6),
([(0, true, false, [94, 212, 468], [510], 12)], 0, E284S72.L7),
([(0, true, false, [94, 212, 468], [510], 13)], 0, E284S72.L8),
([(0, true, false, [94, 212, 468], [510], 18)], 0, E284S72.L9),
([(0, true, false, [94, 212, 468], [510], 19)], 0, E284S72.L10),
([(0, true, false, [94, 212, 468], [510], 20)], 0, E284S72.L11),
([(0, true, false, [94, 212, 468], [510], 22)], 0, E284S72.L12),
([(0, true, false, [94, 212, 468], [510], 24)], 0, E284S72.L13),
([(0, true, false, [94, 212, 468], [510], 25)], 0, E284S72.L14),
([(0, true, false, [94, 212, 468], [510], 26)], 0, E284S72.L15),
([(0, true, false, [94, 212, 468], [510], 27)], 0, E284S72.L16),
([(0, true, false, [94, 212, 468], [510], 28)], 0, E284S72.L17),
([(0, true, false, [94, 212, 468], [510], 29)], 0, E284S72.L18),
([(0, true, false, [94, 212, 468], [510], 30)], 0, E284S72.L19),
([(0, true, false, [94, 212, 468], [510], 31)], 0, E284S72.L20),
([(0, true, false, [94, 212, 468], [510], 33)], 0, E284S72.L21),
([(0, true, false, [94, 212, 468], [510], 38)], 0, E284S72.L22),
([(0, true, false, [94, 212, 468], [510], 42)], 0, E284S72.L23),
([(0, true, false, [94, 212, 468], [510], 43)], 0, E284S72.L24),
([(0, true, false, [94, 212, 468], [510], 45)], 0, E284S72.L25),
([(0, true, false, [94, 212, 468], [510], 46)], 0, E284S72.L26),
([(0, true, false, [94, 212, 468], [510], 48)], 0, E284S72.L27),
([(0, true, false, [94, 212, 468], [510], 51)], 0, E284S72.L28),
([(0, true, false, [94, 212, 468], [510], 61)], 0, E284S72.L29),
([(0, true, false, [94, 212, 468], [510], 63)], 0, E284S72.L30),
([(0, true, false, [94, 212, 468], [510], 66)], 0, E284S72.L31),
([(0, true, false, [94, 212, 468], [510], 74)], 0, E284S72.L32),
([(0, true, false, [94, 212, 468], [510], 76)], 0, E284S72.L33),
([(0, true, false, [94, 212, 468], [510], 77)], 0, E284S72.L34),
([(0, true, false, [94, 212, 468], [510], 78)], 0, E284S72.L35),
([(0, true, false, [94, 212, 468], [510], 79)], 0, E284S72.L36),
([(0, true, false, [94, 212, 468], [510], 80)], 0, E284S72.L37),
([(0, true, false, [94, 212, 468], [510], 90)], 0, E284S72.L38),
([(0, true, false, [94, 212, 468], [510], 91)], 0, E284S72.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E284S72
