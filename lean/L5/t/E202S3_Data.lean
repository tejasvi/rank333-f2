module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E202S3 "data/lean/52ee80d88bf191545f06484d89fc37dd/E202S3.bin"
namespace E202S3
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(8, true, false, [254], [416], 6)], 7, 0, E202S3.L1),
([(8, true, false, [254], [416], 12)], 7, 0, E202S3.L2),
([(8, true, false, [254], [416], 42)], 7, 0, E202S3.L3),
([(8, true, false, [254], [416], 49)], 7, 0, E202S3.L4),
([(8, true, false, [254], [416], 54)], 7, 0, E202S3.L5),
([(8, true, false, [254], [416], 71)], 7, 0, E202S3.L6),
([(8, true, false, [254], [416], 132)], 7, 0, E202S3.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E202S3
