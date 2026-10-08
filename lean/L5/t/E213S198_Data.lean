module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S198 "data/lean/27aaf15082e3e7cb101e4b08600e69cc/E213S198.bin"
namespace E213S198
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [494], [272, 388], 1)], 0, E213S198.L1),
([(12, true, false, [494], [272, 388], 3)], 0, E213S198.L2),
([(12, true, false, [494], [272, 388], 5)], 0, E213S198.L3),
([(12, true, false, [494], [272, 388], 6)], 0, E213S198.L4),
([(12, true, false, [494], [272, 388], 7)], 0, E213S198.L5),
([(12, true, false, [494], [272, 388], 10)], 0, E213S198.L6),
([(12, true, false, [494], [272, 388], 13)], 0, E213S198.L7),
([(12, true, false, [494], [272, 388], 15)], 0, E213S198.L8),
([(12, true, false, [494], [272, 388], 18)], 0, E213S198.L9),
([(12, true, false, [494], [272, 388], 19)], 0, E213S198.L10),
([(12, true, false, [494], [272, 388], 20)], 0, E213S198.L11),
([(12, true, false, [494], [272, 388], 23)], 0, E213S198.L12),
([(12, true, false, [494], [272, 388], 25)], 0, E213S198.L13),
([(12, true, false, [494], [272, 388], 27)], 0, E213S198.L14),
([(12, true, false, [494], [272, 388], 31)], 0, E213S198.L15),
([(12, true, false, [494], [272, 388], 35)], 0, E213S198.L16),
([(12, true, false, [494], [272, 388], 47)], 0, E213S198.L17),
([(12, true, false, [494], [272, 388], 50)], 0, E213S198.L18),
([(12, true, false, [494], [272, 388], 68)], 0, E213S198.L19),
([(12, true, false, [494], [272, 388], 69)], 0, E213S198.L20),
([(12, true, false, [494], [272, 388], 70)], 0, E213S198.L21),
([(12, true, false, [494], [272, 388], 74)], 0, E213S198.L22),
([(12, true, false, [494], [272, 388], 76)], 0, E213S198.L23),
([(12, true, false, [494], [272, 388], 77)], 0, E213S198.L24),
([(12, true, false, [494], [272, 388], 84)], 0, E213S198.L25),
([(12, true, false, [494], [272, 388], 87)], 0, E213S198.L26),
([(12, true, false, [494], [272, 388], 90)], 0, E213S198.L27),
([(12, true, false, [494], [272, 388], 93)], 0, E213S198.L28),
([(12, true, false, [494], [272, 388], 100)], 0, E213S198.L29),
([(12, true, false, [494], [272, 388], 103)], 0, E213S198.L30),
([(12, true, false, [494], [272, 388], 106)], 0, E213S198.L31),
([(12, true, false, [494], [272, 388], 107)], 0, E213S198.L32),
([(12, true, false, [494], [272, 388], 110)], 0, E213S198.L33),
([(12, true, false, [494], [272, 388], 115)], 0, E213S198.L34),
([(12, true, false, [494], [272, 388], 122)], 0, E213S198.L35),
([(12, true, false, [494], [272, 388], 123)], 0, E213S198.L36),
([(12, true, false, [494], [272, 388], 125)], 0, E213S198.L37),
([(12, true, false, [494], [272, 388], 142)], 0, E213S198.L38),
([(12, true, false, [494], [272, 388], 146)], 0, E213S198.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E213S198
