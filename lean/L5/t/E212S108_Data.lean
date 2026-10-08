module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S108 "data/lean/51c0b1da36955730c448f5351ca5d716/E212S108.bin"
namespace E212S108
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [122, 254, 500], [368], 0)], 0, E212S108.L1),
([(11, true, false, [122, 254, 500], [368], 4)], 0, E212S108.L2),
([(11, true, false, [122, 254, 500], [368], 11)], 0, E212S108.L3),
([(11, true, false, [122, 254, 500], [368], 20)], 0, E212S108.L4),
([(11, true, false, [122, 254, 500], [368], 45)], 0, E212S108.L5),
([(11, true, false, [122, 254, 500], [368], 55)], 0, E212S108.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S108
