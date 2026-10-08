module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S122 "data/lean/36963f6566263ca4b17df8420402279a/E236S122.bin"
namespace E236S122
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [394], [22, 276], 2)], 0, E236S122.L1),
([(16, true, false, [394], [22, 276], 4)], 0, E236S122.L2),
([(16, true, false, [394], [22, 276], 5)], 0, E236S122.L3),
([(16, true, false, [394], [22, 276], 10)], 0, E236S122.L4),
([(16, true, false, [394], [22, 276], 12)], 0, E236S122.L5),
([(16, true, false, [394], [22, 276], 14)], 0, E236S122.L6),
([(16, true, false, [394], [22, 276], 15)], 0, E236S122.L7),
([(16, true, false, [394], [22, 276], 19)], 0, E236S122.L8),
([(16, true, false, [394], [22, 276], 25)], 0, E236S122.L9),
([(16, true, false, [394], [22, 276], 31)], 0, E236S122.L10),
([(16, true, false, [394], [22, 276], 48)], 0, E236S122.L11),
([(16, true, false, [394], [22, 276], 49)], 0, E236S122.L12),
([(16, true, false, [394], [22, 276], 56)], 0, E236S122.L13),
([(16, true, false, [394], [22, 276], 60)], 0, E236S122.L14),
([(16, true, false, [394], [22, 276], 61)], 0, E236S122.L15),
([(16, true, false, [394], [22, 276], 70)], 0, E236S122.L16),
([(16, true, false, [394], [22, 276], 75)], 0, E236S122.L17),
([(16, true, false, [394], [22, 276], 79)], 0, E236S122.L18),
([(16, true, false, [394], [22, 276], 82)], 0, E236S122.L19),
([(16, true, false, [394], [22, 276], 92)], 0, E236S122.L20),
([(16, true, false, [394], [22, 276], 93)], 0, E236S122.L21),
([(16, true, false, [394], [22, 276], 98)], 0, E236S122.L22),
([(16, true, false, [394], [22, 276], 107)], 0, E236S122.L23),
([(16, true, false, [394], [22, 276], 124)], 0, E236S122.L24),
([(16, true, false, [394], [22, 276], 133)], 0, E236S122.L25),
([(16, true, false, [394], [22, 276], 136)], 0, E236S122.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E236S122
