module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E408S1 "data/lean/d28f02a113ceaa6a770409df3ddf710d/E408S1.bin"
namespace E408S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [], [], 2)], 0, E408S1.L1),
([(12, true, false, [], [], 3)], 0, E408S1.L2),
([(12, true, false, [], [], 6)], 0, E408S1.L3),
([(12, true, false, [], [], 24)], 0, E408S1.L4),
([(12, true, false, [], [], 34)], 0, E408S1.L5),
([(12, true, false, [], [], 49)], 0, E408S1.L6),
([(12, true, false, [], [], 98)], 0, E408S1.L7),
([(12, true, false, [], [], 104)], 0, E408S1.L8),
([(12, true, false, [], [], 105)], 0, E408S1.L9),
([(12, true, false, [], [], 322)], 0, E408S1.L10),
([(12, true, false, [], [], 325)], 0, E408S1.L11),
([(12, true, false, [], [], 326)], 0, E408S1.L12),
([(12, true, false, [], [], 328)], 0, E408S1.L13),
([(12, true, false, [], [], 332)], 0, E408S1.L14),
([(12, true, false, [], [], 333)], 0, E408S1.L15),
([(12, true, false, [], [], 339)], 0, E408S1.L16),
([(12, true, false, [], [], 343)], 0, E408S1.L17),
([(12, true, false, [], [], 346)], 0, E408S1.L18),
([(12, true, false, [], [], 347)], 0, E408S1.L19),
([(12, true, false, [], [], 348)], 0, E408S1.L20),
([(12, true, false, [], [], 350)], 0, E408S1.L21),
([(12, true, false, [], [], 377)], 0, E408S1.L22),
([(12, true, false, [], [], 405)], 0, E408S1.L23),
([(12, true, false, [], [], 423)], 0, E408S1.L24),
([(12, true, false, [], [], 426)], 0, E408S1.L25),
([(12, true, false, [], [], 451)], 0, E408S1.L26),
([(12, true, false, [], [], 455)], 0, E408S1.L27),
([(12, true, false, [], [], 475)], 0, E408S1.L28),
([(12, true, false, [], [], 482)], 0, E408S1.L29),
([(12, true, false, [], [], 595)], 0, E408S1.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E408S1
