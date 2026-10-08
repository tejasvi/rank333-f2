module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S181 "data/lean/c1ed2362811085ad6e5df2edc07455ac/E284S181.bin"
namespace E284S181
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [116, 478], [42], 0)], 0, E284S181.L1),
([(9, true, false, [116, 478], [42], 3)], 0, E284S181.L2),
([(9, true, false, [116, 478], [42], 6)], 0, E284S181.L3),
([(9, true, false, [116, 478], [42], 7)], 0, E284S181.L4),
([(9, true, false, [116, 478], [42], 15)], 0, E284S181.L5),
([(9, true, false, [116, 478], [42], 43)], 0, E284S181.L6),
([(9, true, false, [116, 478], [42], 72)], 0, E284S181.L7),
([(9, true, false, [116, 478], [42], 73)], 0, E284S181.L8),
([(9, true, false, [116, 478], [42], 75)], 0, E284S181.L9),
([(9, true, false, [116, 478], [42], 76)], 0, E284S181.L10),
([(9, true, false, [116, 478], [42], 78)], 0, E284S181.L11),
([(9, true, false, [116, 478], [42], 80)], 0, E284S181.L12),
([(9, true, false, [116, 478], [42], 84)], 0, E284S181.L13),
([(9, true, false, [116, 478], [42], 88)], 0, E284S181.L14),
([(9, true, false, [116, 478], [42], 96)], 0, E284S181.L15),
([(9, true, false, [116, 478], [42], 100)], 0, E284S181.L16),
([(9, true, false, [116, 478], [42], 125)], 0, E284S181.L17),
([(9, true, false, [116, 478], [42], 126)], 0, E284S181.L18),
([(9, true, false, [116, 478], [42], 131)], 0, E284S181.L19),
([(9, true, false, [116, 478], [42], 146)], 0, E284S181.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E284S181
