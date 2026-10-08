module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S376 "data/lean/2cb7bb71409faafbd68c6ab3a0a39af5/E236S376.bin"
namespace E236S376
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [394, 412], [96], 0)], 0, E236S376.L1),
([(0, true, false, [394, 412], [96], 6)], 0, E236S376.L2),
([(0, true, false, [394, 412], [96], 10)], 0, E236S376.L3),
([(0, true, false, [394, 412], [96], 13)], 0, E236S376.L4),
([(0, true, false, [394, 412], [96], 14)], 0, E236S376.L5),
([(0, true, false, [394, 412], [96], 15)], 0, E236S376.L6),
([(0, true, false, [394, 412], [96], 19)], 0, E236S376.L7),
([(0, true, false, [394, 412], [96], 20)], 0, E236S376.L8),
([(0, true, false, [394, 412], [96], 31)], 0, E236S376.L9),
([(0, true, false, [394, 412], [96], 32)], 0, E236S376.L10),
([(0, true, false, [394, 412], [96], 35)], 0, E236S376.L11),
([(0, true, false, [394, 412], [96], 37)], 0, E236S376.L12),
([(0, true, false, [394, 412], [96], 46)], 0, E236S376.L13),
([(0, true, false, [394, 412], [96], 49)], 0, E236S376.L14),
([(0, true, false, [394, 412], [96], 71)], 0, E236S376.L15),
([(0, true, false, [394, 412], [96], 80)], 0, E236S376.L16),
([(0, true, false, [394, 412], [96], 86)], 0, E236S376.L17),
([(0, true, false, [394, 412], [96], 89)], 0, E236S376.L18),
([(0, true, false, [394, 412], [96], 92)], 0, E236S376.L19),
([(0, true, false, [394, 412], [96], 93)], 0, E236S376.L20),
([(0, true, false, [394, 412], [96], 94)], 0, E236S376.L21),
([(0, true, false, [394, 412], [96], 97)], 0, E236S376.L22),
([(0, true, false, [394, 412], [96], 102)], 0, E236S376.L23),
([(0, true, false, [394, 412], [96], 106)], 0, E236S376.L24),
([(0, true, false, [394, 412], [96], 112)], 0, E236S376.L25),
([(0, true, false, [394, 412], [96], 113)], 0, E236S376.L26),
([(0, true, false, [394, 412], [96], 117)], 0, E236S376.L27),
([(0, true, false, [394, 412], [96], 119)], 0, E236S376.L28),
([(0, true, false, [394, 412], [96], 120)], 0, E236S376.L29),
([(0, true, false, [394, 412], [96], 121)], 0, E236S376.L30),
([(0, true, false, [394, 412], [96], 123)], 0, E236S376.L31),
([(0, true, false, [394, 412], [96], 126)], 0, E236S376.L32),
([(0, true, false, [394, 412], [96], 127)], 0, E236S376.L33),
([(0, true, false, [394, 412], [96], 132)], 0, E236S376.L34),
([(0, true, false, [394, 412], [96], 136)], 0, E236S376.L35),
([(0, true, false, [394, 412], [96], 137)], 0, E236S376.L36),
([(0, true, false, [394, 412], [96], 139)], 0, E236S376.L37),
([(0, true, false, [394, 412], [96], 140)], 0, E236S376.L38),
([(0, true, false, [394, 412], [96], 141)], 0, E236S376.L39)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 39
end E236S376
