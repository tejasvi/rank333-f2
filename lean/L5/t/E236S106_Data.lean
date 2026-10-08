module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S106 "data/lean/f4e6cf266eff1b49a40712aacd8d2398/E236S106.bin"
namespace E236S106
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [254], [96, 118], 3)], 0, E236S106.L1),
([(12, true, false, [254], [96, 118], 9)], 0, E236S106.L2),
([(12, true, false, [254], [96, 118], 44)], 0, E236S106.L3),
([(12, true, false, [254], [96, 118], 46)], 0, E236S106.L4),
([(12, true, false, [254], [96, 118], 47)], 0, E236S106.L5),
([(12, true, false, [254], [96, 118], 52)], 0, E236S106.L6),
([(12, true, false, [254], [96, 118], 55)], 0, E236S106.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S106
