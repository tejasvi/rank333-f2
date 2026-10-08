module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S79 "data/lean/c3aa85be27152b45adb3e2c855c1a14e/E236S79.bin"
namespace E236S79
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [372], [22, 118], 21)], 0, E236S79.L1),
([(16, true, false, [372], [22, 118], 27)], 0, E236S79.L2),
([(16, true, false, [372], [22, 118], 28)], 0, E236S79.L3),
([(16, true, false, [372], [22, 118], 32)], 0, E236S79.L4),
([(16, true, false, [372], [22, 118], 44)], 0, E236S79.L5),
([(16, true, false, [372], [22, 118], 47)], 0, E236S79.L6),
([(16, true, false, [372], [22, 118], 74)], 0, E236S79.L7),
([(16, true, false, [372], [22, 118], 97)], 0, E236S79.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S79
