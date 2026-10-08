module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S322 "data/lean/ef4a403951428c16fa6435c11e47434f/E236S322.bin"
namespace E236S322
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 372], [118], 27)], 0, E236S322.L1),
([(4, true, false, [254, 372], [118], 28)], 0, E236S322.L2),
([(4, true, false, [254, 372], [118], 32)], 0, E236S322.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S322
