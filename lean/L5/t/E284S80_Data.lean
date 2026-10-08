module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S80 "data/lean/7a7f0be7fb67d8d423651ade7644562f/E284S80.bin"
namespace E284S80
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [298, 426], [10, 138], 0)], 0, E284S80.L1),
([(3, true, false, [298, 426], [10, 138], 2)], 0, E284S80.L2),
([(3, true, false, [298, 426], [10, 138], 7)], 0, E284S80.L3),
([(3, true, false, [298, 426], [10, 138], 10)], 0, E284S80.L4),
([(3, true, false, [298, 426], [10, 138], 11)], 0, E284S80.L5),
([(3, true, false, [298, 426], [10, 138], 12)], 0, E284S80.L6),
([(3, true, false, [298, 426], [10, 138], 13)], 0, E284S80.L7),
([(3, true, false, [298, 426], [10, 138], 14)], 0, E284S80.L8),
([(3, true, false, [298, 426], [10, 138], 15)], 0, E284S80.L9),
([(3, true, false, [298, 426], [10, 138], 16)], 0, E284S80.L10),
([(3, true, false, [298, 426], [10, 138], 17)], 0, E284S80.L11),
([(3, true, false, [298, 426], [10, 138], 18)], 0, E284S80.L12),
([(3, true, false, [298, 426], [10, 138], 19)], 0, E284S80.L13),
([(3, true, false, [298, 426], [10, 138], 20)], 0, E284S80.L14),
([(3, true, false, [298, 426], [10, 138], 21)], 0, E284S80.L15),
([(3, true, false, [298, 426], [10, 138], 22)], 0, E284S80.L16),
([(3, true, false, [298, 426], [10, 138], 23)], 0, E284S80.L17),
([(3, true, false, [298, 426], [10, 138], 24)], 0, E284S80.L18),
([(3, true, false, [298, 426], [10, 138], 25)], 0, E284S80.L19),
([(3, true, false, [298, 426], [10, 138], 26)], 0, E284S80.L20),
([(3, true, false, [298, 426], [10, 138], 27)], 0, E284S80.L21),
([(3, true, false, [298, 426], [10, 138], 28)], 0, E284S80.L22),
([(3, true, false, [298, 426], [10, 138], 29)], 0, E284S80.L23),
([(3, true, false, [298, 426], [10, 138], 30)], 0, E284S80.L24),
([(3, true, false, [298, 426], [10, 138], 32)], 0, E284S80.L25),
([(3, true, false, [298, 426], [10, 138], 44)], 0, E284S80.L26),
([(3, true, false, [298, 426], [10, 138], 45)], 0, E284S80.L27),
([(3, true, false, [298, 426], [10, 138], 88)], 0, E284S80.L28),
([(3, true, false, [298, 426], [10, 138], 89)], 0, E284S80.L29),
([(3, true, false, [298, 426], [10, 138], 90)], 0, E284S80.L30),
([(3, true, false, [298, 426], [10, 138], 91)], 0, E284S80.L31),
([(3, true, false, [298, 426], [10, 138], 92)], 0, E284S80.L32),
([(3, true, false, [298, 426], [10, 138], 93)], 0, E284S80.L33),
([(3, true, false, [298, 426], [10, 138], 94)], 0, E284S80.L34),
([(3, true, false, [298, 426], [10, 138], 95)], 0, E284S80.L35),
([(3, true, false, [298, 426], [10, 138], 96)], 0, E284S80.L36),
([(3, true, false, [298, 426], [10, 138], 97)], 0, E284S80.L37),
([(3, true, false, [298, 426], [10, 138], 98)], 0, E284S80.L38),
([(3, true, false, [298, 426], [10, 138], 99)], 0, E284S80.L39),
([(3, true, false, [298, 426], [10, 138], 100)], 0, E284S80.L40),
([(3, true, false, [298, 426], [10, 138], 101)], 0, E284S80.L41),
([(3, true, false, [298, 426], [10, 138], 102)], 0, E284S80.L42),
([(3, true, false, [298, 426], [10, 138], 103)], 0, E284S80.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E284S80
