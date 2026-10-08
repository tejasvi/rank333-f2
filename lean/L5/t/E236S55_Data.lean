module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S55 "data/lean/8481fd8343bafda2c1ee61217b0249c9/E236S55.bin"
namespace E236S55
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [412, 254], [96, 118], 2)], 7, E236S55.L1),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 528)], 0, E236S55.L2),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 560)], 0, E236S55.L3),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 658)], 0, E236S55.L4),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 1184)], 0, E236S55.L5),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 1192)], 0, E236S55.L6),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 1840)], 0, E236S55.L7),
([(0, true, false, [412, 254], [96, 118], 2), (14, false, false, [], [96, 232], 1872)], 0, E236S55.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E236S55
