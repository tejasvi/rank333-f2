module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S31 "data/lean/3d7de89a882a54947976b22857fb62d5/E212S31.bin"
namespace E212S31
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [266, 500], [26], 0)], 0, E212S31.L1),
([(12, true, false, [266, 500], [26], 20)], 0, E212S31.L2),
([(12, true, false, [266, 500], [26], 21)], 0, E212S31.L3),
([(12, true, false, [266, 500], [26], 24)], 0, E212S31.L4),
([(12, true, false, [266, 500], [26], 27)], 0, E212S31.L5),
([(12, true, false, [266, 500], [26], 41)], 0, E212S31.L6),
([(12, true, false, [266, 500], [26], 44)], 0, E212S31.L7),
([(12, true, false, [266, 500], [26], 61)], 0, E212S31.L8),
([(12, true, false, [266, 500], [26], 68)], 0, E212S31.L9),
([(12, true, false, [266, 500], [26], 69)], 0, E212S31.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E212S31
