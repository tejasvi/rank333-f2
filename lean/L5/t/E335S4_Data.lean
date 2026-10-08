module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E335S4 "data/lean/2aedb82ebbf594c760255ee58c1bafe0/E335S4.bin"
namespace E335S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [], [], 0)], 0, E335S4.L1),
([(11, true, false, [], [], 1)], 0, E335S4.L2),
([(11, true, false, [], [], 3)], 0, E335S4.L3),
([(11, true, false, [], [], 4)], 0, E335S4.L4),
([(11, true, false, [], [], 5)], 0, E335S4.L5),
([(11, true, false, [], [], 7)], 0, E335S4.L6),
([(11, true, false, [], [], 10)], 0, E335S4.L7),
([(11, true, false, [], [], 11)], 0, E335S4.L8),
([(11, true, false, [], [], 16)], 0, E335S4.L9),
([(11, true, false, [], [], 18)], 0, E335S4.L10),
([(11, true, false, [], [], 25)], 0, E335S4.L11),
([(11, true, false, [], [], 26)], 0, E335S4.L12),
([(11, true, false, [], [], 27)], 0, E335S4.L13),
([(11, true, false, [], [], 29)], 0, E335S4.L14),
([(11, true, false, [], [], 40)], 0, E335S4.L15),
([(11, true, false, [], [], 102)], 0, E335S4.L16),
([(11, true, false, [], [], 103)], 0, E335S4.L17),
([(11, true, false, [], [], 325)], 0, E335S4.L18),
([(11, true, false, [], [], 326)], 0, E335S4.L19),
([(11, true, false, [], [], 351)], 0, E335S4.L20),
([(11, true, false, [], [], 374)], 0, E335S4.L21),
([(11, true, false, [], [], 375)], 0, E335S4.L22),
([(11, true, false, [], [], 376)], 0, E335S4.L23),
([(11, true, false, [], [], 387)], 0, E335S4.L24),
([(11, true, false, [], [], 394)], 0, E335S4.L25),
([(11, true, false, [], [], 400)], 0, E335S4.L26),
([(11, true, false, [], [], 402)], 0, E335S4.L27),
([(11, true, false, [], [], 423)], 0, E335S4.L28),
([(11, true, false, [], [], 424)], 0, E335S4.L29),
([(11, true, false, [], [], 451)], 0, E335S4.L30),
([(11, true, false, [], [], 455)], 0, E335S4.L31),
([(11, true, false, [], [], 459)], 0, E335S4.L32),
([(11, true, false, [], [], 598)], 0, E335S4.L33),
([(11, true, false, [], [], 620)], 0, E335S4.L34),
([(11, true, false, [], [], 647)], 0, E335S4.L35),
([(11, true, false, [], [], 724)], 0, E335S4.L36),
([(11, true, false, [], [], 728)], 0, E335S4.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E335S4
