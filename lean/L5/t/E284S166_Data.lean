module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S166 "data/lean/86e13094b7cd2c7bb5d71ed71160d9cc/E284S166.bin"
namespace E284S166
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [84, 298], [510], 0)], 0, E284S166.L1),
([(12, true, false, [84, 298], [510], 2)], 0, E284S166.L2),
([(12, true, false, [84, 298], [510], 6)], 0, E284S166.L3),
([(12, true, false, [84, 298], [510], 8)], 0, E284S166.L4),
([(12, true, false, [84, 298], [510], 10)], 0, E284S166.L5),
([(12, true, false, [84, 298], [510], 20)], 0, E284S166.L6),
([(12, true, false, [84, 298], [510], 21)], 0, E284S166.L7),
([(12, true, false, [84, 298], [510], 23)], 0, E284S166.L8),
([(12, true, false, [84, 298], [510], 24)], 0, E284S166.L9),
([(12, true, false, [84, 298], [510], 28)], 0, E284S166.L10),
([(12, true, false, [84, 298], [510], 58)], 0, E284S166.L11),
([(12, true, false, [84, 298], [510], 59)], 0, E284S166.L12),
([(12, true, false, [84, 298], [510], 62)], 0, E284S166.L13),
([(12, true, false, [84, 298], [510], 65)], 0, E284S166.L14),
([(12, true, false, [84, 298], [510], 73)], 0, E284S166.L15),
([(12, true, false, [84, 298], [510], 79)], 0, E284S166.L16),
([(12, true, false, [84, 298], [510], 98)], 0, E284S166.L17),
([(12, true, false, [84, 298], [510], 99)], 0, E284S166.L18),
([(12, true, false, [84, 298], [510], 107)], 0, E284S166.L19),
([(12, true, false, [84, 298], [510], 122)], 0, E284S166.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E284S166
