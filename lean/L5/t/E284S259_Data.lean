module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S259 "data/lean/6d7ff60eeb3e3a72f863b0c6ac57d555/E284S259.bin"
namespace E284S259
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266, 426], [], 88)], 0, E284S259.L1),
([(4, true, false, [266, 426], [], 89)], 0, E284S259.L2),
([(4, true, false, [266, 426], [], 92)], 0, E284S259.L3),
([(4, true, false, [266, 426], [], 96)], 0, E284S259.L4),
([(4, true, false, [266, 426], [], 152)], 0, E284S259.L5),
([(4, true, false, [266, 426], [], 216)], 0, E284S259.L6),
([(4, true, false, [266, 426], [], 400)], 0, E284S259.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E284S259
