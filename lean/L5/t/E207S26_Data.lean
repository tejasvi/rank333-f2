module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S26 "data/lean/631071a0c34204deae143c9339869a4c/E207S26.bin"
namespace E207S26
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266, 426], [80, 240], 18)], 0, E207S26.L1),
([(13, true, false, [266, 426], [80, 240], 19)], 0, E207S26.L2),
([(13, true, false, [266, 426], [80, 240], 20)], 0, E207S26.L3),
([(13, true, false, [266, 426], [80, 240], 21)], 0, E207S26.L4),
([(13, true, false, [266, 426], [80, 240], 22)], 0, E207S26.L5),
([(13, true, false, [266, 426], [80, 240], 23)], 0, E207S26.L6),
([(13, true, false, [266, 426], [80, 240], 24)], 0, E207S26.L7),
([(13, true, false, [266, 426], [80, 240], 32)], 0, E207S26.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E207S26
