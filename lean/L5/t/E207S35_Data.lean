module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S35 "data/lean/c7be64202229e7c7b4dc60d72da8fb40/E207S35.bin"
namespace E207S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [334, 426], [68], 10)], 0, E207S35.L1),
([(9, true, false, [334, 426], [68], 11)], 0, E207S35.L2),
([(9, true, false, [334, 426], [68], 12)], 0, E207S35.L3),
([(9, true, false, [334, 426], [68], 14)], 0, E207S35.L4),
([(9, true, false, [334, 426], [68], 16)], 0, E207S35.L5),
([(9, true, false, [334, 426], [68], 20)], 0, E207S35.L6),
([(9, true, false, [334, 426], [68], 22)], 0, E207S35.L7),
([(9, true, false, [334, 426], [68], 24)], 0, E207S35.L8),
([(9, true, false, [334, 426], [68], 26)], 0, E207S35.L9),
([(9, true, false, [334, 426], [68], 27)], 0, E207S35.L10),
([(9, true, false, [334, 426], [68], 29)], 0, E207S35.L11),
([(9, true, false, [334, 426], [68], 30)], 0, E207S35.L12),
([(9, true, false, [334, 426], [68], 32)], 0, E207S35.L13),
([(9, true, false, [334, 426], [68], 34)], 0, E207S35.L14),
([(9, true, false, [334, 426], [68], 36)], 0, E207S35.L15),
([(9, true, false, [334, 426], [68], 43)], 0, E207S35.L16),
([(9, true, false, [334, 426], [68], 51)], 0, E207S35.L17),
([(9, true, false, [334, 426], [68], 53)], 0, E207S35.L18),
([(9, true, false, [334, 426], [68], 55)], 0, E207S35.L19),
([(9, true, false, [334, 426], [68], 65)], 0, E207S35.L20),
([(9, true, false, [334, 426], [68], 89)], 0, E207S35.L21),
([(9, true, false, [334, 426], [68], 97)], 0, E207S35.L22),
([(9, true, false, [334, 426], [68], 98)], 0, E207S35.L23),
([(9, true, false, [334, 426], [68], 104)], 0, E207S35.L24),
([(9, true, false, [334, 426], [68], 119)], 0, E207S35.L25),
([(9, true, false, [334, 426], [68], 135)], 0, E207S35.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E207S35
