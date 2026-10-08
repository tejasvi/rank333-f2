module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S132 "data/lean/36617830bc08fb73bc52de53e7eeae33/E213S132.bin"
namespace E213S132
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [282, 106], [388], 57)], 0, E213S132.L1),
([(15, true, false, [282, 106], [388], 76)], 0, E213S132.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S132
