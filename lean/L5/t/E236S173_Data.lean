module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S173 "data/lean/190b42ead7a8fd9d760d0f6e026cccfa/E236S173.bin"
namespace E236S173
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [354, 372], [232, 276], 7)], 43, E236S173.L1),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 0)], 0, E236S173.L2),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 2)], 0, E236S173.L3),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 4)], 0, E236S173.L4),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 6)], 0, E236S173.L5),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 8)], 0, E236S173.L6),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 10)], 0, E236S173.L7),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 14)], 0, E236S173.L8),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 15)], 0, E236S173.L9),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 30)], 0, E236S173.L10),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 72)], 0, E236S173.L11),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 80)], 0, E236S173.L12),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 102)], 0, E236S173.L13),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 116)], 0, E236S173.L14),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 196)], 0, E236S173.L15),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 212)], 0, E236S173.L16),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 228)], 0, E236S173.L17),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 244)], 0, E236S173.L18),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 312)], 0, E236S173.L19),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 313)], 0, E236S173.L20),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 324)], 0, E236S173.L21),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 358)], 0, E236S173.L22),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 359)], 0, E236S173.L23),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 386)], 0, E236S173.L24),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 508)], 0, E236S173.L25),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 512)], 0, E236S173.L26),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 516)], 0, E236S173.L27),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 520)], 0, E236S173.L28),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 552)], 0, E236S173.L29),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 554)], 0, E236S173.L30),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 580)], 0, E236S173.L31),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 662)], 0, E236S173.L32),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 669)], 0, E236S173.L33),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 671)], 0, E236S173.L34),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 764)], 0, E236S173.L35),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 776)], 0, E236S173.L36),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 796)], 0, E236S173.L37),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 808)], 0, E236S173.L38),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 856)], 0, E236S173.L39),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 866)], 0, E236S173.L40),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 867)], 0, E236S173.L41),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 876)], 0, E236S173.L42),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 908)], 0, E236S173.L43),
([(2, true, false, [354, 372], [232, 276], 7), (13, false, false, [], [232], 909)], 0, E236S173.L44)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E236S173
