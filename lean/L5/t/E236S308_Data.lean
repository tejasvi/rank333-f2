module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S308 "data/lean/14292ab344060decd9868a47ef345288/E236S308.bin"
namespace E236S308
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [394, 412, 354], [258], 33)], 0, E236S308.L1),
([(8, true, false, [394, 412, 354], [258], 36)], 0, E236S308.L2),
([(8, true, false, [394, 412, 354], [258], 37)], 0, E236S308.L3),
([(8, true, false, [394, 412, 354], [258], 44)], 0, E236S308.L4),
([(8, true, false, [394, 412, 354], [258], 48)], 0, E236S308.L5),
([(8, true, false, [394, 412, 354], [258], 52)], 0, E236S308.L6),
([(8, true, false, [394, 412, 354], [258], 70)], 0, E236S308.L7),
([(8, true, false, [394, 412, 354], [258], 80)], 0, E236S308.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S308
