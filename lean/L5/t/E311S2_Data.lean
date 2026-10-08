module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E311S2 "data/lean/be79f00053aae7140432b6e97254b848/E311S2.bin"
namespace E311S2
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(5, true, false, [], [], 1)], 20, 0, E311S2.L1),
([(5, true, false, [], [], 3)], 20, 0, E311S2.L2),
([(5, true, false, [], [], 4)], 20, 0, E311S2.L3),
([(5, true, false, [], [], 6)], 20, 0, E311S2.L4),
([(5, true, false, [], [], 17)], 20, 0, E311S2.L5),
([(5, true, false, [], [], 21)], 20, 0, E311S2.L6),
([(5, true, false, [], [], 30)], 20, 0, E311S2.L7),
([(5, true, false, [], [], 99)], 20, 0, E311S2.L8),
([(5, true, false, [], [], 101)], 20, 0, E311S2.L9),
([(5, true, false, [], [], 323)], 20, 0, E311S2.L10),
([(5, true, false, [], [], 374)], 20, 0, E311S2.L11),
([(5, true, false, [], [], 455)], 20, 0, E311S2.L12),
([(5, true, false, [], [], 645)], 20, 0, E311S2.L13),
([(5, true, false, [], [], 647)], 20, 0, E311S2.L14),
([(5, true, false, [], [], 708)], 20, 0, E311S2.L15),
([(5, true, false, [], [], 710)], 20, 0, E311S2.L16),
([(5, true, false, [], [], 724)], 20, 0, E311S2.L17),
([(5, true, false, [], [], 728)], 20, 0, E311S2.L18),
([(5, true, false, [], [], 1233)], 20, 0, E311S2.L19),
([(5, true, false, [], [], 1408)], 20, 0, E311S2.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E311S2
