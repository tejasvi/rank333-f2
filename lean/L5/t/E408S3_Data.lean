module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E408S3 "data/lean/ae8573d37d18782591c17a723dfd8d55/E408S3.bin"
namespace E408S3
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [], [], 0)], 0, E408S3.L1),
([(15, true, false, [], [], 3)], 0, E408S3.L2),
([(15, true, false, [], [], 4)], 0, E408S3.L3),
([(15, true, false, [], [], 5)], 0, E408S3.L4),
([(15, true, false, [], [], 7)], 0, E408S3.L5),
([(15, true, false, [], [], 29)], 0, E408S3.L6),
([(15, true, false, [], [], 32)], 0, E408S3.L7),
([(15, true, false, [], [], 50)], 0, E408S3.L8),
([(15, true, false, [], [], 54)], 0, E408S3.L9),
([(15, true, false, [], [], 55)], 0, E408S3.L10),
([(15, true, false, [], [], 63)], 0, E408S3.L11),
([(15, true, false, [], [], 76)], 0, E408S3.L12),
([(15, true, false, [], [], 81)], 0, E408S3.L13),
([(15, true, false, [], [], 83)], 0, E408S3.L14),
([(15, true, false, [], [], 102)], 0, E408S3.L15),
([(15, true, false, [], [], 104)], 0, E408S3.L16),
([(15, true, false, [], [], 127)], 0, E408S3.L17),
([(15, true, false, [], [], 132)], 0, E408S3.L18),
([(15, true, false, [], [], 194)], 0, E408S3.L19),
([(15, true, false, [], [], 200)], 0, E408S3.L20),
([(15, true, false, [], [], 372)], 0, E408S3.L21),
([(15, true, false, [], [], 375)], 0, E408S3.L22),
([(15, true, false, [], [], 376)], 0, E408S3.L23),
([(15, true, false, [], [], 377)], 0, E408S3.L24),
([(15, true, false, [], [], 403)], 0, E408S3.L25),
([(15, true, false, [], [], 405)], 0, E408S3.L26),
([(15, true, false, [], [], 425)], 0, E408S3.L27),
([(15, true, false, [], [], 467)], 0, E408S3.L28),
([(15, true, false, [], [], 599)], 0, E408S3.L29),
([(15, true, false, [], [], 600)], 0, E408S3.L30),
([(15, true, false, [], [], 624)], 0, E408S3.L31),
([(15, true, false, [], [], 627)], 0, E408S3.L32),
([(15, true, false, [], [], 645)], 0, E408S3.L33),
([(15, true, false, [], [], 647)], 0, E408S3.L34),
([(15, true, false, [], [], 648)], 0, E408S3.L35),
([(15, true, false, [], [], 649)], 0, E408S3.L36),
([(15, true, false, [], [], 658)], 0, E408S3.L37),
([(15, true, false, [], [], 660)], 0, E408S3.L38),
([(15, true, false, [], [], 662)], 0, E408S3.L39),
([(15, true, false, [], [], 673)], 0, E408S3.L40),
([(15, true, false, [], [], 676)], 0, E408S3.L41),
([(15, true, false, [], [], 698)], 0, E408S3.L42),
([(15, true, false, [], [], 740)], 0, E408S3.L43),
([(15, true, false, [], [], 1048)], 0, E408S3.L44),
([(15, true, false, [], [], 1090)], 0, E408S3.L45),
([(15, true, false, [], [], 1096)], 0, E408S3.L46),
([(15, true, false, [], [], 1213)], 0, E408S3.L47),
([(15, true, false, [], [], 1397)], 0, E408S3.L48),
([(15, true, false, [], [], 1432)], 0, E408S3.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 49
end E408S3
