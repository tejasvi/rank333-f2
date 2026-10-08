module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S203 "data/lean/590178cad10034c8d9327539107fd4d9/E213S203.bin"
namespace E213S203
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [106], [148, 388], 3)], 0, E213S203.L1),
([(16, true, false, [106], [148, 388], 6)], 0, E213S203.L2),
([(16, true, false, [106], [148, 388], 23)], 0, E213S203.L3),
([(16, true, false, [106], [148, 388], 26)], 0, E213S203.L4),
([(16, true, false, [106], [148, 388], 30)], 0, E213S203.L5),
([(16, true, false, [106], [148, 388], 32)], 0, E213S203.L6),
([(16, true, false, [106], [148, 388], 37)], 0, E213S203.L7),
([(16, true, false, [106], [148, 388], 43)], 0, E213S203.L8),
([(16, true, false, [106], [148, 388], 45)], 0, E213S203.L9),
([(16, true, false, [106], [148, 388], 48)], 0, E213S203.L10),
([(16, true, false, [106], [148, 388], 51)], 0, E213S203.L11),
([(16, true, false, [106], [148, 388], 56)], 0, E213S203.L12),
([(16, true, false, [106], [148, 388], 58)], 0, E213S203.L13),
([(16, true, false, [106], [148, 388], 66)], 0, E213S203.L14),
([(16, true, false, [106], [148, 388], 69)], 0, E213S203.L15),
([(16, true, false, [106], [148, 388], 71)], 0, E213S203.L16),
([(16, true, false, [106], [148, 388], 73)], 0, E213S203.L17),
([(16, true, false, [106], [148, 388], 74)], 0, E213S203.L18),
([(16, true, false, [106], [148, 388], 84)], 0, E213S203.L19),
([(16, true, false, [106], [148, 388], 94)], 0, E213S203.L20),
([(16, true, false, [106], [148, 388], 96)], 0, E213S203.L21),
([(16, true, false, [106], [148, 388], 118)], 0, E213S203.L22),
([(16, true, false, [106], [148, 388], 153)], 0, E213S203.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E213S203
