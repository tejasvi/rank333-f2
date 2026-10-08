module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E404S1 "data/lean/d433a462b11df9a46c03a1b9e9ed4658/E404S1.bin"
namespace E404S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [], [], 0)], 0, E404S1.L1),
([(2, true, false, [], [], 1)], 0, E404S1.L2),
([(2, true, false, [], [], 4)], 0, E404S1.L3),
([(2, true, false, [], [], 5)], 0, E404S1.L4),
([(2, true, false, [], [], 29)], 0, E404S1.L5),
([(2, true, false, [], [], 50)], 0, E404S1.L6),
([(2, true, false, [], [], 51)], 0, E404S1.L7),
([(2, true, false, [], [], 53)], 0, E404S1.L8),
([(2, true, false, [], [], 54)], 0, E404S1.L9),
([(2, true, false, [], [], 55)], 0, E404S1.L10),
([(2, true, false, [], [], 68)], 0, E404S1.L11),
([(2, true, false, [], [], 71)], 0, E404S1.L12),
([(2, true, false, [], [], 72)], 0, E404S1.L13),
([(2, true, false, [], [], 80)], 0, E404S1.L14),
([(2, true, false, [], [], 81)], 0, E404S1.L15),
([(2, true, false, [], [], 99)], 0, E404S1.L16),
([(2, true, false, [], [], 103)], 0, E404S1.L17),
([(2, true, false, [], [], 104)], 0, E404S1.L18),
([(2, true, false, [], [], 152)], 0, E404S1.L19),
([(2, true, false, [], [], 164)], 0, E404S1.L20),
([(2, true, false, [], [], 194)], 0, E404S1.L21),
([(2, true, false, [], [], 200)], 0, E404S1.L22),
([(2, true, false, [], [], 375)], 0, E404S1.L23),
([(2, true, false, [], [], 596)], 0, E404S1.L24),
([(2, true, false, [], [], 597)], 0, E404S1.L25),
([(2, true, false, [], [], 599)], 0, E404S1.L26),
([(2, true, false, [], [], 600)], 0, E404S1.L27),
([(2, true, false, [], [], 601)], 0, E404S1.L28),
([(2, true, false, [], [], 609)], 0, E404S1.L29),
([(2, true, false, [], [], 612)], 0, E404S1.L30),
([(2, true, false, [], [], 614)], 0, E404S1.L31),
([(2, true, false, [], [], 625)], 0, E404S1.L32),
([(2, true, false, [], [], 626)], 0, E404S1.L33),
([(2, true, false, [], [], 645)], 0, E404S1.L34),
([(2, true, false, [], [], 646)], 0, E404S1.L35),
([(2, true, false, [], [], 649)], 0, E404S1.L36),
([(2, true, false, [], [], 694)], 0, E404S1.L37),
([(2, true, false, [], [], 708)], 0, E404S1.L38),
([(2, true, false, [], [], 746)], 0, E404S1.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E404S1
