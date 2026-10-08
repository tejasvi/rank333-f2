module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S24 "data/lean/b5d71310cefe9d753fc5689dfe41e304/E207S24.bin"
namespace E207S24
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [266], [80, 160], 1)], 0, E207S24.L1),
([(15, true, false, [266], [80, 160], 2)], 0, E207S24.L2),
([(15, true, false, [266], [80, 160], 24)], 0, E207S24.L3),
([(15, true, false, [266], [80, 160], 27)], 0, E207S24.L4),
([(15, true, false, [266], [80, 160], 29)], 0, E207S24.L5),
([(15, true, false, [266], [80, 160], 31)], 0, E207S24.L6),
([(15, true, false, [266], [80, 160], 32)], 0, E207S24.L7),
([(15, true, false, [266], [80, 160], 34)], 0, E207S24.L8),
([(15, true, false, [266], [80, 160], 36)], 0, E207S24.L9),
([(15, true, false, [266], [80, 160], 39)], 0, E207S24.L10),
([(15, true, false, [266], [80, 160], 40)], 0, E207S24.L11),
([(15, true, false, [266], [80, 160], 41)], 0, E207S24.L12),
([(15, true, false, [266], [80, 160], 42)], 0, E207S24.L13),
([(15, true, false, [266], [80, 160], 43)], 0, E207S24.L14),
([(15, true, false, [266], [80, 160], 48)], 0, E207S24.L15),
([(15, true, false, [266], [80, 160], 62)], 0, E207S24.L16),
([(15, true, false, [266], [80, 160], 64)], 0, E207S24.L17),
([(15, true, false, [266], [80, 160], 66)], 0, E207S24.L18),
([(15, true, false, [266], [80, 160], 69)], 0, E207S24.L19),
([(15, true, false, [266], [80, 160], 70)], 0, E207S24.L20),
([(15, true, false, [266], [80, 160], 84)], 0, E207S24.L21),
([(15, true, false, [266], [80, 160], 85)], 0, E207S24.L22),
([(15, true, false, [266], [80, 160], 87)], 0, E207S24.L23),
([(15, true, false, [266], [80, 160], 88)], 0, E207S24.L24),
([(15, true, false, [266], [80, 160], 90)], 0, E207S24.L25),
([(15, true, false, [266], [80, 160], 93)], 0, E207S24.L26),
([(15, true, false, [266], [80, 160], 94)], 0, E207S24.L27),
([(15, true, false, [266], [80, 160], 108)], 0, E207S24.L28),
([(15, true, false, [266], [80, 160], 110)], 0, E207S24.L29),
([(15, true, false, [266], [80, 160], 111)], 0, E207S24.L30),
([(15, true, false, [266], [80, 160], 113)], 0, E207S24.L31),
([(15, true, false, [266], [80, 160], 118)], 0, E207S24.L32),
([(15, true, false, [266], [80, 160], 120)], 0, E207S24.L33),
([(15, true, false, [266], [80, 160], 121)], 0, E207S24.L34),
([(15, true, false, [266], [80, 160], 127)], 0, E207S24.L35),
([(15, true, false, [266], [80, 160], 136)], 0, E207S24.L36),
([(15, true, false, [266], [80, 160], 140)], 0, E207S24.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E207S24
