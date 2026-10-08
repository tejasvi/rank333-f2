module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S9 "data/lean/db3e0162403c98fe7eb47acdc01eb2be/E343S9.bin"
namespace E343S9
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(12, true, false, [], [], 101)], 4, 0, E343S9.L1),
([(12, true, false, [], [], 323)], 4, 0, E343S9.L2),
([(12, true, false, [], [], 336)], 4, 0, E343S9.L3),
([(12, true, false, [], [], 869)], 4, 0, E343S9.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E343S9
