module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E378S0 "data/lean/dd30c0bc2fa910a10cb4f6ce1d77cb52/E378S0.bin"
namespace E378S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [382], [154], 1)], 0, E378S0.L1),
([(2, true, false, [382], [154], 2)], 0, E378S0.L2),
([(2, true, false, [382], [154], 3)], 0, E378S0.L3),
([(2, true, false, [382], [154], 8)], 0, E378S0.L4),
([(2, true, false, [382], [154], 10)], 0, E378S0.L5),
([(2, true, false, [382], [154], 11)], 0, E378S0.L6),
([(2, true, false, [382], [154], 14)], 0, E378S0.L7),
([(2, true, false, [382], [154], 16)], 0, E378S0.L8),
([(2, true, false, [382], [154], 21)], 0, E378S0.L9),
([(2, true, false, [382], [154], 23)], 0, E378S0.L10),
([(2, true, false, [382], [154], 29)], 0, E378S0.L11),
([(2, true, false, [382], [154], 31)], 0, E378S0.L12),
([(2, true, false, [382], [154], 35)], 0, E378S0.L13),
([(2, true, false, [382], [154], 61)], 0, E378S0.L14),
([(2, true, false, [382], [154], 63)], 0, E378S0.L15),
([(2, true, false, [382], [154], 68)], 0, E378S0.L16),
([(2, true, false, [382], [154], 80)], 0, E378S0.L17),
([(2, true, false, [382], [154], 122)], 0, E378S0.L18),
([(2, true, false, [382], [154], 170)], 0, E378S0.L19),
([(2, true, false, [382], [154], 174)], 0, E378S0.L20),
([(2, true, false, [382], [154], 177)], 0, E378S0.L21),
([(2, true, false, [382], [154], 178)], 0, E378S0.L22),
([(2, true, false, [382], [154], 180)], 0, E378S0.L23),
([(2, true, false, [382], [154], 181)], 0, E378S0.L24),
([(2, true, false, [382], [154], 182)], 0, E378S0.L25),
([(2, true, false, [382], [154], 260)], 0, E378S0.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E378S0
