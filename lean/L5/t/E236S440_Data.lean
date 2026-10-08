module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S440 "data/lean/3cd9cf09a9f55597136475d11ba295f7/E236S440.bin"
namespace E236S440
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [354, 372, 394, 412, 158], [], 0)], 0, E236S440.L1),
([(4, true, false, [354, 372, 394, 412, 158], [], 1)], 0, E236S440.L2),
([(4, true, false, [354, 372, 394, 412, 158], [], 23)], 0, E236S440.L3),
([(4, true, false, [354, 372, 394, 412, 158], [], 47)], 0, E236S440.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S440
