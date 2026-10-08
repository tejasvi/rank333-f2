module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S12 "data/lean/76e818851391d6423f7b436886bdea5a/E343S12.bin"
namespace E343S12
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(13, true, false, [], [], 50)], 22, 0, E343S12.L1),
([(13, true, false, [], [], 52)], 22, 0, E343S12.L2),
([(13, true, false, [], [], 54)], 22, 0, E343S12.L3),
([(13, true, false, [], [], 63)], 22, 0, E343S12.L4),
([(13, true, false, [], [], 65)], 22, 0, E343S12.L5),
([(13, true, false, [], [], 67)], 22, 0, E343S12.L6),
([(13, true, false, [], [], 74)], 22, 0, E343S12.L7),
([(13, true, false, [], [], 76)], 22, 0, E343S12.L8),
([(13, true, false, [], [], 81)], 22, 0, E343S12.L9),
([(13, true, false, [], [], 93)], 22, 0, E343S12.L10),
([(13, true, false, [], [], 98)], 22, 0, E343S12.L11),
([(13, true, false, [], [], 99)], 22, 0, E343S12.L12),
([(13, true, false, [], [], 103)], 22, 0, E343S12.L13),
([(13, true, false, [], [], 105)], 22, 0, E343S12.L14),
([(13, true, false, [], [], 322)], 22, 0, E343S12.L15),
([(13, true, false, [], [], 329)], 22, 0, E343S12.L16),
([(13, true, false, [], [], 372)], 22, 0, E343S12.L17),
([(13, true, false, [], [], 378)], 22, 0, E343S12.L18),
([(13, true, false, [], [], 595)], 22, 0, E343S12.L19),
([(13, true, false, [], [], 644)], 22, 0, E343S12.L20),
([(13, true, false, [], [], 1044)], 22, 0, E343S12.L21),
([(13, true, false, [], [], 1408)], 22, 0, E343S12.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E343S12
