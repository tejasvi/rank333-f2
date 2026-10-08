module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S316 "data/lean/7ec044bdcbdc536e0d54d04cf78834cf/E284S316.bin"
namespace E284S316
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 340, 394, 468], [], 1)], 0, E284S316.L1),
([(3, true, false, [266, 340, 394, 468], [], 3)], 0, E284S316.L2),
([(3, true, false, [266, 340, 394, 468], [], 16)], 0, E284S316.L3),
([(3, true, false, [266, 340, 394, 468], [], 24)], 0, E284S316.L4),
([(3, true, false, [266, 340, 394, 468], [], 52)], 0, E284S316.L5),
([(3, true, false, [266, 340, 394, 468], [], 53)], 0, E284S316.L6),
([(3, true, false, [266, 340, 394, 468], [], 54)], 0, E284S316.L7),
([(3, true, false, [266, 340, 394, 468], [], 55)], 0, E284S316.L8),
([(3, true, false, [266, 340, 394, 468], [], 56)], 0, E284S316.L9),
([(3, true, false, [266, 340, 394, 468], [], 57)], 0, E284S316.L10),
([(3, true, false, [266, 340, 394, 468], [], 58)], 0, E284S316.L11),
([(3, true, false, [266, 340, 394, 468], [], 60)], 0, E284S316.L12),
([(3, true, false, [266, 340, 394, 468], [], 61)], 0, E284S316.L13),
([(3, true, false, [266, 340, 394, 468], [], 62)], 0, E284S316.L14),
([(3, true, false, [266, 340, 394, 468], [], 64)], 0, E284S316.L15),
([(3, true, false, [266, 340, 394, 468], [], 67)], 0, E284S316.L16),
([(3, true, false, [266, 340, 394, 468], [], 69)], 0, E284S316.L17),
([(3, true, false, [266, 340, 394, 468], [], 71)], 0, E284S316.L18),
([(3, true, false, [266, 340, 394, 468], [], 79)], 0, E284S316.L19),
([(3, true, false, [266, 340, 394, 468], [], 80)], 0, E284S316.L20),
([(3, true, false, [266, 340, 394, 468], [], 86)], 0, E284S316.L21),
([(3, true, false, [266, 340, 394, 468], [], 87)], 0, E284S316.L22),
([(3, true, false, [266, 340, 394, 468], [], 99)], 0, E284S316.L23),
([(3, true, false, [266, 340, 394, 468], [], 126)], 0, E284S316.L24),
([(3, true, false, [266, 340, 394, 468], [], 143)], 0, E284S316.L25),
([(3, true, false, [266, 340, 394, 468], [], 144)], 0, E284S316.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E284S316
