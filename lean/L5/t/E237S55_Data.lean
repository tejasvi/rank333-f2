module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S55 "data/lean/f562250a5073ff5047b8e25c0738c45b/E237S55.bin"
namespace E237S55
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [116, 254, 412, 234], [], 30)], 0, E237S55.L1),
([(1, true, false, [116, 254, 412, 234], [], 36)], 0, E237S55.L2),
([(1, true, false, [116, 254, 412, 234], [], 74)], 0, E237S55.L3),
([(1, true, false, [116, 254, 412, 234], [], 75)], 0, E237S55.L4),
([(1, true, false, [116, 254, 412, 234], [], 84)], 0, E237S55.L5),
([(1, true, false, [116, 254, 412, 234], [], 111)], 0, E237S55.L6),
([(1, true, false, [116, 254, 412, 234], [], 152)], 0, E237S55.L7),
([(1, true, false, [116, 254, 412, 234], [], 182)], 0, E237S55.L8),
([(1, true, false, [116, 254, 412, 234], [], 183)], 0, E237S55.L9),
([(1, true, false, [116, 254, 412, 234], [], 207)], 0, E237S55.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E237S55
