module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S51 "data/lean/55e6b927785458651538a4fe1dbb691c/E207S51.bin"
namespace E207S51
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [266, 426], [80], 30)], 7, E207S51.L1),
([(5, true, false, [266, 426], [80], 36)], 0, E207S51.L2),
([(5, true, false, [266, 426], [80], 45)], 0, E207S51.L3),
([(5, true, false, [266, 426], [80], 88)], 0, E207S51.L4),
([(5, true, false, [266, 426], [80], 136)], 0, E207S51.L5),
([(5, true, false, [266, 426], [80], 137)], 0, E207S51.L6),
([(5, true, false, [266, 426], [80], 143)], 0, E207S51.L7),
([(5, true, false, [266, 426], [80], 160)], 0, E207S51.L8),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 704)], 0, E207S51.L9),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 712)], 0, E207S51.L10),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 732)], 0, E207S51.L11),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 740)], 0, E207S51.L12),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 760)], 0, E207S51.L13),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 764)], 0, E207S51.L14),
([(5, true, false, [266, 426], [80], 30), (4, false, false, [334], [20, 80, 494], 780)], 0, E207S51.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E207S51
