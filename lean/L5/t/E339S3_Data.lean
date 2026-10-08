module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E339S3 "data/lean/932be9635971ca63ce6dc8852a57be3e/E339S3.bin"
namespace E339S3
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(2, true, false, [], [], 3)], 25, 0, E339S3.L1),
([(2, true, false, [], [], 5)], 25, 0, E339S3.L2),
([(2, true, false, [], [], 10)], 25, 0, E339S3.L3),
([(2, true, false, [], [], 23)], 25, 0, E339S3.L4),
([(2, true, false, [], [], 25)], 25, 0, E339S3.L5),
([(2, true, false, [], [], 101)], 25, 0, E339S3.L6),
([(2, true, false, [], [], 103)], 25, 0, E339S3.L7),
([(2, true, false, [], [], 322)], 25, 0, E339S3.L8),
([(2, true, false, [], [], 326)], 25, 0, E339S3.L9),
([(2, true, false, [], [], 333)], 25, 0, E339S3.L10),
([(2, true, false, [], [], 348)], 25, 0, E339S3.L11),
([(2, true, false, [], [], 351)], 25, 0, E339S3.L12),
([(2, true, false, [], [], 374)], 25, 0, E339S3.L13),
([(2, true, false, [], [], 424)], 25, 0, E339S3.L14),
([(2, true, false, [], [], 451)], 25, 0, E339S3.L15),
([(2, true, false, [], [], 455)], 25, 0, E339S3.L16),
([(2, true, false, [], [], 647)], 25, 0, E339S3.L17),
([(2, true, false, [], [], 648)], 25, 0, E339S3.L18),
([(2, true, false, [], [], 724)], 25, 0, E339S3.L19),
([(2, true, false, [], [], 728)], 25, 0, E339S3.L20),
([(2, true, false, [], [], 1222)], 25, 0, E339S3.L21),
([(2, true, false, [], [], 1249)], 25, 0, E339S3.L22),
([(2, true, false, [], [], 1253)], 25, 0, E339S3.L23),
([(2, true, false, [], [], 1396)], 25, 0, E339S3.L24),
([(2, true, false, [], [], 1424)], 25, 0, E339S3.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E339S3
