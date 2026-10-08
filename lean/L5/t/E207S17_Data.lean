module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S17 "data/lean/c0fda0fc95ec039004a6236de999142c/E207S17.bin"
namespace E207S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [346], [80, 240], 1)], 0, E207S17.L1),
([(16, true, false, [346], [80, 240], 4)], 0, E207S17.L2),
([(16, true, false, [346], [80, 240], 6)], 0, E207S17.L3),
([(16, true, false, [346], [80, 240], 16)], 0, E207S17.L4),
([(16, true, false, [346], [80, 240], 25)], 0, E207S17.L5),
([(16, true, false, [346], [80, 240], 27)], 0, E207S17.L6),
([(16, true, false, [346], [80, 240], 28)], 0, E207S17.L7),
([(16, true, false, [346], [80, 240], 30)], 0, E207S17.L8),
([(16, true, false, [346], [80, 240], 32)], 0, E207S17.L9),
([(16, true, false, [346], [80, 240], 35)], 0, E207S17.L10),
([(16, true, false, [346], [80, 240], 58)], 0, E207S17.L11),
([(16, true, false, [346], [80, 240], 60)], 0, E207S17.L12),
([(16, true, false, [346], [80, 240], 61)], 0, E207S17.L13),
([(16, true, false, [346], [80, 240], 80)], 0, E207S17.L14),
([(16, true, false, [346], [80, 240], 82)], 0, E207S17.L15),
([(16, true, false, [346], [80, 240], 83)], 0, E207S17.L16),
([(16, true, false, [346], [80, 240], 87)], 0, E207S17.L17),
([(16, true, false, [346], [80, 240], 88)], 0, E207S17.L18),
([(16, true, false, [346], [80, 240], 89)], 0, E207S17.L19),
([(16, true, false, [346], [80, 240], 121)], 0, E207S17.L20),
([(16, true, false, [346], [80, 240], 124)], 0, E207S17.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E207S17
