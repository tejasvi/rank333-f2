module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S13 "data/lean/3b9bc0bd8d6401e65944f93f91314725/E343S13.bin"
namespace E343S13
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(16, true, false, [], [], 6)], 53, 0, E343S13.L1),
([(16, true, false, [], [], 54)], 53, 0, E343S13.L2),
([(16, true, false, [], [], 81)], 53, 0, E343S13.L3),
([(16, true, false, [], [], 101)], 53, 0, E343S13.L4),
([(16, true, false, [], [], 103)], 53, 0, E343S13.L5),
([(16, true, false, [], [], 130)], 53, 0, E343S13.L6),
([(16, true, false, [], [], 328)], 53, 0, E343S13.L7),
([(16, true, false, [], [], 354)], 53, 0, E343S13.L8),
([(16, true, false, [], [], 356)], 53, 0, E343S13.L9),
([(16, true, false, [], [], 371)], 53, 0, E343S13.L10),
([(16, true, false, [], [], 372)], 53, 0, E343S13.L11),
([(16, true, false, [], [], 374)], 53, 0, E343S13.L12),
([(16, true, false, [], [], 376)], 53, 0, E343S13.L13),
([(16, true, false, [], [], 377)], 53, 0, E343S13.L14),
([(16, true, false, [], [], 378)], 53, 0, E343S13.L15),
([(16, true, false, [], [], 383)], 53, 0, E343S13.L16),
([(16, true, false, [], [], 384)], 53, 0, E343S13.L17),
([(16, true, false, [], [], 387)], 53, 0, E343S13.L18),
([(16, true, false, [], [], 389)], 53, 0, E343S13.L19),
([(16, true, false, [], [], 403)], 53, 0, E343S13.L20),
([(16, true, false, [], [], 404)], 53, 0, E343S13.L21),
([(16, true, false, [], [], 595)], 53, 0, E343S13.L22),
([(16, true, false, [], [], 596)], 53, 0, E343S13.L23),
([(16, true, false, [], [], 598)], 53, 0, E343S13.L24),
([(16, true, false, [], [], 599)], 53, 0, E343S13.L25),
([(16, true, false, [], [], 600)], 53, 0, E343S13.L26),
([(16, true, false, [], [], 601)], 53, 0, E343S13.L27),
([(16, true, false, [], [], 602)], 53, 0, E343S13.L28),
([(16, true, false, [], [], 607)], 53, 0, E343S13.L29),
([(16, true, false, [], [], 608)], 53, 0, E343S13.L30),
([(16, true, false, [], [], 609)], 53, 0, E343S13.L31),
([(16, true, false, [], [], 611)], 53, 0, E343S13.L32),
([(16, true, false, [], [], 612)], 53, 0, E343S13.L33),
([(16, true, false, [], [], 613)], 53, 0, E343S13.L34),
([(16, true, false, [], [], 616)], 53, 0, E343S13.L35),
([(16, true, false, [], [], 619)], 53, 0, E343S13.L36),
([(16, true, false, [], [], 620)], 53, 0, E343S13.L37),
([(16, true, false, [], [], 622)], 53, 0, E343S13.L38),
([(16, true, false, [], [], 627)], 53, 0, E343S13.L39),
([(16, true, false, [], [], 628)], 53, 0, E343S13.L40),
([(16, true, false, [], [], 629)], 53, 0, E343S13.L41),
([(16, true, false, [], [], 638)], 53, 0, E343S13.L42),
([(16, true, false, [], [], 639)], 53, 0, E343S13.L43),
([(16, true, false, [], [], 647)], 53, 0, E343S13.L44),
([(16, true, false, [], [], 669)], 53, 0, E343S13.L45),
([(16, true, false, [], [], 915)], 53, 0, E343S13.L46),
([(16, true, false, [], [], 921)], 53, 0, E343S13.L47),
([(16, true, false, [], [], 1038)], 53, 0, E343S13.L48),
([(16, true, false, [], [], 1398)], 53, 0, E343S13.L49),
([(16, true, false, [], [], 1424)], 53, 0, E343S13.L50),
([(16, true, false, [], [], 1440)], 53, 0, E343S13.L51),
([(16, true, false, [], [], 1446)], 53, 0, E343S13.L52),
([(16, true, false, [], [], 1563)], 53, 0, E343S13.L53)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 53
end E343S13
