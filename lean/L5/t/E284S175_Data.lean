module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S175 "data/lean/10cd388003514bae6549867352d2019a/E284S175.bin"
namespace E284S175
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [84, 116], [], 0)], 0, E284S175.L1),
([(5, true, false, [84, 116], [], 110)], 0, E284S175.L2),
([(5, true, false, [84, 116], [], 216)], 0, E284S175.L3),
([(5, true, false, [84, 116], [], 217)], 0, E284S175.L4),
([(5, true, false, [84, 116], [], 218)], 0, E284S175.L5),
([(5, true, false, [84, 116], [], 219)], 0, E284S175.L6),
([(5, true, false, [84, 116], [], 220)], 0, E284S175.L7),
([(5, true, false, [84, 116], [], 221)], 0, E284S175.L8),
([(5, true, false, [84, 116], [], 222)], 0, E284S175.L9),
([(5, true, false, [84, 116], [], 224)], 0, E284S175.L10),
([(5, true, false, [84, 116], [], 244)], 0, E284S175.L11),
([(5, true, false, [84, 116], [], 245)], 0, E284S175.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E284S175
