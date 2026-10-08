module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S166 "data/lean/24e2c5a350006bdcdfe56592adb33bcd/E218S166.bin"
namespace E218S166
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [106, 266, 500, 142, 494], [], 44)], 0, E218S166.L1),
([(10, true, false, [106, 266, 500, 142, 494], [], 45)], 0, E218S166.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E218S166
