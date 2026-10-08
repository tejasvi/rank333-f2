module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S54 "data/lean/ac1f6c44c4fb18cceda90151f687379d/E237S54.bin"
namespace E237S54
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [116, 254, 412], [], 30)], 0, E237S54.L1),
([(2, true, false, [116, 254, 412], [], 36)], 0, E237S54.L2),
([(2, true, false, [116, 254, 412], [], 74)], 0, E237S54.L3),
([(2, true, false, [116, 254, 412], [], 75)], 0, E237S54.L4),
([(2, true, false, [116, 254, 412], [], 84)], 0, E237S54.L5),
([(2, true, false, [116, 254, 412], [], 111)], 0, E237S54.L6),
([(2, true, false, [116, 254, 412], [], 152)], 0, E237S54.L7),
([(2, true, false, [116, 254, 412], [], 172)], 0, E237S54.L8),
([(2, true, false, [116, 254, 412], [], 183)], 0, E237S54.L9),
([(2, true, false, [116, 254, 412], [], 189)], 0, E237S54.L10),
([(2, true, false, [116, 254, 412], [], 207)], 0, E237S54.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E237S54
