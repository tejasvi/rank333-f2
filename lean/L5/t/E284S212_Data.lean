module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S212 "data/lean/56e5eefd491fe4a3f13613ad21dba21a/E284S212.bin"
namespace E284S212
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 212, 266, 394, 254], [], 0)], 0, E284S212.L1),
([(2, true, false, [84, 212, 266, 394, 254], [], 15)], 0, E284S212.L2),
([(2, true, false, [84, 212, 266, 394, 254], [], 57)], 0, E284S212.L3),
([(2, true, false, [84, 212, 266, 394, 254], [], 76)], 0, E284S212.L4),
([(2, true, false, [84, 212, 266, 394, 254], [], 97)], 0, E284S212.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S212
