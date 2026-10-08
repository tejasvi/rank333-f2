module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S13 "data/lean/de1109f5e44f68855e19b76348abcfcd/E284S13.bin"
namespace E284S13
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 468, 254], [10], 0)], 0, E284S13.L1),
([(3, true, false, [266, 468, 254], [10], 1)], 0, E284S13.L2),
([(3, true, false, [266, 468, 254], [10], 2)], 0, E284S13.L3),
([(3, true, false, [266, 468, 254], [10], 10)], 0, E284S13.L4),
([(3, true, false, [266, 468, 254], [10], 11)], 0, E284S13.L5),
([(3, true, false, [266, 468, 254], [10], 12)], 0, E284S13.L6),
([(3, true, false, [266, 468, 254], [10], 16)], 0, E284S13.L7),
([(3, true, false, [266, 468, 254], [10], 30)], 0, E284S13.L8),
([(3, true, false, [266, 468, 254], [10], 34)], 0, E284S13.L9),
([(3, true, false, [266, 468, 254], [10], 48)], 0, E284S13.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S13
