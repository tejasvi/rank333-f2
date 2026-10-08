module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S393 "data/lean/e8d3fa9b15573f7b023b4061a29a59be/E236S393.bin"
namespace E236S393
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [394, 412, 158], [], 1)], 0, E236S393.L1),
([(8, true, false, [394, 412, 158], [], 75)], 0, E236S393.L2),
([(8, true, false, [394, 412, 158], [], 79)], 0, E236S393.L3),
([(8, true, false, [394, 412, 158], [], 102)], 0, E236S393.L4),
([(8, true, false, [394, 412, 158], [], 138)], 0, E236S393.L5),
([(8, true, false, [394, 412, 158], [], 140)], 0, E236S393.L6),
([(8, true, false, [394, 412, 158], [], 141)], 0, E236S393.L7),
([(8, true, false, [394, 412, 158], [], 146)], 0, E236S393.L8),
([(8, true, false, [394, 412, 158], [], 148)], 0, E236S393.L9),
([(8, true, false, [394, 412, 158], [], 224)], 0, E236S393.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S393
