module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S138 "data/lean/451f71270f6ba20385cfa0092e945ce9/E236S138.bin"
namespace E236S138
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [354], [22, 118], 10)], 0, E236S138.L1),
([(4, true, false, [354], [22, 118], 42)], 0, E236S138.L2),
([(4, true, false, [354], [22, 118], 44)], 0, E236S138.L3),
([(4, true, false, [354], [22, 118], 48)], 0, E236S138.L4),
([(4, true, false, [354], [22, 118], 51)], 0, E236S138.L5),
([(4, true, false, [354], [22, 118], 55)], 0, E236S138.L6),
([(4, true, false, [354], [22, 118], 57)], 0, E236S138.L7),
([(4, true, false, [354], [22, 118], 66)], 0, E236S138.L8),
([(4, true, false, [354], [22, 118], 70)], 0, E236S138.L9),
([(4, true, false, [354], [22, 118], 93)], 0, E236S138.L10),
([(4, true, false, [354], [22, 118], 103)], 0, E236S138.L11),
([(4, true, false, [354], [22, 118], 115)], 0, E236S138.L12),
([(4, true, false, [354], [22, 118], 131)], 0, E236S138.L13),
([(4, true, false, [354], [22, 118], 132)], 0, E236S138.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E236S138
