module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S429 "data/lean/ee09b16da8561dd91096fc0426577681/E236S429.bin"
namespace E236S429
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [372, 158], [118], 2)], 0, E236S429.L1),
([(13, true, false, [372, 158], [118], 3)], 0, E236S429.L2),
([(13, true, false, [372, 158], [118], 40)], 0, E236S429.L3),
([(13, true, false, [372, 158], [118], 80)], 0, E236S429.L4),
([(13, true, false, [372, 158], [118], 114)], 0, E236S429.L5),
([(13, true, false, [372, 158], [118], 116)], 0, E236S429.L6),
([(13, true, false, [372, 158], [118], 198)], 0, E236S429.L7),
([(13, true, false, [372, 158], [118], 202)], 0, E236S429.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S429
