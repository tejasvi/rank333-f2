module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S15 "data/lean/cdc9ff3dbcfac07f2f30b47413c3c63c/E207S15.bin"
namespace E207S15
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [266], [80, 160], 1)], 0, E207S15.L1),
([(7, true, false, [266], [80, 160], 2)], 0, E207S15.L2),
([(7, true, false, [266], [80, 160], 24)], 0, E207S15.L3),
([(7, true, false, [266], [80, 160], 27)], 0, E207S15.L4),
([(7, true, false, [266], [80, 160], 29)], 0, E207S15.L5),
([(7, true, false, [266], [80, 160], 31)], 0, E207S15.L6),
([(7, true, false, [266], [80, 160], 32)], 0, E207S15.L7),
([(7, true, false, [266], [80, 160], 34)], 0, E207S15.L8),
([(7, true, false, [266], [80, 160], 36)], 0, E207S15.L9),
([(7, true, false, [266], [80, 160], 39)], 0, E207S15.L10),
([(7, true, false, [266], [80, 160], 40)], 0, E207S15.L11),
([(7, true, false, [266], [80, 160], 41)], 0, E207S15.L12),
([(7, true, false, [266], [80, 160], 42)], 0, E207S15.L13),
([(7, true, false, [266], [80, 160], 43)], 0, E207S15.L14),
([(7, true, false, [266], [80, 160], 48)], 0, E207S15.L15),
([(7, true, false, [266], [80, 160], 49)], 0, E207S15.L16),
([(7, true, false, [266], [80, 160], 50)], 0, E207S15.L17),
([(7, true, false, [266], [80, 160], 51)], 0, E207S15.L18),
([(7, true, false, [266], [80, 160], 54)], 0, E207S15.L19),
([(7, true, false, [266], [80, 160], 55)], 0, E207S15.L20),
([(7, true, false, [266], [80, 160], 59)], 0, E207S15.L21),
([(7, true, false, [266], [80, 160], 60)], 0, E207S15.L22),
([(7, true, false, [266], [80, 160], 61)], 0, E207S15.L23),
([(7, true, false, [266], [80, 160], 62)], 0, E207S15.L24),
([(7, true, false, [266], [80, 160], 64)], 0, E207S15.L25),
([(7, true, false, [266], [80, 160], 70)], 0, E207S15.L26),
([(7, true, false, [266], [80, 160], 76)], 0, E207S15.L27),
([(7, true, false, [266], [80, 160], 84)], 0, E207S15.L28),
([(7, true, false, [266], [80, 160], 85)], 0, E207S15.L29),
([(7, true, false, [266], [80, 160], 87)], 0, E207S15.L30),
([(7, true, false, [266], [80, 160], 88)], 0, E207S15.L31),
([(7, true, false, [266], [80, 160], 90)], 0, E207S15.L32),
([(7, true, false, [266], [80, 160], 93)], 0, E207S15.L33),
([(7, true, false, [266], [80, 160], 94)], 0, E207S15.L34),
([(7, true, false, [266], [80, 160], 109)], 0, E207S15.L35),
([(7, true, false, [266], [80, 160], 137)], 0, E207S15.L36),
([(7, true, false, [266], [80, 160], 160)], 0, E207S15.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E207S15
