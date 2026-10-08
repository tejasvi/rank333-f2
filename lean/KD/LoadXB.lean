module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import RT.Load
public import L1.Load4
public import R3RT.LoadC
public import R3RT.AddT
public import KD.XBatch
public import KD.XConstN
/-! `#kdbatchX name Pfx "file"`: theorem `name : KD.batchX Pfx.entry stack nodes = true` from a kx2.py batch (kinds/py/kx2.py: the
composed main-search records with the bound bulk-peel part, hybrid format).  The per-job table `Pfx` is R3's (`#r3tableNC` /
`#r3tableQ`); L1's static tables are `L1.T.c2t_<l>` (R3RT.TabC3eD) and `h_<l>` / `suf_<l>` (L1.HypTables); the window constants
are `KD.XC.*_<n>` (KD.XConstN).  One synchronous timed check, µs. -/
@[expose] public section
open Lean Elab Command L1Load R3RTLoadC
namespace KDLoadXB

meta partial def mkXC (it : Array Nat) (q : Nat) : Expr × Nat × Nat × Nat := Id.run do
  let tag := it[q]!; let ns := it[q+1]!
  if tag == 2 then return (mkConst ``KD.XC.cut, q + 2, 0, 0)   -- kill2's budget cut (tag 2, no steps)
  let mut q := q + 2
  let mut sts : Array Expr := #[]
  for _ in [0:ns] do
    sts := sts.push (mkPair natTy natTy (mkRawNatLit it[q]!) (mkRawNatLit it[q+1]!)); q := q + 2
  let stL := mkList (prodTy natTy natTy) sts.toList
  if tag == 0 then
    return (mkApp2 (mkConst ``KD.XC.leaf) stL (mkPair natTy natTy (mkRawNatLit it[q]!) (mkRawNatLit it[q+1]!)), q + 2, ns + 1, 0)
  else
    let v := it[q]!; let k := it[q+1]!; q := q + 2
    let (l, q1, sl, bl) := mkXC it q
    let (r, q2, sr, br) := mkXC it q1
    return (mkAppN (mkConst ``KD.XC.node) #[stL, mkRawNatLit v, mkRawNatLit k, l, r], q2, ns + sl + sr, 1 + bl + br)

/-- little-endian bytes `[lo, hi)` as a Nat: divide and conquer down to 64-byte leaves, each read as eight native 8-byte words -/
meta partial def natLE8 (b : ByteArray) (lo hi : Nat) : Nat :=
  if hi ≤ lo then 0
  else if hi - lo ≤ 64 then
    if lo + 64 ≤ b.size then Id.run do
      let mut acc := 0
      let mut k := 8
      while k > 0 do
        k := k - 1
        acc := (acc <<< 64) ||| (b.extract (lo + 8 * k) (lo + 8 * k + 8)).toUInt64LE!.toNat
      return acc % 2 ^ (8 * (hi - lo))
    else natLE b lo hi
  else
    let mid := lo + ((hi - lo) / 128 + 1) * 64
    let mid := if mid ≥ hi then lo + 64 else mid
    natLE8 b lo mid + (natLE8 b mid hi <<< (8 * (mid - lo)))

/-- `L1Load.items` with native 8-byte reads (`ByteArray.toUInt64LE!`, compiled in core) for the length headers and for payloads of
at most 8 bytes; longer payloads by `natLE8`.  Same values, far fewer interpreted steps. -/
meta def itemsF (b : ByteArray) : Array Nat := Id.run do
  let mut acc : Array Nat := #[]
  let mut o := 0
  while o + 8 ≤ b.size do
    let n := (b.extract o (o + 8)).toUInt64LE!.toNat
    let v := if n ≤ 8 && o + 16 ≤ b.size then (b.extract (o + 8) (o + 16)).toUInt64LE!.toNat % 2 ^ (8 * n)
      else natLE8 b (o + 8) (o + 8 + n)
    acc := acc.push v
    o := o + 8 + n
  return acc

/-- the value of a constant defined by a raw literal (kill2's `K2C/LoadC4.lean`, copied) -/
meta def litOf (n : Name) : CommandElabM Nat := do
  match (← getEnv).find? n with
  | some (.defnInfo d) => match d.value with
    | .lit (.natVal v) => return v
    | _ => throwError s!"{n}: not a literal"
  | _ => throwError s!"{n}: not found"

/-- `B_x` as `K2.bxOK` computes it (kill2's `aggB`, copied): `clrD (addClV 0 REPm REP x rows ||| clrV C2x REP 512 x) DIAG`.  The kernel
still checks `bxOK`, so the loader's value is not trusted. -/
meta def aggB (REPm REP DIAG x C2x : Nat) (masks : List Nat) : Nat :=
  let cl := masks.foldl (fun acc m =>
    let m2 := m ^^^ (m &&& (1 <<< x))
    acc ||| (m2 * ((m2 * REPm) &&& REP))) 0
  let C2 := C2x ^^^ (C2x &&& ((REP <<< x) ||| (((1 <<< 512) - 1) <<< (512 * x))))
  let B := cl ||| C2
  B ^^^ (B &&& DIAG)

meta def cname (k : String) (n : Nat) : Name := Name.mkStr (Name.mkStr `KD "XC") s!"{k}_{n}"
meta def tupleE (n : Nat) : Expr :=
  let t2 := prodTy natTy natTy; let t3 := prodTy natTy t2; let t4 := prodTy natTy t3
  mkPair natTy t4 (mkConst (cname "rep" n)) (mkPair natTy t3 (mkConst (cname "repm" n)) (mkPair natTy t2 (mkConst (cname "grd" n))
    (mkPair natTy natTy (mkConst (cname "lows" n)) (mkConst (cname "diag" n)))))

meta def batchCmd (id pfxN : Name) (path : String) (mode : Nat := 0) (nob : Bool := false) : CommandElabM Unit := do
  let tb ← IO.monoNanosNow
  let cb ← cpuMs
  let b ← IO.FS.readBinFile path
  let it := if mode / 16 % 2 == 1 then items b 0 #[] else itemsF b
  let s := it[0]!
  let tp ← IO.monoNanosNow
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
  let xc := mkConst ``KD.XC
  -- Agg = ℕ × ℕ × ℕ × List ℕ
  let ta3 := prodTy natTy lnat
  let ta2 := prodTy natTy ta3
  let tAgg := prodTy natTy ta2
  let lagg := mkApp (mkConst ``List [Level.zero]) tAgg
  -- KidX = ℕ × ℕ × List ℕ × XC × ℕ × (ℕ × ℕ × ℕ × ℕ × ℕ)
  let tk5 := prodTy natTy t5
  let tk4 := prodTy xc tk5
  let tk3 := prodTy lnat tk4
  let tk2 := prodTy natTy tk3
  let tKid := prodTy natTy tk2
  let lkid := mkApp (mkConst ``List [Level.zero]) tKid
  -- NodeX = ℕ × ℕ × ℕ × ℕ × List ℕ ×6 (r2 r1 r0 x2 x1 ks) × List ℕ (nrows) × List Agg × List ℕ (XL) × ℕ × ℕ × ℕ × List KidX
  let tn16 := prodTy natTy lkid
  let tn15 := prodTy natTy tn16
  let tn14 := prodTy natTy tn15
  let tn13 := prodTy lnat tn14
  let tn12 := prodTy lagg tn13
  let tn11 := prodTy lnat tn12
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
  let (cREPm, cREP, cDIAG) ← if nob then do pure ((← litOf `KD.REPmF), (← litOf `KD.REPF), (← litOf `KD.DIAGF)) else pure (0, 0, 0)
  let mut nd : Array Expr := #[]
  let mut nkids := 0; let mut nsteps := 0; let mut nbr := 0; let mut naggs := 0; let mut ntab := 0; let mut ndict := 0; let mut stepwin := 0; let mut ncrows := 0
  for _ in [0:n] do
    let l := it[q]!; let hdr := it[q+1]!; q := q + 2
    let rd (q : Nat) : List Nat × Nat := let k := it[q]!; ((List.range k).map fun j => it[q + 1 + j]!, q + 1 + k)
    let (r2, q1) := rd q; let (r1, q2) := rd q1; let (r0, q3) := rd q2; let (x2, q4) := rd q3; let (x1, q5) := rd q4
    let (ks, q6) := rd q5; let (nr0, q7) := rd q6
    ndict := ndict + r2.length + r1.length + r0.length + x2.length + x1.length
    q := q7
    -- timing variants: bit 1 drops the children, 2 the aggregates, 4 the deficit table, 8 the extras and node rows
    let nr := if (mode / 8) % 2 == 1 then [] else nr0
    let x2 := if (mode / 8) % 2 == 1 then [] else x2
    let x1 := if (mode / 8) % 2 == 1 then [] else x1
    let na := it[q]!; q := q + 1
    let mut aggs : Array Expr := #[]
    for _ in [0:na] do
      let x := it[q]!
      let (B, k, q0) ← if nob then do
          -- NOB layout (kx3.py KX2_NOB=1): x, k, k positions, k label masks; B_x computed here from c2t_x and the masks
          let k := it[q+1]!
          let masks := (List.range k).map fun j => it[q + 2 + k + j]!
          pure (aggB cREPm cREP cDIAG x (← litOf (tabName x)) masks, k, q + 2)
        else pure (it[q+1]!, it[q+2]!, q + 3)
      q := q0
      let rows := (List.range k).map fun j => it[q + j]!
      q := q + k + (if nob then k else 0)
      aggs := aggs.push (mkPair natTy ta2 (mkRawNatLit x) (mkPair natTy ta3 (mkConst (tabName x)) (mkPair natTy lnat (mkRawNatLit B) (ml rows))))
    naggs := naggs + na
    if (mode / 2) % 2 == 1 then aggs := #[]
    let (XL0, q8) := rd q
    let XL := if (mode / 4) % 2 == 1 then [] else XL0
    q := q8
    let HP := if (mode / 4) % 2 == 1 then 0 else it[q]!; let DEFP := if (mode / 4) % 2 == 1 then 0 else it[q+1]!; q := q + 2
    ntab := ntab + XL.length
    let nk := it[q]!; q := q + 1
    let mut kids : Array Expr := #[]
    for _ in [0:nk] do
      let _kind := it[q]!; let _bb := it[q+1]!; let u := it[q+2]!; let Fu := it[q+3]!; let ncr := it[q+4]!; q := q + 5
      let cr := (List.range ncr).map fun j => it[q + j]!
      q := q + ncr
      let (tr, q', ns, nb) := mkXC it q
      q := q'
      nsteps := nsteps + ns; nbr := nbr + nb; stepwin := stepwin + ns * (510 - u); ncrows := ncrows + cr.length
      if mode % 2 == 0 then kids := kids.push (mkPair natTy tk2 (mkRawNatLit u) (mkPair natTy tk3 (mkRawNatLit Fu) (mkPair lnat tk4 (ml cr)
        (mkPair xc tk5 tr (mkPair natTy t5 (mkConst (tabName u)) (tupleE (510 - u)))))))
    nkids := nkids + nk
    nd := nd.push (mkPair natTy tn2 (mkConst (tabName l)) (mkPair natTy tn3 (mkConst (hName "h" l)) (mkPair natTy tn4 (mkConst (hName "suf" l))
      (mkPair natTy tn5 (mkRawNatLit hdr) (mkPair lnat tn6 (ml r2) (mkPair lnat tn7 (ml r1) (mkPair lnat tn8 (ml r0)
        (mkPair lnat tn9 (ml x2) (mkPair lnat tn10 (ml x1) (mkPair lnat tn11 (ml ks) (mkPair lnat tn12 (ml nr)
          (mkPair lagg tn13 (mkList tAgg aggs.toList) (mkPair lnat tn14 (ml XL) (mkPair natTy tn15 (mkRawNatLit HP)
            (mkPair natTy tn16 (mkRawNatLit DEFP) (mkPair natTy lkid (mkRawNatLit XL.length) (mkList tKid kids.toList)))))))))))))))))
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool)
    (mkAppN (mkConst ``KD.batchX) #[mkConst (pfxN ++ `entry), mkList t5 st, mkList tNode nd.toList]) (mkConst ``Bool.true)
  let decl := Declaration.thmDecl { name := id, levelParams := [], type := ty, value := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true) }
  let env ← getEnv
  let t0 ← IO.monoNanosNow
  let c0 ← cpuMs
  match env.addDeclCore 0 decl none with
  | .ok _ => pure ()
  | .error e => throwError m!"{id}: kernel rejects: {e.toMessageData (← getOptions)}"
  let t1 ← IO.monoNanosNow
  let c1 ← cpuMs
  logInfo m!"{id}: {n} nodes, {nkids} children, {nsteps} steps, {nbr} in-branches, {naggs} aggregates, {ntab} table entries, kernel {(t1 - t0) / 1000} us wall, {c1 - c0} ms cpu, dict {ndict} stepwin {stepwin} crows {ncrows} build {(t0 - tb) / 1000} us wall {c0 - cb} ms cpu parse {(tp - tb) / 1000} us"
elab "#kdbatchX " id:ident pfx:ident p:str : command => batchCmd id.getId pfx.getId p.getString
/-- timing variants (`mode` bits: 1 children, 2 aggregates, 4 deficit table, 8 extras and node rows dropped) -/
elab "#kdbatchXv " id:ident pfx:ident p:str md:num : command => batchCmd id.getId pfx.getId p.getString md.getNat
/-- `#kdbatchX` for batches in the NOB layout (kx3.py `KX2_NOB=1`: aggregates as label masks, `B_x` computed by the loader) -/
elab "#kdbatchXn " id:ident pfx:ident p:str : command => batchCmd id.getId pfx.getId p.getString 0 true
end KDLoadXB
