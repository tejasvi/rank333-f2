module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E206S1 "data/lean/381861449eca1d2ad1c56820823e8cca/E206S1.bin"
namespace E206S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [190, 250], [], 20)], 0, E206S1.L1),
([(2, true, false, [190, 250], [], 24)], 0, E206S1.L2),
([(2, true, false, [190, 250], [], 74)], 0, E206S1.L3),
([(2, true, false, [190, 250], [], 75)], 0, E206S1.L4),
([(2, true, false, [190, 250], [], 78)], 0, E206S1.L5),
([(2, true, false, [190, 250], [], 81)], 0, E206S1.L6),
([(2, true, false, [190, 250], [], 139)], 0, E206S1.L7),
([(2, true, false, [190, 250], [], 140)], 0, E206S1.L8),
([(2, true, false, [190, 250], [], 142)], 0, E206S1.L9),
([(2, true, false, [190, 250], [], 143)], 0, E206S1.L10),
([(2, true, false, [190, 250], [], 146)], 0, E206S1.L11),
([(2, true, false, [190, 250], [], 150)], 0, E206S1.L12),
([(2, true, false, [190, 250], [], 181)], 0, E206S1.L13),
([(2, true, false, [190, 250], [], 216)], 0, E206S1.L14),
([(2, true, false, [190, 250], [], 217)], 0, E206S1.L15),
([(2, true, false, [190, 250], [], 321)], 0, E206S1.L16),
([(2, true, false, [190, 250], [], 364)], 0, E206S1.L17),
([(2, true, false, [190, 250], [], 509)], 0, E206S1.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E206S1
