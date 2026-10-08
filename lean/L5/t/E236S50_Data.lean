module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S50 "data/lean/c217f40c89ed7a276cf472c66426e0d3/E236S50.bin"
namespace E236S50
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [372], [96, 118], 58)], 0, E236S50.L1),
([(11, true, false, [372], [96, 118], 63)], 0, E236S50.L2),
([(11, true, false, [372], [96, 118], 104)], 0, E236S50.L3),
([(11, true, false, [372], [96, 118], 105)], 0, E236S50.L4),
([(11, true, false, [372], [96, 118], 109)], 0, E236S50.L5),
([(11, true, false, [372], [96, 118], 111)], 0, E236S50.L6),
([(11, true, false, [372], [96, 118], 114)], 0, E236S50.L7),
([(11, true, false, [372], [96, 118], 153)], 0, E236S50.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S50
