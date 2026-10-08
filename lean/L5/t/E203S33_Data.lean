module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S33 "data/lean/21d768cf8566729c9a6328849647f078/E203S33.bin"
namespace E203S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [314, 410], [400], 30)], 0, E203S33.L1),
([(0, true, false, [314, 410], [400], 32)], 0, E203S33.L2),
([(0, true, false, [314, 410], [400], 34)], 0, E203S33.L3),
([(0, true, false, [314, 410], [400], 36)], 0, E203S33.L4),
([(0, true, false, [314, 410], [400], 38)], 0, E203S33.L5),
([(0, true, false, [314, 410], [400], 42)], 0, E203S33.L6),
([(0, true, false, [314, 410], [400], 46)], 0, E203S33.L7),
([(0, true, false, [314, 410], [400], 51)], 0, E203S33.L8),
([(0, true, false, [314, 410], [400], 53)], 0, E203S33.L9),
([(0, true, false, [314, 410], [400], 55)], 0, E203S33.L10),
([(0, true, false, [314, 410], [400], 57)], 0, E203S33.L11),
([(0, true, false, [314, 410], [400], 59)], 0, E203S33.L12),
([(0, true, false, [314, 410], [400], 63)], 0, E203S33.L13),
([(0, true, false, [314, 410], [400], 67)], 0, E203S33.L14),
([(0, true, false, [314, 410], [400], 70)], 0, E203S33.L15),
([(0, true, false, [314, 410], [400], 75)], 0, E203S33.L16),
([(0, true, false, [314, 410], [400], 82)], 0, E203S33.L17),
([(0, true, false, [314, 410], [400], 83)], 0, E203S33.L18),
([(0, true, false, [314, 410], [400], 86)], 0, E203S33.L19),
([(0, true, false, [314, 410], [400], 88)], 0, E203S33.L20),
([(0, true, false, [314, 410], [400], 89)], 0, E203S33.L21),
([(0, true, false, [314, 410], [400], 92)], 0, E203S33.L22),
([(0, true, false, [314, 410], [400], 94)], 0, E203S33.L23),
([(0, true, false, [314, 410], [400], 95)], 0, E203S33.L24),
([(0, true, false, [314, 410], [400], 96)], 0, E203S33.L25),
([(0, true, false, [314, 410], [400], 98)], 0, E203S33.L26),
([(0, true, false, [314, 410], [400], 99)], 0, E203S33.L27),
([(0, true, false, [314, 410], [400], 104)], 0, E203S33.L28),
([(0, true, false, [314, 410], [400], 113)], 0, E203S33.L29),
([(0, true, false, [314, 410], [400], 115)], 0, E203S33.L30),
([(0, true, false, [314, 410], [400], 124)], 0, E203S33.L31),
([(0, true, false, [314, 410], [400], 135)], 0, E203S33.L32),
([(0, true, false, [314, 410], [400], 140)], 0, E203S33.L33),
([(0, true, false, [314, 410], [400], 142)], 0, E203S33.L34),
([(0, true, false, [314, 410], [400], 143)], 0, E203S33.L35),
([(0, true, false, [314, 410], [400], 145)], 0, E203S33.L36),
([(0, true, false, [314, 410], [400], 146)], 0, E203S33.L37),
([(0, true, false, [314, 410], [400], 147)], 0, E203S33.L38),
([(0, true, false, [314, 410], [400], 152)], 0, E203S33.L39),
([(0, true, false, [314, 410], [400], 153)], 0, E203S33.L40),
([(0, true, false, [314, 410], [400], 154)], 0, E203S33.L41),
([(0, true, false, [314, 410], [400], 155)], 0, E203S33.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E203S33
