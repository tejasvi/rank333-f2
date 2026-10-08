module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S185 "data/lean/6c645ace7c0da8885a19bb1871a803f4/E213S185.bin"
namespace E213S185
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 244, 282], [], 0)], 0, E213S185.L1),
([(2, true, false, [106, 244, 282], [], 2)], 0, E213S185.L2),
([(2, true, false, [106, 244, 282], [], 3)], 0, E213S185.L3),
([(2, true, false, [106, 244, 282], [], 4)], 0, E213S185.L4),
([(2, true, false, [106, 244, 282], [], 6)], 0, E213S185.L5),
([(2, true, false, [106, 244, 282], [], 7)], 0, E213S185.L6),
([(2, true, false, [106, 244, 282], [], 8)], 0, E213S185.L7),
([(2, true, false, [106, 244, 282], [], 9)], 0, E213S185.L8),
([(2, true, false, [106, 244, 282], [], 10)], 0, E213S185.L9),
([(2, true, false, [106, 244, 282], [], 12)], 0, E213S185.L10),
([(2, true, false, [106, 244, 282], [], 21)], 0, E213S185.L11),
([(2, true, false, [106, 244, 282], [], 22)], 0, E213S185.L12),
([(2, true, false, [106, 244, 282], [], 31)], 0, E213S185.L13),
([(2, true, false, [106, 244, 282], [], 37)], 0, E213S185.L14),
([(2, true, false, [106, 244, 282], [], 38)], 0, E213S185.L15),
([(2, true, false, [106, 244, 282], [], 39)], 0, E213S185.L16),
([(2, true, false, [106, 244, 282], [], 40)], 0, E213S185.L17),
([(2, true, false, [106, 244, 282], [], 41)], 0, E213S185.L18),
([(2, true, false, [106, 244, 282], [], 42)], 0, E213S185.L19),
([(2, true, false, [106, 244, 282], [], 43)], 0, E213S185.L20),
([(2, true, false, [106, 244, 282], [], 44)], 0, E213S185.L21),
([(2, true, false, [106, 244, 282], [], 46)], 0, E213S185.L22),
([(2, true, false, [106, 244, 282], [], 47)], 0, E213S185.L23),
([(2, true, false, [106, 244, 282], [], 49)], 0, E213S185.L24),
([(2, true, false, [106, 244, 282], [], 51)], 0, E213S185.L25),
([(2, true, false, [106, 244, 282], [], 55)], 0, E213S185.L26),
([(2, true, false, [106, 244, 282], [], 65)], 0, E213S185.L27),
([(2, true, false, [106, 244, 282], [], 67)], 0, E213S185.L28),
([(2, true, false, [106, 244, 282], [], 69)], 0, E213S185.L29),
([(2, true, false, [106, 244, 282], [], 73)], 0, E213S185.L30),
([(2, true, false, [106, 244, 282], [], 89)], 0, E213S185.L31),
([(2, true, false, [106, 244, 282], [], 93)], 0, E213S185.L32),
([(2, true, false, [106, 244, 282], [], 107)], 0, E213S185.L33),
([(2, true, false, [106, 244, 282], [], 115)], 0, E213S185.L34),
([(2, true, false, [106, 244, 282], [], 117)], 0, E213S185.L35),
([(2, true, false, [106, 244, 282], [], 126)], 0, E213S185.L36),
([(2, true, false, [106, 244, 282], [], 131)], 0, E213S185.L37),
([(2, true, false, [106, 244, 282], [], 137)], 0, E213S185.L38),
([(2, true, false, [106, 244, 282], [], 145)], 0, E213S185.L39),
([(2, true, false, [106, 244, 282], [], 148)], 0, E213S185.L40),
([(2, true, false, [106, 244, 282], [], 153)], 0, E213S185.L41),
([(2, true, false, [106, 244, 282], [], 157)], 0, E213S185.L42),
([(2, true, false, [106, 244, 282], [], 167)], 0, E213S185.L43),
([(2, true, false, [106, 244, 282], [], 171)], 0, E213S185.L44),
([(2, true, false, [106, 244, 282], [], 183)], 0, E213S185.L45),
([(2, true, false, [106, 244, 282], [], 187)], 0, E213S185.L46),
([(2, true, false, [106, 244, 282], [], 201)], 0, E213S185.L47),
([(2, true, false, [106, 244, 282], [], 205)], 0, E213S185.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E213S185
