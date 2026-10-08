module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S182 "data/lean/634233dcfd996b7c77705ba583f67bc9/E284S182.bin"
namespace E284S182
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [266, 298], [], 88)], 0, E284S182.L1),
([(4, true, false, [266, 298], [], 166)], 0, E284S182.L2),
([(4, true, false, [266, 298], [], 167)], 0, E284S182.L3),
([(4, true, false, [266, 298], [], 168)], 0, E284S182.L4),
([(4, true, false, [266, 298], [], 169)], 0, E284S182.L5),
([(4, true, false, [266, 298], [], 170)], 0, E284S182.L6),
([(4, true, false, [266, 298], [], 171)], 0, E284S182.L7),
([(4, true, false, [266, 298], [], 172)], 0, E284S182.L8),
([(4, true, false, [266, 298], [], 173)], 0, E284S182.L9),
([(4, true, false, [266, 298], [], 174)], 0, E284S182.L10),
([(4, true, false, [266, 298], [], 175)], 0, E284S182.L11),
([(4, true, false, [266, 298], [], 176)], 0, E284S182.L12),
([(4, true, false, [266, 298], [], 177)], 0, E284S182.L13),
([(4, true, false, [266, 298], [], 178)], 0, E284S182.L14),
([(4, true, false, [266, 298], [], 179)], 0, E284S182.L15),
([(4, true, false, [266, 298], [], 180)], 0, E284S182.L16),
([(4, true, false, [266, 298], [], 181)], 0, E284S182.L17),
([(4, true, false, [266, 298], [], 182)], 0, E284S182.L18),
([(4, true, false, [266, 298], [], 183)], 0, E284S182.L19),
([(4, true, false, [266, 298], [], 184)], 0, E284S182.L20),
([(4, true, false, [266, 298], [], 185)], 0, E284S182.L21),
([(4, true, false, [266, 298], [], 198)], 0, E284S182.L22),
([(4, true, false, [266, 298], [], 244)], 0, E284S182.L23),
([(4, true, false, [266, 298], [], 260)], 0, E284S182.L24),
([(4, true, false, [266, 298], [], 380)], 0, E284S182.L25),
([(4, true, false, [266, 298], [], 436)], 0, E284S182.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E284S182
