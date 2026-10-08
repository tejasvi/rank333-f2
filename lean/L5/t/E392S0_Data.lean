module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E392S0 "data/lean/f584a80f19e2d1f019419d82611b99b9/E392S0.bin"
namespace E392S0
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [382], [223], 0)], 0, E392S0.L1),
([(4, true, false, [382], [223], 7)], 0, E392S0.L2),
([(4, true, false, [382], [223], 10)], 0, E392S0.L3),
([(4, true, false, [382], [223], 19)], 0, E392S0.L4),
([(4, true, false, [382], [223], 36)], 0, E392S0.L5),
([(4, true, false, [382], [223], 51)], 0, E392S0.L6),
([(4, true, false, [382], [223], 62)], 0, E392S0.L7),
([(4, true, false, [382], [223], 78)], 0, E392S0.L8),
([(4, true, false, [382], [223], 79)], 0, E392S0.L9),
([(4, true, false, [382], [223], 81)], 0, E392S0.L10),
([(4, true, false, [382], [223], 82)], 0, E392S0.L11),
([(4, true, false, [382], [223], 85)], 0, E392S0.L12),
([(4, true, false, [382], [223], 100)], 0, E392S0.L13),
([(4, true, false, [382], [223], 136)], 0, E392S0.L14),
([(4, true, false, [382], [223], 140)], 0, E392S0.L15),
([(4, true, false, [382], [223], 143)], 0, E392S0.L16),
([(4, true, false, [382], [223], 160)], 0, E392S0.L17),
([(4, true, false, [382], [223], 167)], 0, E392S0.L18),
([(4, true, false, [382], [223], 183)], 0, E392S0.L19),
([(4, true, false, [382], [223], 189)], 0, E392S0.L20),
([(4, true, false, [382], [223], 222)], 0, E392S0.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E392S0
