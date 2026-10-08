module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S20 "data/lean/fb0bd734baf4c768f58e0016f99e689e/E236S20.bin"
namespace E236S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [394], [96], 0)], 0, E236S20.L1),
([(0, true, false, [394], [96], 2)], 0, E236S20.L2),
([(0, true, false, [394], [96], 3)], 0, E236S20.L3),
([(0, true, false, [394], [96], 7)], 0, E236S20.L4),
([(0, true, false, [394], [96], 8)], 0, E236S20.L5),
([(0, true, false, [394], [96], 9)], 0, E236S20.L6),
([(0, true, false, [394], [96], 11)], 0, E236S20.L7),
([(0, true, false, [394], [96], 12)], 0, E236S20.L8),
([(0, true, false, [394], [96], 17)], 0, E236S20.L9),
([(0, true, false, [394], [96], 57)], 0, E236S20.L10),
([(0, true, false, [394], [96], 58)], 0, E236S20.L11),
([(0, true, false, [394], [96], 64)], 0, E236S20.L12),
([(0, true, false, [394], [96], 69)], 0, E236S20.L13),
([(0, true, false, [394], [96], 79)], 0, E236S20.L14),
([(0, true, false, [394], [96], 85)], 0, E236S20.L15),
([(0, true, false, [394], [96], 94)], 0, E236S20.L16),
([(0, true, false, [394], [96], 100)], 0, E236S20.L17),
([(0, true, false, [394], [96], 137)], 0, E236S20.L18),
([(0, true, false, [394], [96], 155)], 0, E236S20.L19),
([(0, true, false, [394], [96], 164)], 0, E236S20.L20),
([(0, true, false, [394], [96], 165)], 0, E236S20.L21),
([(0, true, false, [394], [96], 166)], 0, E236S20.L22),
([(0, true, false, [394], [96], 167)], 0, E236S20.L23),
([(0, true, false, [394], [96], 168)], 0, E236S20.L24),
([(0, true, false, [394], [96], 169)], 0, E236S20.L25),
([(0, true, false, [394], [96], 171)], 0, E236S20.L26),
([(0, true, false, [394], [96], 172)], 0, E236S20.L27),
([(0, true, false, [394], [96], 173)], 0, E236S20.L28),
([(0, true, false, [394], [96], 174)], 0, E236S20.L29),
([(0, true, false, [394], [96], 175)], 0, E236S20.L30),
([(0, true, false, [394], [96], 176)], 0, E236S20.L31),
([(0, true, false, [394], [96], 178)], 0, E236S20.L32),
([(0, true, false, [394], [96], 180)], 0, E236S20.L33),
([(0, true, false, [394], [96], 181)], 0, E236S20.L34),
([(0, true, false, [394], [96], 184)], 0, E236S20.L35),
([(0, true, false, [394], [96], 185)], 0, E236S20.L36),
([(0, true, false, [394], [96], 190)], 0, E236S20.L37),
([(0, true, false, [394], [96], 199)], 0, E236S20.L38),
([(0, true, false, [394], [96], 225)], 0, E236S20.L39),
([(0, true, false, [394], [96], 229)], 0, E236S20.L40),
([(0, true, false, [394], [96], 242)], 0, E236S20.L41),
([(0, true, false, [394], [96], 254)], 0, E236S20.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E236S20
