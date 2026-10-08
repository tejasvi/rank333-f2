module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S121 "data/lean/d45e3be69bc837ddac7535f5dda8496a/E213S121.bin"
namespace E213S121
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [106, 244], [368], 2)], 0, E213S121.L1),
([(5, true, false, [106, 244], [368], 35)], 0, E213S121.L2),
([(5, true, false, [106, 244], [368], 41)], 0, E213S121.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S121
