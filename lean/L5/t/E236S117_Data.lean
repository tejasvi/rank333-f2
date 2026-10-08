module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S117 "data/lean/294f6ee27373b7850f01015460fc7c0c/E236S117.bin"
namespace E236S117
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [412, 354], [22], 0)], 0, E236S117.L1),
([(5, true, false, [412, 354], [22], 5)], 0, E236S117.L2),
([(5, true, false, [412, 354], [22], 42)], 0, E236S117.L3),
([(5, true, false, [412, 354], [22], 43)], 0, E236S117.L4),
([(5, true, false, [412, 354], [22], 44)], 0, E236S117.L5),
([(5, true, false, [412, 354], [22], 45)], 0, E236S117.L6),
([(5, true, false, [412, 354], [22], 46)], 0, E236S117.L7),
([(5, true, false, [412, 354], [22], 47)], 0, E236S117.L8),
([(5, true, false, [412, 354], [22], 48)], 0, E236S117.L9),
([(5, true, false, [412, 354], [22], 49)], 0, E236S117.L10),
([(5, true, false, [412, 354], [22], 50)], 0, E236S117.L11),
([(5, true, false, [412, 354], [22], 51)], 0, E236S117.L12),
([(5, true, false, [412, 354], [22], 52)], 0, E236S117.L13),
([(5, true, false, [412, 354], [22], 53)], 0, E236S117.L14),
([(5, true, false, [412, 354], [22], 54)], 0, E236S117.L15),
([(5, true, false, [412, 354], [22], 55)], 0, E236S117.L16),
([(5, true, false, [412, 354], [22], 56)], 0, E236S117.L17),
([(5, true, false, [412, 354], [22], 57)], 0, E236S117.L18),
([(5, true, false, [412, 354], [22], 58)], 0, E236S117.L19),
([(5, true, false, [412, 354], [22], 59)], 0, E236S117.L20),
([(5, true, false, [412, 354], [22], 60)], 0, E236S117.L21),
([(5, true, false, [412, 354], [22], 61)], 0, E236S117.L22),
([(5, true, false, [412, 354], [22], 83)], 0, E236S117.L23),
([(5, true, false, [412, 354], [22], 87)], 0, E236S117.L24),
([(5, true, false, [412, 354], [22], 89)], 0, E236S117.L25),
([(5, true, false, [412, 354], [22], 91)], 0, E236S117.L26),
([(5, true, false, [412, 354], [22], 95)], 0, E236S117.L27),
([(5, true, false, [412, 354], [22], 99)], 0, E236S117.L28),
([(5, true, false, [412, 354], [22], 101)], 0, E236S117.L29),
([(5, true, false, [412, 354], [22], 102)], 0, E236S117.L30),
([(5, true, false, [412, 354], [22], 104)], 0, E236S117.L31),
([(5, true, false, [412, 354], [22], 105)], 0, E236S117.L32),
([(5, true, false, [412, 354], [22], 116)], 0, E236S117.L33),
([(5, true, false, [412, 354], [22], 119)], 0, E236S117.L34),
([(5, true, false, [412, 354], [22], 120)], 0, E236S117.L35),
([(5, true, false, [412, 354], [22], 128)], 0, E236S117.L36),
([(5, true, false, [412, 354], [22], 147)], 0, E236S117.L37),
([(5, true, false, [412, 354], [22], 170)], 0, E236S117.L38),
([(5, true, false, [412, 354], [22], 219)], 0, E236S117.L39),
([(5, true, false, [412, 354], [22], 223)], 0, E236S117.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E236S117
