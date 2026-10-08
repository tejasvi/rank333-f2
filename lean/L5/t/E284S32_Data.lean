module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S32 "data/lean/7bd18a19616240422e761d84a3e1ba2d/E284S32.bin"
namespace E284S32
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 266, 212], [138], 0)], 0, E284S32.L1),
([(8, true, false, [254, 266, 212], [138], 1)], 0, E284S32.L2),
([(8, true, false, [254, 266, 212], [138], 3)], 0, E284S32.L3),
([(8, true, false, [254, 266, 212], [138], 4)], 0, E284S32.L4),
([(8, true, false, [254, 266, 212], [138], 5)], 0, E284S32.L5),
([(8, true, false, [254, 266, 212], [138], 7)], 0, E284S32.L6),
([(8, true, false, [254, 266, 212], [138], 8)], 0, E284S32.L7),
([(8, true, false, [254, 266, 212], [138], 20)], 0, E284S32.L8),
([(8, true, false, [254, 266, 212], [138], 21)], 0, E284S32.L9),
([(8, true, false, [254, 266, 212], [138], 34)], 0, E284S32.L10),
([(8, true, false, [254, 266, 212], [138], 41)], 0, E284S32.L11),
([(8, true, false, [254, 266, 212], [138], 42)], 0, E284S32.L12),
([(8, true, false, [254, 266, 212], [138], 43)], 0, E284S32.L13),
([(8, true, false, [254, 266, 212], [138], 83)], 0, E284S32.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E284S32
