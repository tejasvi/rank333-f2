module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import RT.Load
public import L1.Load4
public import R3RT.Compose
public import R3RT.LoadTD
public import R3RT.AddT
/-! `#r3batchC name Pfx "file"`: theorem `name : R3RT.batchC Pfx.entry REPmA REPA DIAGA stack nodes = true` from an r3c.py batch.
Per window size `n` the layout constants of kill2's `childL` are defined once, as `R3C.REP_<n>` etc. (`pk` values computed here);
the node-matrix constants are `R3C.REPmA`, `R3C.REPA`, `R3C.DIAGA` (n = 511). One synchronous timed check (`R3RT.AddT`). -/
@[expose] public section
open Lean Elab Command L1Load
namespace R3RTLoadC
meta def pkC (S n : Nat) (f : Nat → Nat) : Nat := Id.run do
  let mut a := 0
  for i in [0:n] do a := a ||| (f i <<< (S * i))
  return a
meta def defC (n : Name) (v : Nat) : CommandElabM Unit := do
  if (← getEnv).contains n then return
  let dv : DefinitionVal := { name := n, levelParams := [], type := natTy, value := mkRawNatLit v, hints := ReducibilityHints.abbrev, safety := DefinitionSafety.safe }
  liftCoreM <| addDecl (Declaration.defnDecl dv) (forceExpose := true)
meta def lpar (X : Nat) : Nat := Id.run do
  let rank3 (v : Nat) : Nat := Id.run do
    let mut r := #[v &&& 7, (v >>> 3) &&& 7, (v >>> 6) &&& 7]
    let mut rk := 0
    for bit in [0:3] do
      let mut piv := 3
      for i in [0:3] do
        if piv == 3 && r[i]! != 0 && (r[i]! >>> bit) &&& 1 == 1 then piv := i
      if piv == 3 then continue
      let pv := r[piv]!
      r := r.set! piv 0
      rk := rk + 1
      for i in [0:3] do
        if (r[i]! >>> bit) &&& 1 == 1 then r := r.set! i (r[i]! ^^^ pv)
    return rk
  let mut lab := 0
  let mut m := 0
  for t in [1:4] do
    for v in [1:512] do
      if rank3 v == t then
        let x := v &&& X
        let par := (List.range 9).foldl (fun a i => a ^^^ ((x >>> i) &&& 1)) 0
        if par == 1 then m := m ||| (1 <<< lab)
        lab := lab + 1
  return m
meta def nm (s : String) (n : Nat) : Name := Name.mkStr `R3C s!"{s}_{n}"
/-- the hyperplane label masks, computed once per process -/
meta initialize lpCache : IO.Ref (Array Nat) ← IO.mkRef #[]
meta def getLP : IO (Array Nat) := do
  let c ← lpCache.get
  if c.size == 512 then return c
  let a : Array Nat := (List.range 512).toArray.map fun X => if X == 0 then 2 ^ 511 - 1 else lpar X
  lpCache.set a
  return a
meta def ensureN (n : Nat) : CommandElabM Unit := do
  let S := 512
  if (← getEnv).contains (nm "REP" n) then return
  let REP := pkC S n (fun _ => 1)
  defC (nm "REP" n) REP
  defC (nm "DIAG" n) (pkC S n (fun i => 2 ^ i))
  defC (nm "REPm" n) (pkC (S - 1) n (fun _ => 1))
  defC (nm "LOWS" n) (REP * (2 ^ (S - 1) - 1))
  defC (nm "GRD" n) (REP * 2 ^ (S - 1))
meta partial def mkTree (it : Array Nat) (q : Nat) (u : Nat) (LP : Array Nat) : Expr × Nat := Id.run do
  let tag := it[q]!; let ns := it[q+1]!
  let mut q := q + 2
  let mut sts : Array Expr := #[]
  for _ in [0:ns] do
    let X := it[q]!; let d := it[q+1]!; q := q + 2
    sts := sts.push (mkPair natTy natTy (mkRawNatLit LP[X]!) (mkRawNatLit d))
  let stL := mkList (prodTy natTy natTy) sts.toList
  if tag == 0 then
    let X := it[q]!; let d := it[q+1]!
    return (mkApp2 (mkConst ``R3RT.XTi.leaf) stL (mkPair natTy natTy (mkRawNatLit LP[X]!) (mkRawNatLit d)), q + 2)
  else
    let v := it[q]!; let useC2 := it[q+1]!; let nb := it[q+2]!; q := q + 3
    let rows := (List.range nb).map fun j => mkRawNatLit it[q + j]!
    q := q + nb
    let (l, q1) := mkTree it q u LP
    let (r, q2) := mkTree it q1 u LP
    let C2 := if useC2 == 1 then mkConst (tabName (u + 1 + v)) else mkRawNatLit 0
    return (mkAppN (mkConst ``R3RT.XTi.node) #[stL, mkRawNatLit v, C2, mkList natTy rows, l, r], q2)
meta def batchCmd (id pfxN : Name) (path : String) (mode : Nat) : CommandElabM Unit := do
  let tA ← IO.monoNanosNow
  let b ← IO.FS.readBinFile path
  let it := items b 0 #[]
  let tB ← IO.monoNanosNow
  let LP ← getLP
  defC `R3C.REPmA (pkC 511 511 (fun _ => 1)); defC `R3C.REPA (pkC 512 511 (fun _ => 1)); defC `R3C.DIAGA (pkC 512 511 (fun i => 2 ^ i))
  let s := it[0]!
  let t2 := prodTy natTy natTy
  let t3 := prodTy natTy t2
  let t4 := prodTy natTy t3
  let t5 := prodTy natTy t4
  let st := (List.range s).map fun i =>
    mkPair natTy t4 (mkRawNatLit it[1+5*i]!) (mkPair natTy t3 (mkRawNatLit it[2+5*i]!)
      (mkPair natTy t2 (mkRawNatLit it[3+5*i]!) (mkPair natTy natTy (mkRawNatLit it[4+5*i]!) (mkRawNatLit it[5+5*i]!))))
  let mut q := 1 + 5 * s
  let n := it[q]!; q := q + 1
  let lnat := mkApp (mkConst ``List [Level.zero]) natTy
  let xti := mkConst ``R3RT.XTi
  -- Kid = ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × List ℕ × XTi
  let tk10 := prodTy lnat xti
  let tk9 := prodTy natTy tk10
  let tk8 := prodTy natTy tk9
  let tk7 := prodTy natTy tk8
  let tk6 := prodTy natTy tk7
  let tk5 := prodTy natTy tk6
  let tk4 := prodTy natTy tk5
  let tk3 := prodTy natTy tk4
  let tk2 := prodTy natTy tk3
  let tKid := prodTy natTy tk2
  let lkid := mkApp (mkConst ``List [Level.zero]) tKid
  -- NodeC = ℕ × ℕ × ℕ × ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List ℕ × List Kid
  let tn11 := prodTy lnat lkid
  let tn10 := prodTy lnat tn11
  let tn9 := prodTy lnat tn10
  let tn8 := prodTy lnat tn9
  let tn7 := prodTy lnat tn8
  let tn6 := prodTy lnat tn7
  let tn5 := prodTy lnat tn6
  let tn4 := prodTy natTy tn5
  let tn3 := prodTy natTy tn4
  let tn2 := prodTy natTy tn3
  let tNode := prodTy natTy tn2
  let ml (xs : List Nat) : Expr := mkList natTy (xs.map mkRawNatLit)
  let mut nd : Array Expr := #[]
  let mut nkids := 0
  for _ in [0:n] do
    let l := it[q]!; let hdr := it[q+1]!; q := q + 2
    let rd (q : Nat) : List Nat × Nat := let k := it[q]!; ((List.range k).map fun j => it[q + 1 + j]!, q + 1 + k)
    let (r2, q1) := rd q; let (r1, q2) := rd q1; let (r0, q3) := rd q2; let (x2, q4) := rd q3; let (x1, q5) := rd q4
    let (ks, q6) := rd q5; let (nr0, q7) := rd q6
    let nr := if (mode / 2) % 2 == 1 then [] else nr0
    let x2 := if (mode / 2) % 2 == 1 then [] else x2
    let x1 := if (mode / 2) % 2 == 1 then [] else x1
    q := q7
    let nk := it[q]!; q := q + 1
    let mut kids : Array Expr := #[]
    for _ in [0:nk] do
      let _kind := it[q]!; let _bb := it[q+1]!; let u := it[q+2]!; let Fu := it[q+3]!; let ncr := it[q+4]!; q := q + 5
      let cr := (List.range ncr).map fun j => it[q + j]!
      q := q + ncr
      let (tr, q') := mkTree it q u LP
      q := q'
      let nW := 510 - u
      ensureN nW
      let kid := mkPair natTy tk2 (mkConst (nm "REPm" nW)) (mkPair natTy tk3 (mkConst (nm "REP" nW)) (mkPair natTy tk4 (mkConst (nm "GRD" nW))
        (mkPair natTy tk5 (mkConst (nm "LOWS" nW)) (mkPair natTy tk6 (mkConst (nm "DIAG" nW)) (mkPair natTy tk7 (mkRawNatLit (2 ^ nW))
          (mkPair natTy tk8 (mkRawNatLit (u + 1)) (mkPair natTy tk9 (mkConst (tabName u)) (mkPair natTy tk10 (mkRawNatLit Fu)
            (mkPair lnat xti (ml cr) tr)))))))))
      if mode % 2 == 0 then kids := kids.push kid
    nkids := nkids + nk
    nd := nd.push (mkPair natTy tn2 (mkConst (tabName l)) (mkPair natTy tn3 (mkConst (hName "h" l)) (mkPair natTy tn4 (mkConst (hName "suf" l))
      (mkPair natTy tn5 (mkRawNatLit hdr) (mkPair lnat tn6 (ml r2) (mkPair lnat tn7 (ml r1) (mkPair lnat tn8 (ml r0)
        (mkPair lnat tn9 (ml x2) (mkPair lnat tn10 (ml x1) (mkPair lnat tn11 (ml ks) (mkPair lnat lkid (ml nr) (mkList tKid kids.toList))))))))))))
  let tC ← IO.monoNanosNow
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkAppN (mkConst ``R3RT.batchC) #[mkConst (pfxN ++ `entry), mkConst `R3C.REPmA, mkConst `R3C.REPA, mkConst `R3C.DIAGA,
      mkList t5 st, mkList tNode nd.toList]) (mkConst ``Bool.true)
  let decl := Declaration.thmDecl { name := id, levelParams := [], type := ty, value := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true) }
  let (w, c) ← R3RTAdd.addTimed decl s!"{id} (batch)"
  logInfo m!"{id}: {n} nodes, {nkids} children, kernel {w} ms wall, {c} ms cpu (parse {(tB - tA) / 1000000} ms, build {(tC - tB) / 1000000} ms)"
elab "#r3batchC " id:ident pfx:ident p:str : command => batchCmd id.getId pfx.getId p.getString 0
/-- timing variants: `mode` bit 1 drops the children, bit 2 the extra rows and node rows -/
elab "#r3batchCv " id:ident pfx:ident p:str md:num : command => batchCmd id.getId pfx.getId p.getString md.getNat
end R3RTLoadC

namespace R3RTLoadC
open Lean Elab Command
/-- `#r3tableNC Pfx "file"`: the guarded per-job table without its `tab_ok` check (timing files only: the check is measured once per
chunk table in a separate file) -/
elab "#r3tableNC " pfx:ident p:str : command => R3RTLoadTD.rttableG pfx.getId p.getString 64 552
end R3RTLoadC
