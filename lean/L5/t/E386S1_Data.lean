module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E386S1 "data/lean/bd6209de28e64ce295929420fd0f8cac/E386S1.bin"
namespace E386S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [], [], 1)], 0, E386S1.L1),
([(10, true, false, [], [], 3)], 0, E386S1.L2),
([(10, true, false, [], [], 4)], 0, E386S1.L3),
([(10, true, false, [], [], 5)], 0, E386S1.L4),
([(10, true, false, [], [], 14)], 0, E386S1.L5),
([(10, true, false, [], [], 16)], 0, E386S1.L6),
([(10, true, false, [], [], 29)], 0, E386S1.L7),
([(10, true, false, [], [], 32)], 0, E386S1.L8),
([(10, true, false, [], [], 49)], 0, E386S1.L9),
([(10, true, false, [], [], 53)], 0, E386S1.L10),
([(10, true, false, [], [], 55)], 0, E386S1.L11),
([(10, true, false, [], [], 56)], 0, E386S1.L12),
([(10, true, false, [], [], 60)], 0, E386S1.L13),
([(10, true, false, [], [], 66)], 0, E386S1.L14),
([(10, true, false, [], [], 78)], 0, E386S1.L15),
([(10, true, false, [], [], 83)], 0, E386S1.L16),
([(10, true, false, [], [], 103)], 0, E386S1.L17),
([(10, true, false, [], [], 130)], 0, E386S1.L18),
([(10, true, false, [], [], 322)], 0, E386S1.L19),
([(10, true, false, [], [], 326)], 0, E386S1.L20),
([(10, true, false, [], [], 327)], 0, E386S1.L21),
([(10, true, false, [], [], 329)], 0, E386S1.L22),
([(10, true, false, [], [], 599)], 0, E386S1.L23),
([(10, true, false, [], [], 624)], 0, E386S1.L24),
([(10, true, false, [], [], 645)], 0, E386S1.L25),
([(10, true, false, [], [], 647)], 0, E386S1.L26),
([(10, true, false, [], [], 648)], 0, E386S1.L27),
([(10, true, false, [], [], 649)], 0, E386S1.L28),
([(10, true, false, [], [], 660)], 0, E386S1.L29),
([(10, true, false, [], [], 662)], 0, E386S1.L30),
([(10, true, false, [], [], 669)], 0, E386S1.L31),
([(10, true, false, [], [], 671)], 0, E386S1.L32),
([(10, true, false, [], [], 673)], 0, E386S1.L33),
([(10, true, false, [], [], 697)], 0, E386S1.L34),
([(10, true, false, [], [], 732)], 0, E386S1.L35),
([(10, true, false, [], [], 737)], 0, E386S1.L36),
([(10, true, false, [], [], 856)], 0, E386S1.L37),
([(10, true, false, [], [], 872)], 0, E386S1.L38),
([(10, true, false, [], [], 907)], 0, E386S1.L39),
([(10, true, false, [], [], 912)], 0, E386S1.L40),
([(10, true, false, [], [], 1222)], 0, E386S1.L41),
([(10, true, false, [], [], 1223)], 0, E386S1.L42),
([(10, true, false, [], [], 1262)], 0, E386S1.L43),
([(10, true, false, [], [], 1271)], 0, E386S1.L44)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 44
end E386S1
