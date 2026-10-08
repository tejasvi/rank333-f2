module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S35 "data/lean/ce3a6cdd436821c60eeeff3090eef60b/E284S35.bin"
namespace E284S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 394, 468], [], 0)], 0, E284S35.L1),
([(8, true, false, [254, 266, 394, 468], [], 1)], 0, E284S35.L2),
([(8, true, false, [254, 266, 394, 468], [], 3)], 0, E284S35.L3),
([(8, true, false, [254, 266, 394, 468], [], 10)], 0, E284S35.L4),
([(8, true, false, [254, 266, 394, 468], [], 11)], 0, E284S35.L5),
([(8, true, false, [254, 266, 394, 468], [], 12)], 0, E284S35.L6),
([(8, true, false, [254, 266, 394, 468], [], 17)], 0, E284S35.L7),
([(8, true, false, [254, 266, 394, 468], [], 21)], 0, E284S35.L8),
([(8, true, false, [254, 266, 394, 468], [], 23)], 0, E284S35.L9),
([(8, true, false, [254, 266, 394, 468], [], 30)], 0, E284S35.L10),
([(8, true, false, [254, 266, 394, 468], [], 31)], 0, E284S35.L11),
([(8, true, false, [254, 266, 394, 468], [], 42)], 0, E284S35.L12),
([(8, true, false, [254, 266, 394, 468], [], 43)], 0, E284S35.L13),
([(8, true, false, [254, 266, 394, 468], [], 46)], 0, E284S35.L14),
([(8, true, false, [254, 266, 394, 468], [], 53)], 0, E284S35.L15),
([(8, true, false, [254, 266, 394, 468], [], 54)], 0, E284S35.L16),
([(8, true, false, [254, 266, 394, 468], [], 73)], 0, E284S35.L17),
([(8, true, false, [254, 266, 394, 468], [], 142)], 0, E284S35.L18),
([(8, true, false, [254, 266, 394, 468], [], 164)], 0, E284S35.L19),
([(8, true, false, [254, 266, 394, 468], [], 187)], 0, E284S35.L20),
([(8, true, false, [254, 266, 394, 468], [], 211)], 0, E284S35.L21),
([(8, true, false, [254, 266, 394, 468], [], 218)], 0, E284S35.L22),
([(8, true, false, [254, 266, 394, 468], [], 234)], 0, E284S35.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E284S35
