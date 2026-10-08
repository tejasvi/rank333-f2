module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S278 "data/lean/4ffb02c285169232bb64cb03eb5f63d6/E284S278.bin"
namespace E284S278
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 212, 478], [138], 13)], 0, E284S278.L1),
([(2, true, false, [84, 212, 478], [138], 15)], 0, E284S278.L2),
([(2, true, false, [84, 212, 478], [138], 19)], 0, E284S278.L3),
([(2, true, false, [84, 212, 478], [138], 23)], 0, E284S278.L4),
([(2, true, false, [84, 212, 478], [138], 29)], 0, E284S278.L5),
([(2, true, false, [84, 212, 478], [138], 30)], 0, E284S278.L6),
([(2, true, false, [84, 212, 478], [138], 31)], 0, E284S278.L7),
([(2, true, false, [84, 212, 478], [138], 35)], 0, E284S278.L8),
([(2, true, false, [84, 212, 478], [138], 36)], 0, E284S278.L9),
([(2, true, false, [84, 212, 478], [138], 43)], 0, E284S278.L10),
([(2, true, false, [84, 212, 478], [138], 48)], 0, E284S278.L11),
([(2, true, false, [84, 212, 478], [138], 55)], 0, E284S278.L12),
([(2, true, false, [84, 212, 478], [138], 65)], 0, E284S278.L13),
([(2, true, false, [84, 212, 478], [138], 75)], 0, E284S278.L14),
([(2, true, false, [84, 212, 478], [138], 89)], 0, E284S278.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E284S278
