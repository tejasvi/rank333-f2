module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S246 "data/lean/9478d4894632ae8c75d3ec46b8b461b2/E284S246.bin"
namespace E284S246
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [298, 394, 266, 426], [10], 0)], 0, E284S246.L1),
([(6, true, false, [298, 394, 266, 426], [10], 10)], 0, E284S246.L2),
([(6, true, false, [298, 394, 266, 426], [10], 11)], 0, E284S246.L3),
([(6, true, false, [298, 394, 266, 426], [10], 14)], 0, E284S246.L4),
([(6, true, false, [298, 394, 266, 426], [10], 17)], 0, E284S246.L5),
([(6, true, false, [298, 394, 266, 426], [10], 31)], 0, E284S246.L6),
([(6, true, false, [298, 394, 266, 426], [10], 48)], 0, E284S246.L7),
([(6, true, false, [298, 394, 266, 426], [10], 49)], 0, E284S246.L8),
([(6, true, false, [298, 394, 266, 426], [10], 91)], 0, E284S246.L9),
([(6, true, false, [298, 394, 266, 426], [10], 99)], 0, E284S246.L10),
([(6, true, false, [298, 394, 266, 426], [10], 123)], 0, E284S246.L11),
([(6, true, false, [298, 394, 266, 426], [10], 129)], 0, E284S246.L12),
([(6, true, false, [298, 394, 266, 426], [10], 142)], 0, E284S246.L13),
([(6, true, false, [298, 394, 266, 426], [10], 144)], 0, E284S246.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S246
