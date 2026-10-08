module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S33 "data/lean/1e72bf5449995000ea318c2557a82aed/E207S33.bin"
namespace E207S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 334], [], 2)], 0, E207S33.L1),
([(0, true, false, [266, 334], [], 6)], 0, E207S33.L2),
([(0, true, false, [266, 334], [], 21)], 0, E207S33.L3),
([(0, true, false, [266, 334], [], 24)], 0, E207S33.L4),
([(0, true, false, [266, 334], [], 41)], 0, E207S33.L5),
([(0, true, false, [266, 334], [], 156)], 0, E207S33.L6),
([(0, true, false, [266, 334], [], 163)], 0, E207S33.L7),
([(0, true, false, [266, 334], [], 167)], 0, E207S33.L8),
([(0, true, false, [266, 334], [], 168)], 0, E207S33.L9),
([(0, true, false, [266, 334], [], 171)], 0, E207S33.L10),
([(0, true, false, [266, 334], [], 172)], 0, E207S33.L11),
([(0, true, false, [266, 334], [], 174)], 0, E207S33.L12),
([(0, true, false, [266, 334], [], 176)], 0, E207S33.L13),
([(0, true, false, [266, 334], [], 188)], 0, E207S33.L14),
([(0, true, false, [266, 334], [], 198)], 0, E207S33.L15),
([(0, true, false, [266, 334], [], 222)], 0, E207S33.L16),
([(0, true, false, [266, 334], [], 238)], 0, E207S33.L17),
([(0, true, false, [266, 334], [], 272)], 0, E207S33.L18),
([(0, true, false, [266, 334], [], 282)], 0, E207S33.L19),
([(0, true, false, [266, 334], [], 414)], 0, E207S33.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E207S33
