module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E343S11 "data/lean/21bb71a7a938075b0883f5efb6b40bc5/E343S11.bin"
namespace E343S11
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(3, true, false, [], [], 0)], 32, 0, E343S11.L1),
([(3, true, false, [], [], 1)], 32, 0, E343S11.L2),
([(3, true, false, [], [], 3)], 32, 0, E343S11.L3),
([(3, true, false, [], [], 5)], 32, 0, E343S11.L4),
([(3, true, false, [], [], 18)], 32, 0, E343S11.L5),
([(3, true, false, [], [], 27)], 32, 0, E343S11.L6),
([(3, true, false, [], [], 323)], 32, 0, E343S11.L7),
([(3, true, false, [], [], 325)], 32, 0, E343S11.L8),
([(3, true, false, [], [], 326)], 32, 0, E343S11.L9),
([(3, true, false, [], [], 332)], 32, 0, E343S11.L10),
([(3, true, false, [], [], 333)], 32, 0, E343S11.L11),
([(3, true, false, [], [], 338)], 32, 0, E343S11.L12),
([(3, true, false, [], [], 347)], 32, 0, E343S11.L13),
([(3, true, false, [], [], 349)], 32, 0, E343S11.L14),
([(3, true, false, [], [], 376)], 32, 0, E343S11.L15),
([(3, true, false, [], [], 421)], 32, 0, E343S11.L16),
([(3, true, false, [], [], 423)], 32, 0, E343S11.L17),
([(3, true, false, [], [], 451)], 32, 0, E343S11.L18),
([(3, true, false, [], [], 467)], 32, 0, E343S11.L19),
([(3, true, false, [], [], 473)], 32, 0, E343S11.L20),
([(3, true, false, [], [], 595)], 32, 0, E343S11.L21),
([(3, true, false, [], [], 598)], 32, 0, E343S11.L22),
([(3, true, false, [], [], 599)], 32, 0, E343S11.L23),
([(3, true, false, [], [], 600)], 32, 0, E343S11.L24),
([(3, true, false, [], [], 610)], 32, 0, E343S11.L25),
([(3, true, false, [], [], 611)], 32, 0, E343S11.L26),
([(3, true, false, [], [], 613)], 32, 0, E343S11.L27),
([(3, true, false, [], [], 618)], 32, 0, E343S11.L28),
([(3, true, false, [], [], 626)], 32, 0, E343S11.L29),
([(3, true, false, [], [], 647)], 32, 0, E343S11.L30),
([(3, true, false, [], [], 728)], 32, 0, E343S11.L31),
([(3, true, false, [], [], 871)], 32, 0, E343S11.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E343S11
