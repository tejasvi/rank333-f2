module
public import R22Port.U_6050cb77ad13
public meta import Lean
public meta import R3RT.LabT
public import Lean
public import L1.Load
public import KD.XBind
public import KD.XConstN
public import R3RT.TabC3eD
/-! `#kdxnode "kxp.bin" maxNodes everyK raw`: kernel timing of the bound bulk-peel X kills (`KD.xnodeOK`, KD/XBind.lean) on
kxp.py's records.  Per node (every K-th): one declaration `KD.xnodePart … = true` (dictionary, node rows, node matrix) and one
declaration `KD.xchild … = true` per child; with `raw = 1` also kill2's unbound `K2.childL` on the same child with literal inputs
(as kill2's `#k2xnode`), for the binding's overhead.  Frames, the dictionary and the node matrix are literals built here from the
static files (C3eD.c2t, kept3eD_lab.bin); the c2t slices enter through `KD.c2tab`.  Synchronous `addDeclCore`, µs. -/
@[expose] public section
open Lean Elab Command L1Load
set_option maxRecDepth 100000
namespace KDLoadX

meta def lit (n : Nat) : Expr := mkRawNatLit n
meta def pairNN (a b : Nat) : Expr := mkPair natTy natTy (lit a) (lit b)
meta def stepTy : Expr := prodTy natTy natTy

/-- the bound tree at item position `q`: (expression, next position, steps, in-branches) -/
meta partial def mkXB (it : Array Nat) (q : Nat) (u : Nat) : Expr × Nat × Nat × Nat :=
  let tag := it[q]!; let ns := it[q+1]!
  let stL := mkList stepTy ((List.range ns).map fun i => pairNN it[q+2+2*i]! it[q+3+2*i]!)
  let q1 := q + 2 + 2 * ns
  if tag == 0 then
    (mkApp2 (mkConst ``KD.XB.leaf) stL (pairNN it[q1]! it[q1+1]!), q1 + 2, ns + 1, 0)
  else
    let v := it[q1]!; let f := it[q1+1]!; let nb := it[q1+2]!
    let rows := (List.range nb).map fun i => lit it[q1+3+i]!
    let C2 := if f == 1 then mkConst (Name.mkStr (Name.mkStr `L1 "T") s!"c2t_{u + 1 + v}") else lit 0
    let (l, q2, sl, bl) := mkXB it (q1 + 3 + nb) u
    let (r, q3, sr, br) := mkXB it q2 u
    (mkAppN (mkConst ``KD.XB.node) #[stL, lit v, C2, mkList natTy rows, l, r], q3, ns + sl + sr, 1 + bl + br)

/-- kill2's tree with literal masks (for the unbound comparison) -/
meta partial def mkXT (it : Array Nat) (q : Nat) (u : Nat) (masks : Array Nat) (LP : Array Nat) : Expr × Nat :=
  let tag := it[q]!; let ns := it[q+1]!
  let stL := mkList stepTy ((List.range ns).map fun i => mkPair natTy natTy (lit LP[it[q+2+2*i]!]!) (lit it[q+3+2*i]!))
  let q1 := q + 2 + 2 * ns
  if tag == 0 then
    (mkApp2 (mkConst ``K2.XT.leaf) stL (mkPair natTy natTy (lit LP[it[q1]!]!) (lit it[q1+1]!)), q1 + 2)
  else
    let v := it[q1]!; let f := it[q1+1]!; let nb := it[q1+2]!
    let rows := (List.range nb).map fun i => lit masks[it[q1+3+i]!]!
    let C2 := if f == 1 then mkConst (Name.mkStr (Name.mkStr `L1 "T") s!"c2t_{u + 1 + v}") else lit 0
    let (l, q2) := mkXT it (q1 + 3 + nb) u masks LP
    let (r, q3) := mkXT it q2 u masks LP
    (mkAppN (mkConst ``K2.XT.node) #[stL, lit v, C2, mkList natTy rows, l, r], q3)

meta def timeDecl (nm : Name) (lhs : Expr) : CommandElabM Nat := do
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool) lhs (mkConst ``Bool.true)
  let pf := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
  let decl := Declaration.thmDecl { name := nm, levelParams := [], type := ty, value := pf }
  let env ← getEnv
  let t0 ← IO.monoNanosNow
  match env.addDeclCore 0 decl none with
  | .ok _ => pure ()
  | .error e => throwError m!"{nm}: kernel rejects: {e.toMessageData (← getOptions)}"
  let t1 ← IO.monoNanosNow
  return (t1 - t0) / 1000

meta def lpar (labv : Array Nat) (X : Nat) : Nat := Id.run do
  let mut m := 0
  for l in [0:511] do
    let x := labv[l]! &&& X
    let p := (List.range 9).foldl (fun a i => a ^^^ ((x >>> i) &&& 1)) 0
    if p == 1 then m := m ||| (1 <<< l)
  return m

elab "#kdxnode " p:str n:num k:num rw:num cz:num : command => do
  let raw := rw.getNat == 1
  let czn := cz.getNat
  let b ← IO.FS.readBinFile p.getString
  let it := items b 0 #[]
  let tabB ← IO.FS.readBinFile "data/lean/48752ee91aa3a82f686338f91f508896/C3eD.c2t"
  let tab := 511 * 64
  let c2t : Array Nat := (List.range 511).toArray.map fun l => natLE tabB (l * tab) ((l + 1) * tab)
  let conf1 := natLE tabB (511 * tab) (512 * tab)
  let labb ← IO.FS.readBinFile "data/lean/c2624c174a573a8334132808166253b2/kept3eD_lab.bin"
  let M511 := 2 ^ 511 - 1
  let REPA := KD.pkMeta 512 511 (fun _ => 1); let DIAGA := KD.pkMeta 512 511 (fun i => 2 ^ i); let REPmA := KD.pkMeta 511 511 (fun _ => 1)
  let outer3 (m : Nat) : Nat := m * ((m * REPmA) &&& REPA)
  -- label vectors (prof7 --rord 123) for kill2's demand masks
  let labv : Array Nat := (List.range 511).toArray.map fun l => R3RT.vecL l
  let LP : Array Nat := (List.range 512).toArray.map fun X => if X == 0 then M511 else lpar labv X
  let mut cache : Std.HashMap Nat (Nat × Nat × Nat × Nat × Nat) := {}
  let mut q := 0; let mut nn := 0; let mut nodeIx := 0
  let mut tNode := 0; let mut tKid := 0; let mut tRaw := 0; let mut nKid := 0; let mut nDict := 0; let mut nSteps := 0; let mut nBr := 0
  let mut lines : Array String := #[]
  while q < it.size && nn < n.getNat do
    let doIt := nodeIx % k.getNat == 0
    nodeIx := nodeIx + 1
    let du := it[q]!; let last := it[q+1]!; let nQ := it[q+2]!
    let Q := (List.range nQ).map fun i => it[q + 3 + i]!
    q := q + 3 + nQ
    let D := it[q]!; let U := it[q+1]!; let n1 := it[q+2]!; let nd := it[q+3]!; q := q + 4
    let mut ents : Array Nat := #[]
    for _ in [0:nd] do
      let rid := it[q]!; q := q + 2
      ents := ents.push (natLE labb (rid * 65) (rid * 65 + 65))
    let masks := ents.map (· &&& M511)
    let nnode := it[q]!; let nodeIdx := (List.range nnode).map fun i => it[q + 1 + i]!; q := q + 1 + nnode
    let nkids := it[q]!; q := q + 1
    let S := Q.foldl (fun a l => a ||| (1 <<< l)) 0
    let N' := Q.foldl (fun a l => a ||| c2t[l]!) conf1
    let DICT := (List.range nd).foldl (fun a i => a ||| (masks[i]! <<< (512 * i))) 0
    let CAPS := (List.range nd).foldl (fun a i => a ||| ((ents[i]! >>> 511) <<< (8 * i))) 0
    let pcm (x : Nat) : Nat := (List.range 511).foldl (fun c j => if x.testBit j then c + 1 else c) 0
    let Ecnt0 := (List.range nd).foldl (fun a i => a ||| (pcm (masks[i]! &&& S) <<< (8 * i))) 0
    -- corruptions (negative tests): 1 = E_0 raised by one; 2 = cap_0 raised to E_0 + r_0 + 1
    let Ecnt := if czn == 1 then Ecnt0 + 1 else Ecnt0
    let CAPS := if czn == 2 then (CAPS ^^^ (CAPS &&& 255)) ||| (((Ecnt0 &&& 255) + (if 0 < n1 then 1 else 2) + 1) &&& 255) else CAPS
    let nb := (nd + 62) / 63
    let dtE := mkApp (mkConst ``KD.shr9) (lit DICT)
    let A0 := nodeIdx.foldl (fun a i => a ||| outer3 masks[i]!) N'
    let Anode := A0 ^^^ (A0 &&& DIAGA)
    let mut tN := 0
    if doIt then
      tN ← timeDecl (Name.mkSimple s!"xn{nn}") (mkAppN (mkConst ``KD.xnodePartB) #[lit S, lit N', lit du, lit DICT, lit CAPS, lit Ecnt,
        lit n1, lit nd, lit nb, lit Anode, mkList natTy (nodeIdx.map lit)])
      tNode := tNode + tN; nDict := nDict + nd
    let mut tK := 0; let mut tR := 0
    for ci in [0:nkids] do
      let u := it[q]!; let kind := it[q+1]!; let bb := it[q+2]!; let Fu := it[q+3]!
      q := q + 4
      let ncr := it[q]!; let cr := (List.range ncr).map fun i => it[q + 1 + i]!
      q := q + 1 + ncr
      let q0 := q
      let (t, q1, ns, nb) := mkXB it q u
      q := q1
      if doIt then
        let nW := 510 - u
        let us ← timeDecl (Name.mkSimple s!"xc{nn}_{ci}") (mkAppN (mkConst ``KD.xchild) #[lit D, lit U, lit du, lit last,
          lit n1, lit nd, lit Anode, dtE, lit u, lit Fu, mkList natTy (cr.map lit), t,
          mkConst (Name.mkStr (Name.mkStr `L1 "T") s!"c2t_{u}"), KDXC.tupleE nW])
        tK := tK + us; nKid := nKid + 1; nSteps := nSteps + ns; nBr := nBr + nb
        let mut ur := 0
        if raw then
          let (REP, DIAG, REPm, LOWS, GRD) ← match cache.get? nW with
            | some c => pure c
            | none => do
              let REP := KD.pkMeta 512 nW (fun _ => 1); let DIAG := KD.pkMeta 512 nW (fun i => 2 ^ i); let REPm := KD.pkMeta 511 nW (fun _ => 1)
              let c := (REP, DIAG, REPm, REP * (2 ^ 511 - 1), REP * 2 ^ 511)
              cache := cache.insert nW c
              pure c
          let (xt, _) := mkXT it q0 u masks LP
          ur ← timeDecl (Name.mkSimple s!"xr{nn}_{ci}") (mkAppN (mkConst ``K2.childL) #[lit REPm, lit REP, lit GRD, lit LOWS, lit M511,
            lit DIAG, lit 512, lit (2 ^ nW), lit (u + 1), lit Anode, mkConst (Name.mkStr (Name.mkStr `L1 "T") s!"c2t_{u}"), lit Fu,
            mkList natTy (cr.map fun i => lit masks[i]!), xt])
          tR := tR + ur
        lines := lines.push s!"C {nn} {kind} {bb} {510 - u} {ncr} {ns} {nb} {us} {ur}"
    tKid := tKid + tK; tRaw := tRaw + tR
    lines := lines.push s!"N {nn} {nd} {n1} {nnode} {nkids} {tN} {tK} {tR} {if doIt then 1 else 0}"
    nn := nn + 1
  IO.FS.writeFile (p.getString ++ ".times") (String.intercalate "\n" lines.toList ++ "\n")
  logInfo m!"#kdxnode: {nn} nodes, node parts {tNode} us ({nDict} dictionary entries, {tNode / max nDict 1} us per entry); {nKid} children {tKid} us ({tKid / max nKid 1} us per child), {nSteps} steps, {nBr} in-branches; unbound childL {tRaw} us ({tRaw / max nKid 1} us per child)"

end KDLoadX
