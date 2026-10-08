module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S346 "data/lean/2815d8802720f8c14abd466ca8eb8869/E236S346.bin"
namespace E236S346
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 354, 394, 412], [], 0)], 0, E236S346.L1),
([(0, true, false, [158, 354, 394, 412], [], 1)], 0, E236S346.L2),
([(0, true, false, [158, 354, 394, 412], [], 2)], 0, E236S346.L3),
([(0, true, false, [158, 354, 394, 412], [], 3)], 0, E236S346.L4),
([(0, true, false, [158, 354, 394, 412], [], 4)], 0, E236S346.L5),
([(0, true, false, [158, 354, 394, 412], [], 5)], 0, E236S346.L6),
([(0, true, false, [158, 354, 394, 412], [], 12)], 0, E236S346.L7),
([(0, true, false, [158, 354, 394, 412], [], 13)], 0, E236S346.L8),
([(0, true, false, [158, 354, 394, 412], [], 22)], 0, E236S346.L9),
([(0, true, false, [158, 354, 394, 412], [], 23)], 0, E236S346.L10),
([(0, true, false, [158, 354, 394, 412], [], 27)], 0, E236S346.L11),
([(0, true, false, [158, 354, 394, 412], [], 29)], 0, E236S346.L12),
([(0, true, false, [158, 354, 394, 412], [], 39)], 0, E236S346.L13),
([(0, true, false, [158, 354, 394, 412], [], 40)], 0, E236S346.L14),
([(0, true, false, [158, 354, 394, 412], [], 41)], 0, E236S346.L15),
([(0, true, false, [158, 354, 394, 412], [], 43)], 0, E236S346.L16),
([(0, true, false, [158, 354, 394, 412], [], 44)], 0, E236S346.L17),
([(0, true, false, [158, 354, 394, 412], [], 45)], 0, E236S346.L18),
([(0, true, false, [158, 354, 394, 412], [], 56)], 0, E236S346.L19),
([(0, true, false, [158, 354, 394, 412], [], 76)], 0, E236S346.L20),
([(0, true, false, [158, 354, 394, 412], [], 77)], 0, E236S346.L21),
([(0, true, false, [158, 354, 394, 412], [], 88)], 0, E236S346.L22),
([(0, true, false, [158, 354, 394, 412], [], 100)], 0, E236S346.L23),
([(0, true, false, [158, 354, 394, 412], [], 108)], 0, E236S346.L24),
([(0, true, false, [158, 354, 394, 412], [], 109)], 0, E236S346.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E236S346
