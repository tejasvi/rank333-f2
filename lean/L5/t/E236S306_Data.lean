module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S306 "data/lean/ccb298d0c138fb97a686cba911910581/E236S306.bin"
namespace E236S306
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 394, 412], [136], 0)], 0, E236S306.L1),
([(0, true, false, [354, 394, 412], [136], 2)], 0, E236S306.L2),
([(0, true, false, [354, 394, 412], [136], 15)], 0, E236S306.L3),
([(0, true, false, [354, 394, 412], [136], 24)], 0, E236S306.L4),
([(0, true, false, [354, 394, 412], [136], 25)], 0, E236S306.L5),
([(0, true, false, [354, 394, 412], [136], 53)], 0, E236S306.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S306
