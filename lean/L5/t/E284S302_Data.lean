module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S302 "data/lean/44ad7194b37f990c80b7d6fbdcfc8835/E284S302.bin"
namespace E284S302
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [298, 426], [10, 138], 0)], 0, E284S302.L1),
([(2, true, false, [298, 426], [10, 138], 1)], 0, E284S302.L2),
([(2, true, false, [298, 426], [10, 138], 2)], 0, E284S302.L3),
([(2, true, false, [298, 426], [10, 138], 4)], 0, E284S302.L4),
([(2, true, false, [298, 426], [10, 138], 7)], 0, E284S302.L5),
([(2, true, false, [298, 426], [10, 138], 14)], 0, E284S302.L6),
([(2, true, false, [298, 426], [10, 138], 17)], 0, E284S302.L7),
([(2, true, false, [298, 426], [10, 138], 18)], 0, E284S302.L8),
([(2, true, false, [298, 426], [10, 138], 19)], 0, E284S302.L9),
([(2, true, false, [298, 426], [10, 138], 30)], 0, E284S302.L10),
([(2, true, false, [298, 426], [10, 138], 32)], 0, E284S302.L11),
([(2, true, false, [298, 426], [10, 138], 34)], 0, E284S302.L12),
([(2, true, false, [298, 426], [10, 138], 37)], 0, E284S302.L13),
([(2, true, false, [298, 426], [10, 138], 44)], 0, E284S302.L14),
([(2, true, false, [298, 426], [10, 138], 45)], 0, E284S302.L15),
([(2, true, false, [298, 426], [10, 138], 46)], 0, E284S302.L16),
([(2, true, false, [298, 426], [10, 138], 47)], 0, E284S302.L17),
([(2, true, false, [298, 426], [10, 138], 59)], 0, E284S302.L18),
([(2, true, false, [298, 426], [10, 138], 60)], 0, E284S302.L19),
([(2, true, false, [298, 426], [10, 138], 72)], 0, E284S302.L20),
([(2, true, false, [298, 426], [10, 138], 73)], 0, E284S302.L21),
([(2, true, false, [298, 426], [10, 138], 82)], 0, E284S302.L22),
([(2, true, false, [298, 426], [10, 138], 83)], 0, E284S302.L23),
([(2, true, false, [298, 426], [10, 138], 85)], 0, E284S302.L24),
([(2, true, false, [298, 426], [10, 138], 86)], 0, E284S302.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E284S302
