module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S14 "data/lean/d22ab3cc498a658ae38030df7c6955a7/E236S14.bin"
namespace E236S14
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [412], [96], 1)], 0, E236S14.L1),
([(12, true, false, [412], [96], 20)], 0, E236S14.L2),
([(12, true, false, [412], [96], 21)], 0, E236S14.L3),
([(12, true, false, [412], [96], 22)], 0, E236S14.L4),
([(12, true, false, [412], [96], 23)], 0, E236S14.L5),
([(12, true, false, [412], [96], 25)], 0, E236S14.L6),
([(12, true, false, [412], [96], 35)], 0, E236S14.L7),
([(12, true, false, [412], [96], 62)], 0, E236S14.L8),
([(12, true, false, [412], [96], 64)], 0, E236S14.L9),
([(12, true, false, [412], [96], 70)], 0, E236S14.L10),
([(12, true, false, [412], [96], 74)], 0, E236S14.L11),
([(12, true, false, [412], [96], 90)], 0, E236S14.L12),
([(12, true, false, [412], [96], 91)], 0, E236S14.L13),
([(12, true, false, [412], [96], 170)], 0, E236S14.L14),
([(12, true, false, [412], [96], 171)], 0, E236S14.L15),
([(12, true, false, [412], [96], 172)], 0, E236S14.L16),
([(12, true, false, [412], [96], 174)], 0, E236S14.L17),
([(12, true, false, [412], [96], 175)], 0, E236S14.L18),
([(12, true, false, [412], [96], 176)], 0, E236S14.L19),
([(12, true, false, [412], [96], 185)], 0, E236S14.L20),
([(12, true, false, [412], [96], 196)], 0, E236S14.L21),
([(12, true, false, [412], [96], 199)], 0, E236S14.L22),
([(12, true, false, [412], [96], 204)], 0, E236S14.L23),
([(12, true, false, [412], [96], 205)], 0, E236S14.L24),
([(12, true, false, [412], [96], 206)], 0, E236S14.L25),
([(12, true, false, [412], [96], 208)], 0, E236S14.L26),
([(12, true, false, [412], [96], 209)], 0, E236S14.L27),
([(12, true, false, [412], [96], 211)], 0, E236S14.L28),
([(12, true, false, [412], [96], 212)], 0, E236S14.L29),
([(12, true, false, [412], [96], 216)], 0, E236S14.L30),
([(12, true, false, [412], [96], 225)], 0, E236S14.L31),
([(12, true, false, [412], [96], 275)], 0, E236S14.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E236S14
