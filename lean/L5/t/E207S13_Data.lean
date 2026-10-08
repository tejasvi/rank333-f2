module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S13 "data/lean/04c15ea2919049e34cf22e03f97d4da6/E207S13.bin"
namespace E207S13
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [286, 334, 426], [], 11)], 0, E207S13.L1),
([(3, true, false, [286, 334, 426], [], 20)], 0, E207S13.L2),
([(3, true, false, [286, 334, 426], [], 21)], 0, E207S13.L3),
([(3, true, false, [286, 334, 426], [], 24)], 0, E207S13.L4),
([(3, true, false, [286, 334, 426], [], 31)], 0, E207S13.L5),
([(3, true, false, [286, 334, 426], [], 74)], 0, E207S13.L6),
([(3, true, false, [286, 334, 426], [], 78)], 0, E207S13.L7),
([(3, true, false, [286, 334, 426], [], 139)], 0, E207S13.L8),
([(3, true, false, [286, 334, 426], [], 141)], 0, E207S13.L9),
([(3, true, false, [286, 334, 426], [], 149)], 0, E207S13.L10),
([(3, true, false, [286, 334, 426], [], 151)], 0, E207S13.L11),
([(3, true, false, [286, 334, 426], [], 216)], 0, E207S13.L12),
([(3, true, false, [286, 334, 426], [], 224)], 0, E207S13.L13),
([(3, true, false, [286, 334, 426], [], 272)], 0, E207S13.L14),
([(3, true, false, [286, 334, 426], [], 320)], 0, E207S13.L15),
([(3, true, false, [286, 334, 426], [], 358)], 0, E207S13.L16),
([(3, true, false, [286, 334, 426], [], 359)], 0, E207S13.L17),
([(3, true, false, [286, 334, 426], [], 408)], 0, E207S13.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E207S13
