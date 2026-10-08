module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E407S2 "data/lean/39ff6ee4994925dec36e81da0807a855/E407S2.bin"
namespace E407S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(17, true, false, [], [], 1)], 0, E407S2.L1),
([(17, true, false, [], [], 5)], 0, E407S2.L2),
([(17, true, false, [], [], 49)], 0, E407S2.L3),
([(17, true, false, [], [], 53)], 0, E407S2.L4),
([(17, true, false, [], [], 78)], 0, E407S2.L5),
([(17, true, false, [], [], 81)], 0, E407S2.L6),
([(17, true, false, [], [], 372)], 0, E407S2.L7),
([(17, true, false, [], [], 385)], 0, E407S2.L8),
([(17, true, false, [], [], 595)], 0, E407S2.L9),
([(17, true, false, [], [], 600)], 0, E407S2.L10),
([(17, true, false, [], [], 601)], 0, E407S2.L11),
([(17, true, false, [], [], 609)], 0, E407S2.L12),
([(17, true, false, [], [], 629)], 0, E407S2.L13),
([(17, true, false, [], [], 649)], 0, E407S2.L14),
([(17, true, false, [], [], 676)], 0, E407S2.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E407S2
