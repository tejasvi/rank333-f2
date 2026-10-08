module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S75 "data/lean/901507617b59c9315f49c991b9961d67/E207S75.bin"
namespace E207S75
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [266, 346, 494, 286], [], 0)], 0, E207S75.L1),
([(5, true, false, [266, 346, 494, 286], [], 2)], 0, E207S75.L2),
([(5, true, false, [266, 346, 494, 286], [], 5)], 0, E207S75.L3),
([(5, true, false, [266, 346, 494, 286], [], 6)], 0, E207S75.L4),
([(5, true, false, [266, 346, 494, 286], [], 7)], 0, E207S75.L5),
([(5, true, false, [266, 346, 494, 286], [], 9)], 0, E207S75.L6),
([(5, true, false, [266, 346, 494, 286], [], 11)], 0, E207S75.L7),
([(5, true, false, [266, 346, 494, 286], [], 12)], 0, E207S75.L8),
([(5, true, false, [266, 346, 494, 286], [], 15)], 0, E207S75.L9),
([(5, true, false, [266, 346, 494, 286], [], 16)], 0, E207S75.L10),
([(5, true, false, [266, 346, 494, 286], [], 17)], 0, E207S75.L11),
([(5, true, false, [266, 346, 494, 286], [], 19)], 0, E207S75.L12),
([(5, true, false, [266, 346, 494, 286], [], 27)], 0, E207S75.L13),
([(5, true, false, [266, 346, 494, 286], [], 32)], 0, E207S75.L14),
([(5, true, false, [266, 346, 494, 286], [], 51)], 0, E207S75.L15),
([(5, true, false, [266, 346, 494, 286], [], 55)], 0, E207S75.L16),
([(5, true, false, [266, 346, 494, 286], [], 83)], 0, E207S75.L17),
([(5, true, false, [266, 346, 494, 286], [], 84)], 0, E207S75.L18),
([(5, true, false, [266, 346, 494, 286], [], 85)], 0, E207S75.L19),
([(5, true, false, [266, 346, 494, 286], [], 86)], 0, E207S75.L20),
([(5, true, false, [266, 346, 494, 286], [], 87)], 0, E207S75.L21),
([(5, true, false, [266, 346, 494, 286], [], 96)], 0, E207S75.L22),
([(5, true, false, [266, 346, 494, 286], [], 99)], 0, E207S75.L23),
([(5, true, false, [266, 346, 494, 286], [], 115)], 0, E207S75.L24),
([(5, true, false, [266, 346, 494, 286], [], 117)], 0, E207S75.L25),
([(5, true, false, [266, 346, 494, 286], [], 119)], 0, E207S75.L26),
([(5, true, false, [266, 346, 494, 286], [], 121)], 0, E207S75.L27),
([(5, true, false, [266, 346, 494, 286], [], 130)], 0, E207S75.L28),
([(5, true, false, [266, 346, 494, 286], [], 165)], 0, E207S75.L29),
([(5, true, false, [266, 346, 494, 286], [], 169)], 0, E207S75.L30),
([(5, true, false, [266, 346, 494, 286], [], 189)], 0, E207S75.L31),
([(5, true, false, [266, 346, 494, 286], [], 190)], 0, E207S75.L32),
([(5, true, false, [266, 346, 494, 286], [], 191)], 0, E207S75.L33),
([(5, true, false, [266, 346, 494, 286], [], 192)], 0, E207S75.L34),
([(5, true, false, [266, 346, 494, 286], [], 193)], 0, E207S75.L35),
([(5, true, false, [266, 346, 494, 286], [], 195)], 0, E207S75.L36),
([(5, true, false, [266, 346, 494, 286], [], 197)], 0, E207S75.L37),
([(5, true, false, [266, 346, 494, 286], [], 198)], 0, E207S75.L38),
([(5, true, false, [266, 346, 494, 286], [], 229)], 0, E207S75.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E207S75
