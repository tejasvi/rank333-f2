module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S127 "data/lean/32e33be357c65863a3c11e7f7a8a8978/E236S127.bin"
namespace E236S127
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [412, 394], [258], 0)], 0, E236S127.L1),
([(15, true, false, [412, 394], [258], 4)], 0, E236S127.L2),
([(15, true, false, [412, 394], [258], 5)], 0, E236S127.L3),
([(15, true, false, [412, 394], [258], 6)], 0, E236S127.L4),
([(15, true, false, [412, 394], [258], 14)], 0, E236S127.L5),
([(15, true, false, [412, 394], [258], 17)], 0, E236S127.L6),
([(15, true, false, [412, 394], [258], 36)], 0, E236S127.L7),
([(15, true, false, [412, 394], [258], 37)], 0, E236S127.L8),
([(15, true, false, [412, 394], [258], 39)], 0, E236S127.L9),
([(15, true, false, [412, 394], [258], 47)], 0, E236S127.L10),
([(15, true, false, [412, 394], [258], 49)], 0, E236S127.L11),
([(15, true, false, [412, 394], [258], 74)], 0, E236S127.L12),
([(15, true, false, [412, 394], [258], 75)], 0, E236S127.L13),
([(15, true, false, [412, 394], [258], 76)], 0, E236S127.L14),
([(15, true, false, [412, 394], [258], 77)], 0, E236S127.L15),
([(15, true, false, [412, 394], [258], 78)], 0, E236S127.L16),
([(15, true, false, [412, 394], [258], 79)], 0, E236S127.L17),
([(15, true, false, [412, 394], [258], 80)], 0, E236S127.L18),
([(15, true, false, [412, 394], [258], 81)], 0, E236S127.L19),
([(15, true, false, [412, 394], [258], 84)], 0, E236S127.L20),
([(15, true, false, [412, 394], [258], 85)], 0, E236S127.L21),
([(15, true, false, [412, 394], [258], 89)], 0, E236S127.L22),
([(15, true, false, [412, 394], [258], 92)], 0, E236S127.L23),
([(15, true, false, [412, 394], [258], 93)], 0, E236S127.L24),
([(15, true, false, [412, 394], [258], 94)], 0, E236S127.L25),
([(15, true, false, [412, 394], [258], 100)], 0, E236S127.L26),
([(15, true, false, [412, 394], [258], 101)], 0, E236S127.L27),
([(15, true, false, [412, 394], [258], 113)], 0, E236S127.L28),
([(15, true, false, [412, 394], [258], 115)], 0, E236S127.L29),
([(15, true, false, [412, 394], [258], 116)], 0, E236S127.L30),
([(15, true, false, [412, 394], [258], 128)], 0, E236S127.L31),
([(15, true, false, [412, 394], [258], 130)], 0, E236S127.L32),
([(15, true, false, [412, 394], [258], 141)], 0, E236S127.L33),
([(15, true, false, [412, 394], [258], 143)], 0, E236S127.L34),
([(15, true, false, [412, 394], [258], 181)], 0, E236S127.L35),
([(15, true, false, [412, 394], [258], 189)], 0, E236S127.L36)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E236S127
