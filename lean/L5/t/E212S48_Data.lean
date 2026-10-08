module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S48 "data/lean/020680693ab9b9244c3af0085710abca/E212S48.bin"
namespace E212S48
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [500], [26, 362], 0)], 0, E212S48.L1),
([(0, true, false, [500], [26, 362], 10)], 0, E212S48.L2),
([(0, true, false, [500], [26, 362], 16)], 0, E212S48.L3),
([(0, true, false, [500], [26, 362], 72)], 0, E212S48.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E212S48
