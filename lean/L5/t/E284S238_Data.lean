module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S238 "data/lean/de9e1684cd2a4f77e61a0c79cee86c5f/E284S238.bin"
namespace E284S238
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [426, 394], [42], 0)], 0, E284S238.L1),
([(8, true, false, [426, 394], [42], 1)], 0, E284S238.L2),
([(8, true, false, [426, 394], [42], 2)], 0, E284S238.L3),
([(8, true, false, [426, 394], [42], 3)], 0, E284S238.L4),
([(8, true, false, [426, 394], [42], 4)], 0, E284S238.L5),
([(8, true, false, [426, 394], [42], 46)], 0, E284S238.L6),
([(8, true, false, [426, 394], [42], 47)], 0, E284S238.L7),
([(8, true, false, [426, 394], [42], 80)], 0, E284S238.L8),
([(8, true, false, [426, 394], [42], 81)], 0, E284S238.L9),
([(8, true, false, [426, 394], [42], 84)], 0, E284S238.L10),
([(8, true, false, [426, 394], [42], 86)], 0, E284S238.L11),
([(8, true, false, [426, 394], [42], 87)], 0, E284S238.L12),
([(8, true, false, [426, 394], [42], 91)], 0, E284S238.L13),
([(8, true, false, [426, 394], [42], 100)], 0, E284S238.L14),
([(8, true, false, [426, 394], [42], 102)], 0, E284S238.L15),
([(8, true, false, [426, 394], [42], 104)], 0, E284S238.L16),
([(8, true, false, [426, 394], [42], 105)], 0, E284S238.L17),
([(8, true, false, [426, 394], [42], 106)], 0, E284S238.L18),
([(8, true, false, [426, 394], [42], 107)], 0, E284S238.L19),
([(8, true, false, [426, 394], [42], 108)], 0, E284S238.L20),
([(8, true, false, [426, 394], [42], 109)], 0, E284S238.L21),
([(8, true, false, [426, 394], [42], 110)], 0, E284S238.L22),
([(8, true, false, [426, 394], [42], 124)], 0, E284S238.L23),
([(8, true, false, [426, 394], [42], 128)], 0, E284S238.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E284S238
