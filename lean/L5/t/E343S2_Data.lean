module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S2 "data/lean/6ad2cc828fbf28cd51d947d3203063fa/E343S2.bin"
namespace E343S2
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(2, true, false, [], [], 49)], 29, 0, E343S2.L1),
([(2, true, false, [], [], 51)], 29, 0, E343S2.L2),
([(2, true, false, [], [], 53)], 29, 0, E343S2.L3),
([(2, true, false, [], [], 55)], 29, 0, E343S2.L4),
([(2, true, false, [], [], 56)], 29, 0, E343S2.L5),
([(2, true, false, [], [], 62)], 29, 0, E343S2.L6),
([(2, true, false, [], [], 71)], 29, 0, E343S2.L7),
([(2, true, false, [], [], 78)], 29, 0, E343S2.L8),
([(2, true, false, [], [], 82)], 29, 0, E343S2.L9),
([(2, true, false, [], [], 98)], 29, 0, E343S2.L10),
([(2, true, false, [], [], 371)], 29, 0, E343S2.L11),
([(2, true, false, [], [], 595)], 29, 0, E343S2.L12),
([(2, true, false, [], [], 599)], 29, 0, E343S2.L13),
([(2, true, false, [], [], 600)], 29, 0, E343S2.L14),
([(2, true, false, [], [], 601)], 29, 0, E343S2.L15),
([(2, true, false, [], [], 608)], 29, 0, E343S2.L16),
([(2, true, false, [], [], 612)], 29, 0, E343S2.L17),
([(2, true, false, [], [], 614)], 29, 0, E343S2.L18),
([(2, true, false, [], [], 624)], 29, 0, E343S2.L19),
([(2, true, false, [], [], 628)], 29, 0, E343S2.L20),
([(2, true, false, [], [], 644)], 29, 0, E343S2.L21),
([(2, true, false, [], [], 648)], 29, 0, E343S2.L22),
([(2, true, false, [], [], 661)], 29, 0, E343S2.L23),
([(2, true, false, [], [], 673)], 29, 0, E343S2.L24),
([(2, true, false, [], [], 872)], 29, 0, E343S2.L25),
([(2, true, false, [], [], 907)], 29, 0, E343S2.L26),
([(2, true, false, [], [], 912)], 29, 0, E343S2.L27),
([(2, true, false, [], [], 1031)], 29, 0, E343S2.L28),
([(2, true, false, [], [], 1051)], 29, 0, E343S2.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E343S2
