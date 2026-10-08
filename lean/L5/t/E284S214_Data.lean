module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S214 "data/lean/3ebe013403a4b068ae277e0d754d9633/E284S214.bin"
namespace E284S214
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266, 340], [510], 1)], 0, E284S214.L1),
([(4, true, false, [266, 340], [510], 4)], 0, E284S214.L2),
([(4, true, false, [266, 340], [510], 25)], 0, E284S214.L3),
([(4, true, false, [266, 340], [510], 29)], 0, E284S214.L4),
([(4, true, false, [266, 340], [510], 30)], 0, E284S214.L5),
([(4, true, false, [266, 340], [510], 34)], 0, E284S214.L6),
([(4, true, false, [266, 340], [510], 35)], 0, E284S214.L7),
([(4, true, false, [266, 340], [510], 36)], 0, E284S214.L8),
([(4, true, false, [266, 340], [510], 38)], 0, E284S214.L9),
([(4, true, false, [266, 340], [510], 61)], 0, E284S214.L10),
([(4, true, false, [266, 340], [510], 94)], 0, E284S214.L11),
([(4, true, false, [266, 340], [510], 114)], 0, E284S214.L12),
([(4, true, false, [266, 340], [510], 127)], 0, E284S214.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E284S214
