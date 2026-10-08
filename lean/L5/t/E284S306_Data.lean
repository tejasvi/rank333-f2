module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S306 "data/lean/6350b476952c6958c4065ad8baedc15e/E284S306.bin"
namespace E284S306
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [394, 426], [10, 42], 2)], 0, E284S306.L1),
([(2, true, false, [394, 426], [10, 42], 3)], 0, E284S306.L2),
([(2, true, false, [394, 426], [10, 42], 6)], 0, E284S306.L3),
([(2, true, false, [394, 426], [10, 42], 9)], 0, E284S306.L4),
([(2, true, false, [394, 426], [10, 42], 24)], 0, E284S306.L5),
([(2, true, false, [394, 426], [10, 42], 25)], 0, E284S306.L6),
([(2, true, false, [394, 426], [10, 42], 26)], 0, E284S306.L7),
([(2, true, false, [394, 426], [10, 42], 27)], 0, E284S306.L8),
([(2, true, false, [394, 426], [10, 42], 28)], 0, E284S306.L9),
([(2, true, false, [394, 426], [10, 42], 31)], 0, E284S306.L10),
([(2, true, false, [394, 426], [10, 42], 32)], 0, E284S306.L11),
([(2, true, false, [394, 426], [10, 42], 54)], 0, E284S306.L12),
([(2, true, false, [394, 426], [10, 42], 55)], 0, E284S306.L13),
([(2, true, false, [394, 426], [10, 42], 57)], 0, E284S306.L14),
([(2, true, false, [394, 426], [10, 42], 61)], 0, E284S306.L15),
([(2, true, false, [394, 426], [10, 42], 62)], 0, E284S306.L16),
([(2, true, false, [394, 426], [10, 42], 63)], 0, E284S306.L17),
([(2, true, false, [394, 426], [10, 42], 64)], 0, E284S306.L18),
([(2, true, false, [394, 426], [10, 42], 65)], 0, E284S306.L19),
([(2, true, false, [394, 426], [10, 42], 66)], 0, E284S306.L20),
([(2, true, false, [394, 426], [10, 42], 67)], 0, E284S306.L21),
([(2, true, false, [394, 426], [10, 42], 68)], 0, E284S306.L22),
([(2, true, false, [394, 426], [10, 42], 69)], 0, E284S306.L23),
([(2, true, false, [394, 426], [10, 42], 72)], 0, E284S306.L24),
([(2, true, false, [394, 426], [10, 42], 73)], 0, E284S306.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E284S306
