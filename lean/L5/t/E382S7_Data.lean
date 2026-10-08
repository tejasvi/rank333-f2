module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E382S7 "data/lean/92a3ca92803252919cb5731880bd9685/E382S7.bin"
namespace E382S7
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [], [], 2)], 0, E382S7.L1),
([(13, true, false, [], [], 6)], 0, E382S7.L2),
([(13, true, false, [], [], 20)], 0, E382S7.L3),
([(13, true, false, [], [], 34)], 0, E382S7.L4),
([(13, true, false, [], [], 55)], 0, E382S7.L5),
([(13, true, false, [], [], 83)], 0, E382S7.L6),
([(13, true, false, [], [], 127)], 0, E382S7.L7),
([(13, true, false, [], [], 326)], 0, E382S7.L8),
([(13, true, false, [], [], 327)], 0, E382S7.L9),
([(13, true, false, [], [], 328)], 0, E382S7.L10),
([(13, true, false, [], [], 334)], 0, E382S7.L11),
([(13, true, false, [], [], 355)], 0, E382S7.L12),
([(13, true, false, [], [], 365)], 0, E382S7.L13),
([(13, true, false, [], [], 371)], 0, E382S7.L14),
([(13, true, false, [], [], 373)], 0, E382S7.L15),
([(13, true, false, [], [], 374)], 0, E382S7.L16),
([(13, true, false, [], [], 375)], 0, E382S7.L17),
([(13, true, false, [], [], 376)], 0, E382S7.L18),
([(13, true, false, [], [], 377)], 0, E382S7.L19),
([(13, true, false, [], [], 381)], 0, E382S7.L20),
([(13, true, false, [], [], 382)], 0, E382S7.L21),
([(13, true, false, [], [], 383)], 0, E382S7.L22),
([(13, true, false, [], [], 384)], 0, E382S7.L23),
([(13, true, false, [], [], 387)], 0, E382S7.L24),
([(13, true, false, [], [], 388)], 0, E382S7.L25),
([(13, true, false, [], [], 389)], 0, E382S7.L26),
([(13, true, false, [], [], 391)], 0, E382S7.L27),
([(13, true, false, [], [], 392)], 0, E382S7.L28),
([(13, true, false, [], [], 393)], 0, E382S7.L29),
([(13, true, false, [], [], 394)], 0, E382S7.L30),
([(13, true, false, [], [], 395)], 0, E382S7.L31),
([(13, true, false, [], [], 399)], 0, E382S7.L32),
([(13, true, false, [], [], 404)], 0, E382S7.L33),
([(13, true, false, [], [], 405)], 0, E382S7.L34),
([(13, true, false, [], [], 407)], 0, E382S7.L35),
([(13, true, false, [], [], 408)], 0, E382S7.L36),
([(13, true, false, [], [], 409)], 0, E382S7.L37),
([(13, true, false, [], [], 410)], 0, E382S7.L38),
([(13, true, false, [], [], 418)], 0, E382S7.L39),
([(13, true, false, [], [], 426)], 0, E382S7.L40),
([(13, true, false, [], [], 475)], 0, E382S7.L41),
([(13, true, false, [], [], 482)], 0, E382S7.L42),
([(13, true, false, [], [], 594)], 0, E382S7.L43),
([(13, true, false, [], [], 597)], 0, E382S7.L44),
([(13, true, false, [], [], 599)], 0, E382S7.L45),
([(13, true, false, [], [], 644)], 0, E382S7.L46),
([(13, true, false, [], [], 648)], 0, E382S7.L47),
([(13, true, false, [], [], 650)], 0, E382S7.L48),
([(13, true, false, [], [], 654)], 0, E382S7.L49),
([(13, true, false, [], [], 655)], 0, E382S7.L50),
([(13, true, false, [], [], 670)], 0, E382S7.L51),
([(13, true, false, [], [], 697)], 0, E382S7.L52),
([(13, true, false, [], [], 699)], 0, E382S7.L53),
([(13, true, false, [], [], 755)], 0, E382S7.L54),
([(13, true, false, [], [], 874)], 0, E382S7.L55),
([(13, true, false, [], [], 930)], 0, E382S7.L56),
([(13, true, false, [], [], 1049)], 0, E382S7.L57),
([(13, true, false, [], [], 1098)], 0, E382S7.L58),
([(13, true, false, [], [], 1105)], 0, E382S7.L59),
([(13, true, false, [], [], 1224)], 0, E382S7.L60),
([(13, true, false, [], [], 1280)], 0, E382S7.L61),
([(13, true, false, [], [], 1399)], 0, E382S7.L62),
([(13, true, false, [], [], 1455)], 0, E382S7.L63),
([(13, true, false, [], [], 1574)], 0, E382S7.L64),
([(13, true, false, [], [], 1630)], 0, E382S7.L65),
([(13, true, false, [], [], 2022)], 0, E382S7.L66),
([(13, true, false, [], [], 2078)], 0, E382S7.L67)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 67
end E382S7
