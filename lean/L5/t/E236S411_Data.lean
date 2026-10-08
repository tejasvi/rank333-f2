module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S411 "data/lean/d8524c8f0dc35268c12b83134669b4fd/E236S411.bin"
namespace E236S411
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [372, 412, 158], [], 10)], 0, E236S411.L1),
([(9, true, false, [372, 412, 158], [], 11)], 0, E236S411.L2),
([(9, true, false, [372, 412, 158], [], 14)], 0, E236S411.L3),
([(9, true, false, [372, 412, 158], [], 15)], 0, E236S411.L4),
([(9, true, false, [372, 412, 158], [], 16)], 0, E236S411.L5),
([(9, true, false, [372, 412, 158], [], 17)], 0, E236S411.L6),
([(9, true, false, [372, 412, 158], [], 18)], 0, E236S411.L7),
([(9, true, false, [372, 412, 158], [], 75)], 0, E236S411.L8),
([(9, true, false, [372, 412, 158], [], 76)], 0, E236S411.L9),
([(9, true, false, [372, 412, 158], [], 88)], 0, E236S411.L10),
([(9, true, false, [372, 412, 158], [], 94)], 0, E236S411.L11),
([(9, true, false, [372, 412, 158], [], 95)], 0, E236S411.L12),
([(9, true, false, [372, 412, 158], [], 97)], 0, E236S411.L13),
([(9, true, false, [372, 412, 158], [], 152)], 0, E236S411.L14),
([(9, true, false, [372, 412, 158], [], 224)], 0, E236S411.L15),
([(9, true, false, [372, 412, 158], [], 227)], 0, E236S411.L16),
([(9, true, false, [372, 412, 158], [], 264)], 0, E236S411.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S411
