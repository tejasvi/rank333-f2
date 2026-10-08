module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E390S0 "data/lean/34eac3a6b052ff12e2366dc9027e79bd/E390S0.bin"
namespace E390S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [], [], 1)], 0, E390S0.L1),
([(7, true, false, [], [], 5)], 0, E390S0.L2),
([(7, true, false, [], [], 18)], 0, E390S0.L3),
([(7, true, false, [], [], 32)], 0, E390S0.L4),
([(7, true, false, [], [], 49)], 0, E390S0.L5),
([(7, true, false, [], [], 50)], 0, E390S0.L6),
([(7, true, false, [], [], 52)], 0, E390S0.L7),
([(7, true, false, [], [], 53)], 0, E390S0.L8),
([(7, true, false, [], [], 55)], 0, E390S0.L9),
([(7, true, false, [], [], 56)], 0, E390S0.L10),
([(7, true, false, [], [], 60)], 0, E390S0.L11),
([(7, true, false, [], [], 62)], 0, E390S0.L12),
([(7, true, false, [], [], 83)], 0, E390S0.L13),
([(7, true, false, [], [], 92)], 0, E390S0.L14),
([(7, true, false, [], [], 98)], 0, E390S0.L15),
([(7, true, false, [], [], 103)], 0, E390S0.L16),
([(7, true, false, [], [], 104)], 0, E390S0.L17),
([(7, true, false, [], [], 110)], 0, E390S0.L18),
([(7, true, false, [], [], 111)], 0, E390S0.L19),
([(7, true, false, [], [], 112)], 0, E390S0.L20),
([(7, true, false, [], [], 114)], 0, E390S0.L21),
([(7, true, false, [], [], 116)], 0, E390S0.L22),
([(7, true, false, [], [], 125)], 0, E390S0.L23),
([(7, true, false, [], [], 130)], 0, E390S0.L24),
([(7, true, false, [], [], 142)], 0, E390S0.L25),
([(7, true, false, [], [], 154)], 0, E390S0.L26),
([(7, true, false, [], [], 155)], 0, E390S0.L27),
([(7, true, false, [], [], 322)], 0, E390S0.L28),
([(7, true, false, [], [], 323)], 0, E390S0.L29),
([(7, true, false, [], [], 329)], 0, E390S0.L30),
([(7, true, false, [], [], 348)], 0, E390S0.L31),
([(7, true, false, [], [], 595)], 0, E390S0.L32),
([(7, true, false, [], [], 601)], 0, E390S0.L33),
([(7, true, false, [], [], 602)], 0, E390S0.L34),
([(7, true, false, [], [], 644)], 0, E390S0.L35),
([(7, true, false, [], [], 645)], 0, E390S0.L36),
([(7, true, false, [], [], 649)], 0, E390S0.L37),
([(7, true, false, [], [], 658)], 0, E390S0.L38),
([(7, true, false, [], [], 671)], 0, E390S0.L39),
([(7, true, false, [], [], 708)], 0, E390S0.L40),
([(7, true, false, [], [], 868)], 0, E390S0.L41),
([(7, true, false, [], [], 875)], 0, E390S0.L42),
([(7, true, false, [], [], 876)], 0, E390S0.L43),
([(7, true, false, [], [], 931)], 0, E390S0.L44),
([(7, true, false, [], [], 1218)], 0, E390S0.L45),
([(7, true, false, [], [], 1219)], 0, E390S0.L46),
([(7, true, false, [], [], 1226)], 0, E390S0.L47),
([(7, true, false, [], [], 1233)], 0, E390S0.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E390S0
