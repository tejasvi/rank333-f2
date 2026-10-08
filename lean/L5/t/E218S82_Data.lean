module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S82 "data/lean/27b3d40395afaebee3e8f8cd97f97cea/E218S82.bin"
namespace E218S82
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254], [112], 0)], 0, E218S82.L1),
([(8, true, false, [254], [112], 3)], 0, E218S82.L2),
([(8, true, false, [254], [112], 9)], 0, E218S82.L3),
([(8, true, false, [254], [112], 12)], 0, E218S82.L4),
([(8, true, false, [254], [112], 20)], 0, E218S82.L5),
([(8, true, false, [254], [112], 21)], 0, E218S82.L6),
([(8, true, false, [254], [112], 22)], 0, E218S82.L7),
([(8, true, false, [254], [112], 23)], 0, E218S82.L8),
([(8, true, false, [254], [112], 24)], 0, E218S82.L9),
([(8, true, false, [254], [112], 25)], 0, E218S82.L10),
([(8, true, false, [254], [112], 29)], 0, E218S82.L11),
([(8, true, false, [254], [112], 33)], 0, E218S82.L12),
([(8, true, false, [254], [112], 34)], 0, E218S82.L13),
([(8, true, false, [254], [112], 35)], 0, E218S82.L14),
([(8, true, false, [254], [112], 36)], 0, E218S82.L15),
([(8, true, false, [254], [112], 37)], 0, E218S82.L16),
([(8, true, false, [254], [112], 42)], 0, E218S82.L17),
([(8, true, false, [254], [112], 43)], 0, E218S82.L18),
([(8, true, false, [254], [112], 44)], 0, E218S82.L19),
([(8, true, false, [254], [112], 45)], 0, E218S82.L20),
([(8, true, false, [254], [112], 46)], 0, E218S82.L21),
([(8, true, false, [254], [112], 51)], 0, E218S82.L22),
([(8, true, false, [254], [112], 55)], 0, E218S82.L23),
([(8, true, false, [254], [112], 84)], 0, E218S82.L24),
([(8, true, false, [254], [112], 113)], 0, E218S82.L25),
([(8, true, false, [254], [112], 192)], 0, E218S82.L26),
([(8, true, false, [254], [112], 193)], 0, E218S82.L27),
([(8, true, false, [254], [112], 194)], 0, E218S82.L28),
([(8, true, false, [254], [112], 195)], 0, E218S82.L29),
([(8, true, false, [254], [112], 196)], 0, E218S82.L30),
([(8, true, false, [254], [112], 197)], 0, E218S82.L31),
([(8, true, false, [254], [112], 198)], 0, E218S82.L32),
([(8, true, false, [254], [112], 199)], 0, E218S82.L33),
([(8, true, false, [254], [112], 200)], 0, E218S82.L34),
([(8, true, false, [254], [112], 201)], 0, E218S82.L35),
([(8, true, false, [254], [112], 202)], 0, E218S82.L36),
([(8, true, false, [254], [112], 203)], 0, E218S82.L37),
([(8, true, false, [254], [112], 208)], 0, E218S82.L38),
([(8, true, false, [254], [112], 219)], 0, E218S82.L39),
([(8, true, false, [254], [112], 245)], 0, E218S82.L40),
([(8, true, false, [254], [112], 248)], 0, E218S82.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E218S82
