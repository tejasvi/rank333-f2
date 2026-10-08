module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S177 "data/lean/539413a57b9ab4fb9c91406477b1a90e/E284S177.bin"
namespace E284S177
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [478], [510], 2)], 0, E284S177.L1),
([(4, true, false, [478], [510], 58)], 0, E284S177.L2),
([(4, true, false, [478], [510], 61)], 0, E284S177.L3),
([(4, true, false, [478], [510], 65)], 0, E284S177.L4),
([(4, true, false, [478], [510], 70)], 0, E284S177.L5),
([(4, true, false, [478], [510], 73)], 0, E284S177.L6),
([(4, true, false, [478], [510], 77)], 0, E284S177.L7),
([(4, true, false, [478], [510], 78)], 0, E284S177.L8),
([(4, true, false, [478], [510], 114)], 0, E284S177.L9),
([(4, true, false, [478], [510], 116)], 0, E284S177.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E284S177
