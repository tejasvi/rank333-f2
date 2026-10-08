module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S309 "data/lean/6b57ada1603d55170adee955d9f0419d/E284S309.bin"
namespace E284S309
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 298, 394, 426], [], 58)], 0, E284S309.L1),
([(3, true, false, [266, 298, 394, 426], [], 59)], 0, E284S309.L2),
([(3, true, false, [266, 298, 394, 426], [], 62)], 0, E284S309.L3),
([(3, true, false, [266, 298, 394, 426], [], 63)], 0, E284S309.L4),
([(3, true, false, [266, 298, 394, 426], [], 89)], 0, E284S309.L5),
([(3, true, false, [266, 298, 394, 426], [], 90)], 0, E284S309.L6),
([(3, true, false, [266, 298, 394, 426], [], 94)], 0, E284S309.L7),
([(3, true, false, [266, 298, 394, 426], [], 120)], 0, E284S309.L8),
([(3, true, false, [266, 298, 394, 426], [], 124)], 0, E284S309.L9),
([(3, true, false, [266, 298, 394, 426], [], 125)], 0, E284S309.L10),
([(3, true, false, [266, 298, 394, 426], [], 128)], 0, E284S309.L11),
([(3, true, false, [266, 298, 394, 426], [], 132)], 0, E284S309.L12),
([(3, true, false, [266, 298, 394, 426], [], 133)], 0, E284S309.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E284S309
