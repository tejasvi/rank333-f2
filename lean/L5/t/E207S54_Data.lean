module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S54 "data/lean/f8d188bcfe05061946ec051d18c4681c/E207S54.bin"
namespace E207S54
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [334, 494], [80], 1)], 0, E207S54.L1),
([(5, true, false, [334, 494], [80], 4)], 0, E207S54.L2),
([(5, true, false, [334, 494], [80], 10)], 0, E207S54.L3),
([(5, true, false, [334, 494], [80], 16)], 0, E207S54.L4),
([(5, true, false, [334, 494], [80], 30)], 0, E207S54.L5),
([(5, true, false, [334, 494], [80], 62)], 0, E207S54.L6),
([(5, true, false, [334, 494], [80], 67)], 0, E207S54.L7),
([(5, true, false, [334, 494], [80], 99)], 0, E207S54.L8),
([(5, true, false, [334, 494], [80], 103)], 0, E207S54.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E207S54
