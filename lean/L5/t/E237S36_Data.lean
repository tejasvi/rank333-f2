module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S36 "data/lean/cc38e359543b0a894e1a705252bdf226/E237S36.bin"
namespace E237S36
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [116, 158, 412], [], 0)], 0, E237S36.L1),
([(8, true, false, [116, 158, 412], [], 1)], 0, E237S36.L2),
([(8, true, false, [116, 158, 412], [], 2)], 0, E237S36.L3),
([(8, true, false, [116, 158, 412], [], 3)], 0, E237S36.L4),
([(8, true, false, [116, 158, 412], [], 4)], 0, E237S36.L5),
([(8, true, false, [116, 158, 412], [], 5)], 0, E237S36.L6),
([(8, true, false, [116, 158, 412], [], 7)], 0, E237S36.L7),
([(8, true, false, [116, 158, 412], [], 10)], 0, E237S36.L8),
([(8, true, false, [116, 158, 412], [], 16)], 0, E237S36.L9),
([(8, true, false, [116, 158, 412], [], 20)], 0, E237S36.L10),
([(8, true, false, [116, 158, 412], [], 22)], 0, E237S36.L11),
([(8, true, false, [116, 158, 412], [], 24)], 0, E237S36.L12),
([(8, true, false, [116, 158, 412], [], 26)], 0, E237S36.L13),
([(8, true, false, [116, 158, 412], [], 34)], 0, E237S36.L14),
([(8, true, false, [116, 158, 412], [], 36)], 0, E237S36.L15),
([(8, true, false, [116, 158, 412], [], 41)], 0, E237S36.L16),
([(8, true, false, [116, 158, 412], [], 58)], 0, E237S36.L17),
([(8, true, false, [116, 158, 412], [], 59)], 0, E237S36.L18),
([(8, true, false, [116, 158, 412], [], 69)], 0, E237S36.L19),
([(8, true, false, [116, 158, 412], [], 76)], 0, E237S36.L20),
([(8, true, false, [116, 158, 412], [], 81)], 0, E237S36.L21),
([(8, true, false, [116, 158, 412], [], 83)], 0, E237S36.L22),
([(8, true, false, [116, 158, 412], [], 84)], 0, E237S36.L23),
([(8, true, false, [116, 158, 412], [], 86)], 0, E237S36.L24),
([(8, true, false, [116, 158, 412], [], 88)], 0, E237S36.L25),
([(8, true, false, [116, 158, 412], [], 90)], 0, E237S36.L26),
([(8, true, false, [116, 158, 412], [], 106)], 0, E237S36.L27),
([(8, true, false, [116, 158, 412], [], 113)], 0, E237S36.L28),
([(8, true, false, [116, 158, 412], [], 132)], 0, E237S36.L29),
([(8, true, false, [116, 158, 412], [], 154)], 0, E237S36.L30),
([(8, true, false, [116, 158, 412], [], 155)], 0, E237S36.L31),
([(8, true, false, [116, 158, 412], [], 172)], 0, E237S36.L32),
([(8, true, false, [116, 158, 412], [], 173)], 0, E237S36.L33),
([(8, true, false, [116, 158, 412], [], 180)], 0, E237S36.L34),
([(8, true, false, [116, 158, 412], [], 198)], 0, E237S36.L35),
([(8, true, false, [116, 158, 412], [], 205)], 0, E237S36.L36),
([(8, true, false, [116, 158, 412], [], 216)], 0, E237S36.L37),
([(8, true, false, [116, 158, 412], [], 217)], 0, E237S36.L38),
([(8, true, false, [116, 158, 412], [], 232)], 0, E237S36.L39),
([(8, true, false, [116, 158, 412], [], 233)], 0, E237S36.L40),
([(8, true, false, [116, 158, 412], [], 253)], 0, E237S36.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E237S36
