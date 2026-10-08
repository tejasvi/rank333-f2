module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S183 "data/lean/3004199c2bbc5629ee5c57f7609f71aa/E212S183.bin"
namespace E212S183
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 122], [], 10)], 0, E212S183.L1),
([(3, true, false, [158, 254, 122], [], 11)], 0, E212S183.L2),
([(3, true, false, [158, 254, 122], [], 15)], 0, E212S183.L3),
([(3, true, false, [158, 254, 122], [], 16)], 0, E212S183.L4),
([(3, true, false, [158, 254, 122], [], 17)], 0, E212S183.L5),
([(3, true, false, [158, 254, 122], [], 21)], 0, E212S183.L6),
([(3, true, false, [158, 254, 122], [], 25)], 0, E212S183.L7),
([(3, true, false, [158, 254, 122], [], 74)], 0, E212S183.L8),
([(3, true, false, [158, 254, 122], [], 76)], 0, E212S183.L9),
([(3, true, false, [158, 254, 122], [], 80)], 0, E212S183.L10),
([(3, true, false, [158, 254, 122], [], 81)], 0, E212S183.L11),
([(3, true, false, [158, 254, 122], [], 82)], 0, E212S183.L12),
([(3, true, false, [158, 254, 122], [], 83)], 0, E212S183.L13),
([(3, true, false, [158, 254, 122], [], 138)], 0, E212S183.L14),
([(3, true, false, [158, 254, 122], [], 139)], 0, E212S183.L15),
([(3, true, false, [158, 254, 122], [], 141)], 0, E212S183.L16),
([(3, true, false, [158, 254, 122], [], 145)], 0, E212S183.L17),
([(3, true, false, [158, 254, 122], [], 149)], 0, E212S183.L18),
([(3, true, false, [158, 254, 122], [], 150)], 0, E212S183.L19),
([(3, true, false, [158, 254, 122], [], 151)], 0, E212S183.L20),
([(3, true, false, [158, 254, 122], [], 153)], 0, E212S183.L21),
([(3, true, false, [158, 254, 122], [], 216)], 0, E212S183.L22),
([(3, true, false, [158, 254, 122], [], 217)], 0, E212S183.L23),
([(3, true, false, [158, 254, 122], [], 222)], 0, E212S183.L24),
([(3, true, false, [158, 254, 122], [], 223)], 0, E212S183.L25),
([(3, true, false, [158, 254, 122], [], 224)], 0, E212S183.L26),
([(3, true, false, [158, 254, 122], [], 225)], 0, E212S183.L27),
([(3, true, false, [158, 254, 122], [], 230)], 0, E212S183.L28),
([(3, true, false, [158, 254, 122], [], 231)], 0, E212S183.L29),
([(3, true, false, [158, 254, 122], [], 252)], 0, E212S183.L30),
([(3, true, false, [158, 254, 122], [], 253)], 0, E212S183.L31),
([(3, true, false, [158, 254, 122], [], 255)], 0, E212S183.L32),
([(3, true, false, [158, 254, 122], [], 256)], 0, E212S183.L33),
([(3, true, false, [158, 254, 122], [], 257)], 0, E212S183.L34),
([(3, true, false, [158, 254, 122], [], 260)], 0, E212S183.L35),
([(3, true, false, [158, 254, 122], [], 322)], 0, E212S183.L36),
([(3, true, false, [158, 254, 122], [], 366)], 0, E212S183.L37),
([(3, true, false, [158, 254, 122], [], 526)], 0, E212S183.L38)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 38
end E212S183
