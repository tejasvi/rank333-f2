module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S165 "data/lean/5befe80ef5bdbb3e60fe1dc840bd2b36/E236S165.bin"
namespace E236S165
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 412], [96, 136], 1)], 0, E236S165.L1),
([(0, true, false, [158, 412], [96, 136], 4)], 0, E236S165.L2),
([(0, true, false, [158, 412], [96, 136], 10)], 0, E236S165.L3),
([(0, true, false, [158, 412], [96, 136], 14)], 0, E236S165.L4),
([(0, true, false, [158, 412], [96, 136], 20)], 0, E236S165.L5),
([(0, true, false, [158, 412], [96, 136], 21)], 0, E236S165.L6),
([(0, true, false, [158, 412], [96, 136], 32)], 0, E236S165.L7),
([(0, true, false, [158, 412], [96, 136], 35)], 0, E236S165.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S165
