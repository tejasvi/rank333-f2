module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E311S4 "data/lean/14babdafe4d289954fa18923e0adc610/E311S4.bin"
namespace E311S4
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(10, true, false, [], [], 51)], 7, 0, E311S4.L1),
([(10, true, false, [], [], 55)], 7, 0, E311S4.L2),
([(10, true, false, [], [], 599)], 7, 0, E311S4.L3),
([(10, true, false, [], [], 601)], 7, 0, E311S4.L4),
([(10, true, false, [], [], 648)], 7, 0, E311S4.L5),
([(10, true, false, [], [], 649)], 7, 0, E311S4.L6),
([(10, true, false, [], [], 650)], 7, 0, E311S4.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E311S4
