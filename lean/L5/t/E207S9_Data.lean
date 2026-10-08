module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S9 "data/lean/e047afac5ca12af23ee38108e882370f/E207S9.bin"
namespace E207S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [426, 494], [], 1)], 0, E207S9.L1),
([(5, true, false, [426, 494], [], 4)], 0, E207S9.L2),
([(5, true, false, [426, 494], [], 10)], 0, E207S9.L3),
([(5, true, false, [426, 494], [], 11)], 0, E207S9.L4),
([(5, true, false, [426, 494], [], 12)], 0, E207S9.L5),
([(5, true, false, [426, 494], [], 13)], 0, E207S9.L6),
([(5, true, false, [426, 494], [], 14)], 0, E207S9.L7),
([(5, true, false, [426, 494], [], 15)], 0, E207S9.L8),
([(5, true, false, [426, 494], [], 16)], 0, E207S9.L9),
([(5, true, false, [426, 494], [], 17)], 0, E207S9.L10),
([(5, true, false, [426, 494], [], 18)], 0, E207S9.L11),
([(5, true, false, [426, 494], [], 19)], 0, E207S9.L12),
([(5, true, false, [426, 494], [], 20)], 0, E207S9.L13),
([(5, true, false, [426, 494], [], 21)], 0, E207S9.L14),
([(5, true, false, [426, 494], [], 22)], 0, E207S9.L15),
([(5, true, false, [426, 494], [], 26)], 0, E207S9.L16),
([(5, true, false, [426, 494], [], 27)], 0, E207S9.L17),
([(5, true, false, [426, 494], [], 29)], 0, E207S9.L18),
([(5, true, false, [426, 494], [], 30)], 0, E207S9.L19),
([(5, true, false, [426, 494], [], 34)], 0, E207S9.L20),
([(5, true, false, [426, 494], [], 36)], 0, E207S9.L21),
([(5, true, false, [426, 494], [], 38)], 0, E207S9.L22),
([(5, true, false, [426, 494], [], 58)], 0, E207S9.L23),
([(5, true, false, [426, 494], [], 69)], 0, E207S9.L24),
([(5, true, false, [426, 494], [], 74)], 0, E207S9.L25),
([(5, true, false, [426, 494], [], 75)], 0, E207S9.L26),
([(5, true, false, [426, 494], [], 77)], 0, E207S9.L27),
([(5, true, false, [426, 494], [], 78)], 0, E207S9.L28),
([(5, true, false, [426, 494], [], 83)], 0, E207S9.L29),
([(5, true, false, [426, 494], [], 84)], 0, E207S9.L30),
([(5, true, false, [426, 494], [], 108)], 0, E207S9.L31),
([(5, true, false, [426, 494], [], 216)], 0, E207S9.L32),
([(5, true, false, [426, 494], [], 217)], 0, E207S9.L33),
([(5, true, false, [426, 494], [], 221)], 0, E207S9.L34),
([(5, true, false, [426, 494], [], 222)], 0, E207S9.L35),
([(5, true, false, [426, 494], [], 225)], 0, E207S9.L36),
([(5, true, false, [426, 494], [], 229)], 0, E207S9.L37),
([(5, true, false, [426, 494], [], 244)], 0, E207S9.L38),
([(5, true, false, [426, 494], [], 260)], 0, E207S9.L39),
([(5, true, false, [426, 494], [], 264)], 0, E207S9.L40),
([(5, true, false, [426, 494], [], 312)], 0, E207S9.L41),
([(5, true, false, [426, 494], [], 352)], 0, E207S9.L42),
([(5, true, false, [426, 494], [], 356)], 0, E207S9.L43),
([(5, true, false, [426, 494], [], 406)], 0, E207S9.L44),
([(5, true, false, [426, 494], [], 432)], 0, E207S9.L45),
([(5, true, false, [426, 494], [], 436)], 0, E207S9.L46),
([(5, true, false, [426, 494], [], 464)], 0, E207S9.L47)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E207S9
