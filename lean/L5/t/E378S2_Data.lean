module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E378S2 "data/lean/f9c231cc35f76011289715009c8c5433/E378S2.bin"
namespace E378S2
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [111, 395], [], 88)], 0, E378S2.L1),
([(15, true, false, [111, 395], [], 89)], 0, E378S2.L2),
([(15, true, false, [111, 395], [], 90)], 0, E378S2.L3),
([(15, true, false, [111, 395], [], 91)], 0, E378S2.L4),
([(15, true, false, [111, 395], [], 93)], 0, E378S2.L5),
([(15, true, false, [111, 395], [], 94)], 0, E378S2.L6),
([(15, true, false, [111, 395], [], 95)], 0, E378S2.L7),
([(15, true, false, [111, 395], [], 96)], 0, E378S2.L8),
([(15, true, false, [111, 395], [], 97)], 0, E378S2.L9),
([(15, true, false, [111, 395], [], 109)], 0, E378S2.L10),
([(15, true, false, [111, 395], [], 152)], 0, E378S2.L11),
([(15, true, false, [111, 395], [], 172)], 0, E378S2.L12),
([(15, true, false, [111, 395], [], 217)], 0, E378S2.L13),
([(15, true, false, [111, 395], [], 225)], 0, E378S2.L14),
([(15, true, false, [111, 395], [], 365)], 0, E378S2.L15),
([(15, true, false, [111, 395], [], 401)], 0, E378S2.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E378S2
