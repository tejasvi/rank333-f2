module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S26 "data/lean/d57b4abf3029c977d14753cf1c920b6a/E205S26.bin"
namespace E205S26
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 212], [], 0)], 0, E205S26.L1),
([(3, true, false, [116, 212], [], 1)], 0, E205S26.L2),
([(3, true, false, [116, 212], [], 5)], 0, E205S26.L3),
([(3, true, false, [116, 212], [], 20)], 0, E205S26.L4),
([(3, true, false, [116, 212], [], 21)], 0, E205S26.L5),
([(3, true, false, [116, 212], [], 25)], 0, E205S26.L6),
([(3, true, false, [116, 212], [], 35)], 0, E205S26.L7),
([(3, true, false, [116, 212], [], 40)], 0, E205S26.L8),
([(3, true, false, [116, 212], [], 45)], 0, E205S26.L9),
([(3, true, false, [116, 212], [], 60)], 0, E205S26.L10),
([(3, true, false, [116, 212], [], 63)], 0, E205S26.L11),
([(3, true, false, [116, 212], [], 74)], 0, E205S26.L12),
([(3, true, false, [116, 212], [], 75)], 0, E205S26.L13),
([(3, true, false, [116, 212], [], 94)], 0, E205S26.L14),
([(3, true, false, [116, 212], [], 97)], 0, E205S26.L15),
([(3, true, false, [116, 212], [], 162)], 0, E205S26.L16),
([(3, true, false, [116, 212], [], 164)], 0, E205S26.L17),
([(3, true, false, [116, 212], [], 264)], 0, E205S26.L18),
([(3, true, false, [116, 212], [], 266)], 0, E205S26.L19),
([(3, true, false, [116, 212], [], 270)], 0, E205S26.L20),
([(3, true, false, [116, 212], [], 283)], 0, E205S26.L21),
([(3, true, false, [116, 212], [], 291)], 0, E205S26.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E205S26
