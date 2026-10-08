module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S435 "data/lean/c4875aeb7b749db1624e3003594bba06/E236S435.bin"
namespace E236S435
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254, 354, 394, 158], [], 0)], 0, E236S435.L1),
([(10, true, false, [254, 354, 394, 158], [], 1)], 0, E236S435.L2),
([(10, true, false, [254, 354, 394, 158], [], 2)], 0, E236S435.L3),
([(10, true, false, [254, 354, 394, 158], [], 3)], 0, E236S435.L4),
([(10, true, false, [254, 354, 394, 158], [], 4)], 0, E236S435.L5),
([(10, true, false, [254, 354, 394, 158], [], 19)], 0, E236S435.L6),
([(10, true, false, [254, 354, 394, 158], [], 20)], 0, E236S435.L7),
([(10, true, false, [254, 354, 394, 158], [], 33)], 0, E236S435.L8),
([(10, true, false, [254, 354, 394, 158], [], 42)], 0, E236S435.L9),
([(10, true, false, [254, 354, 394, 158], [], 44)], 0, E236S435.L10),
([(10, true, false, [254, 354, 394, 158], [], 49)], 0, E236S435.L11),
([(10, true, false, [254, 354, 394, 158], [], 51)], 0, E236S435.L12),
([(10, true, false, [254, 354, 394, 158], [], 61)], 0, E236S435.L13),
([(10, true, false, [254, 354, 394, 158], [], 66)], 0, E236S435.L14),
([(10, true, false, [254, 354, 394, 158], [], 81)], 0, E236S435.L15),
([(10, true, false, [254, 354, 394, 158], [], 85)], 0, E236S435.L16),
([(10, true, false, [254, 354, 394, 158], [], 97)], 0, E236S435.L17),
([(10, true, false, [254, 354, 394, 158], [], 103)], 0, E236S435.L18),
([(10, true, false, [254, 354, 394, 158], [], 105)], 0, E236S435.L19),
([(10, true, false, [254, 354, 394, 158], [], 125)], 0, E236S435.L20),
([(10, true, false, [254, 354, 394, 158], [], 131)], 0, E236S435.L21),
([(10, true, false, [254, 354, 394, 158], [], 140)], 0, E236S435.L22),
([(10, true, false, [254, 354, 394, 158], [], 169)], 0, E236S435.L23),
([(10, true, false, [254, 354, 394, 158], [], 173)], 0, E236S435.L24),
([(10, true, false, [254, 354, 394, 158], [], 183)], 0, E236S435.L25),
([(10, true, false, [254, 354, 394, 158], [], 193)], 0, E236S435.L26),
([(10, true, false, [254, 354, 394, 158], [], 205)], 0, E236S435.L27),
([(10, true, false, [254, 354, 394, 158], [], 211)], 0, E236S435.L28),
([(10, true, false, [254, 354, 394, 158], [], 221)], 0, E236S435.L29),
([(10, true, false, [254, 354, 394, 158], [], 227)], 0, E236S435.L30),
([(10, true, false, [254, 354, 394, 158], [], 241)], 0, E236S435.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S435
