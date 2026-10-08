module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import RT.Load
public import L1.Load4
public import R3RT.Check4TD
public import R3RT.L1v5
public import R3RT.AddT
/-! `#r3batchTD name Pfx "file"`: theorem `name : R3RT.batch4TD Pfx.entry stack nodes = true` from a `#r3batchT` batch file (same
items: s, s x (S, D, N, U, d), n, n x (label, header, E, RI, nk, kills)); the packed indices become three literal lists per record
(c2, ex + c1, V rows, each reversed); E is not used (the checker derives it).  One synchronous timed check (`R3RT.AddT`). -/
@[expose] public section
open Lean Elab Command L1Load
namespace R3RTLoadTD
elab "#r3batchTD " id:ident pfx:ident p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let it := items b 0 #[]
  let s := it[0]!
  let t2 := prodTy natTy natTy
  let t3 := prodTy natTy t2
  let t4 := prodTy natTy t3
  let t5 := prodTy natTy t4
  let st := (List.range s).map fun i =>
    mkPair natTy t4 (mkRawNatLit it[1+5*i]!) (mkPair natTy t3 (mkRawNatLit it[2+5*i]!)
      (mkPair natTy t2 (mkRawNatLit it[3+5*i]!) (mkPair natTy natTy (mkRawNatLit it[4+5*i]!) (mkRawNatLit it[5+5*i]!))))
  let o := 1 + 5 * s
  let n := it[o]!
  let lnat := mkApp (mkConst ``List [Level.zero]) natTy
  let tK := prodTy lnat lnat
  let tV := prodTy lnat tK
  let t1 := prodTy lnat tV
  let tH := prodTy natTy t1
  let tS := prodTy natTy tH
  let tC := prodTy natTy tS
  let ml (xs : List Nat) : Expr := mkList natTy (xs.map mkRawNatLit)
  let mut nd : Array Expr := #[]
  let mut q := o + 1
  for _ in [0:n] do
    let l := it[q]!; let hdr := it[q+1]!; let RI := it[q+3]!; let nk := it[q+4]!
    let ks := mkList natTy ((List.range nk).map fun j => mkRawNatLit it[q+5+j]!)
    let nV := (hdr >>> 22) &&& 1023
    let n1 := ((hdr >>> 32) &&& 1023) + ((hdr >>> 42) &&& 1023)
    let m := nV + n1 + ((hdr >>> 52) &&& 1023)
    let refs := (List.range m).map fun i => (RI >>> (16 * i)) &&& 65535
    let rV := (refs.take nV).reverse; let r1 := ((refs.drop nV).take n1).reverse; let r2 := (refs.drop (nV + n1)).reverse
    nd := nd.push (mkPair natTy tC (mkConst (tabName l)) (mkPair natTy tS (mkConst (hName "h" l)) (mkPair natTy tH (mkConst (hName "suf" l))
      (mkPair natTy t1 (mkRawNatLit hdr) (mkPair lnat tV (ml r2) (mkPair lnat tK (ml r1) (mkPair lnat lnat (ml rV) ks)))))))
    q := q + 5 + nk
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkApp3 (mkConst ``R3RT.batch4TD) (mkConst (pfx.getId ++ `entry)) (mkList t5 st) (mkList (prodTy natTy tC) nd.toList)) (mkConst ``Bool.true)
  let decl := Declaration.thmDecl { name := id.getId, levelParams := [], type := ty, value := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true) }
  let (w, c) ← R3RTAdd.addTimed decl s!"{id.getId} (batch)"
  logInfo m!"{id.getId}: {n} nodes, kernel {w} ms wall, {c} ms cpu"
/-- `#r3batch5TD name Pfx "file"`: as `#r3batchTD` for L1 v5 records (`R3RT.batch5TD`, r3l1t5.py batches) -/
elab "#r3batch5TD " id:ident pfx:ident p:str : command => do
  let b ← IO.FS.readBinFile p.getString
  let it := items b 0 #[]
  let s := it[0]!
  let t2 := prodTy natTy natTy
  let t3 := prodTy natTy t2
  let t4 := prodTy natTy t3
  let t5 := prodTy natTy t4
  let st := (List.range s).map fun i =>
    mkPair natTy t4 (mkRawNatLit it[1+5*i]!) (mkPair natTy t3 (mkRawNatLit it[2+5*i]!)
      (mkPair natTy t2 (mkRawNatLit it[3+5*i]!) (mkPair natTy natTy (mkRawNatLit it[4+5*i]!) (mkRawNatLit it[5+5*i]!))))
  let o := 1 + 5 * s
  let n := it[o]!
  let lnat := mkApp (mkConst ``List [Level.zero]) natTy
  let tK := prodTy lnat lnat
  let tV := prodTy lnat tK
  let t1 := prodTy lnat tV
  let tH := prodTy natTy t1
  let tS := prodTy natTy tH
  let tC := prodTy natTy tS
  let ml (xs : List Nat) : Expr := mkList natTy (xs.map mkRawNatLit)
  let mut nd : Array Expr := #[]
  let mut q := o + 1
  for _ in [0:n] do
    let l := it[q]!; let hdr := it[q+1]!; let RI := it[q+3]!; let nk := it[q+4]!
    let ks := mkList natTy ((List.range nk).map fun j => mkRawNatLit it[q+5+j]!)
    let nV := (hdr >>> 22) &&& 1023
    let n1 := ((hdr >>> 32) &&& 1023) + ((hdr >>> 42) &&& 1023)
    let m := nV + n1 + ((hdr >>> 52) &&& 1023)
    let refs := (List.range m).map fun i => (RI >>> (16 * i)) &&& 65535
    let rV := (refs.take nV).reverse; let r1 := ((refs.drop nV).take n1).reverse; let r2 := (refs.drop (nV + n1)).reverse
    nd := nd.push (mkPair natTy tC (mkConst (tabName l)) (mkPair natTy tS (mkConst (hName "h" l)) (mkPair natTy tH (mkConst (hName "suf" l))
      (mkPair natTy t1 (mkRawNatLit hdr) (mkPair lnat tV (ml r2) (mkPair lnat tK (ml r1) (mkPair lnat lnat (ml rV) ks)))))))
    q := q + 5 + nk
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkApp3 (mkConst ``R3RT.batch5TD) (mkConst (pfx.getId ++ `entry)) (mkList t5 st) (mkList (prodTy natTy tC) nd.toList)) (mkConst ``Bool.true)
  let decl := Declaration.thmDecl { name := id.getId, levelParams := [], type := ty, value := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true) }
  let (w, c) ← R3RTAdd.addTimed decl s!"{id.getId} (batch)"
  logInfo m!"{id.getId}: {n} nodes, kernel {w} ms wall, {c} ms cpu"
end R3RTLoadTD

namespace R3RTLoadTD
open Lean Elab Command
/-- RT's `rttable` (chunks of `ch` entries of `wb` bits, `Bool.rec` dispatcher) with a guarded chunk function:
`Pfx.chunk k = 0` for `k ≥ nch` (the bare dispatcher aliases chunk indices with period `2^depth`); so `Pfx.entry i = 0` for every
`i ≥ N` (the last chunk's literal has no bits past its entries). -/
meta def rttableG (pfx : Name) (path : String) (ch : Nat) (wb : Nat) : CommandElabM Unit := do
  let b ← IO.FS.readBinFile path
  let wB := wb / 8
  let n := b.size / wB
  let nch := (n + ch - 1) / ch
  let pf := pfx
  for k in [0:nch] do
    liftCoreM <| RTLoad.defN (pf ++ Name.mkSimple s!"C{k}") RTLoad.natTy (mkRawNatLit (RTLoad.natLE b (wB * ch * k) (min b.size (wB * ch * (k + 1)))))
  let dep := Nat.max 1 (Nat.log2 (nch - 1) + 1)
  let fnTy := mkForall `k BinderInfo.default RTLoad.natTy RTLoad.natTy
  for lvl in [1:dep + 1] do
    let cnt := (nch + 2 ^ lvl - 1) / 2 ^ lvl
    for idx in [0:cnt] do
      let kv := mkBVar 0
      let child (c : Nat) : Expr :=
        if lvl == 1 then (if c < nch then mkConst (pf ++ Name.mkSimple s!"C{c}") else mkRawNatLit 0)
        else (if c * 2 ^ (lvl - 1) < nch then mkApp (mkConst (pf ++ Name.mkSimple s!"D{lvl-1}_{c}")) kv else mkRawNatLit 0)
      let body := mkApp4 (mkConst ``Bool.rec [Level.one]) (mkLambda `_ BinderInfo.default (mkConst ``Bool) RTLoad.natTy)
        (child (2 * idx)) (child (2 * idx + 1)) (RTLoad.bitE kv (lvl - 1))
      liftCoreM <| RTLoad.defN (pf ++ Name.mkSimple s!"D{lvl}_{idx}") fnTy (mkLambda `k BinderInfo.default RTLoad.natTy body)
  -- guarded: chunk k = Bool.rec 0 (D_dep_0 k) (Nat.blt k nch)
  let kv := mkBVar 0
  let guarded := mkApp4 (mkConst ``Bool.rec [Level.one]) (mkLambda `_ BinderInfo.default (mkConst ``Bool) RTLoad.natTy)
    (mkRawNatLit 0) (mkApp (mkConst (pf ++ Name.mkSimple s!"D{dep}_0")) kv) (mkApp2 (mkConst ``Nat.blt) kv (mkRawNatLit nch))
  liftCoreM <| RTLoad.defN (pf ++ `chunk) fnTy (mkLambda `k BinderInfo.default RTLoad.natTy guarded)
  let iv := mkBVar 0
  let ent := mkApp2 (mkConst ``Nat.land)
    (mkApp2 (mkConst ``Nat.shiftRight) (mkApp (mkConst (pf ++ `chunk)) (mkApp2 (mkConst ``Nat.div) iv (mkRawNatLit ch)))
      (mkApp2 (mkConst ``Nat.mul) (mkRawNatLit wb) (mkApp2 (mkConst ``Nat.mod) iv (mkRawNatLit ch))))
    (mkRawNatLit (2 ^ wb - 1))
  liftCoreM <| RTLoad.defN (pf ++ `entry) fnTy (mkLambda `i BinderInfo.default RTLoad.natTy ent)
  liftCoreM <| RTLoad.defN (pf ++ `N) RTLoad.natTy (mkRawNatLit n)
  logInfo m!"#rttableG {pf}: {n} entries of {wb} bits, {nch} chunks, depth {dep}, chunk guarded"

/-- `#r3tableQ Pfx rowE "file"`: the guarded table, with the theorem `Pfx.tab_ok : R3RT.tabOKQ rowE Pfx.chunk 64 Pfx.N nch = true` -/
elab "#r3tableQ " pfx:ident re:ident p:str : command => do
  rttableG pfx.getId p.getString 64 552
  let pf := pfx.getId
  let sz := (← IO.FS.readBinFile p.getString).size / 69
  let nch := (sz + 63) / 64
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkAppN (mkConst ``R3RT.tabOKQ) #[mkConst re.getId, mkConst (pf ++ `chunk), mkRawNatLit 64, mkConst (pf ++ `N), mkRawNatLit nch]) (mkConst ``Bool.true)
  let decl := Declaration.thmDecl { name := pf ++ `tab_ok, levelParams := [], type := ty, value := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true) }
  let (w, c) ← R3RTAdd.addTimed decl s!"{pf} (row table)"
  logInfo m!"{pf}.tab_ok: kernel {w} ms wall, {c} ms cpu"
end R3RTLoadTD
