module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S5 "data/lean/dd31e9d69182b0dd671f7e974436cf06/E343S5.bin"
namespace E343S5
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(1, true, false, [], [], 1)], 23, 0, E343S5.L1),
([(1, true, false, [], [], 3)], 23, 0, E343S5.L2),
([(1, true, false, [], [], 10)], 23, 0, E343S5.L3),
([(1, true, false, [], [], 18)], 23, 0, E343S5.L4),
([(1, true, false, [], [], 27)], 23, 0, E343S5.L5),
([(1, true, false, [], [], 30)], 23, 0, E343S5.L6),
([(1, true, false, [], [], 98)], 23, 0, E343S5.L7),
([(1, true, false, [], [], 99)], 23, 0, E343S5.L8),
([(1, true, false, [], [], 101)], 23, 0, E343S5.L9),
([(1, true, false, [], [], 112)], 23, 0, E343S5.L10),
([(1, true, false, [], [], 123)], 23, 0, E343S5.L11),
([(1, true, false, [], [], 323)], 23, 0, E343S5.L12),
([(1, true, false, [], [], 326)], 23, 0, E343S5.L13),
([(1, true, false, [], [], 372)], 23, 0, E343S5.L14),
([(1, true, false, [], [], 435)], 23, 0, E343S5.L15),
([(1, true, false, [], [], 599)], 23, 0, E343S5.L16),
([(1, true, false, [], [], 645)], 23, 0, E343S5.L17),
([(1, true, false, [], [], 648)], 23, 0, E343S5.L18),
([(1, true, false, [], [], 708)], 23, 0, E343S5.L19),
([(1, true, false, [], [], 710)], 23, 0, E343S5.L20),
([(1, true, false, [], [], 1233)], 23, 0, E343S5.L21),
([(1, true, false, [], [], 1394)], 23, 0, E343S5.L22),
([(1, true, false, [], [], 1408)], 23, 0, E343S5.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E343S5
