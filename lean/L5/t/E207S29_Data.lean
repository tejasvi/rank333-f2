module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S29 "data/lean/07765bdf169729e3b79c8dcadc75d992/E207S29.bin"
namespace E207S29
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [286, 346, 426, 494], [], 22)], 0, E207S29.L1),
([(3, true, false, [286, 346, 426, 494], [], 152)], 0, E207S29.L2),
([(3, true, false, [286, 346, 426, 494], [], 158)], 0, E207S29.L3),
([(3, true, false, [286, 346, 426, 494], [], 316)], 0, E207S29.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E207S29
