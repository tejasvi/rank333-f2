module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S154 "data/lean/348ab33ccd1eac8e62fa9d8985466473/E236S154.bin"
namespace E236S154
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354], [96, 136], 0)], 0, E236S154.L1),
([(0, true, false, [354], [96, 136], 2)], 0, E236S154.L2),
([(0, true, false, [354], [96, 136], 8)], 0, E236S154.L3),
([(0, true, false, [354], [96, 136], 12)], 0, E236S154.L4),
([(0, true, false, [354], [96, 136], 20)], 0, E236S154.L5),
([(0, true, false, [354], [96, 136], 21)], 0, E236S154.L6),
([(0, true, false, [354], [96, 136], 22)], 0, E236S154.L7),
([(0, true, false, [354], [96, 136], 23)], 0, E236S154.L8),
([(0, true, false, [354], [96, 136], 24)], 0, E236S154.L9),
([(0, true, false, [354], [96, 136], 30)], 0, E236S154.L10),
([(0, true, false, [354], [96, 136], 36)], 0, E236S154.L11),
([(0, true, false, [354], [96, 136], 40)], 0, E236S154.L12),
([(0, true, false, [354], [96, 136], 44)], 0, E236S154.L13),
([(0, true, false, [354], [96, 136], 45)], 0, E236S154.L14),
([(0, true, false, [354], [96, 136], 48)], 0, E236S154.L15),
([(0, true, false, [354], [96, 136], 49)], 0, E236S154.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E236S154
