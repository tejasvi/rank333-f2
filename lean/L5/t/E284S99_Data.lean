module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S99 "data/lean/c88d72d2d21d940904419e116a588a46/E284S99.bin"
namespace E284S99
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266], [138], 10)], 0, E284S99.L1),
([(3, true, false, [84, 266], [138], 11)], 0, E284S99.L2),
([(3, true, false, [84, 266], [138], 12)], 0, E284S99.L3),
([(3, true, false, [84, 266], [138], 14)], 0, E284S99.L4),
([(3, true, false, [84, 266], [138], 20)], 0, E284S99.L5),
([(3, true, false, [84, 266], [138], 21)], 0, E284S99.L6),
([(3, true, false, [84, 266], [138], 22)], 0, E284S99.L7),
([(3, true, false, [84, 266], [138], 24)], 0, E284S99.L8),
([(3, true, false, [84, 266], [138], 27)], 0, E284S99.L9),
([(3, true, false, [84, 266], [138], 31)], 0, E284S99.L10),
([(3, true, false, [84, 266], [138], 34)], 0, E284S99.L11),
([(3, true, false, [84, 266], [138], 41)], 0, E284S99.L12),
([(3, true, false, [84, 266], [138], 46)], 0, E284S99.L13),
([(3, true, false, [84, 266], [138], 85)], 0, E284S99.L14),
([(3, true, false, [84, 266], [138], 86)], 0, E284S99.L15),
([(3, true, false, [84, 266], [138], 103)], 0, E284S99.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E284S99
