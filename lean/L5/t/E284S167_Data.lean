module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S167 "data/lean/a1289340d5f6fabe881ab15da711b2af/E284S167.bin"
namespace E284S167
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [372, 298], [222], 1)], 0, E284S167.L1),
([(10, true, false, [372, 298], [222], 4)], 0, E284S167.L2),
([(10, true, false, [372, 298], [222], 5)], 0, E284S167.L3),
([(10, true, false, [372, 298], [222], 6)], 0, E284S167.L4),
([(10, true, false, [372, 298], [222], 7)], 0, E284S167.L5),
([(10, true, false, [372, 298], [222], 8)], 0, E284S167.L6),
([(10, true, false, [372, 298], [222], 10)], 0, E284S167.L7),
([(10, true, false, [372, 298], [222], 16)], 0, E284S167.L8),
([(10, true, false, [372, 298], [222], 20)], 0, E284S167.L9),
([(10, true, false, [372, 298], [222], 29)], 0, E284S167.L10),
([(10, true, false, [372, 298], [222], 32)], 0, E284S167.L11),
([(10, true, false, [372, 298], [222], 41)], 0, E284S167.L12),
([(10, true, false, [372, 298], [222], 46)], 0, E284S167.L13),
([(10, true, false, [372, 298], [222], 78)], 0, E284S167.L14),
([(10, true, false, [372, 298], [222], 79)], 0, E284S167.L15),
([(10, true, false, [372, 298], [222], 81)], 0, E284S167.L16),
([(10, true, false, [372, 298], [222], 83)], 0, E284S167.L17),
([(10, true, false, [372, 298], [222], 85)], 0, E284S167.L18),
([(10, true, false, [372, 298], [222], 118)], 0, E284S167.L19),
([(10, true, false, [372, 298], [222], 158)], 0, E284S167.L20),
([(10, true, false, [372, 298], [222], 164)], 0, E284S167.L21),
([(10, true, false, [372, 298], [222], 166)], 0, E284S167.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E284S167
