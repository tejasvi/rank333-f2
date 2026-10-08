module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S217 "data/lean/aaadce4f58f3c4775eee07db15856170/E213S217.bin"
namespace E213S217
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [494, 158, 244], [388], 0)], 0, E213S217.L1),
([(13, true, false, [494, 158, 244], [388], 1)], 0, E213S217.L2),
([(13, true, false, [494, 158, 244], [388], 3)], 0, E213S217.L3),
([(13, true, false, [494, 158, 244], [388], 6)], 0, E213S217.L4),
([(13, true, false, [494, 158, 244], [388], 10)], 0, E213S217.L5),
([(13, true, false, [494, 158, 244], [388], 12)], 0, E213S217.L6),
([(13, true, false, [494, 158, 244], [388], 16)], 0, E213S217.L7),
([(13, true, false, [494, 158, 244], [388], 28)], 0, E213S217.L8),
([(13, true, false, [494, 158, 244], [388], 32)], 0, E213S217.L9),
([(13, true, false, [494, 158, 244], [388], 42)], 0, E213S217.L10),
([(13, true, false, [494, 158, 244], [388], 46)], 0, E213S217.L11),
([(13, true, false, [494, 158, 244], [388], 49)], 0, E213S217.L12),
([(13, true, false, [494, 158, 244], [388], 54)], 0, E213S217.L13),
([(13, true, false, [494, 158, 244], [388], 62)], 0, E213S217.L14),
([(13, true, false, [494, 158, 244], [388], 64)], 0, E213S217.L15),
([(13, true, false, [494, 158, 244], [388], 112)], 0, E213S217.L16),
([(13, true, false, [494, 158, 244], [388], 128)], 0, E213S217.L17),
([(13, true, false, [494, 158, 244], [388], 154)], 0, E213S217.L18),
([(13, true, false, [494, 158, 244], [388], 159)], 0, E213S217.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E213S217
