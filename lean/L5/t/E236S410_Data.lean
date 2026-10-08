module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S410 "data/lean/ea696d7419aa1898ac2a902ff3ddc6ab/E236S410.bin"
namespace E236S410
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [354, 394, 158], [], 31)], 0, E236S410.L1),
([(11, true, false, [354, 394, 158], [], 88)], 0, E236S410.L2),
([(11, true, false, [354, 394, 158], [], 89)], 0, E236S410.L3),
([(11, true, false, [354, 394, 158], [], 90)], 0, E236S410.L4),
([(11, true, false, [354, 394, 158], [], 92)], 0, E236S410.L5),
([(11, true, false, [354, 394, 158], [], 94)], 0, E236S410.L6),
([(11, true, false, [354, 394, 158], [], 95)], 0, E236S410.L7),
([(11, true, false, [354, 394, 158], [], 97)], 0, E236S410.L8),
([(11, true, false, [354, 394, 158], [], 109)], 0, E236S410.L9),
([(11, true, false, [354, 394, 158], [], 153)], 0, E236S410.L10),
([(11, true, false, [354, 394, 158], [], 217)], 0, E236S410.L11),
([(11, true, false, [354, 394, 158], [], 229)], 0, E236S410.L12),
([(11, true, false, [354, 394, 158], [], 316)], 0, E236S410.L13),
([(11, true, false, [354, 394, 158], [], 401)], 0, E236S410.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E236S410
