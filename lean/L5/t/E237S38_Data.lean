module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S38 "data/lean/b9c2321d7b51f0a24f789205eedda204/E237S38.bin"
namespace E237S38
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354], [488, 508], 22)], 22, E237S38.L1),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 880)], 0, E237S38.L2),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 884)], 0, E237S38.L3),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 976)], 0, E237S38.L4),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 980)], 0, E237S38.L5),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1076)], 0, E237S38.L6),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1172)], 0, E237S38.L7),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1264)], 0, E237S38.L8),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1360)], 0, E237S38.L9),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1762)], 0, E237S38.L10),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1858)], 0, E237S38.L11),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1952)], 0, E237S38.L12),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 1954)], 0, E237S38.L13),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2048)], 0, E237S38.L14),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2050)], 0, E237S38.L15),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2144)], 0, E237S38.L16),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2240)], 0, E237S38.L17),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2640)], 0, E237S38.L18),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2736)], 0, E237S38.L19),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2836)], 0, E237S38.L20),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 2932)], 0, E237S38.L21),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 3120)], 0, E237S38.L22),
([(6, true, false, [354], [488, 508], 22), (10, false, false, [116], [96, 234, 488], 3124)], 0, E237S38.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E237S38
