module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S18 "data/lean/7bd6cf85cb204aeb27f0a19fa8d8e1a3/E205S18.bin"
namespace E205S18
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [314, 410], [], 1)], 0, E205S18.L1),
([(8, true, false, [314, 410], [], 10)], 0, E205S18.L2),
([(8, true, false, [314, 410], [], 11)], 0, E205S18.L3),
([(8, true, false, [314, 410], [], 12)], 0, E205S18.L4),
([(8, true, false, [314, 410], [], 13)], 0, E205S18.L5),
([(8, true, false, [314, 410], [], 15)], 0, E205S18.L6),
([(8, true, false, [314, 410], [], 21)], 0, E205S18.L7),
([(8, true, false, [314, 410], [], 22)], 0, E205S18.L8),
([(8, true, false, [314, 410], [], 23)], 0, E205S18.L9),
([(8, true, false, [314, 410], [], 30)], 0, E205S18.L10),
([(8, true, false, [314, 410], [], 88)], 0, E205S18.L11),
([(8, true, false, [314, 410], [], 89)], 0, E205S18.L12),
([(8, true, false, [314, 410], [], 90)], 0, E205S18.L13),
([(8, true, false, [314, 410], [], 91)], 0, E205S18.L14),
([(8, true, false, [314, 410], [], 92)], 0, E205S18.L15),
([(8, true, false, [314, 410], [], 93)], 0, E205S18.L16),
([(8, true, false, [314, 410], [], 94)], 0, E205S18.L17),
([(8, true, false, [314, 410], [], 95)], 0, E205S18.L18),
([(8, true, false, [314, 410], [], 96)], 0, E205S18.L19),
([(8, true, false, [314, 410], [], 97)], 0, E205S18.L20),
([(8, true, false, [314, 410], [], 98)], 0, E205S18.L21),
([(8, true, false, [314, 410], [], 108)], 0, E205S18.L22),
([(8, true, false, [314, 410], [], 112)], 0, E205S18.L23),
([(8, true, false, [314, 410], [], 113)], 0, E205S18.L24),
([(8, true, false, [314, 410], [], 114)], 0, E205S18.L25),
([(8, true, false, [314, 410], [], 117)], 0, E205S18.L26),
([(8, true, false, [314, 410], [], 123)], 0, E205S18.L27),
([(8, true, false, [314, 410], [], 142)], 0, E205S18.L28),
([(8, true, false, [314, 410], [], 152)], 0, E205S18.L29),
([(8, true, false, [314, 410], [], 162)], 0, E205S18.L30),
([(8, true, false, [314, 410], [], 172)], 0, E205S18.L31),
([(8, true, false, [314, 410], [], 216)], 0, E205S18.L32),
([(8, true, false, [314, 410], [], 224)], 0, E205S18.L33),
([(8, true, false, [314, 410], [], 312)], 0, E205S18.L34),
([(8, true, false, [314, 410], [], 314)], 0, E205S18.L35),
([(8, true, false, [314, 410], [], 316)], 0, E205S18.L36),
([(8, true, false, [314, 410], [], 317)], 0, E205S18.L37),
([(8, true, false, [314, 410], [], 320)], 0, E205S18.L38),
([(8, true, false, [314, 410], [], 322)], 0, E205S18.L39),
([(8, true, false, [314, 410], [], 365)], 0, E205S18.L40),
([(8, true, false, [314, 410], [], 400)], 0, E205S18.L41),
([(8, true, false, [314, 410], [], 408)], 0, E205S18.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E205S18
