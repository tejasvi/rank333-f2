module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S10 "data/lean/ee1f832f73d25d93cac6d50028cf8c4a/E159S10.bin"
namespace E159S10
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [84, 244], [416], 2)], 54, 0, E159S10.L1),
([(6, true, false, [84, 244], [416], 4)], 54, 0, E159S10.L2),
([(6, true, false, [84, 244], [416], 8)], 54, 0, E159S10.L3),
([(6, true, false, [84, 244], [416], 9)], 54, 0, E159S10.L4),
([(6, true, false, [84, 244], [416], 11)], 54, 0, E159S10.L5),
([(6, true, false, [84, 244], [416], 14)], 54, 0, E159S10.L6),
([(6, true, false, [84, 244], [416], 21)], 54, 0, E159S10.L7),
([(6, true, false, [84, 244], [416], 51)], 54, 0, E159S10.L8),
([(6, true, false, [84, 244], [416], 53)], 54, 0, E159S10.L9),
([(6, true, false, [84, 244], [416], 54)], 54, 0, E159S10.L10),
([(6, true, false, [84, 244], [416], 55)], 54, 0, E159S10.L11),
([(6, true, false, [84, 244], [416], 58)], 54, 0, E159S10.L12),
([(6, true, false, [84, 244], [416], 63)], 54, 0, E159S10.L13),
([(6, true, false, [84, 244], [416], 66)], 54, 0, E159S10.L14),
([(6, true, false, [84, 244], [416], 67)], 54, 0, E159S10.L15),
([(6, true, false, [84, 244], [416], 68)], 54, 0, E159S10.L16),
([(6, true, false, [84, 244], [416], 74)], 54, 0, E159S10.L17),
([(6, true, false, [84, 244], [416], 76)], 54, 0, E159S10.L18),
([(6, true, false, [84, 244], [416], 77)], 54, 0, E159S10.L19),
([(6, true, false, [84, 244], [416], 83)], 54, 0, E159S10.L20),
([(6, true, false, [84, 244], [416], 84)], 54, 0, E159S10.L21),
([(6, true, false, [84, 244], [416], 85)], 54, 0, E159S10.L22),
([(6, true, false, [84, 244], [416], 88)], 54, 0, E159S10.L23),
([(6, true, false, [84, 244], [416], 89)], 54, 0, E159S10.L24),
([(6, true, false, [84, 244], [416], 91)], 54, 0, E159S10.L25),
([(6, true, false, [84, 244], [416], 92)], 54, 0, E159S10.L26),
([(6, true, false, [84, 244], [416], 93)], 54, 0, E159S10.L27),
([(6, true, false, [84, 244], [416], 94)], 54, 0, E159S10.L28),
([(6, true, false, [84, 244], [416], 96)], 54, 0, E159S10.L29),
([(6, true, false, [84, 244], [416], 97)], 54, 0, E159S10.L30),
([(6, true, false, [84, 244], [416], 98)], 54, 0, E159S10.L31),
([(6, true, false, [84, 244], [416], 102)], 54, 0, E159S10.L32),
([(6, true, false, [84, 244], [416], 103)], 54, 0, E159S10.L33),
([(6, true, false, [84, 244], [416], 105)], 54, 0, E159S10.L34),
([(6, true, false, [84, 244], [416], 106)], 54, 0, E159S10.L35),
([(6, true, false, [84, 244], [416], 109)], 54, 0, E159S10.L36),
([(6, true, false, [84, 244], [416], 112)], 54, 0, E159S10.L37),
([(6, true, false, [84, 244], [416], 114)], 54, 0, E159S10.L38),
([(6, true, false, [84, 244], [416], 115)], 54, 0, E159S10.L39),
([(6, true, false, [84, 244], [416], 117)], 54, 0, E159S10.L40),
([(6, true, false, [84, 244], [416], 119)], 54, 0, E159S10.L41),
([(6, true, false, [84, 244], [416], 125)], 54, 0, E159S10.L42),
([(6, true, false, [84, 244], [416], 135)], 54, 0, E159S10.L43),
([(6, true, false, [84, 244], [416], 136)], 54, 0, E159S10.L44),
([(6, true, false, [84, 244], [416], 137)], 54, 0, E159S10.L45),
([(6, true, false, [84, 244], [416], 138)], 54, 0, E159S10.L46),
([(6, true, false, [84, 244], [416], 140)], 54, 0, E159S10.L47),
([(6, true, false, [84, 244], [416], 142)], 54, 0, E159S10.L48),
([(6, true, false, [84, 244], [416], 143)], 54, 0, E159S10.L49),
([(6, true, false, [84, 244], [416], 145)], 54, 0, E159S10.L50),
([(6, true, false, [84, 244], [416], 146)], 54, 0, E159S10.L51),
([(6, true, false, [84, 244], [416], 147)], 54, 0, E159S10.L52),
([(6, true, false, [84, 244], [416], 149)], 54, 0, E159S10.L53),
([(6, true, false, [84, 244], [416], 151)], 54, 0, E159S10.L54)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 54
end E159S10
