module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S15 "data/lean/be97be1bd9eae667bb0d681b0e573724/E236S15.bin"
namespace E236S15
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [394], [96], 2)], 0, E236S15.L1),
([(13, true, false, [394], [96], 8)], 0, E236S15.L2),
([(13, true, false, [394], [96], 20)], 0, E236S15.L3),
([(13, true, false, [394], [96], 21)], 0, E236S15.L4),
([(13, true, false, [394], [96], 22)], 0, E236S15.L5),
([(13, true, false, [394], [96], 28)], 0, E236S15.L6),
([(13, true, false, [394], [96], 31)], 0, E236S15.L7),
([(13, true, false, [394], [96], 38)], 0, E236S15.L8),
([(13, true, false, [394], [96], 39)], 0, E236S15.L9),
([(13, true, false, [394], [96], 43)], 0, E236S15.L10),
([(13, true, false, [394], [96], 44)], 0, E236S15.L11),
([(13, true, false, [394], [96], 45)], 0, E236S15.L12),
([(13, true, false, [394], [96], 48)], 0, E236S15.L13),
([(13, true, false, [394], [96], 55)], 0, E236S15.L14),
([(13, true, false, [394], [96], 57)], 0, E236S15.L15),
([(13, true, false, [394], [96], 79)], 0, E236S15.L16),
([(13, true, false, [394], [96], 85)], 0, E236S15.L17),
([(13, true, false, [394], [96], 100)], 0, E236S15.L18),
([(13, true, false, [394], [96], 165)], 0, E236S15.L19),
([(13, true, false, [394], [96], 168)], 0, E236S15.L20),
([(13, true, false, [394], [96], 169)], 0, E236S15.L21),
([(13, true, false, [394], [96], 173)], 0, E236S15.L22),
([(13, true, false, [394], [96], 178)], 0, E236S15.L23),
([(13, true, false, [394], [96], 187)], 0, E236S15.L24),
([(13, true, false, [394], [96], 189)], 0, E236S15.L25),
([(13, true, false, [394], [96], 193)], 0, E236S15.L26),
([(13, true, false, [394], [96], 198)], 0, E236S15.L27),
([(13, true, false, [394], [96], 210)], 0, E236S15.L28),
([(13, true, false, [394], [96], 212)], 0, E236S15.L29),
([(13, true, false, [394], [96], 213)], 0, E236S15.L30),
([(13, true, false, [394], [96], 215)], 0, E236S15.L31),
([(13, true, false, [394], [96], 216)], 0, E236S15.L32),
([(13, true, false, [394], [96], 218)], 0, E236S15.L33),
([(13, true, false, [394], [96], 221)], 0, E236S15.L34),
([(13, true, false, [394], [96], 230)], 0, E236S15.L35),
([(13, true, false, [394], [96], 231)], 0, E236S15.L36),
([(13, true, false, [394], [96], 239)], 0, E236S15.L37),
([(13, true, false, [394], [96], 245)], 0, E236S15.L38),
([(13, true, false, [394], [96], 262)], 0, E236S15.L39),
([(13, true, false, [394], [96], 268)], 0, E236S15.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E236S15
