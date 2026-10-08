module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S218 "data/lean/c6a494ffa869477048e33acc2a58380f/E213S218.bin"
namespace E213S218
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [282, 106, 244], [388], 0)], 0, E213S218.L1),
([(13, true, false, [282, 106, 244], [388], 4)], 0, E213S218.L2),
([(13, true, false, [282, 106, 244], [388], 5)], 0, E213S218.L3),
([(13, true, false, [282, 106, 244], [388], 8)], 0, E213S218.L4),
([(13, true, false, [282, 106, 244], [388], 16)], 0, E213S218.L5),
([(13, true, false, [282, 106, 244], [388], 37)], 0, E213S218.L6),
([(13, true, false, [282, 106, 244], [388], 41)], 0, E213S218.L7),
([(13, true, false, [282, 106, 244], [388], 62)], 0, E213S218.L8),
([(13, true, false, [282, 106, 244], [388], 63)], 0, E213S218.L9),
([(13, true, false, [282, 106, 244], [388], 76)], 0, E213S218.L10),
([(13, true, false, [282, 106, 244], [388], 116)], 0, E213S218.L11),
([(13, true, false, [282, 106, 244], [388], 128)], 0, E213S218.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E213S218
