module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E335S1 "data/lean/5ce240f332f65b0c887c3558ea372347/E335S1.bin"
namespace E335S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [], [], 0)], 0, E335S1.L1),
([(13, true, false, [], [], 1)], 0, E335S1.L2),
([(13, true, false, [], [], 2)], 0, E335S1.L3),
([(13, true, false, [], [], 3)], 0, E335S1.L4),
([(13, true, false, [], [], 4)], 0, E335S1.L5),
([(13, true, false, [], [], 5)], 0, E335S1.L6),
([(13, true, false, [], [], 7)], 0, E335S1.L7),
([(13, true, false, [], [], 8)], 0, E335S1.L8),
([(13, true, false, [], [], 9)], 0, E335S1.L9),
([(13, true, false, [], [], 10)], 0, E335S1.L10),
([(13, true, false, [], [], 11)], 0, E335S1.L11),
([(13, true, false, [], [], 14)], 0, E335S1.L12),
([(13, true, false, [], [], 20)], 0, E335S1.L13),
([(13, true, false, [], [], 25)], 0, E335S1.L14),
([(13, true, false, [], [], 26)], 0, E335S1.L15),
([(13, true, false, [], [], 28)], 0, E335S1.L16),
([(13, true, false, [], [], 29)], 0, E335S1.L17),
([(13, true, false, [], [], 31)], 0, E335S1.L18),
([(13, true, false, [], [], 35)], 0, E335S1.L19),
([(13, true, false, [], [], 40)], 0, E335S1.L20),
([(13, true, false, [], [], 51)], 0, E335S1.L21),
([(13, true, false, [], [], 52)], 0, E335S1.L22),
([(13, true, false, [], [], 53)], 0, E335S1.L23),
([(13, true, false, [], [], 69)], 0, E335S1.L24),
([(13, true, false, [], [], 100)], 0, E335S1.L25),
([(13, true, false, [], [], 118)], 0, E335S1.L26),
([(13, true, false, [], [], 170)], 0, E335S1.L27),
([(13, true, false, [], [], 323)], 0, E335S1.L28),
([(13, true, false, [], [], 324)], 0, E335S1.L29),
([(13, true, false, [], [], 325)], 0, E335S1.L30),
([(13, true, false, [], [], 326)], 0, E335S1.L31),
([(13, true, false, [], [], 327)], 0, E335S1.L32),
([(13, true, false, [], [], 329)], 0, E335S1.L33),
([(13, true, false, [], [], 332)], 0, E335S1.L34),
([(13, true, false, [], [], 333)], 0, E335S1.L35),
([(13, true, false, [], [], 347)], 0, E335S1.L36),
([(13, true, false, [], [], 351)], 0, E335S1.L37),
([(13, true, false, [], [], 353)], 0, E335S1.L38),
([(13, true, false, [], [], 362)], 0, E335S1.L39),
([(13, true, false, [], [], 371)], 0, E335S1.L40),
([(13, true, false, [], [], 373)], 0, E335S1.L41),
([(13, true, false, [], [], 374)], 0, E335S1.L42),
([(13, true, false, [], [], 375)], 0, E335S1.L43),
([(13, true, false, [], [], 376)], 0, E335S1.L44),
([(13, true, false, [], [], 378)], 0, E335S1.L45),
([(13, true, false, [], [], 386)], 0, E335S1.L46),
([(13, true, false, [], [], 391)], 0, E335S1.L47),
([(13, true, false, [], [], 394)], 0, E335S1.L48),
([(13, true, false, [], [], 400)], 0, E335S1.L49),
([(13, true, false, [], [], 420)], 0, E335S1.L50),
([(13, true, false, [], [], 427)], 0, E335S1.L51),
([(13, true, false, [], [], 428)], 0, E335S1.L52),
([(13, true, false, [], [], 455)], 0, E335S1.L53),
([(13, true, false, [], [], 464)], 0, E335S1.L54),
([(13, true, false, [], [], 483)], 0, E335S1.L55),
([(13, true, false, [], [], 595)], 0, E335S1.L56),
([(13, true, false, [], [], 597)], 0, E335S1.L57),
([(13, true, false, [], [], 598)], 0, E335S1.L58),
([(13, true, false, [], [], 599)], 0, E335S1.L59),
([(13, true, false, [], [], 602)], 0, E335S1.L60),
([(13, true, false, [], [], 605)], 0, E335S1.L61),
([(13, true, false, [], [], 606)], 0, E335S1.L62),
([(13, true, false, [], [], 615)], 0, E335S1.L63),
([(13, true, false, [], [], 616)], 0, E335S1.L64),
([(13, true, false, [], [], 617)], 0, E335S1.L65),
([(13, true, false, [], [], 620)], 0, E335S1.L66),
([(13, true, false, [], [], 621)], 0, E335S1.L67),
([(13, true, false, [], [], 623)], 0, E335S1.L68),
([(13, true, false, [], [], 626)], 0, E335S1.L69),
([(13, true, false, [], [], 872)], 0, E335S1.L70),
([(13, true, false, [], [], 903)], 0, E335S1.L71),
([(13, true, false, [], [], 907)], 0, E335S1.L72),
([(13, true, false, [], [], 912)], 0, E335S1.L73),
([(13, true, false, [], [], 1395)], 0, E335S1.L74),
([(13, true, false, [], [], 1401)], 0, E335S1.L75),
([(13, true, false, [], [], 1419)], 0, E335S1.L76)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 76
end E335S1
