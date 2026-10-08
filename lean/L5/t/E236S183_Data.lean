module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S183 "data/lean/0d06c437514f5791475671b50919c118/E236S183.bin"
namespace E236S183
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [158, 372, 412], [22], 5)], 0, E236S183.L1),
([(5, true, false, [158, 372, 412], [22], 13)], 0, E236S183.L2),
([(5, true, false, [158, 372, 412], [22], 14)], 0, E236S183.L3),
([(5, true, false, [158, 372, 412], [22], 15)], 0, E236S183.L4),
([(5, true, false, [158, 372, 412], [22], 16)], 0, E236S183.L5),
([(5, true, false, [158, 372, 412], [22], 17)], 0, E236S183.L6),
([(5, true, false, [158, 372, 412], [22], 20)], 0, E236S183.L7),
([(5, true, false, [158, 372, 412], [22], 21)], 0, E236S183.L8),
([(5, true, false, [158, 372, 412], [22], 22)], 0, E236S183.L9),
([(5, true, false, [158, 372, 412], [22], 32)], 0, E236S183.L10),
([(5, true, false, [158, 372, 412], [22], 33)], 0, E236S183.L11),
([(5, true, false, [158, 372, 412], [22], 40)], 0, E236S183.L12),
([(5, true, false, [158, 372, 412], [22], 53)], 0, E236S183.L13),
([(5, true, false, [158, 372, 412], [22], 68)], 0, E236S183.L14),
([(5, true, false, [158, 372, 412], [22], 70)], 0, E236S183.L15),
([(5, true, false, [158, 372, 412], [22], 72)], 0, E236S183.L16),
([(5, true, false, [158, 372, 412], [22], 73)], 0, E236S183.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S183
