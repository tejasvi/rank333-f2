module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S265 "data/lean/bd8a574d71461a08a830f1ffdc6b8554/E236S265.bin"
namespace E236S265
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158], [22, 276], 4)], 0, E236S265.L1),
([(4, true, false, [158], [22, 276], 12)], 0, E236S265.L2),
([(4, true, false, [158], [22, 276], 24)], 0, E236S265.L3),
([(4, true, false, [158], [22, 276], 47)], 0, E236S265.L4),
([(4, true, false, [158], [22, 276], 48)], 0, E236S265.L5),
([(4, true, false, [158], [22, 276], 49)], 0, E236S265.L6),
([(4, true, false, [158], [22, 276], 51)], 0, E236S265.L7),
([(4, true, false, [158], [22, 276], 54)], 0, E236S265.L8),
([(4, true, false, [158], [22, 276], 55)], 0, E236S265.L9),
([(4, true, false, [158], [22, 276], 70)], 0, E236S265.L10),
([(4, true, false, [158], [22, 276], 92)], 0, E236S265.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E236S265
