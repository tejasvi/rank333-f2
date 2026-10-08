module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S16 "data/lean/ccbc9a42f86a92e747133f03624a76d9/E204S16.bin"
namespace E204S16
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 372, 426, 468], [], 0)], 0, E204S16.L1),
([(0, true, false, [266, 372, 426, 468], [], 1)], 0, E204S16.L2),
([(0, true, false, [266, 372, 426, 468], [], 2)], 0, E204S16.L3),
([(0, true, false, [266, 372, 426, 468], [], 3)], 0, E204S16.L4),
([(0, true, false, [266, 372, 426, 468], [], 4)], 0, E204S16.L5),
([(0, true, false, [266, 372, 426, 468], [], 5)], 0, E204S16.L6),
([(0, true, false, [266, 372, 426, 468], [], 8)], 0, E204S16.L7),
([(0, true, false, [266, 372, 426, 468], [], 13)], 0, E204S16.L8),
([(0, true, false, [266, 372, 426, 468], [], 15)], 0, E204S16.L9),
([(0, true, false, [266, 372, 426, 468], [], 16)], 0, E204S16.L10),
([(0, true, false, [266, 372, 426, 468], [], 17)], 0, E204S16.L11),
([(0, true, false, [266, 372, 426, 468], [], 18)], 0, E204S16.L12),
([(0, true, false, [266, 372, 426, 468], [], 19)], 0, E204S16.L13),
([(0, true, false, [266, 372, 426, 468], [], 20)], 0, E204S16.L14),
([(0, true, false, [266, 372, 426, 468], [], 21)], 0, E204S16.L15),
([(0, true, false, [266, 372, 426, 468], [], 22)], 0, E204S16.L16),
([(0, true, false, [266, 372, 426, 468], [], 23)], 0, E204S16.L17),
([(0, true, false, [266, 372, 426, 468], [], 24)], 0, E204S16.L18),
([(0, true, false, [266, 372, 426, 468], [], 26)], 0, E204S16.L19),
([(0, true, false, [266, 372, 426, 468], [], 27)], 0, E204S16.L20),
([(0, true, false, [266, 372, 426, 468], [], 32)], 0, E204S16.L21),
([(0, true, false, [266, 372, 426, 468], [], 35)], 0, E204S16.L22),
([(0, true, false, [266, 372, 426, 468], [], 36)], 0, E204S16.L23),
([(0, true, false, [266, 372, 426, 468], [], 37)], 0, E204S16.L24),
([(0, true, false, [266, 372, 426, 468], [], 38)], 0, E204S16.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E204S16
