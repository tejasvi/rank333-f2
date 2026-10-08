module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S396 "data/lean/c8ba52d0f2c0cdc8741e205b50a42bfb/E236S396.bin"
namespace E236S396
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372], [96, 136], 2)], 0, E236S396.L1),
([(0, true, false, [372], [96, 136], 3)], 0, E236S396.L2),
([(0, true, false, [372], [96, 136], 8)], 0, E236S396.L3),
([(0, true, false, [372], [96, 136], 9)], 0, E236S396.L4),
([(0, true, false, [372], [96, 136], 25)], 0, E236S396.L5),
([(0, true, false, [372], [96, 136], 33)], 0, E236S396.L6),
([(0, true, false, [372], [96, 136], 42)], 0, E236S396.L7),
([(0, true, false, [372], [96, 136], 46)], 0, E236S396.L8),
([(0, true, false, [372], [96, 136], 48)], 0, E236S396.L9),
([(0, true, false, [372], [96, 136], 50)], 0, E236S396.L10),
([(0, true, false, [372], [96, 136], 52)], 0, E236S396.L11),
([(0, true, false, [372], [96, 136], 54)], 0, E236S396.L12),
([(0, true, false, [372], [96, 136], 55)], 0, E236S396.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S396
