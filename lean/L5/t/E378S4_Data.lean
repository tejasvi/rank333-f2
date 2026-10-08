module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E378S4 "data/lean/b78888e6bd5d16f32490564abbb14894/E378S4.bin"
namespace E378S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [], [324], 0)], 0, E378S4.L1),
([(3, true, false, [], [324], 5)], 0, E378S4.L2),
([(3, true, false, [], [324], 51)], 0, E378S4.L3),
([(3, true, false, [], [324], 149)], 0, E378S4.L4),
([(3, true, false, [], [324], 150)], 0, E378S4.L5),
([(3, true, false, [], [324], 156)], 0, E378S4.L6),
([(3, true, false, [], [324], 168)], 0, E378S4.L7),
([(3, true, false, [], [324], 238)], 0, E378S4.L8),
([(3, true, false, [], [324], 369)], 0, E378S4.L9),
([(3, true, false, [], [324], 381)], 0, E378S4.L10),
([(3, true, false, [], [324], 445)], 0, E378S4.L11),
([(3, true, false, [], [324], 454)], 0, E378S4.L12),
([(3, true, false, [], [324], 457)], 0, E378S4.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E378S4
