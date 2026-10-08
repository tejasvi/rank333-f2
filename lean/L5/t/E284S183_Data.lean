module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S183 "data/lean/eeed81b3abd418f8173d5f97fd246e99/E284S183.bin"
namespace E284S183
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [116, 266, 84, 298], [], 0)], 0, E284S183.L1),
([(10, true, false, [116, 266, 84, 298], [], 21)], 0, E284S183.L2),
([(10, true, false, [116, 266, 84, 298], [], 25)], 0, E284S183.L3),
([(10, true, false, [116, 266, 84, 298], [], 42)], 0, E284S183.L4),
([(10, true, false, [116, 266, 84, 298], [], 85)], 0, E284S183.L5),
([(10, true, false, [116, 266, 84, 298], [], 88)], 0, E284S183.L6),
([(10, true, false, [116, 266, 84, 298], [], 106)], 0, E284S183.L7),
([(10, true, false, [116, 266, 84, 298], [], 138)], 0, E284S183.L8),
([(10, true, false, [116, 266, 84, 298], [], 139)], 0, E284S183.L9),
([(10, true, false, [116, 266, 84, 298], [], 142)], 0, E284S183.L10),
([(10, true, false, [116, 266, 84, 298], [], 145)], 0, E284S183.L11),
([(10, true, false, [116, 266, 84, 298], [], 159)], 0, E284S183.L12),
([(10, true, false, [116, 266, 84, 298], [], 170)], 0, E284S183.L13),
([(10, true, false, [116, 266, 84, 298], [], 215)], 0, E284S183.L14),
([(10, true, false, [116, 266, 84, 298], [], 335)], 0, E284S183.L15),
([(10, true, false, [116, 266, 84, 298], [], 338)], 0, E284S183.L16),
([(10, true, false, [116, 266, 84, 298], [], 342)], 0, E284S183.L17),
([(10, true, false, [116, 266, 84, 298], [], 347)], 0, E284S183.L18),
([(10, true, false, [116, 266, 84, 298], [], 361)], 0, E284S183.L19),
([(10, true, false, [116, 266, 84, 298], [], 372)], 0, E284S183.L20),
([(10, true, false, [116, 266, 84, 298], [], 474)], 0, E284S183.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E284S183
