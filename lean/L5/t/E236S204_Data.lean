module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S204 "data/lean/46c28ffa4872d3dc9ab4a433e910bead/E236S204.bin"
namespace E236S204
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [394, 412, 254], [136], 0)], 0, E236S204.L1),
([(0, true, false, [394, 412, 254], [136], 6)], 0, E236S204.L2),
([(0, true, false, [394, 412, 254], [136], 20)], 0, E236S204.L3),
([(0, true, false, [394, 412, 254], [136], 26)], 0, E236S204.L4),
([(0, true, false, [394, 412, 254], [136], 34)], 0, E236S204.L5),
([(0, true, false, [394, 412, 254], [136], 35)], 0, E236S204.L6),
([(0, true, false, [394, 412, 254], [136], 68)], 0, E236S204.L7),
([(0, true, false, [394, 412, 254], [136], 69)], 0, E236S204.L8),
([(0, true, false, [394, 412, 254], [136], 74)], 0, E236S204.L9),
([(0, true, false, [394, 412, 254], [136], 76)], 0, E236S204.L10),
([(0, true, false, [394, 412, 254], [136], 78)], 0, E236S204.L11),
([(0, true, false, [394, 412, 254], [136], 79)], 0, E236S204.L12),
([(0, true, false, [394, 412, 254], [136], 86)], 0, E236S204.L13),
([(0, true, false, [394, 412, 254], [136], 88)], 0, E236S204.L14),
([(0, true, false, [394, 412, 254], [136], 89)], 0, E236S204.L15),
([(0, true, false, [394, 412, 254], [136], 92)], 0, E236S204.L16),
([(0, true, false, [394, 412, 254], [136], 93)], 0, E236S204.L17),
([(0, true, false, [394, 412, 254], [136], 94)], 0, E236S204.L18),
([(0, true, false, [394, 412, 254], [136], 102)], 0, E236S204.L19),
([(0, true, false, [394, 412, 254], [136], 105)], 0, E236S204.L20),
([(0, true, false, [394, 412, 254], [136], 107)], 0, E236S204.L21),
([(0, true, false, [394, 412, 254], [136], 112)], 0, E236S204.L22),
([(0, true, false, [394, 412, 254], [136], 113)], 0, E236S204.L23),
([(0, true, false, [394, 412, 254], [136], 119)], 0, E236S204.L24),
([(0, true, false, [394, 412, 254], [136], 121)], 0, E236S204.L25),
([(0, true, false, [394, 412, 254], [136], 126)], 0, E236S204.L26),
([(0, true, false, [394, 412, 254], [136], 136)], 0, E236S204.L27),
([(0, true, false, [394, 412, 254], [136], 137)], 0, E236S204.L28),
([(0, true, false, [394, 412, 254], [136], 138)], 0, E236S204.L29),
([(0, true, false, [394, 412, 254], [136], 139)], 0, E236S204.L30),
([(0, true, false, [394, 412, 254], [136], 140)], 0, E236S204.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S204
