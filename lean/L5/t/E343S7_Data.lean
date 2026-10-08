module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S7 "data/lean/f79918a2b0d180fe05ac3e6b1219fbbc/E343S7.bin"
namespace E343S7
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(6, true, false, [], [], 49)], 42, 0, E343S7.L1),
([(6, true, false, [], [], 52)], 42, 0, E343S7.L2),
([(6, true, false, [], [], 54)], 42, 0, E343S7.L3),
([(6, true, false, [], [], 74)], 42, 0, E343S7.L4),
([(6, true, false, [], [], 81)], 42, 0, E343S7.L5),
([(6, true, false, [], [], 98)], 42, 0, E343S7.L6),
([(6, true, false, [], [], 99)], 42, 0, E343S7.L7),
([(6, true, false, [], [], 100)], 42, 0, E343S7.L8),
([(6, true, false, [], [], 103)], 42, 0, E343S7.L9),
([(6, true, false, [], [], 147)], 42, 0, E343S7.L10),
([(6, true, false, [], [], 155)], 42, 0, E343S7.L11),
([(6, true, false, [], [], 322)], 42, 0, E343S7.L12),
([(6, true, false, [], [], 329)], 42, 0, E343S7.L13),
([(6, true, false, [], [], 372)], 42, 0, E343S7.L14),
([(6, true, false, [], [], 595)], 42, 0, E343S7.L15),
([(6, true, false, [], [], 596)], 42, 0, E343S7.L16),
([(6, true, false, [], [], 598)], 42, 0, E343S7.L17),
([(6, true, false, [], [], 600)], 42, 0, E343S7.L18),
([(6, true, false, [], [], 601)], 42, 0, E343S7.L19),
([(6, true, false, [], [], 602)], 42, 0, E343S7.L20),
([(6, true, false, [], [], 607)], 42, 0, E343S7.L21),
([(6, true, false, [], [], 608)], 42, 0, E343S7.L22),
([(6, true, false, [], [], 609)], 42, 0, E343S7.L23),
([(6, true, false, [], [], 611)], 42, 0, E343S7.L24),
([(6, true, false, [], [], 613)], 42, 0, E343S7.L25),
([(6, true, false, [], [], 627)], 42, 0, E343S7.L26),
([(6, true, false, [], [], 628)], 42, 0, E343S7.L27),
([(6, true, false, [], [], 629)], 42, 0, E343S7.L28),
([(6, true, false, [], [], 638)], 42, 0, E343S7.L29),
([(6, true, false, [], [], 644)], 42, 0, E343S7.L30),
([(6, true, false, [], [], 646)], 42, 0, E343S7.L31),
([(6, true, false, [], [], 647)], 42, 0, E343S7.L32),
([(6, true, false, [], [], 651)], 42, 0, E343S7.L33),
([(6, true, false, [], [], 664)], 42, 0, E343S7.L34),
([(6, true, false, [], [], 669)], 42, 0, E343S7.L35),
([(6, true, false, [], [], 693)], 42, 0, E343S7.L36),
([(6, true, false, [], [], 701)], 42, 0, E343S7.L37),
([(6, true, false, [], [], 875)], 42, 0, E343S7.L38),
([(6, true, false, [], [], 876)], 42, 0, E343S7.L39),
([(6, true, false, [], [], 931)], 42, 0, E343S7.L40),
([(6, true, false, [], [], 1050)], 42, 0, E343S7.L41),
([(6, true, false, [], [], 1225)], 42, 0, E343S7.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E343S7
