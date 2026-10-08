module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S154 "data/lean/4b2d9a2f32468fe01abb72259a13b802/E218S154.bin"
namespace E218S154
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [142, 494], [112, 272], 46)], 0, E218S154.L1),
([(2, true, false, [142, 494], [112, 272], 55)], 0, E218S154.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E218S154
