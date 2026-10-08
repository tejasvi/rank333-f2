module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S40 "data/lean/93c05c1572224490037572e0e538ab59/E236S40.bin"
namespace E236S40
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [412], [508], 4)], 0, E236S40.L1),
([(8, true, false, [412], [508], 5)], 0, E236S40.L2),
([(8, true, false, [412], [508], 7)], 0, E236S40.L3),
([(8, true, false, [412], [508], 10)], 0, E236S40.L4),
([(8, true, false, [412], [508], 42)], 0, E236S40.L5),
([(8, true, false, [412], [508], 43)], 0, E236S40.L6),
([(8, true, false, [412], [508], 44)], 0, E236S40.L7),
([(8, true, false, [412], [508], 45)], 0, E236S40.L8),
([(8, true, false, [412], [508], 48)], 0, E236S40.L9),
([(8, true, false, [412], [508], 49)], 0, E236S40.L10),
([(8, true, false, [412], [508], 52)], 0, E236S40.L11),
([(8, true, false, [412], [508], 54)], 0, E236S40.L12),
([(8, true, false, [412], [508], 55)], 0, E236S40.L13),
([(8, true, false, [412], [508], 56)], 0, E236S40.L14),
([(8, true, false, [412], [508], 57)], 0, E236S40.L15),
([(8, true, false, [412], [508], 60)], 0, E236S40.L16),
([(8, true, false, [412], [508], 61)], 0, E236S40.L17),
([(8, true, false, [412], [508], 74)], 0, E236S40.L18),
([(8, true, false, [412], [508], 78)], 0, E236S40.L19),
([(8, true, false, [412], [508], 80)], 0, E236S40.L20),
([(8, true, false, [412], [508], 81)], 0, E236S40.L21),
([(8, true, false, [412], [508], 83)], 0, E236S40.L22),
([(8, true, false, [412], [508], 84)], 0, E236S40.L23),
([(8, true, false, [412], [508], 116)], 0, E236S40.L24),
([(8, true, false, [412], [508], 117)], 0, E236S40.L25),
([(8, true, false, [412], [508], 126)], 0, E236S40.L26),
([(8, true, false, [412], [508], 138)], 0, E236S40.L27),
([(8, true, false, [412], [508], 140)], 0, E236S40.L28),
([(8, true, false, [412], [508], 160)], 0, E236S40.L29),
([(8, true, false, [412], [508], 162)], 0, E236S40.L30),
([(8, true, false, [412], [508], 165)], 0, E236S40.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S40
