module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S134 "data/lean/1ea00595c2ab8ee938697aedbe14bccd/E236S134.bin"
namespace E236S134
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [158, 254], [22, 118], 26)], 0, E236S134.L1),
([(15, true, false, [158, 254], [22, 118], 27)], 0, E236S134.L2),
([(15, true, false, [158, 254], [22, 118], 28)], 0, E236S134.L3),
([(15, true, false, [158, 254], [22, 118], 31)], 0, E236S134.L4),
([(15, true, false, [158, 254], [22, 118], 32)], 0, E236S134.L5),
([(15, true, false, [158, 254], [22, 118], 33)], 0, E236S134.L6),
([(15, true, false, [158, 254], [22, 118], 42)], 0, E236S134.L7),
([(15, true, false, [158, 254], [22, 118], 44)], 0, E236S134.L8),
([(15, true, false, [158, 254], [22, 118], 47)], 0, E236S134.L9),
([(15, true, false, [158, 254], [22, 118], 48)], 0, E236S134.L10),
([(15, true, false, [158, 254], [22, 118], 93)], 0, E236S134.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E236S134
