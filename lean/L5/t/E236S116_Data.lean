module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S116 "data/lean/375c748546dcf19b601badd294f71d39/E236S116.bin"
namespace E236S116
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [372, 394], [22], 5)], 0, E236S116.L1),
([(5, true, false, [372, 394], [22], 8)], 0, E236S116.L2),
([(5, true, false, [372, 394], [22], 42)], 0, E236S116.L3),
([(5, true, false, [372, 394], [22], 43)], 0, E236S116.L4),
([(5, true, false, [372, 394], [22], 45)], 0, E236S116.L5),
([(5, true, false, [372, 394], [22], 46)], 0, E236S116.L6),
([(5, true, false, [372, 394], [22], 47)], 0, E236S116.L7),
([(5, true, false, [372, 394], [22], 48)], 0, E236S116.L8),
([(5, true, false, [372, 394], [22], 49)], 0, E236S116.L9),
([(5, true, false, [372, 394], [22], 50)], 0, E236S116.L10),
([(5, true, false, [372, 394], [22], 51)], 0, E236S116.L11),
([(5, true, false, [372, 394], [22], 53)], 0, E236S116.L12),
([(5, true, false, [372, 394], [22], 55)], 0, E236S116.L13),
([(5, true, false, [372, 394], [22], 57)], 0, E236S116.L14),
([(5, true, false, [372, 394], [22], 58)], 0, E236S116.L15),
([(5, true, false, [372, 394], [22], 59)], 0, E236S116.L16),
([(5, true, false, [372, 394], [22], 60)], 0, E236S116.L17),
([(5, true, false, [372, 394], [22], 61)], 0, E236S116.L18),
([(5, true, false, [372, 394], [22], 75)], 0, E236S116.L19),
([(5, true, false, [372, 394], [22], 76)], 0, E236S116.L20),
([(5, true, false, [372, 394], [22], 77)], 0, E236S116.L21),
([(5, true, false, [372, 394], [22], 79)], 0, E236S116.L22),
([(5, true, false, [372, 394], [22], 80)], 0, E236S116.L23),
([(5, true, false, [372, 394], [22], 81)], 0, E236S116.L24),
([(5, true, false, [372, 394], [22], 83)], 0, E236S116.L25),
([(5, true, false, [372, 394], [22], 85)], 0, E236S116.L26),
([(5, true, false, [372, 394], [22], 87)], 0, E236S116.L27),
([(5, true, false, [372, 394], [22], 89)], 0, E236S116.L28),
([(5, true, false, [372, 394], [22], 91)], 0, E236S116.L29),
([(5, true, false, [372, 394], [22], 93)], 0, E236S116.L30),
([(5, true, false, [372, 394], [22], 95)], 0, E236S116.L31),
([(5, true, false, [372, 394], [22], 102)], 0, E236S116.L32),
([(5, true, false, [372, 394], [22], 112)], 0, E236S116.L33),
([(5, true, false, [372, 394], [22], 113)], 0, E236S116.L34),
([(5, true, false, [372, 394], [22], 115)], 0, E236S116.L35),
([(5, true, false, [372, 394], [22], 117)], 0, E236S116.L36),
([(5, true, false, [372, 394], [22], 120)], 0, E236S116.L37),
([(5, true, false, [372, 394], [22], 125)], 0, E236S116.L38),
([(5, true, false, [372, 394], [22], 141)], 0, E236S116.L39),
([(5, true, false, [372, 394], [22], 143)], 0, E236S116.L40),
([(5, true, false, [372, 394], [22], 147)], 0, E236S116.L41),
([(5, true, false, [372, 394], [22], 151)], 0, E236S116.L42),
([(5, true, false, [372, 394], [22], 166)], 0, E236S116.L43),
([(5, true, false, [372, 394], [22], 185)], 0, E236S116.L44),
([(5, true, false, [372, 394], [22], 187)], 0, E236S116.L45)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 45
end E236S116
