module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S221 "data/lean/10615ae6eebfe675b42c34ac9107dea0/E213S221.bin"
namespace E213S221
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254], [148, 272], 2)], 0, E213S221.L1),
([(7, true, false, [254], [148, 272], 4)], 0, E213S221.L2),
([(7, true, false, [254], [148, 272], 5)], 0, E213S221.L3),
([(7, true, false, [254], [148, 272], 7)], 0, E213S221.L4),
([(7, true, false, [254], [148, 272], 10)], 0, E213S221.L5),
([(7, true, false, [254], [148, 272], 12)], 0, E213S221.L6),
([(7, true, false, [254], [148, 272], 14)], 0, E213S221.L7),
([(7, true, false, [254], [148, 272], 15)], 0, E213S221.L8),
([(7, true, false, [254], [148, 272], 18)], 0, E213S221.L9),
([(7, true, false, [254], [148, 272], 19)], 0, E213S221.L10),
([(7, true, false, [254], [148, 272], 20)], 0, E213S221.L11),
([(7, true, false, [254], [148, 272], 27)], 0, E213S221.L12),
([(7, true, false, [254], [148, 272], 33)], 0, E213S221.L13),
([(7, true, false, [254], [148, 272], 35)], 0, E213S221.L14),
([(7, true, false, [254], [148, 272], 41)], 0, E213S221.L15),
([(7, true, false, [254], [148, 272], 47)], 0, E213S221.L16),
([(7, true, false, [254], [148, 272], 62)], 0, E213S221.L17),
([(7, true, false, [254], [148, 272], 75)], 0, E213S221.L18),
([(7, true, false, [254], [148, 272], 77)], 0, E213S221.L19),
([(7, true, false, [254], [148, 272], 78)], 0, E213S221.L20),
([(7, true, false, [254], [148, 272], 87)], 0, E213S221.L21),
([(7, true, false, [254], [148, 272], 88)], 0, E213S221.L22),
([(7, true, false, [254], [148, 272], 89)], 0, E213S221.L23),
([(7, true, false, [254], [148, 272], 94)], 0, E213S221.L24),
([(7, true, false, [254], [148, 272], 97)], 0, E213S221.L25),
([(7, true, false, [254], [148, 272], 98)], 0, E213S221.L26),
([(7, true, false, [254], [148, 272], 100)], 0, E213S221.L27),
([(7, true, false, [254], [148, 272], 114)], 0, E213S221.L28),
([(7, true, false, [254], [148, 272], 121)], 0, E213S221.L29),
([(7, true, false, [254], [148, 272], 122)], 0, E213S221.L30),
([(7, true, false, [254], [148, 272], 124)], 0, E213S221.L31),
([(7, true, false, [254], [148, 272], 148)], 0, E213S221.L32),
([(7, true, false, [254], [148, 272], 157)], 0, E213S221.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E213S221
