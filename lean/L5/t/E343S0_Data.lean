module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S0 "data/lean/4cf8e0c1a4496b3ef4acf3a14c59dbaa/E343S0.bin"
namespace E343S0
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(0, true, false, [], [], 3)], 47, 0, E343S0.L1),
([(0, true, false, [], [], 5)], 47, 0, E343S0.L2),
([(0, true, false, [], [], 49)], 47, 0, E343S0.L3),
([(0, true, false, [], [], 103)], 47, 0, E343S0.L4),
([(0, true, false, [], [], 130)], 47, 0, E343S0.L5),
([(0, true, false, [], [], 322)], 47, 0, E343S0.L6),
([(0, true, false, [], [], 326)], 47, 0, E343S0.L7),
([(0, true, false, [], [], 329)], 47, 0, E343S0.L8),
([(0, true, false, [], [], 351)], 47, 0, E343S0.L9),
([(0, true, false, [], [], 371)], 47, 0, E343S0.L10),
([(0, true, false, [], [], 374)], 47, 0, E343S0.L11),
([(0, true, false, [], [], 375)], 47, 0, E343S0.L12),
([(0, true, false, [], [], 376)], 47, 0, E343S0.L13),
([(0, true, false, [], [], 377)], 47, 0, E343S0.L14),
([(0, true, false, [], [], 378)], 47, 0, E343S0.L15),
([(0, true, false, [], [], 381)], 47, 0, E343S0.L16),
([(0, true, false, [], [], 382)], 47, 0, E343S0.L17),
([(0, true, false, [], [], 383)], 47, 0, E343S0.L18),
([(0, true, false, [], [], 384)], 47, 0, E343S0.L19),
([(0, true, false, [], [], 396)], 47, 0, E343S0.L20),
([(0, true, false, [], [], 403)], 47, 0, E343S0.L21),
([(0, true, false, [], [], 404)], 47, 0, E343S0.L22),
([(0, true, false, [], [], 414)], 47, 0, E343S0.L23),
([(0, true, false, [], [], 427)], 47, 0, E343S0.L24),
([(0, true, false, [], [], 428)], 47, 0, E343S0.L25),
([(0, true, false, [], [], 473)], 47, 0, E343S0.L26),
([(0, true, false, [], [], 600)], 47, 0, E343S0.L27),
([(0, true, false, [], [], 627)], 47, 0, E343S0.L28),
([(0, true, false, [], [], 644)], 47, 0, E343S0.L29),
([(0, true, false, [], [], 647)], 47, 0, E343S0.L30),
([(0, true, false, [], [], 648)], 47, 0, E343S0.L31),
([(0, true, false, [], [], 649)], 47, 0, E343S0.L32),
([(0, true, false, [], [], 654)], 47, 0, E343S0.L33),
([(0, true, false, [], [], 655)], 47, 0, E343S0.L34),
([(0, true, false, [], [], 669)], 47, 0, E343S0.L35),
([(0, true, false, [], [], 670)], 47, 0, E343S0.L36),
([(0, true, false, [], [], 675)], 47, 0, E343S0.L37),
([(0, true, false, [], [], 740)], 47, 0, E343S0.L38),
([(0, true, false, [], [], 746)], 47, 0, E343S0.L39),
([(0, true, false, [], [], 1050)], 47, 0, E343S0.L40),
([(0, true, false, [], [], 1265)], 47, 0, E343S0.L41),
([(0, true, false, [], [], 1271)], 47, 0, E343S0.L42),
([(0, true, false, [], [], 1398)], 47, 0, E343S0.L43),
([(0, true, false, [], [], 1424)], 47, 0, E343S0.L44),
([(0, true, false, [], [], 1440)], 47, 0, E343S0.L45),
([(0, true, false, [], [], 1446)], 47, 0, E343S0.L46),
([(0, true, false, [], [], 1563)], 47, 0, E343S0.L47)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E343S0
