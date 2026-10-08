module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S28 "data/lean/dee2818186934fe8168f61d972cd09b6/E204S28.bin"
namespace E204S28
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [334, 372, 468, 494], [], 0)], 0, E204S28.L1),
([(0, true, false, [334, 372, 468, 494], [], 1)], 0, E204S28.L2),
([(0, true, false, [334, 372, 468, 494], [], 2)], 0, E204S28.L3),
([(0, true, false, [334, 372, 468, 494], [], 3)], 0, E204S28.L4),
([(0, true, false, [334, 372, 468, 494], [], 4)], 0, E204S28.L5),
([(0, true, false, [334, 372, 468, 494], [], 5)], 0, E204S28.L6),
([(0, true, false, [334, 372, 468, 494], [], 6)], 0, E204S28.L7),
([(0, true, false, [334, 372, 468, 494], [], 13)], 0, E204S28.L8),
([(0, true, false, [334, 372, 468, 494], [], 15)], 0, E204S28.L9),
([(0, true, false, [334, 372, 468, 494], [], 16)], 0, E204S28.L10),
([(0, true, false, [334, 372, 468, 494], [], 17)], 0, E204S28.L11),
([(0, true, false, [334, 372, 468, 494], [], 18)], 0, E204S28.L12),
([(0, true, false, [334, 372, 468, 494], [], 19)], 0, E204S28.L13),
([(0, true, false, [334, 372, 468, 494], [], 20)], 0, E204S28.L14),
([(0, true, false, [334, 372, 468, 494], [], 21)], 0, E204S28.L15),
([(0, true, false, [334, 372, 468, 494], [], 22)], 0, E204S28.L16),
([(0, true, false, [334, 372, 468, 494], [], 23)], 0, E204S28.L17),
([(0, true, false, [334, 372, 468, 494], [], 24)], 0, E204S28.L18),
([(0, true, false, [334, 372, 468, 494], [], 25)], 0, E204S28.L19),
([(0, true, false, [334, 372, 468, 494], [], 27)], 0, E204S28.L20),
([(0, true, false, [334, 372, 468, 494], [], 32)], 0, E204S28.L21),
([(0, true, false, [334, 372, 468, 494], [], 35)], 0, E204S28.L22),
([(0, true, false, [334, 372, 468, 494], [], 36)], 0, E204S28.L23),
([(0, true, false, [334, 372, 468, 494], [], 37)], 0, E204S28.L24),
([(0, true, false, [334, 372, 468, 494], [], 38)], 0, E204S28.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E204S28
