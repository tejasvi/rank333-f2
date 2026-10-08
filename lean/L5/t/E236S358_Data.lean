module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S358 "data/lean/b9978ebb90a1e46d36d7755bae4576a7/E236S358.bin"
namespace E236S358
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [372, 254, 354], [232], 28)], 0, E236S358.L1),
([(15, true, false, [372, 254, 354], [232], 44)], 0, E236S358.L2),
([(15, true, false, [372, 254, 354], [232], 52)], 0, E236S358.L3),
([(15, true, false, [372, 254, 354], [232], 53)], 0, E236S358.L4),
([(15, true, false, [372, 254, 354], [232], 74)], 0, E236S358.L5),
([(15, true, false, [372, 254, 354], [232], 86)], 0, E236S358.L6),
([(15, true, false, [372, 254, 354], [232], 112)], 0, E236S358.L7),
([(15, true, false, [372, 254, 354], [232], 126)], 0, E236S358.L8),
([(15, true, false, [372, 254, 354], [232], 152)], 0, E236S358.L9),
([(15, true, false, [372, 254, 354], [232], 160)], 0, E236S358.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S358
