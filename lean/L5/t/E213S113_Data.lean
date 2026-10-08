module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S113 "data/lean/324057d7cf95e8e82ada844e7d9308f3/E213S113.bin"
namespace E213S113
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [158], [272], 0)], 0, E213S113.L1),
([(14, true, false, [158], [272], 3)], 0, E213S113.L2),
([(14, true, false, [158], [272], 4)], 0, E213S113.L3),
([(14, true, false, [158], [272], 6)], 0, E213S113.L4),
([(14, true, false, [158], [272], 12)], 0, E213S113.L5),
([(14, true, false, [158], [272], 14)], 0, E213S113.L6),
([(14, true, false, [158], [272], 24)], 0, E213S113.L7),
([(14, true, false, [158], [272], 25)], 0, E213S113.L8),
([(14, true, false, [158], [272], 26)], 0, E213S113.L9),
([(14, true, false, [158], [272], 28)], 0, E213S113.L10),
([(14, true, false, [158], [272], 30)], 0, E213S113.L11),
([(14, true, false, [158], [272], 31)], 0, E213S113.L12),
([(14, true, false, [158], [272], 32)], 0, E213S113.L13),
([(14, true, false, [158], [272], 33)], 0, E213S113.L14),
([(14, true, false, [158], [272], 34)], 0, E213S113.L15),
([(14, true, false, [158], [272], 35)], 0, E213S113.L16),
([(14, true, false, [158], [272], 36)], 0, E213S113.L17),
([(14, true, false, [158], [272], 39)], 0, E213S113.L18),
([(14, true, false, [158], [272], 40)], 0, E213S113.L19),
([(14, true, false, [158], [272], 41)], 0, E213S113.L20),
([(14, true, false, [158], [272], 68)], 0, E213S113.L21),
([(14, true, false, [158], [272], 80)], 0, E213S113.L22),
([(14, true, false, [158], [272], 81)], 0, E213S113.L23),
([(14, true, false, [158], [272], 82)], 0, E213S113.L24),
([(14, true, false, [158], [272], 84)], 0, E213S113.L25),
([(14, true, false, [158], [272], 85)], 0, E213S113.L26),
([(14, true, false, [158], [272], 87)], 0, E213S113.L27),
([(14, true, false, [158], [272], 88)], 0, E213S113.L28),
([(14, true, false, [158], [272], 90)], 0, E213S113.L29),
([(14, true, false, [158], [272], 96)], 0, E213S113.L30),
([(14, true, false, [158], [272], 100)], 0, E213S113.L31),
([(14, true, false, [158], [272], 104)], 0, E213S113.L32),
([(14, true, false, [158], [272], 105)], 0, E213S113.L33),
([(14, true, false, [158], [272], 132)], 0, E213S113.L34),
([(14, true, false, [158], [272], 141)], 0, E213S113.L35),
([(14, true, false, [158], [272], 206)], 0, E213S113.L36),
([(14, true, false, [158], [272], 208)], 0, E213S113.L37),
([(14, true, false, [158], [272], 220)], 0, E213S113.L38),
([(14, true, false, [158], [272], 221)], 0, E213S113.L39),
([(14, true, false, [158], [272], 248)], 0, E213S113.L40),
([(14, true, false, [158], [272], 252)], 0, E213S113.L41),
([(14, true, false, [158], [272], 254)], 0, E213S113.L42),
([(14, true, false, [158], [272], 255)], 0, E213S113.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E213S113
