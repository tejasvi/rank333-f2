module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S34 "data/lean/e80315f185182c345089478671e9d18c/E236S34.bin"
namespace E236S34
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [412, 372], [22], 12)], 0, E236S34.L1),
([(15, true, false, [412, 372], [22], 133)], 0, E236S34.L2),
([(15, true, false, [412, 372], [22], 140)], 0, E236S34.L3),
([(15, true, false, [412, 372], [22], 141)], 0, E236S34.L4),
([(15, true, false, [412, 372], [22], 142)], 0, E236S34.L5),
([(15, true, false, [412, 372], [22], 143)], 0, E236S34.L6),
([(15, true, false, [412, 372], [22], 176)], 0, E236S34.L7),
([(15, true, false, [412, 372], [22], 177)], 0, E236S34.L8),
([(15, true, false, [412, 372], [22], 181)], 0, E236S34.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E236S34
