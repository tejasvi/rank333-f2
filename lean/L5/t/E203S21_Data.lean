module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S21 "data/lean/a64eeaea472d88bfb73f6eac3fd52612/E203S21.bin"
namespace E203S21
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372, 382, 468, 478], [], 0)], 0, E203S21.L1),
([(0, true, false, [372, 382, 468, 478], [], 5)], 0, E203S21.L2),
([(0, true, false, [372, 382, 468, 478], [], 6)], 0, E203S21.L3),
([(0, true, false, [372, 382, 468, 478], [], 8)], 0, E203S21.L4),
([(0, true, false, [372, 382, 468, 478], [], 9)], 0, E203S21.L5),
([(0, true, false, [372, 382, 468, 478], [], 10)], 0, E203S21.L6),
([(0, true, false, [372, 382, 468, 478], [], 15)], 0, E203S21.L7),
([(0, true, false, [372, 382, 468, 478], [], 74)], 0, E203S21.L8),
([(0, true, false, [372, 382, 468, 478], [], 111)], 0, E203S21.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E203S21
