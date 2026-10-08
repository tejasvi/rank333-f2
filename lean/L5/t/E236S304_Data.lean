module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S304 "data/lean/c2e378ba79785ef24ddd6de39a41c729/E236S304.bin"
namespace E236S304
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354, 394, 158], [], 10)], 0, E236S304.L1),
([(6, true, false, [354, 394, 158], [], 11)], 0, E236S304.L2),
([(6, true, false, [354, 394, 158], [], 13)], 0, E236S304.L3),
([(6, true, false, [354, 394, 158], [], 14)], 0, E236S304.L4),
([(6, true, false, [354, 394, 158], [], 15)], 0, E236S304.L5),
([(6, true, false, [354, 394, 158], [], 16)], 0, E236S304.L6),
([(6, true, false, [354, 394, 158], [], 17)], 0, E236S304.L7),
([(6, true, false, [354, 394, 158], [], 19)], 0, E236S304.L8),
([(6, true, false, [354, 394, 158], [], 20)], 0, E236S304.L9),
([(6, true, false, [354, 394, 158], [], 21)], 0, E236S304.L10),
([(6, true, false, [354, 394, 158], [], 22)], 0, E236S304.L11),
([(6, true, false, [354, 394, 158], [], 23)], 0, E236S304.L12),
([(6, true, false, [354, 394, 158], [], 24)], 0, E236S304.L13),
([(6, true, false, [354, 394, 158], [], 25)], 0, E236S304.L14),
([(6, true, false, [354, 394, 158], [], 26)], 0, E236S304.L15),
([(6, true, false, [354, 394, 158], [], 27)], 0, E236S304.L16),
([(6, true, false, [354, 394, 158], [], 28)], 0, E236S304.L17),
([(6, true, false, [354, 394, 158], [], 29)], 0, E236S304.L18),
([(6, true, false, [354, 394, 158], [], 31)], 0, E236S304.L19),
([(6, true, false, [354, 394, 158], [], 36)], 0, E236S304.L20),
([(6, true, false, [354, 394, 158], [], 88)], 0, E236S304.L21),
([(6, true, false, [354, 394, 158], [], 89)], 0, E236S304.L22),
([(6, true, false, [354, 394, 158], [], 93)], 0, E236S304.L23),
([(6, true, false, [354, 394, 158], [], 95)], 0, E236S304.L24),
([(6, true, false, [354, 394, 158], [], 99)], 0, E236S304.L25),
([(6, true, false, [354, 394, 158], [], 152)], 0, E236S304.L26),
([(6, true, false, [354, 394, 158], [], 153)], 0, E236S304.L27),
([(6, true, false, [354, 394, 158], [], 158)], 0, E236S304.L28),
([(6, true, false, [354, 394, 158], [], 159)], 0, E236S304.L29),
([(6, true, false, [354, 394, 158], [], 216)], 0, E236S304.L30),
([(6, true, false, [354, 394, 158], [], 217)], 0, E236S304.L31),
([(6, true, false, [354, 394, 158], [], 218)], 0, E236S304.L32),
([(6, true, false, [354, 394, 158], [], 223)], 0, E236S304.L33),
([(6, true, false, [354, 394, 158], [], 227)], 0, E236S304.L34),
([(6, true, false, [354, 394, 158], [], 229)], 0, E236S304.L35),
([(6, true, false, [354, 394, 158], [], 230)], 0, E236S304.L36),
([(6, true, false, [354, 394, 158], [], 233)], 0, E236S304.L37),
([(6, true, false, [354, 394, 158], [], 242)], 0, E236S304.L38),
([(6, true, false, [354, 394, 158], [], 243)], 0, E236S304.L39),
([(6, true, false, [354, 394, 158], [], 252)], 0, E236S304.L40),
([(6, true, false, [354, 394, 158], [], 254)], 0, E236S304.L41),
([(6, true, false, [354, 394, 158], [], 255)], 0, E236S304.L42),
([(6, true, false, [354, 394, 158], [], 262)], 0, E236S304.L43),
([(6, true, false, [354, 394, 158], [], 263)], 0, E236S304.L44),
([(6, true, false, [354, 394, 158], [], 265)], 0, E236S304.L45),
([(6, true, false, [354, 394, 158], [], 266)], 0, E236S304.L46),
([(6, true, false, [354, 394, 158], [], 278)], 0, E236S304.L47),
([(6, true, false, [354, 394, 158], [], 316)], 0, E236S304.L48),
([(6, true, false, [354, 394, 158], [], 317)], 0, E236S304.L49),
([(6, true, false, [354, 394, 158], [], 322)], 0, E236S304.L50),
([(6, true, false, [354, 394, 158], [], 323)], 0, E236S304.L51),
([(6, true, false, [354, 394, 158], [], 353)], 0, E236S304.L52)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 52
end E236S304
