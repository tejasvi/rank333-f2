module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S17 "data/lean/5cfe2315ab57c27a66725eb245b52412/E159S17.bin"
namespace E159S17
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(11, true, false, [340, 94], [10], 1)], 48, 0, E159S17.L1),
([(11, true, false, [340, 94], [10], 2)], 48, 0, E159S17.L2),
([(11, true, false, [340, 94], [10], 3)], 48, 0, E159S17.L3),
([(11, true, false, [340, 94], [10], 4)], 48, 0, E159S17.L4),
([(11, true, false, [340, 94], [10], 8)], 48, 0, E159S17.L5),
([(11, true, false, [340, 94], [10], 9)], 48, 0, E159S17.L6),
([(11, true, false, [340, 94], [10], 20)], 48, 0, E159S17.L7),
([(11, true, false, [340, 94], [10], 21)], 48, 0, E159S17.L8),
([(11, true, false, [340, 94], [10], 22)], 48, 0, E159S17.L9),
([(11, true, false, [340, 94], [10], 23)], 48, 0, E159S17.L10),
([(11, true, false, [340, 94], [10], 25)], 48, 0, E159S17.L11),
([(11, true, false, [340, 94], [10], 26)], 48, 0, E159S17.L12),
([(11, true, false, [340, 94], [10], 27)], 48, 0, E159S17.L13),
([(11, true, false, [340, 94], [10], 29)], 48, 0, E159S17.L14),
([(11, true, false, [340, 94], [10], 31)], 48, 0, E159S17.L15),
([(11, true, false, [340, 94], [10], 32)], 48, 0, E159S17.L16),
([(11, true, false, [340, 94], [10], 37)], 48, 0, E159S17.L17),
([(11, true, false, [340, 94], [10], 38)], 48, 0, E159S17.L18),
([(11, true, false, [340, 94], [10], 40)], 48, 0, E159S17.L19),
([(11, true, false, [340, 94], [10], 41)], 48, 0, E159S17.L20),
([(11, true, false, [340, 94], [10], 42)], 48, 0, E159S17.L21),
([(11, true, false, [340, 94], [10], 44)], 48, 0, E159S17.L22),
([(11, true, false, [340, 94], [10], 47)], 48, 0, E159S17.L23),
([(11, true, false, [340, 94], [10], 61)], 48, 0, E159S17.L24),
([(11, true, false, [340, 94], [10], 62)], 48, 0, E159S17.L25),
([(11, true, false, [340, 94], [10], 65)], 48, 0, E159S17.L26),
([(11, true, false, [340, 94], [10], 68)], 48, 0, E159S17.L27),
([(11, true, false, [340, 94], [10], 72)], 48, 0, E159S17.L28),
([(11, true, false, [340, 94], [10], 84)], 48, 0, E159S17.L29),
([(11, true, false, [340, 94], [10], 93)], 48, 0, E159S17.L30),
([(11, true, false, [340, 94], [10], 96)], 48, 0, E159S17.L31),
([(11, true, false, [340, 94], [10], 99)], 48, 0, E159S17.L32),
([(11, true, false, [340, 94], [10], 117)], 48, 0, E159S17.L33),
([(11, true, false, [340, 94], [10], 148)], 48, 0, E159S17.L34),
([(11, true, false, [340, 94], [10], 149)], 48, 0, E159S17.L35),
([(11, true, false, [340, 94], [10], 164)], 48, 0, E159S17.L36),
([(11, true, false, [340, 94], [10], 165)], 48, 0, E159S17.L37),
([(11, true, false, [340, 94], [10], 166)], 48, 0, E159S17.L38),
([(11, true, false, [340, 94], [10], 167)], 48, 0, E159S17.L39),
([(11, true, false, [340, 94], [10], 168)], 48, 0, E159S17.L40),
([(11, true, false, [340, 94], [10], 173)], 48, 0, E159S17.L41),
([(11, true, false, [340, 94], [10], 177)], 48, 0, E159S17.L42),
([(11, true, false, [340, 94], [10], 186)], 48, 0, E159S17.L43),
([(11, true, false, [340, 94], [10], 188)], 48, 0, E159S17.L44),
([(11, true, false, [340, 94], [10], 190)], 48, 0, E159S17.L45),
([(11, true, false, [340, 94], [10], 202)], 48, 0, E159S17.L46),
([(11, true, false, [340, 94], [10], 217)], 48, 0, E159S17.L47),
([(11, true, false, [340, 94], [10], 259)], 48, 0, E159S17.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E159S17
