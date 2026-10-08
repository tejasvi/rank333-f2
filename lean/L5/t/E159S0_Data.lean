module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E159S0 "data/lean/ac45cd3ab13773e0020b96dc37eea7d6/E159S0.bin"
namespace E159S0
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(16, true, false, [84, 94, 340], [160], 6)], 3, 0, E159S0.L1),
([(16, true, false, [84, 94, 340], [160], 12)], 3, 0, E159S0.L2),
([(16, true, false, [84, 94, 340], [160], 125)], 3, 0, E159S0.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E159S0
