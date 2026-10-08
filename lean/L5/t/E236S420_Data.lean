module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S420 "data/lean/f8b5abd240b67ec22c089dc4bcc58130/E236S420.bin"
namespace E236S420
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 412], [136], 0)], 0, E236S420.L1),
([(0, true, false, [158, 412], [136], 1)], 0, E236S420.L2),
([(0, true, false, [158, 412], [136], 6)], 0, E236S420.L3),
([(0, true, false, [158, 412], [136], 10)], 0, E236S420.L4),
([(0, true, false, [158, 412], [136], 11)], 0, E236S420.L5),
([(0, true, false, [158, 412], [136], 20)], 0, E236S420.L6),
([(0, true, false, [158, 412], [136], 32)], 0, E236S420.L7),
([(0, true, false, [158, 412], [136], 40)], 0, E236S420.L8),
([(0, true, false, [158, 412], [136], 41)], 0, E236S420.L9),
([(0, true, false, [158, 412], [136], 44)], 0, E236S420.L10),
([(0, true, false, [158, 412], [136], 45)], 0, E236S420.L11),
([(0, true, false, [158, 412], [136], 48)], 0, E236S420.L12),
([(0, true, false, [158, 412], [136], 92)], 0, E236S420.L13),
([(0, true, false, [158, 412], [136], 97)], 0, E236S420.L14),
([(0, true, false, [158, 412], [136], 99)], 0, E236S420.L15),
([(0, true, false, [158, 412], [136], 101)], 0, E236S420.L16),
([(0, true, false, [158, 412], [136], 142)], 0, E236S420.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S420
