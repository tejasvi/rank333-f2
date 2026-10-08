module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S390 "data/lean/14013884e22e7fbc617cf72830d81fdd/E236S390.bin"
namespace E236S390
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 394, 412, 158], [], 0)], 0, E236S390.L1),
([(8, true, false, [254, 394, 412, 158], [], 42)], 0, E236S390.L2),
([(8, true, false, [254, 394, 412, 158], [], 45)], 0, E236S390.L3),
([(8, true, false, [254, 394, 412, 158], [], 51)], 0, E236S390.L4),
([(8, true, false, [254, 394, 412, 158], [], 79)], 0, E236S390.L5),
([(8, true, false, [254, 394, 412, 158], [], 86)], 0, E236S390.L6),
([(8, true, false, [254, 394, 412, 158], [], 87)], 0, E236S390.L7),
([(8, true, false, [254, 394, 412, 158], [], 176)], 0, E236S390.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S390
