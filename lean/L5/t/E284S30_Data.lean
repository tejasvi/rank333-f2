module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S30 "data/lean/8c3fcce225915259fc0d15c9ada0e030/E284S30.bin"
namespace E284S30
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [94, 266, 468], [126], 0)], 0, E284S30.L1),
([(8, true, false, [94, 266, 468], [126], 6)], 0, E284S30.L2),
([(8, true, false, [94, 266, 468], [126], 10)], 0, E284S30.L3),
([(8, true, false, [94, 266, 468], [126], 11)], 0, E284S30.L4),
([(8, true, false, [94, 266, 468], [126], 12)], 0, E284S30.L5),
([(8, true, false, [94, 266, 468], [126], 13)], 0, E284S30.L6),
([(8, true, false, [94, 266, 468], [126], 16)], 0, E284S30.L7),
([(8, true, false, [94, 266, 468], [126], 33)], 0, E284S30.L8),
([(8, true, false, [94, 266, 468], [126], 38)], 0, E284S30.L9),
([(8, true, false, [94, 266, 468], [126], 53)], 0, E284S30.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S30
