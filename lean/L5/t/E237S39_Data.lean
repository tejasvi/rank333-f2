module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S39 "data/lean/6e263288bdc45bc36553f575e8f4ff41/E237S39.bin"
namespace E237S39
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [234, 254, 354], [], 0)], 0, E237S39.L1),
([(6, true, false, [234, 254, 354], [], 1)], 0, E237S39.L2),
([(6, true, false, [234, 254, 354], [], 7)], 0, E237S39.L3),
([(6, true, false, [234, 254, 354], [], 10)], 0, E237S39.L4),
([(6, true, false, [234, 254, 354], [], 14)], 0, E237S39.L5),
([(6, true, false, [234, 254, 354], [], 24)], 0, E237S39.L6),
([(6, true, false, [234, 254, 354], [], 25)], 0, E237S39.L7),
([(6, true, false, [234, 254, 354], [], 35)], 0, E237S39.L8),
([(6, true, false, [234, 254, 354], [], 44)], 0, E237S39.L9),
([(6, true, false, [234, 254, 354], [], 46)], 0, E237S39.L10),
([(6, true, false, [234, 254, 354], [], 49)], 0, E237S39.L11),
([(6, true, false, [234, 254, 354], [], 50)], 0, E237S39.L12),
([(6, true, false, [234, 254, 354], [], 51)], 0, E237S39.L13),
([(6, true, false, [234, 254, 354], [], 52)], 0, E237S39.L14),
([(6, true, false, [234, 254, 354], [], 53)], 0, E237S39.L15),
([(6, true, false, [234, 254, 354], [], 54)], 0, E237S39.L16),
([(6, true, false, [234, 254, 354], [], 60)], 0, E237S39.L17),
([(6, true, false, [234, 254, 354], [], 69)], 0, E237S39.L18),
([(6, true, false, [234, 254, 354], [], 71)], 0, E237S39.L19),
([(6, true, false, [234, 254, 354], [], 79)], 0, E237S39.L20),
([(6, true, false, [234, 254, 354], [], 80)], 0, E237S39.L21),
([(6, true, false, [234, 254, 354], [], 81)], 0, E237S39.L22),
([(6, true, false, [234, 254, 354], [], 82)], 0, E237S39.L23),
([(6, true, false, [234, 254, 354], [], 83)], 0, E237S39.L24),
([(6, true, false, [234, 254, 354], [], 90)], 0, E237S39.L25),
([(6, true, false, [234, 254, 354], [], 104)], 0, E237S39.L26),
([(6, true, false, [234, 254, 354], [], 110)], 0, E237S39.L27),
([(6, true, false, [234, 254, 354], [], 128)], 0, E237S39.L28),
([(6, true, false, [234, 254, 354], [], 134)], 0, E237S39.L29),
([(6, true, false, [234, 254, 354], [], 141)], 0, E237S39.L30),
([(6, true, false, [234, 254, 354], [], 144)], 0, E237S39.L31),
([(6, true, false, [234, 254, 354], [], 152)], 0, E237S39.L32),
([(6, true, false, [234, 254, 354], [], 154)], 0, E237S39.L33),
([(6, true, false, [234, 254, 354], [], 156)], 0, E237S39.L34),
([(6, true, false, [234, 254, 354], [], 158)], 0, E237S39.L35),
([(6, true, false, [234, 254, 354], [], 167)], 0, E237S39.L36),
([(6, true, false, [234, 254, 354], [], 168)], 0, E237S39.L37),
([(6, true, false, [234, 254, 354], [], 173)], 0, E237S39.L38),
([(6, true, false, [234, 254, 354], [], 176)], 0, E237S39.L39),
([(6, true, false, [234, 254, 354], [], 180)], 0, E237S39.L40),
([(6, true, false, [234, 254, 354], [], 190)], 0, E237S39.L41),
([(6, true, false, [234, 254, 354], [], 200)], 0, E237S39.L42),
([(6, true, false, [234, 254, 354], [], 206)], 0, E237S39.L43),
([(6, true, false, [234, 254, 354], [], 234)], 0, E237S39.L44),
([(6, true, false, [234, 254, 354], [], 236)], 0, E237S39.L45),
([(6, true, false, [234, 254, 354], [], 248)], 0, E237S39.L46),
([(6, true, false, [234, 254, 354], [], 254)], 0, E237S39.L47)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E237S39
