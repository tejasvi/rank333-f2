module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S72 "data/lean/f33fcbee943d0cb2e74f233d8da5388c/E207S72.bin"
namespace E207S72
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [334, 426, 494, 286], [], 0)], 0, E207S72.L1),
([(4, true, false, [334, 426, 494, 286], [], 2)], 0, E207S72.L2),
([(4, true, false, [334, 426, 494, 286], [], 5)], 0, E207S72.L3),
([(4, true, false, [334, 426, 494, 286], [], 48)], 0, E207S72.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E207S72
