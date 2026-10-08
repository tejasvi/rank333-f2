module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S84 "data/lean/719cda6e88603e2723ffcaebb44f0d57/E207S84.bin"
namespace E207S84
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 286, 334, 346], [], 0)], 0, E207S84.L1),
([(0, true, false, [266, 286, 334, 346], [], 1)], 0, E207S84.L2),
([(0, true, false, [266, 286, 334, 346], [], 2)], 0, E207S84.L3),
([(0, true, false, [266, 286, 334, 346], [], 3)], 0, E207S84.L4),
([(0, true, false, [266, 286, 334, 346], [], 4)], 0, E207S84.L5),
([(0, true, false, [266, 286, 334, 346], [], 5)], 0, E207S84.L6),
([(0, true, false, [266, 286, 334, 346], [], 6)], 0, E207S84.L7),
([(0, true, false, [266, 286, 334, 346], [], 7)], 0, E207S84.L8),
([(0, true, false, [266, 286, 334, 346], [], 8)], 0, E207S84.L9),
([(0, true, false, [266, 286, 334, 346], [], 9)], 0, E207S84.L10),
([(0, true, false, [266, 286, 334, 346], [], 10)], 0, E207S84.L11),
([(0, true, false, [266, 286, 334, 346], [], 11)], 0, E207S84.L12),
([(0, true, false, [266, 286, 334, 346], [], 12)], 0, E207S84.L13),
([(0, true, false, [266, 286, 334, 346], [], 15)], 0, E207S84.L14),
([(0, true, false, [266, 286, 334, 346], [], 16)], 0, E207S84.L15),
([(0, true, false, [266, 286, 334, 346], [], 18)], 0, E207S84.L16),
([(0, true, false, [266, 286, 334, 346], [], 29)], 0, E207S84.L17),
([(0, true, false, [266, 286, 334, 346], [], 30)], 0, E207S84.L18),
([(0, true, false, [266, 286, 334, 346], [], 31)], 0, E207S84.L19),
([(0, true, false, [266, 286, 334, 346], [], 32)], 0, E207S84.L20),
([(0, true, false, [266, 286, 334, 346], [], 33)], 0, E207S84.L21),
([(0, true, false, [266, 286, 334, 346], [], 34)], 0, E207S84.L22),
([(0, true, false, [266, 286, 334, 346], [], 39)], 0, E207S84.L23),
([(0, true, false, [266, 286, 334, 346], [], 40)], 0, E207S84.L24),
([(0, true, false, [266, 286, 334, 346], [], 53)], 0, E207S84.L25),
([(0, true, false, [266, 286, 334, 346], [], 54)], 0, E207S84.L26),
([(0, true, false, [266, 286, 334, 346], [], 55)], 0, E207S84.L27),
([(0, true, false, [266, 286, 334, 346], [], 57)], 0, E207S84.L28),
([(0, true, false, [266, 286, 334, 346], [], 58)], 0, E207S84.L29),
([(0, true, false, [266, 286, 334, 346], [], 59)], 0, E207S84.L30),
([(0, true, false, [266, 286, 334, 346], [], 70)], 0, E207S84.L31),
([(0, true, false, [266, 286, 334, 346], [], 71)], 0, E207S84.L32),
([(0, true, false, [266, 286, 334, 346], [], 73)], 0, E207S84.L33),
([(0, true, false, [266, 286, 334, 346], [], 77)], 0, E207S84.L34),
([(0, true, false, [266, 286, 334, 346], [], 79)], 0, E207S84.L35),
([(0, true, false, [266, 286, 334, 346], [], 85)], 0, E207S84.L36),
([(0, true, false, [266, 286, 334, 346], [], 96)], 0, E207S84.L37),
([(0, true, false, [266, 286, 334, 346], [], 99)], 0, E207S84.L38),
([(0, true, false, [266, 286, 334, 346], [], 103)], 0, E207S84.L39),
([(0, true, false, [266, 286, 334, 346], [], 122)], 0, E207S84.L40),
([(0, true, false, [266, 286, 334, 346], [], 123)], 0, E207S84.L41),
([(0, true, false, [266, 286, 334, 346], [], 130)], 0, E207S84.L42),
([(0, true, false, [266, 286, 334, 346], [], 148)], 0, E207S84.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E207S84
