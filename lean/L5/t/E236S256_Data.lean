module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S256 "data/lean/568d005662891d4d579678af3dbcfbcd/E236S256.bin"
namespace E236S256
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 412], [276], 23)], 0, E236S256.L1),
([(5, true, false, [158, 412], [276], 24)], 0, E236S256.L2),
([(5, true, false, [158, 412], [276], 25)], 0, E236S256.L3),
([(5, true, false, [158, 412], [276], 26)], 0, E236S256.L4),
([(5, true, false, [158, 412], [276], 28)], 0, E236S256.L5),
([(5, true, false, [158, 412], [276], 29)], 0, E236S256.L6),
([(5, true, false, [158, 412], [276], 30)], 0, E236S256.L7),
([(5, true, false, [158, 412], [276], 44)], 0, E236S256.L8),
([(5, true, false, [158, 412], [276], 45)], 0, E236S256.L9),
([(5, true, false, [158, 412], [276], 47)], 0, E236S256.L10),
([(5, true, false, [158, 412], [276], 48)], 0, E236S256.L11),
([(5, true, false, [158, 412], [276], 54)], 0, E236S256.L12),
([(5, true, false, [158, 412], [276], 74)], 0, E236S256.L13),
([(5, true, false, [158, 412], [276], 75)], 0, E236S256.L14),
([(5, true, false, [158, 412], [276], 95)], 0, E236S256.L15),
([(5, true, false, [158, 412], [276], 116)], 0, E236S256.L16),
([(5, true, false, [158, 412], [276], 129)], 0, E236S256.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S256
