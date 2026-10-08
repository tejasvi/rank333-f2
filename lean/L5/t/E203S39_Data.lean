module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S39 "data/lean/e9c64bc20c9c80c46dd37aa08191fa47/E203S39.bin"
namespace E203S39
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [314, 372, 410, 468], [], 0)], 0, E203S39.L1),
([(4, true, false, [314, 372, 410, 468], [], 1)], 0, E203S39.L2),
([(4, true, false, [314, 372, 410, 468], [], 2)], 0, E203S39.L3),
([(4, true, false, [314, 372, 410, 468], [], 5)], 0, E203S39.L4),
([(4, true, false, [314, 372, 410, 468], [], 6)], 0, E203S39.L5),
([(4, true, false, [314, 372, 410, 468], [], 7)], 0, E203S39.L6),
([(4, true, false, [314, 372, 410, 468], [], 10)], 0, E203S39.L7),
([(4, true, false, [314, 372, 410, 468], [], 12)], 0, E203S39.L8),
([(4, true, false, [314, 372, 410, 468], [], 22)], 0, E203S39.L9),
([(4, true, false, [314, 372, 410, 468], [], 23)], 0, E203S39.L10),
([(4, true, false, [314, 372, 410, 468], [], 24)], 0, E203S39.L11),
([(4, true, false, [314, 372, 410, 468], [], 27)], 0, E203S39.L12),
([(4, true, false, [314, 372, 410, 468], [], 29)], 0, E203S39.L13),
([(4, true, false, [314, 372, 410, 468], [], 44)], 0, E203S39.L14),
([(4, true, false, [314, 372, 410, 468], [], 46)], 0, E203S39.L15),
([(4, true, false, [314, 372, 410, 468], [], 47)], 0, E203S39.L16),
([(4, true, false, [314, 372, 410, 468], [], 73)], 0, E203S39.L17),
([(4, true, false, [314, 372, 410, 468], [], 76)], 0, E203S39.L18),
([(4, true, false, [314, 372, 410, 468], [], 85)], 0, E203S39.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E203S39
