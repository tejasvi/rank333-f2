module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S207 "data/lean/d91e676aa7d708d2bc967d01077f9e14/E236S207.bin"
namespace E236S207
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [412, 254, 394], [232], 10)], 0, E236S207.L1),
([(14, true, false, [412, 254, 394], [232], 16)], 0, E236S207.L2),
([(14, true, false, [412, 254, 394], [232], 74)], 0, E236S207.L3),
([(14, true, false, [412, 254, 394], [232], 82)], 0, E236S207.L4),
([(14, true, false, [412, 254, 394], [232], 168)], 0, E236S207.L5),
([(14, true, false, [412, 254, 394], [232], 174)], 0, E236S207.L6),
([(14, true, false, [412, 254, 394], [232], 210)], 0, E236S207.L7),
([(14, true, false, [412, 254, 394], [232], 226)], 0, E236S207.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S207
