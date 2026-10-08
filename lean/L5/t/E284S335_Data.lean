module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S335 "data/lean/18bdbc9afbda57ae318182b9c0bd9f55/E284S335.bin"
namespace E284S335
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [84, 372, 394, 116, 340, 426], [], 47)], 0, E284S335.L1),
([(15, true, false, [84, 372, 394, 116, 340, 426], [], 49)], 0, E284S335.L2),
([(15, true, false, [84, 372, 394, 116, 340, 426], [], 51)], 0, E284S335.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S335
