module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S180 "data/lean/cfd3e83de96781aecf1b21af4d7db244/E284S180.bin"
namespace E284S180
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [84, 478], [10], 0)], 0, E284S180.L1),
([(12, true, false, [84, 478], [10], 2)], 0, E284S180.L2),
([(12, true, false, [84, 478], [10], 8)], 0, E284S180.L3),
([(12, true, false, [84, 478], [10], 10)], 0, E284S180.L4),
([(12, true, false, [84, 478], [10], 21)], 0, E284S180.L5),
([(12, true, false, [84, 478], [10], 22)], 0, E284S180.L6),
([(12, true, false, [84, 478], [10], 23)], 0, E284S180.L7),
([(12, true, false, [84, 478], [10], 25)], 0, E284S180.L8),
([(12, true, false, [84, 478], [10], 27)], 0, E284S180.L9),
([(12, true, false, [84, 478], [10], 40)], 0, E284S180.L10),
([(12, true, false, [84, 478], [10], 62)], 0, E284S180.L11),
([(12, true, false, [84, 478], [10], 68)], 0, E284S180.L12),
([(12, true, false, [84, 478], [10], 84)], 0, E284S180.L13),
([(12, true, false, [84, 478], [10], 149)], 0, E284S180.L14),
([(12, true, false, [84, 478], [10], 168)], 0, E284S180.L15),
([(12, true, false, [84, 478], [10], 169)], 0, E284S180.L16),
([(12, true, false, [84, 478], [10], 170)], 0, E284S180.L17),
([(12, true, false, [84, 478], [10], 171)], 0, E284S180.L18),
([(12, true, false, [84, 478], [10], 173)], 0, E284S180.L19),
([(12, true, false, [84, 478], [10], 177)], 0, E284S180.L20),
([(12, true, false, [84, 478], [10], 181)], 0, E284S180.L21),
([(12, true, false, [84, 478], [10], 190)], 0, E284S180.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E284S180
