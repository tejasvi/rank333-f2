module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S114 "data/lean/d69bfa7f4b90b557edcbd7ad778686e0/E212S114.bin"
namespace E212S114
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [494], [228], 5)], 0, E212S114.L1),
([(5, true, false, [494], [228], 11)], 0, E212S114.L2),
([(5, true, false, [494], [228], 14)], 0, E212S114.L3),
([(5, true, false, [494], [228], 43)], 0, E212S114.L4),
([(5, true, false, [494], [228], 46)], 0, E212S114.L5),
([(5, true, false, [494], [228], 51)], 0, E212S114.L6),
([(5, true, false, [494], [228], 60)], 0, E212S114.L7),
([(5, true, false, [494], [228], 63)], 0, E212S114.L8),
([(5, true, false, [494], [228], 82)], 0, E212S114.L9),
([(5, true, false, [494], [228], 84)], 0, E212S114.L10),
([(5, true, false, [494], [228], 90)], 0, E212S114.L11),
([(5, true, false, [494], [228], 92)], 0, E212S114.L12),
([(5, true, false, [494], [228], 94)], 0, E212S114.L13),
([(5, true, false, [494], [228], 134)], 0, E212S114.L14),
([(5, true, false, [494], [228], 135)], 0, E212S114.L15),
([(5, true, false, [494], [228], 147)], 0, E212S114.L16),
([(5, true, false, [494], [228], 159)], 0, E212S114.L17),
([(5, true, false, [494], [228], 162)], 0, E212S114.L18),
([(5, true, false, [494], [228], 168)], 0, E212S114.L19),
([(5, true, false, [494], [228], 171)], 0, E212S114.L20),
([(5, true, false, [494], [228], 174)], 0, E212S114.L21),
([(5, true, false, [494], [228], 194)], 0, E212S114.L22),
([(5, true, false, [494], [228], 213)], 0, E212S114.L23),
([(5, true, false, [494], [228], 214)], 0, E212S114.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E212S114
