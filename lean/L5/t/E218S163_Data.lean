module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S163 "data/lean/d9b6f9b02144f47724ecca6f7928cea6/E218S163.bin"
namespace E218S163
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [142, 254, 500, 106], [], 30)], 0, E218S163.L1),
([(4, true, false, [142, 254, 500, 106], [], 31)], 0, E218S163.L2),
([(4, true, false, [142, 254, 500, 106], [], 32)], 0, E218S163.L3),
([(4, true, false, [142, 254, 500, 106], [], 33)], 0, E218S163.L4),
([(4, true, false, [142, 254, 500, 106], [], 34)], 0, E218S163.L5),
([(4, true, false, [142, 254, 500, 106], [], 69)], 0, E218S163.L6),
([(4, true, false, [142, 254, 500, 106], [], 70)], 0, E218S163.L7),
([(4, true, false, [142, 254, 500, 106], [], 74)], 0, E218S163.L8),
([(4, true, false, [142, 254, 500, 106], [], 75)], 0, E218S163.L9),
([(4, true, false, [142, 254, 500, 106], [], 85)], 0, E218S163.L10),
([(4, true, false, [142, 254, 500, 106], [], 108)], 0, E218S163.L11),
([(4, true, false, [142, 254, 500, 106], [], 111)], 0, E218S163.L12),
([(4, true, false, [142, 254, 500, 106], [], 115)], 0, E218S163.L13),
([(4, true, false, [142, 254, 500, 106], [], 125)], 0, E218S163.L14),
([(4, true, false, [142, 254, 500, 106], [], 127)], 0, E218S163.L15),
([(4, true, false, [142, 254, 500, 106], [], 158)], 0, E218S163.L16),
([(4, true, false, [142, 254, 500, 106], [], 181)], 0, E218S163.L17),
([(4, true, false, [142, 254, 500, 106], [], 207)], 0, E218S163.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E218S163
