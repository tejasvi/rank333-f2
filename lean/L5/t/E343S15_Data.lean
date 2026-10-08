module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S15 "data/lean/e2cf3d9bde483a00c4de7d0d998eff23/E343S15.bin"
namespace E343S15
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(13, true, false, [], [], 1)], 35, 0, E343S15.L1),
([(13, true, false, [], [], 3)], 35, 0, E343S15.L2),
([(13, true, false, [], [], 4)], 35, 0, E343S15.L3),
([(13, true, false, [], [], 5)], 35, 0, E343S15.L4),
([(13, true, false, [], [], 18)], 35, 0, E343S15.L5),
([(13, true, false, [], [], 25)], 35, 0, E343S15.L6),
([(13, true, false, [], [], 27)], 35, 0, E343S15.L7),
([(13, true, false, [], [], 29)], 35, 0, E343S15.L8),
([(13, true, false, [], [], 31)], 35, 0, E343S15.L9),
([(13, true, false, [], [], 52)], 35, 0, E343S15.L10),
([(13, true, false, [], [], 53)], 35, 0, E343S15.L11),
([(13, true, false, [], [], 54)], 35, 0, E343S15.L12),
([(13, true, false, [], [], 65)], 35, 0, E343S15.L13),
([(13, true, false, [], [], 67)], 35, 0, E343S15.L14),
([(13, true, false, [], [], 71)], 35, 0, E343S15.L15),
([(13, true, false, [], [], 72)], 35, 0, E343S15.L16),
([(13, true, false, [], [], 81)], 35, 0, E343S15.L17),
([(13, true, false, [], [], 102)], 35, 0, E343S15.L18),
([(13, true, false, [], [], 123)], 35, 0, E343S15.L19),
([(13, true, false, [], [], 150)], 35, 0, E343S15.L20),
([(13, true, false, [], [], 151)], 35, 0, E343S15.L21),
([(13, true, false, [], [], 191)], 35, 0, E343S15.L22),
([(13, true, false, [], [], 294)], 35, 0, E343S15.L23),
([(13, true, false, [], [], 323)], 35, 0, E343S15.L24),
([(13, true, false, [], [], 326)], 35, 0, E343S15.L25),
([(13, true, false, [], [], 327)], 35, 0, E343S15.L26),
([(13, true, false, [], [], 336)], 35, 0, E343S15.L27),
([(13, true, false, [], [], 347)], 35, 0, E343S15.L28),
([(13, true, false, [], [], 349)], 35, 0, E343S15.L29),
([(13, true, false, [], [], 372)], 35, 0, E343S15.L30),
([(13, true, false, [], [], 375)], 35, 0, E343S15.L31),
([(13, true, false, [], [], 435)], 35, 0, E343S15.L32),
([(13, true, false, [], [], 437)], 35, 0, E343S15.L33),
([(13, true, false, [], [], 596)], 35, 0, E343S15.L34),
([(13, true, false, [], [], 885)], 35, 0, E343S15.L35)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 35
end E343S15
