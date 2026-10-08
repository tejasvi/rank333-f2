module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S20 "data/lean/89ad431110f3690ca7f89c98ec80b336/E207S20.bin"
namespace E207S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [346, 426], [80, 160], 22)], 0, E207S20.L1),
([(4, true, false, [346, 426], [80, 160], 41)], 0, E207S20.L2),
([(4, true, false, [346, 426], [80, 160], 54)], 0, E207S20.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E207S20
