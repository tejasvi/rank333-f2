module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S37 "data/lean/389b9050312b435e97d2023ba502c937/E236S37.bin"
namespace E236S37
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [394, 412], [232], 36)], 0, E236S37.L1),
([(14, true, false, [394, 412], [232], 37)], 0, E236S37.L2),
([(14, true, false, [394, 412], [232], 38)], 0, E236S37.L3),
([(14, true, false, [394, 412], [232], 39)], 0, E236S37.L4),
([(14, true, false, [394, 412], [232], 40)], 0, E236S37.L5),
([(14, true, false, [394, 412], [232], 41)], 0, E236S37.L6),
([(14, true, false, [394, 412], [232], 74)], 0, E236S37.L7),
([(14, true, false, [394, 412], [232], 76)], 0, E236S37.L8),
([(14, true, false, [394, 412], [232], 82)], 0, E236S37.L9),
([(14, true, false, [394, 412], [232], 84)], 0, E236S37.L10),
([(14, true, false, [394, 412], [232], 112)], 0, E236S37.L11),
([(14, true, false, [394, 412], [232], 113)], 0, E236S37.L12),
([(14, true, false, [394, 412], [232], 114)], 0, E236S37.L13),
([(14, true, false, [394, 412], [232], 115)], 0, E236S37.L14),
([(14, true, false, [394, 412], [232], 118)], 0, E236S37.L15),
([(14, true, false, [394, 412], [232], 119)], 0, E236S37.L16),
([(14, true, false, [394, 412], [232], 151)], 0, E236S37.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S37
