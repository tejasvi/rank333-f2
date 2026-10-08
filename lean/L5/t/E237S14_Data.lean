module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S14 "data/lean/fbe9328b4c44a7fd06c78e17c7058c32/E237S14.bin"
namespace E237S14
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [354, 254], [96, 392], 0)], 0, E237S14.L1),
([(8, true, false, [354, 254], [96, 392], 2)], 0, E237S14.L2),
([(8, true, false, [354, 254], [96, 392], 8)], 0, E237S14.L3),
([(8, true, false, [354, 254], [96, 392], 12)], 0, E237S14.L4),
([(8, true, false, [354, 254], [96, 392], 20)], 0, E237S14.L5),
([(8, true, false, [354, 254], [96, 392], 28)], 0, E237S14.L6),
([(8, true, false, [354, 254], [96, 392], 40)], 0, E237S14.L7),
([(8, true, false, [354, 254], [96, 392], 42)], 0, E237S14.L8),
([(8, true, false, [354, 254], [96, 392], 48)], 0, E237S14.L9),
([(8, true, false, [354, 254], [96, 392], 49)], 0, E237S14.L10),
([(8, true, false, [354, 254], [96, 392], 53)], 0, E237S14.L11),
([(8, true, false, [354, 254], [96, 392], 54)], 0, E237S14.L12),
([(8, true, false, [354, 254], [96, 392], 62)], 0, E237S14.L13),
([(8, true, false, [354, 254], [96, 392], 64)], 0, E237S14.L14),
([(8, true, false, [354, 254], [96, 392], 67)], 0, E237S14.L15),
([(8, true, false, [354, 254], [96, 392], 68)], 0, E237S14.L16),
([(8, true, false, [354, 254], [96, 392], 70)], 0, E237S14.L17),
([(8, true, false, [354, 254], [96, 392], 71)], 0, E237S14.L18),
([(8, true, false, [354, 254], [96, 392], 74)], 0, E237S14.L19),
([(8, true, false, [354, 254], [96, 392], 76)], 0, E237S14.L20),
([(8, true, false, [354, 254], [96, 392], 79)], 0, E237S14.L21),
([(8, true, false, [354, 254], [96, 392], 106)], 0, E237S14.L22),
([(8, true, false, [354, 254], [96, 392], 148)], 0, E237S14.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E237S14
