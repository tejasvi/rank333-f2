module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S31 "data/lean/0bd842b7a627dd9178acdfedd181271f/E284S31.bin"
namespace E284S31
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 468], [126], 0)], 0, E284S31.L1),
([(8, true, false, [254, 266, 468], [126], 1)], 0, E284S31.L2),
([(8, true, false, [254, 266, 468], [126], 2)], 0, E284S31.L3),
([(8, true, false, [254, 266, 468], [126], 5)], 0, E284S31.L4),
([(8, true, false, [254, 266, 468], [126], 6)], 0, E284S31.L5),
([(8, true, false, [254, 266, 468], [126], 7)], 0, E284S31.L6),
([(8, true, false, [254, 266, 468], [126], 42)], 0, E284S31.L7),
([(8, true, false, [254, 266, 468], [126], 56)], 0, E284S31.L8),
([(8, true, false, [254, 266, 468], [126], 57)], 0, E284S31.L9),
([(8, true, false, [254, 266, 468], [126], 64)], 0, E284S31.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S31
