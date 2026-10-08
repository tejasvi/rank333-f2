module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S22 "data/lean/e2f3785a26f4e070bbe4fdd5c8213738/E205S22.bin"
namespace E205S22
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [116, 212, 314, 410], [], 0)], 0, E205S22.L1),
([(4, true, false, [116, 212, 314, 410], [], 1)], 0, E205S22.L2),
([(4, true, false, [116, 212, 314, 410], [], 2)], 0, E205S22.L3),
([(4, true, false, [116, 212, 314, 410], [], 3)], 0, E205S22.L4),
([(4, true, false, [116, 212, 314, 410], [], 8)], 0, E205S22.L5),
([(4, true, false, [116, 212, 314, 410], [], 9)], 0, E205S22.L6),
([(4, true, false, [116, 212, 314, 410], [], 10)], 0, E205S22.L7),
([(4, true, false, [116, 212, 314, 410], [], 11)], 0, E205S22.L8),
([(4, true, false, [116, 212, 314, 410], [], 12)], 0, E205S22.L9),
([(4, true, false, [116, 212, 314, 410], [], 13)], 0, E205S22.L10),
([(4, true, false, [116, 212, 314, 410], [], 14)], 0, E205S22.L11),
([(4, true, false, [116, 212, 314, 410], [], 16)], 0, E205S22.L12),
([(4, true, false, [116, 212, 314, 410], [], 17)], 0, E205S22.L13),
([(4, true, false, [116, 212, 314, 410], [], 19)], 0, E205S22.L14),
([(4, true, false, [116, 212, 314, 410], [], 23)], 0, E205S22.L15),
([(4, true, false, [116, 212, 314, 410], [], 24)], 0, E205S22.L16),
([(4, true, false, [116, 212, 314, 410], [], 25)], 0, E205S22.L17),
([(4, true, false, [116, 212, 314, 410], [], 26)], 0, E205S22.L18),
([(4, true, false, [116, 212, 314, 410], [], 28)], 0, E205S22.L19),
([(4, true, false, [116, 212, 314, 410], [], 30)], 0, E205S22.L20),
([(4, true, false, [116, 212, 314, 410], [], 31)], 0, E205S22.L21),
([(4, true, false, [116, 212, 314, 410], [], 32)], 0, E205S22.L22),
([(4, true, false, [116, 212, 314, 410], [], 33)], 0, E205S22.L23),
([(4, true, false, [116, 212, 314, 410], [], 34)], 0, E205S22.L24),
([(4, true, false, [116, 212, 314, 410], [], 35)], 0, E205S22.L25),
([(4, true, false, [116, 212, 314, 410], [], 36)], 0, E205S22.L26),
([(4, true, false, [116, 212, 314, 410], [], 41)], 0, E205S22.L27),
([(4, true, false, [116, 212, 314, 410], [], 42)], 0, E205S22.L28),
([(4, true, false, [116, 212, 314, 410], [], 44)], 0, E205S22.L29),
([(4, true, false, [116, 212, 314, 410], [], 48)], 0, E205S22.L30),
([(4, true, false, [116, 212, 314, 410], [], 49)], 0, E205S22.L31),
([(4, true, false, [116, 212, 314, 410], [], 53)], 0, E205S22.L32),
([(4, true, false, [116, 212, 314, 410], [], 54)], 0, E205S22.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E205S22
