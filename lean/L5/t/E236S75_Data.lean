module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S75 "data/lean/8c7a49580a574b813f1363a7e9ce31a1/E236S75.bin"
namespace E236S75
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [412], [508], 4)], 0, E236S75.L1),
([(7, true, false, [412], [508], 5)], 0, E236S75.L2),
([(7, true, false, [412], [508], 6)], 0, E236S75.L3),
([(7, true, false, [412], [508], 7)], 0, E236S75.L4),
([(7, true, false, [412], [508], 8)], 0, E236S75.L5),
([(7, true, false, [412], [508], 10)], 0, E236S75.L6),
([(7, true, false, [412], [508], 22)], 0, E236S75.L7),
([(7, true, false, [412], [508], 42)], 0, E236S75.L8),
([(7, true, false, [412], [508], 43)], 0, E236S75.L9),
([(7, true, false, [412], [508], 44)], 0, E236S75.L10),
([(7, true, false, [412], [508], 45)], 0, E236S75.L11),
([(7, true, false, [412], [508], 46)], 0, E236S75.L12),
([(7, true, false, [412], [508], 47)], 0, E236S75.L13),
([(7, true, false, [412], [508], 48)], 0, E236S75.L14),
([(7, true, false, [412], [508], 49)], 0, E236S75.L15),
([(7, true, false, [412], [508], 51)], 0, E236S75.L16),
([(7, true, false, [412], [508], 52)], 0, E236S75.L17),
([(7, true, false, [412], [508], 53)], 0, E236S75.L18),
([(7, true, false, [412], [508], 54)], 0, E236S75.L19),
([(7, true, false, [412], [508], 55)], 0, E236S75.L20),
([(7, true, false, [412], [508], 56)], 0, E236S75.L21),
([(7, true, false, [412], [508], 57)], 0, E236S75.L22),
([(7, true, false, [412], [508], 58)], 0, E236S75.L23),
([(7, true, false, [412], [508], 59)], 0, E236S75.L24),
([(7, true, false, [412], [508], 60)], 0, E236S75.L25),
([(7, true, false, [412], [508], 61)], 0, E236S75.L26),
([(7, true, false, [412], [508], 74)], 0, E236S75.L27),
([(7, true, false, [412], [508], 75)], 0, E236S75.L28),
([(7, true, false, [412], [508], 77)], 0, E236S75.L29),
([(7, true, false, [412], [508], 79)], 0, E236S75.L30),
([(7, true, false, [412], [508], 80)], 0, E236S75.L31),
([(7, true, false, [412], [508], 81)], 0, E236S75.L32),
([(7, true, false, [412], [508], 84)], 0, E236S75.L33),
([(7, true, false, [412], [508], 86)], 0, E236S75.L34),
([(7, true, false, [412], [508], 92)], 0, E236S75.L35),
([(7, true, false, [412], [508], 99)], 0, E236S75.L36),
([(7, true, false, [412], [508], 112)], 0, E236S75.L37),
([(7, true, false, [412], [508], 114)], 0, E236S75.L38),
([(7, true, false, [412], [508], 116)], 0, E236S75.L39),
([(7, true, false, [412], [508], 117)], 0, E236S75.L40),
([(7, true, false, [412], [508], 119)], 0, E236S75.L41),
([(7, true, false, [412], [508], 125)], 0, E236S75.L42),
([(7, true, false, [412], [508], 126)], 0, E236S75.L43),
([(7, true, false, [412], [508], 140)], 0, E236S75.L44),
([(7, true, false, [412], [508], 141)], 0, E236S75.L45),
([(7, true, false, [412], [508], 146)], 0, E236S75.L46),
([(7, true, false, [412], [508], 147)], 0, E236S75.L47),
([(7, true, false, [412], [508], 160)], 0, E236S75.L48),
([(7, true, false, [412], [508], 162)], 0, E236S75.L49),
([(7, true, false, [412], [508], 165)], 0, E236S75.L50),
([(7, true, false, [412], [508], 221)], 0, E236S75.L51),
([(7, true, false, [412], [508], 222)], 0, E236S75.L52)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 52
end E236S75
