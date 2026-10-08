module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S45 "data/lean/96e03352fcdf87b570c95fce010769a8/E207S45.bin"
namespace E207S45
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [346, 426], [68], 1)], 0, E207S45.L1),
([(7, true, false, [346, 426], [68], 2)], 0, E207S45.L2),
([(7, true, false, [346, 426], [68], 3)], 0, E207S45.L3),
([(7, true, false, [346, 426], [68], 5)], 0, E207S45.L4),
([(7, true, false, [346, 426], [68], 9)], 0, E207S45.L5),
([(7, true, false, [346, 426], [68], 13)], 0, E207S45.L6),
([(7, true, false, [346, 426], [68], 21)], 0, E207S45.L7),
([(7, true, false, [346, 426], [68], 36)], 0, E207S45.L8),
([(7, true, false, [346, 426], [68], 37)], 0, E207S45.L9),
([(7, true, false, [346, 426], [68], 39)], 0, E207S45.L10),
([(7, true, false, [346, 426], [68], 43)], 0, E207S45.L11),
([(7, true, false, [346, 426], [68], 45)], 0, E207S45.L12),
([(7, true, false, [346, 426], [68], 48)], 0, E207S45.L13),
([(7, true, false, [346, 426], [68], 50)], 0, E207S45.L14),
([(7, true, false, [346, 426], [68], 55)], 0, E207S45.L15),
([(7, true, false, [346, 426], [68], 56)], 0, E207S45.L16),
([(7, true, false, [346, 426], [68], 60)], 0, E207S45.L17),
([(7, true, false, [346, 426], [68], 76)], 0, E207S45.L18),
([(7, true, false, [346, 426], [68], 77)], 0, E207S45.L19),
([(7, true, false, [346, 426], [68], 82)], 0, E207S45.L20),
([(7, true, false, [346, 426], [68], 84)], 0, E207S45.L21),
([(7, true, false, [346, 426], [68], 94)], 0, E207S45.L22),
([(7, true, false, [346, 426], [68], 96)], 0, E207S45.L23),
([(7, true, false, [346, 426], [68], 117)], 0, E207S45.L24),
([(7, true, false, [346, 426], [68], 119)], 0, E207S45.L25),
([(7, true, false, [346, 426], [68], 152)], 0, E207S45.L26),
([(7, true, false, [346, 426], [68], 164)], 0, E207S45.L27),
([(7, true, false, [346, 426], [68], 165)], 0, E207S45.L28),
([(7, true, false, [346, 426], [68], 166)], 0, E207S45.L29),
([(7, true, false, [346, 426], [68], 167)], 0, E207S45.L30),
([(7, true, false, [346, 426], [68], 169)], 0, E207S45.L31),
([(7, true, false, [346, 426], [68], 176)], 0, E207S45.L32),
([(7, true, false, [346, 426], [68], 186)], 0, E207S45.L33),
([(7, true, false, [346, 426], [68], 192)], 0, E207S45.L34),
([(7, true, false, [346, 426], [68], 193)], 0, E207S45.L35)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 35
end E207S45
