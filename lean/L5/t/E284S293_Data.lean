module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S293 "data/lean/8c72507c8185d94d78f80054e5536491/E284S293.bin"
namespace E284S293
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [212, 244, 254, 382, 266], [], 10)], 0, E284S293.L1),
([(0, true, false, [212, 244, 254, 382, 266], [], 11)], 0, E284S293.L2),
([(0, true, false, [212, 244, 254, 382, 266], [], 12)], 0, E284S293.L3),
([(0, true, false, [212, 244, 254, 382, 266], [], 14)], 0, E284S293.L4),
([(0, true, false, [212, 244, 254, 382, 266], [], 16)], 0, E284S293.L5),
([(0, true, false, [212, 244, 254, 382, 266], [], 17)], 0, E284S293.L6),
([(0, true, false, [212, 244, 254, 382, 266], [], 18)], 0, E284S293.L7),
([(0, true, false, [212, 244, 254, 382, 266], [], 36)], 0, E284S293.L8),
([(0, true, false, [212, 244, 254, 382, 266], [], 38)], 0, E284S293.L9),
([(0, true, false, [212, 244, 254, 382, 266], [], 43)], 0, E284S293.L10),
([(0, true, false, [212, 244, 254, 382, 266], [], 44)], 0, E284S293.L11),
([(0, true, false, [212, 244, 254, 382, 266], [], 53)], 0, E284S293.L12),
([(0, true, false, [212, 244, 254, 382, 266], [], 54)], 0, E284S293.L13),
([(0, true, false, [212, 244, 254, 382, 266], [], 57)], 0, E284S293.L14),
([(0, true, false, [212, 244, 254, 382, 266], [], 63)], 0, E284S293.L15),
([(0, true, false, [212, 244, 254, 382, 266], [], 65)], 0, E284S293.L16),
([(0, true, false, [212, 244, 254, 382, 266], [], 67)], 0, E284S293.L17),
([(0, true, false, [212, 244, 254, 382, 266], [], 68)], 0, E284S293.L18),
([(0, true, false, [212, 244, 254, 382, 266], [], 78)], 0, E284S293.L19),
([(0, true, false, [212, 244, 254, 382, 266], [], 80)], 0, E284S293.L20),
([(0, true, false, [212, 244, 254, 382, 266], [], 81)], 0, E284S293.L21),
([(0, true, false, [212, 244, 254, 382, 266], [], 101)], 0, E284S293.L22),
([(0, true, false, [212, 244, 254, 382, 266], [], 123)], 0, E284S293.L23),
([(0, true, false, [212, 244, 254, 382, 266], [], 124)], 0, E284S293.L24),
([(0, true, false, [212, 244, 254, 382, 266], [], 125)], 0, E284S293.L25),
([(0, true, false, [212, 244, 254, 382, 266], [], 126)], 0, E284S293.L26),
([(0, true, false, [212, 244, 254, 382, 266], [], 129)], 0, E284S293.L27),
([(0, true, false, [212, 244, 254, 382, 266], [], 134)], 0, E284S293.L28),
([(0, true, false, [212, 244, 254, 382, 266], [], 143)], 0, E284S293.L29),
([(0, true, false, [212, 244, 254, 382, 266], [], 146)], 0, E284S293.L30),
([(0, true, false, [212, 244, 254, 382, 266], [], 151)], 0, E284S293.L31),
([(0, true, false, [212, 244, 254, 382, 266], [], 174)], 0, E284S293.L32),
([(0, true, false, [212, 244, 254, 382, 266], [], 184)], 0, E284S293.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E284S293
