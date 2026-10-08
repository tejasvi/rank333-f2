module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S361 "data/lean/3993b9539e376855cedd7ad4693afe73/E284S361.bin"
namespace E284S361
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 8)], 0, E284S361.L1),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 77)], 0, E284S361.L2),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 80)], 0, E284S361.L3),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 83)], 0, E284S361.L4),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 94)], 0, E284S361.L5),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 95)], 0, E284S361.L6),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 97)], 0, E284S361.L7),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 98)], 0, E284S361.L8),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 129)], 0, E284S361.L9),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 133)], 0, E284S361.L10),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 146)], 0, E284S361.L11),
([(10, true, false, [254, 266, 394, 478, 94, 298, 382, 426], [], 148)], 0, E284S361.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S361
