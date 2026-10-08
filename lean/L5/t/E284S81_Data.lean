module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S81 "data/lean/658ca9d17ed2d1d4d886f57c2d521076/E284S81.bin"
namespace E284S81
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [394, 426], [10, 42], 0)], 0, E284S81.L1),
([(3, true, false, [394, 426], [10, 42], 1)], 0, E284S81.L2),
([(3, true, false, [394, 426], [10, 42], 2)], 0, E284S81.L3),
([(3, true, false, [394, 426], [10, 42], 3)], 0, E284S81.L4),
([(3, true, false, [394, 426], [10, 42], 4)], 0, E284S81.L5),
([(3, true, false, [394, 426], [10, 42], 5)], 0, E284S81.L6),
([(3, true, false, [394, 426], [10, 42], 6)], 0, E284S81.L7),
([(3, true, false, [394, 426], [10, 42], 7)], 0, E284S81.L8),
([(3, true, false, [394, 426], [10, 42], 8)], 0, E284S81.L9),
([(3, true, false, [394, 426], [10, 42], 9)], 0, E284S81.L10),
([(3, true, false, [394, 426], [10, 42], 10)], 0, E284S81.L11),
([(3, true, false, [394, 426], [10, 42], 11)], 0, E284S81.L12),
([(3, true, false, [394, 426], [10, 42], 12)], 0, E284S81.L13),
([(3, true, false, [394, 426], [10, 42], 13)], 0, E284S81.L14),
([(3, true, false, [394, 426], [10, 42], 14)], 0, E284S81.L15),
([(3, true, false, [394, 426], [10, 42], 15)], 0, E284S81.L16),
([(3, true, false, [394, 426], [10, 42], 16)], 0, E284S81.L17),
([(3, true, false, [394, 426], [10, 42], 17)], 0, E284S81.L18),
([(3, true, false, [394, 426], [10, 42], 18)], 0, E284S81.L19),
([(3, true, false, [394, 426], [10, 42], 19)], 0, E284S81.L20),
([(3, true, false, [394, 426], [10, 42], 20)], 0, E284S81.L21),
([(3, true, false, [394, 426], [10, 42], 21)], 0, E284S81.L22),
([(3, true, false, [394, 426], [10, 42], 22)], 0, E284S81.L23),
([(3, true, false, [394, 426], [10, 42], 23)], 0, E284S81.L24),
([(3, true, false, [394, 426], [10, 42], 24)], 0, E284S81.L25),
([(3, true, false, [394, 426], [10, 42], 25)], 0, E284S81.L26),
([(3, true, false, [394, 426], [10, 42], 26)], 0, E284S81.L27),
([(3, true, false, [394, 426], [10, 42], 27)], 0, E284S81.L28),
([(3, true, false, [394, 426], [10, 42], 28)], 0, E284S81.L29),
([(3, true, false, [394, 426], [10, 42], 29)], 0, E284S81.L30),
([(3, true, false, [394, 426], [10, 42], 30)], 0, E284S81.L31),
([(3, true, false, [394, 426], [10, 42], 31)], 0, E284S81.L32),
([(3, true, false, [394, 426], [10, 42], 36)], 0, E284S81.L33),
([(3, true, false, [394, 426], [10, 42], 37)], 0, E284S81.L34),
([(3, true, false, [394, 426], [10, 42], 40)], 0, E284S81.L35),
([(3, true, false, [394, 426], [10, 42], 41)], 0, E284S81.L36),
([(3, true, false, [394, 426], [10, 42], 46)], 0, E284S81.L37),
([(3, true, false, [394, 426], [10, 42], 47)], 0, E284S81.L38),
([(3, true, false, [394, 426], [10, 42], 48)], 0, E284S81.L39),
([(3, true, false, [394, 426], [10, 42], 50)], 0, E284S81.L40),
([(3, true, false, [394, 426], [10, 42], 66)], 0, E284S81.L41),
([(3, true, false, [394, 426], [10, 42], 67)], 0, E284S81.L42),
([(3, true, false, [394, 426], [10, 42], 68)], 0, E284S81.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E284S81
