module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S236 "data/lean/9064558e2ace54c6cc08cf0477490606/E284S236.bin"
namespace E284S236
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [426, 298], [138], 0)], 0, E284S236.L1),
([(12, true, false, [426, 298], [138], 1)], 0, E284S236.L2),
([(12, true, false, [426, 298], [138], 3)], 0, E284S236.L3),
([(12, true, false, [426, 298], [138], 14)], 0, E284S236.L4),
([(12, true, false, [426, 298], [138], 15)], 0, E284S236.L5),
([(12, true, false, [426, 298], [138], 20)], 0, E284S236.L6),
([(12, true, false, [426, 298], [138], 22)], 0, E284S236.L7),
([(12, true, false, [426, 298], [138], 23)], 0, E284S236.L8),
([(12, true, false, [426, 298], [138], 26)], 0, E284S236.L9),
([(12, true, false, [426, 298], [138], 28)], 0, E284S236.L10),
([(12, true, false, [426, 298], [138], 35)], 0, E284S236.L11),
([(12, true, false, [426, 298], [138], 43)], 0, E284S236.L12),
([(12, true, false, [426, 298], [138], 60)], 0, E284S236.L13),
([(12, true, false, [426, 298], [138], 63)], 0, E284S236.L14),
([(12, true, false, [426, 298], [138], 64)], 0, E284S236.L15),
([(12, true, false, [426, 298], [138], 67)], 0, E284S236.L16),
([(12, true, false, [426, 298], [138], 84)], 0, E284S236.L17),
([(12, true, false, [426, 298], [138], 87)], 0, E284S236.L18),
([(12, true, false, [426, 298], [138], 88)], 0, E284S236.L19),
([(12, true, false, [426, 298], [138], 91)], 0, E284S236.L20),
([(12, true, false, [426, 298], [138], 94)], 0, E284S236.L21),
([(12, true, false, [426, 298], [138], 111)], 0, E284S236.L22),
([(12, true, false, [426, 298], [138], 146)], 0, E284S236.L23),
([(12, true, false, [426, 298], [138], 147)], 0, E284S236.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E284S236
