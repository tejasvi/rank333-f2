module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S9 "data/lean/5d4ab1110efb9b1f22f0d9a8cbc521ba/E237S9.bin"
namespace E237S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [116, 354], [392, 488], 0)], 0, E237S9.L1),
([(10, true, false, [116, 354], [392, 488], 9)], 0, E237S9.L2),
([(10, true, false, [116, 354], [392, 488], 14)], 0, E237S9.L3),
([(10, true, false, [116, 354], [392, 488], 17)], 0, E237S9.L4),
([(10, true, false, [116, 354], [392, 488], 24)], 0, E237S9.L5),
([(10, true, false, [116, 354], [392, 488], 25)], 0, E237S9.L6),
([(10, true, false, [116, 354], [392, 488], 26)], 0, E237S9.L7),
([(10, true, false, [116, 354], [392, 488], 27)], 0, E237S9.L8),
([(10, true, false, [116, 354], [392, 488], 29)], 0, E237S9.L9),
([(10, true, false, [116, 354], [392, 488], 32)], 0, E237S9.L10),
([(10, true, false, [116, 354], [392, 488], 40)], 0, E237S9.L11),
([(10, true, false, [116, 354], [392, 488], 41)], 0, E237S9.L12),
([(10, true, false, [116, 354], [392, 488], 46)], 0, E237S9.L13),
([(10, true, false, [116, 354], [392, 488], 47)], 0, E237S9.L14),
([(10, true, false, [116, 354], [392, 488], 48)], 0, E237S9.L15),
([(10, true, false, [116, 354], [392, 488], 49)], 0, E237S9.L16),
([(10, true, false, [116, 354], [392, 488], 50)], 0, E237S9.L17),
([(10, true, false, [116, 354], [392, 488], 51)], 0, E237S9.L18),
([(10, true, false, [116, 354], [392, 488], 53)], 0, E237S9.L19),
([(10, true, false, [116, 354], [392, 488], 54)], 0, E237S9.L20),
([(10, true, false, [116, 354], [392, 488], 58)], 0, E237S9.L21),
([(10, true, false, [116, 354], [392, 488], 69)], 0, E237S9.L22),
([(10, true, false, [116, 354], [392, 488], 70)], 0, E237S9.L23),
([(10, true, false, [116, 354], [392, 488], 88)], 0, E237S9.L24),
([(10, true, false, [116, 354], [392, 488], 90)], 0, E237S9.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E237S9
