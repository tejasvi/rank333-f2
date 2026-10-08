module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S18 "data/lean/29357b70d3594784703927a9cc37eafb/E202S18.bin"
namespace E202S18
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(8, true, false, [244, 282, 340, 426], [], 30)], 31, 0, E202S18.L1),
([(8, true, false, [244, 282, 340, 426], [], 31)], 31, 0, E202S18.L2),
([(8, true, false, [244, 282, 340, 426], [], 32)], 31, 0, E202S18.L3),
([(8, true, false, [244, 282, 340, 426], [], 33)], 31, 0, E202S18.L4),
([(8, true, false, [244, 282, 340, 426], [], 34)], 31, 0, E202S18.L5),
([(8, true, false, [244, 282, 340, 426], [], 35)], 31, 0, E202S18.L6),
([(8, true, false, [244, 282, 340, 426], [], 36)], 31, 0, E202S18.L7),
([(8, true, false, [244, 282, 340, 426], [], 38)], 31, 0, E202S18.L8),
([(8, true, false, [244, 282, 340, 426], [], 39)], 31, 0, E202S18.L9),
([(8, true, false, [244, 282, 340, 426], [], 40)], 31, 0, E202S18.L10),
([(8, true, false, [244, 282, 340, 426], [], 42)], 31, 0, E202S18.L11),
([(8, true, false, [244, 282, 340, 426], [], 49)], 31, 0, E202S18.L12),
([(8, true, false, [244, 282, 340, 426], [], 75)], 31, 0, E202S18.L13),
([(8, true, false, [244, 282, 340, 426], [], 78)], 31, 0, E202S18.L14),
([(8, true, false, [244, 282, 340, 426], [], 88)], 31, 0, E202S18.L15),
([(8, true, false, [244, 282, 340, 426], [], 108)], 31, 0, E202S18.L16),
([(8, true, false, [244, 282, 340, 426], [], 109)], 31, 0, E202S18.L17),
([(8, true, false, [244, 282, 340, 426], [], 110)], 31, 0, E202S18.L18),
([(8, true, false, [244, 282, 340, 426], [], 118)], 31, 0, E202S18.L19),
([(8, true, false, [244, 282, 340, 426], [], 119)], 31, 0, E202S18.L20),
([(8, true, false, [244, 282, 340, 426], [], 123)], 31, 0, E202S18.L21),
([(8, true, false, [244, 282, 340, 426], [], 124)], 31, 0, E202S18.L22),
([(8, true, false, [244, 282, 340, 426], [], 130)], 31, 0, E202S18.L23),
([(8, true, false, [244, 282, 340, 426], [], 134)], 31, 0, E202S18.L24),
([(8, true, false, [244, 282, 340, 426], [], 143)], 31, 0, E202S18.L25),
([(8, true, false, [244, 282, 340, 426], [], 145)], 31, 0, E202S18.L26),
([(8, true, false, [244, 282, 340, 426], [], 178)], 31, 0, E202S18.L27),
([(8, true, false, [244, 282, 340, 426], [], 202)], 31, 0, E202S18.L28),
([(8, true, false, [244, 282, 340, 426], [], 206)], 31, 0, E202S18.L29),
([(8, true, false, [244, 282, 340, 426], [], 232)], 31, 0, E202S18.L30),
([(8, true, false, [244, 282, 340, 426], [], 236)], 31, 0, E202S18.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E202S18
