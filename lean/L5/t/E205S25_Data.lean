module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S25 "data/lean/84776a710c6e17bf2c35b4606e53b8bd/E205S25.bin"
namespace E205S25
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116, 314, 212, 410], [], 0)], 0, E205S25.L1),
([(9, true, false, [116, 314, 212, 410], [], 11)], 0, E205S25.L2),
([(9, true, false, [116, 314, 212, 410], [], 15)], 0, E205S25.L3),
([(9, true, false, [116, 314, 212, 410], [], 20)], 0, E205S25.L4),
([(9, true, false, [116, 314, 212, 410], [], 21)], 0, E205S25.L5),
([(9, true, false, [116, 314, 212, 410], [], 24)], 0, E205S25.L6),
([(9, true, false, [116, 314, 212, 410], [], 74)], 0, E205S25.L7),
([(9, true, false, [116, 314, 212, 410], [], 75)], 0, E205S25.L8),
([(9, true, false, [116, 314, 212, 410], [], 76)], 0, E205S25.L9),
([(9, true, false, [116, 314, 212, 410], [], 78)], 0, E205S25.L10),
([(9, true, false, [116, 314, 212, 410], [], 79)], 0, E205S25.L11),
([(9, true, false, [116, 314, 212, 410], [], 80)], 0, E205S25.L12),
([(9, true, false, [116, 314, 212, 410], [], 82)], 0, E205S25.L13),
([(9, true, false, [116, 314, 212, 410], [], 85)], 0, E205S25.L14),
([(9, true, false, [116, 314, 212, 410], [], 138)], 0, E205S25.L15),
([(9, true, false, [116, 314, 212, 410], [], 144)], 0, E205S25.L16),
([(9, true, false, [116, 314, 212, 410], [], 148)], 0, E205S25.L17),
([(9, true, false, [116, 314, 212, 410], [], 152)], 0, E205S25.L18),
([(9, true, false, [116, 314, 212, 410], [], 162)], 0, E205S25.L19),
([(9, true, false, [116, 314, 212, 410], [], 166)], 0, E205S25.L20),
([(9, true, false, [116, 314, 212, 410], [], 202)], 0, E205S25.L21),
([(9, true, false, [116, 314, 212, 410], [], 203)], 0, E205S25.L22),
([(9, true, false, [116, 314, 212, 410], [], 209)], 0, E205S25.L23),
([(9, true, false, [116, 314, 212, 410], [], 211)], 0, E205S25.L24),
([(9, true, false, [116, 314, 212, 410], [], 212)], 0, E205S25.L25),
([(9, true, false, [116, 314, 212, 410], [], 247)], 0, E205S25.L26),
([(9, true, false, [116, 314, 212, 410], [], 294)], 0, E205S25.L27),
([(9, true, false, [116, 314, 212, 410], [], 295)], 0, E205S25.L28),
([(9, true, false, [116, 314, 212, 410], [], 298)], 0, E205S25.L29),
([(9, true, false, [116, 314, 212, 410], [], 342)], 0, E205S25.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E205S25
