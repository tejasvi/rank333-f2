module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E407S1 "data/lean/9d545023ce33d3e2149026b585ca6ae5/E407S1.bin"
namespace E407S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [], [], 0)], 0, E407S1.L1),
([(4, true, false, [], [], 5)], 0, E407S1.L2),
([(4, true, false, [], [], 50)], 0, E407S1.L3),
([(4, true, false, [], [], 51)], 0, E407S1.L4),
([(4, true, false, [], [], 52)], 0, E407S1.L5),
([(4, true, false, [], [], 54)], 0, E407S1.L6),
([(4, true, false, [], [], 55)], 0, E407S1.L7),
([(4, true, false, [], [], 67)], 0, E407S1.L8),
([(4, true, false, [], [], 69)], 0, E407S1.L9),
([(4, true, false, [], [], 70)], 0, E407S1.L10),
([(4, true, false, [], [], 73)], 0, E407S1.L11),
([(4, true, false, [], [], 77)], 0, E407S1.L12),
([(4, true, false, [], [], 83)], 0, E407S1.L13),
([(4, true, false, [], [], 96)], 0, E407S1.L14),
([(4, true, false, [], [], 99)], 0, E407S1.L15),
([(4, true, false, [], [], 100)], 0, E407S1.L16),
([(4, true, false, [], [], 101)], 0, E407S1.L17),
([(4, true, false, [], [], 112)], 0, E407S1.L18),
([(4, true, false, [], [], 113)], 0, E407S1.L19),
([(4, true, false, [], [], 114)], 0, E407S1.L20),
([(4, true, false, [], [], 149)], 0, E407S1.L21),
([(4, true, false, [], [], 322)], 0, E407S1.L22),
([(4, true, false, [], [], 323)], 0, E407S1.L23),
([(4, true, false, [], [], 324)], 0, E407S1.L24),
([(4, true, false, [], [], 325)], 0, E407S1.L25),
([(4, true, false, [], [], 327)], 0, E407S1.L26),
([(4, true, false, [], [], 328)], 0, E407S1.L27),
([(4, true, false, [], [], 343)], 0, E407S1.L28),
([(4, true, false, [], [], 346)], 0, E407S1.L29),
([(4, true, false, [], [], 347)], 0, E407S1.L30),
([(4, true, false, [], [], 595)], 0, E407S1.L31),
([(4, true, false, [], [], 596)], 0, E407S1.L32),
([(4, true, false, [], [], 598)], 0, E407S1.L33),
([(4, true, false, [], [], 600)], 0, E407S1.L34),
([(4, true, false, [], [], 601)], 0, E407S1.L35),
([(4, true, false, [], [], 608)], 0, E407S1.L36),
([(4, true, false, [], [], 616)], 0, E407S1.L37),
([(4, true, false, [], [], 619)], 0, E407S1.L38),
([(4, true, false, [], [], 628)], 0, E407S1.L39),
([(4, true, false, [], [], 645)], 0, E407S1.L40),
([(4, true, false, [], [], 646)], 0, E407S1.L41),
([(4, true, false, [], [], 647)], 0, E407S1.L42),
([(4, true, false, [], [], 649)], 0, E407S1.L43),
([(4, true, false, [], [], 650)], 0, E407S1.L44),
([(4, true, false, [], [], 658)], 0, E407S1.L45),
([(4, true, false, [], [], 660)], 0, E407S1.L46),
([(4, true, false, [], [], 662)], 0, E407S1.L47),
([(4, true, false, [], [], 671)], 0, E407S1.L48),
([(4, true, false, [], [], 672)], 0, E407S1.L49),
([(4, true, false, [], [], 740)], 0, E407S1.L50),
([(4, true, false, [], [], 746)], 0, E407S1.L51),
([(4, true, false, [], [], 870)], 0, E407S1.L52),
([(4, true, false, [], [], 873)], 0, E407S1.L53),
([(4, true, false, [], [], 874)], 0, E407S1.L54),
([(4, true, false, [], [], 891)], 0, E407S1.L55),
([(4, true, false, [], [], 915)], 0, E407S1.L56),
([(4, true, false, [], [], 923)], 0, E407S1.L57),
([(4, true, false, [], [], 930)], 0, E407S1.L58),
([(4, true, false, [], [], 1219)], 0, E407S1.L59),
([(4, true, false, [], [], 1220)], 0, E407S1.L60),
([(4, true, false, [], [], 1233)], 0, E407S1.L61),
([(4, true, false, [], [], 1235)], 0, E407S1.L62),
([(4, true, false, [], [], 1244)], 0, E407S1.L63),
([(4, true, false, [], [], 1249)], 0, E407S1.L64),
([(4, true, false, [], [], 1253)], 0, E407S1.L65)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 65
end E407S1
