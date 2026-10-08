module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S76 "data/lean/c38c49713e9f2c0218b1f5ede80ee73b/E207S76.bin"
namespace E207S76
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266, 494, 286], [80], 1)], 0, E207S76.L1),
([(4, true, false, [266, 494, 286], [80], 4)], 0, E207S76.L2),
([(4, true, false, [266, 494, 286], [80], 21)], 0, E207S76.L3),
([(4, true, false, [266, 494, 286], [80], 52)], 0, E207S76.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E207S76
