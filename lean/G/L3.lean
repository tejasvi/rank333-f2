module
public import R22Port.U_6050cb77ad13
public meta import Lean
public meta import G.Interface
public import Lean
public import L1.Load
public import R3RT.AddT
public import G.A2
/-! Production loaders for the version-2 Gram checker (one data module per anchor representative, many small check modules).
* `#orbData3 ns "orb" "pa"`: constants `ns.*`: the field packs, the bit-slices (computed here from the packs; phase A checks
  them), the rank-1 groups, `ns.r1 : G.D2.R1`, `ns.orb : G.V2.Orb2`, the range lists `ns.rB ns.rC ns.rV`, the counts, the
  packed anchor `ns.t0` (no theorems).
* phase A: `#aR1 ns`, `#aSl ns`, `#aG ns`, `#aA2 ns nm i0 i1`, `#aA3 ns nm i0 i1`;
* per-vertex batches: `#vB2 ns nm "file" lo` (d = 2), `#vB1 ns nm "file" lo` (d = 1), `#sB ns nm "file" c0` (rank-2 bases).
Every theorem is `Eq.refl true` on a Bool checker, checked by the kernel (timed with `R3RTAdd.addTimed`). -/
@[expose] public section
open Lean Elab Command L1Load
namespace G.L3

meta def lnatTy : Expr := mkApp (mkConst ``List [Level.zero]) natTy
meta def listOf (ty : Expr) : Expr := mkApp (mkConst ``List [Level.zero]) ty
meta def listNat (xs : Array Nat) : Expr := mkList natTy (xs.toList.map mkRawNatLit)
meta def tripTy : Expr := prodTy natTy (prodTy natTy natTy)
meta def mkTrip (a b c : Nat) : Expr := mkPair natTy (prodTy natTy natTy) (mkRawNatLit a) (mkPair natTy natTy (mkRawNatLit b) (mkRawNatLit c))

meta partial def itemRanges (b : ByteArray) (o : Nat) (acc : Array (Nat × Nat)) : Array (Nat × Nat) :=
  if o + 8 > b.size then acc else
    let n := natLE b o (o + 8)
    itemRanges b (o + 8 + n) (acc.push (o + 8, o + 8 + n))

meta def zeros (n : Nat) : ByteArray := Id.run do
  let mut a := ByteArray.empty
  for _ in [0:n] do a := a.push 0
  return a

/-- the 29 bit-slices of the stride-32 field pack in bytes `[lo, hi)` of `b` (`n` fields) -/
meta def slicesOf (b : ByteArray) (lo hi n : Nat) : Array Nat := Id.run do
  let nb := (n + 7) / 8
  let mut buf := zeros (29 * nb)
  for k in [0:n] do
    let mut x : Nat := 0
    for t in [0:4] do
      let p := lo + 4 * k + t
      if p < hi then x := x ||| ((b.get! p).toNat <<< (8 * t))
    if x != 0 then
      for i in [0:29] do
        if (x >>> i) % 2 == 1 then
          let q := i * nb + k / 8
          buf := buf.set! q (buf.get! q ||| ((1 : UInt8) <<< (k % 8).toUInt8))
  let mut out := #[]
  for i in [0:29] do out := out.push (natLE buf (i * nb) (i * nb + nb))
  return out

meta def unpack (x n w : Nat) : Array Nat := Id.run do
  let mut a := #[]
  let mut y := x
  for _ in [0:n] do
    a := a.push (y % (1 <<< w))
    y := y >>> w
  return a

structure Cur where
  it : Array Nat
  q : Nat
meta def Cur.next (c : Cur) : Nat × Cur := (c.it[c.q]!, { c with q := c.q + 1 })
meta def Cur.list (c : Cur) (w : Nat) : Array Nat × Cur :=
  let (n, c) := c.next
  let (x, c) := c.next
  (unpack x n w, c)

/-! ### certificate expressions -/
meta def pairNLTy : Expr := prodTy natTy lnatTy
meta def chsTy : Expr := listOf (listOf pairNLTy)
meta def ccTy : Expr := mkConst ``G.D2.CoreCert
meta def optTy : Expr := mkApp (mkConst ``Option [Level.zero]) (prodTy lnatTy lnatTy)
meta def colGTy : Expr := prodTy lnatTy (prodTy lnatTy (listOf lnatTy))
meta def edgeTy : Expr := prodTy lnatTy (listOf ccTy)
meta def memTy : Expr := prodTy lnatTy (listOf edgeTy)
meta def qTy : Expr := prodTy natTy (prodTy lnatTy (listOf ccTy))
meta def vc2Ty : Expr := prodTy chsTy (prodTy (listOf memTy) (prodTy lnatTy (listOf qTy)))
meta def m1Ty : Expr := prodTy lnatTy (listOf ccTy)
meta def wTy : Expr := prodTy natTy ccTy
meta def vc1Ty : Expr := prodTy chsTy (prodTy (listOf m1Ty) (listOf wTy))
meta def scTy : Expr := prodTy chsTy (listOf memTy)
meta def recSTy : Expr := prodTy lnatTy (listOf scTy)

meta partial def readCore (ng : Nat) (c : Cur) : Expr × Nat × Cur := Id.run do
  let (mode, c) := c.next
  let mut c := c
  if mode == 0 then
    let mut gs : Array Expr := #[]
    for _ in [0:ng] do
      let (flag, c1) := c.next
      c := c1
      if flag == 0 then gs := gs.push (mkApp (mkConst ``Option.none [Level.zero]) (prodTy lnatTy lnatTy))
      else
        let (obs, c2) := c.list 16
        let (ocs, c3) := c2.list 16
        c := c3
        gs := gs.push (mkApp2 (mkConst ``Option.some [Level.zero]) (prodTy lnatTy lnatTy) (mkPair lnatTy lnatTy (listNat obs) (listNat ocs)))
    return (mkApp (mkConst ``G.D2.CoreCert.cnt) (mkList optTy gs.toList), 0, c)
  else if mode == 1 then
    let mut gs : Array Expr := #[]
    let mut ncand := 0
    for _ in [0:ng] do
      let (obs, c1) := c.list 16
      let (ocs, c2) := c1.list 16
      c := c2
      let mut jss : Array Expr := #[]
      for _ in obs do
        let (js, c3) := c.list 16
        c := c3
        ncand := ncand + js.size
        jss := jss.push (listNat js)
      gs := gs.push (mkPair lnatTy (prodTy lnatTy (listOf lnatTy)) (listNat obs) (mkPair lnatTy (listOf lnatTy) (listNat ocs) (mkList lnatTy jss.toList)))
    let (cols, c4) := c.next
    return (mkApp2 (mkConst ``G.D2.CoreCert.col) (mkList colGTy gs.toList) (mkRawNatLit cols), ncand, c4)
  else
    let (gi, c1) := c.next
    let (obs, c2) := c1.list 16
    let (ocs, c3) := c2.list 16
    c := c3
    let mut jss : Array Expr := #[]
    let mut nx := 0
    for _ in obs do
      let (js, c4) := c.list 16
      c := c4
      nx := nx + js.size
      jss := jss.push (listNat js)
    let (eout, n1, c5) := readCore ng c
    c := c5
    let mut ins : Array Expr := #[]
    let mut ncand := n1
    for _ in [0:nx] do
      let (e, n2, c6) := readCore ng c
      c := c6
      ncand := ncand + n2
      ins := ins.push e
    return (mkAppN (mkConst ``G.D2.CoreCert.br) #[mkRawNatLit gi, listNat obs, listNat ocs, mkList lnatTy jss.toList, eout,
      mkList ccTy ins.toList], ncand, c)

meta def readChs (nch : Nat) (c : Cur) : Expr × Cur := Id.run do
  let mut c := c
  let mut chs : Array Expr := #[]
  for _ in [0:nch] do
    let (k, c1) := c.next
    c := c1
    let mut prs : Array Expr := #[]
    for _ in [0:k] do
      let (off, c2) := c.next
      let (js, c3) := c2.list 16
      c := c3
      prs := prs.push (mkPair natTy lnatTy (mkRawNatLit off) (listNat js))
    chs := chs.push (mkList pairNLTy prs.toList)
  return (mkList (listOf pairNLTy) chs.toList, c)

/-- member records for triangles: per member (decreasing) the up list, per edge the third vertices and their cores -/
meta def readMems3 (ng : Nat) (c : Cur) : Expr × Nat × Nat × Cur := Id.run do
  let (m, c) := c.next
  let mut c := c
  let mut ms : Array Expr := #[]
  let mut ncore := 0
  for _ in [0:m] do
    let (up, c1) := c.list 16
    c := c1
    let mut es : Array Expr := #[]
    for _ in up do
      let (th, c2) := c.list 16
      c := c2
      let mut cs : Array Expr := #[]
      for _ in th do
        let (e, _, c3) := readCore ng c
        c := c3
        cs := cs.push e
        ncore := ncore + 1
      es := es.push (mkPair lnatTy (listOf ccTy) (listNat th) (mkList ccTy cs.toList))
    ms := ms.push (mkPair lnatTy (listOf edgeTy) (listNat up) (mkList edgeTy es.toList))
  return (mkList memTy ms.toList, m, ncore, c)

/-! ### the data module -/
meta def packRaw (d raw : Nat) : Nat := Id.run do
  let a := raw % 512
  let B := (raw >>> 9) % 512
  let C := (raw >>> 18) % 512
  let U := (raw >>> 27) % (1 <<< (3 * d))
  let V := (raw >>> (27 + 3 * d)) % (1 <<< (3 * d))
  let r := G.rk a
  let mut t := 0
  for q in [0:r] do
    t := t ||| ((G.yvec (G.Rc a q) C ||| (G.row d U q <<< 27)) <<< (32 * q))
    t := t ||| ((G.xvec B (G.Lc a q) ||| (G.row d V q <<< 27)) <<< (96 + 32 * q))
  return t ||| (r <<< 192) ||| (a <<< 196)

structure PA where
  d : Nat
  t0raw : Nat
  B1 : Array Nat
  C1 : Array Nat
  B2 : Array Nat
  cert2 : Array (Array (Array (Nat × Array Nat)))
  cert3 : Array (Array (Array (Nat × Array Nat)))

meta partial def readCert (c : Cur) : Array (Array (Array (Nat × Array Nat))) × Cur := Id.run do
  let (na, c) := c.next
  let mut c := c
  let mut as := #[]
  for _ in [0:na] do
    let (nu, c1) := c.next
    c := c1
    let mut us := #[]
    for _ in [0:nu] do
      let (nc, c2) := c.next
      c := c2
      let mut cs := #[]
      for _ in [0:nc] do
        let (ce, c3) := c.next
        let (ps, c4) := c3.list 32
        c := c4
        cs := cs.push (ce, ps)
      us := us.push cs
    as := as.push us
  return (as, c)
meta def readPA (of pf : String) : IO PA := do
  let b ← IO.FS.readBinFile of
  let it := items b 0 #[]
  let pb ← IO.FS.readBinFile pf
  let jt := items pb 0 #[]
  let c : Cur := ⟨jt, 0⟩
  let (B1, c) := c.list 32
  let (C1, c) := c.list 32
  let (B2, c) := c.list 32
  let (cert2, c) := readCert c
  let (cert3, _) := readCert c
  return ⟨it[0]!, it[1]!, B1, C1, B2, cert2, cert3⟩

meta def ofRank (r skip : Nat) : List Nat := (List.range 512).filter fun a => G.rk a == r && a != skip && a != 0
meta def centTy : Expr := prodTy natTy lnatTy
meta def certExpr (us : Array (Array (Nat × Array Nat))) : Expr :=
  mkList (listOf centTy) (us.toList.map fun cs => mkList centTy (cs.toList.map fun (ce, ps) => mkPair natTy lnatTy (mkRawNatLit ce) (listNat ps)))
/-- per rank-2 first factor: (a, b0, b1, c0, c1, entries) -/
meta def ranges2 (p : PA) : Array (Nat × Nat × Nat × Nat × Nat × Array Nat) := Id.run do
  let mut out := #[]
  let mut bpos := 0
  let mut cpos := 0
  for (a, i) in (ofRank 2 (p.t0raw % 512)).zip (List.range 1000) do
    let es := p.B2.filter fun e => e % 512 == a
    let nrec := p.cert2[i]!.foldl (fun acc cs => acc + (cs.filter fun (ce, _) => ce >>> 9 == 1).size) 0
    out := out.push (a, bpos, bpos + es.size, cpos, cpos + nrec, es)
    bpos := bpos + es.size
    cpos := cpos + nrec
  return out
meta def ranges3 (p : PA) : Array (Nat × Nat × Nat) := Id.run do
  let mut out := #[]
  let mut vpos := 0
  if p.cert3.size == 0 then return out
  for (a, i) in (ofRank 3 (p.t0raw % 512)).zip (List.range 1000) do
    let nv := p.cert3[i]!.foldl (fun acc cs => acc + cs.foldl (fun x (_, ps) => x + ps.size) 0) 0
    out := out.push (a, vpos, vpos + nv)
    vpos := vpos + nv
  return out

meta def defNatN (n : Name) (v : Nat) : CommandElabM Unit := liftCoreM <| defNat n v
meta def defConst (n : Name) (ty val : Expr) : CommandElabM Unit :=
  liftCoreM <| addDecl (Declaration.defnDecl { name := n, levelParams := [], type := ty, value := val, hints := ReducibilityHints.abbrev, safety := DefinitionSafety.safe }) (forceExpose := true)
meta def slExpr (k : String → Name) (pre : String) (vals : Array Nat) : CommandElabM Expr := do
  for i in [0:29] do defNatN (k s!"{pre}{i}") vals[i]!
  return mkAppN (mkConst ``G.Sl29.mk) ((List.range 29).toArray.map fun i => mkConst (k s!"{pre}{i}"))

elab "#orbData3 " ns:ident of:str pf:str : command => do
  let base := ns.getId
  let k (s : String) : Name := base ++ Name.mkSimple s
  let b ← IO.FS.readBinFile of.getString
  let rg := itemRanges b 0 #[]
  let it := items b 0 #[]
  let p ← readPA of.getString pf.getString
  let d := it[0]!
  let t0 := packRaw d it[1]!
  let nB1 := it[2]!
  let nC1 := it[3]!
  let nB2 := it[8]!
  let nRec := it[9]!
  defNatN (k "t0") t0
  defNatN (k "nB1") nB1
  defNatN (k "nC1") nC1
  defConst (k "B1") lnatTy (listNat p.B1)
  defConst (k "C1") lnatTy (listNat p.C1)
  -- rank 1
  defNatN (k "PB1") it[4]!
  defNatN (k "PC1") it[6]!
  let sB ← slExpr k "S1B" (slicesOf b rg[4]!.1 rg[4]!.2 nB1)
  let sC ← slExpr k "S1C" (slicesOf b rg[6]!.1 rg[6]!.2 nC1)
  defNatN (k "AB") ((1 <<< nB1) - 1)
  defNatN (k "AC") ((1 <<< nC1) - 1)
  let as1 := ofRank 1 ((t0 >>> 196) % 512)
  let mut gs : Array Expr := #[]
  let mut pb := 0
  let mut pc := 0
  for (a, gi) in as1.zip (List.range 1000) do
    let nb := (p.B1.filter fun e => e % 512 == a).size
    let nc := (p.C1.filter fun e => e % 512 == a).size
    defNatN (k s!"g{gi}B") ((it[4]! >>> (32 * pb)) % (1 <<< (32 * nb)))
    defNatN (k s!"g{gi}C") ((it[6]! >>> (32 * pc)) % (1 <<< (32 * nc)))
    gs := gs.push (mkAppN (mkConst ``G.D2.Grp.mk) #[mkRawNatLit a, mkRawNatLit pb, mkRawNatLit nb, mkRawNatLit pc, mkRawNatLit nc,
      mkConst (k s!"g{gi}B"), mkConst (k s!"g{gi}C")])
    pb := pb + nb
    pc := pc + nc
  defConst (k "r1") (mkConst ``G.D2.R1) (mkAppN (mkConst ``G.D2.R1.mk) #[sB, sC, mkConst (k "AB"), mkConst (k "AC"),
    mkList (mkConst ``G.D2.Grp) gs.toList])
  -- rank 2
  for (n, i) in [("PB2X0", 10), ("PB2X1", 11), ("PC2Y0", 13), ("PC2Y1", 14)] do defNatN (k n) it[i]!
  let sX0 ← slExpr k "SX0" (slicesOf b rg[10]!.1 rg[10]!.2 nB2)
  let sX1 ← slExpr k "SX1" (slicesOf b rg[11]!.1 rg[11]!.2 nB2)
  let sY0 ← slExpr k "SY0" (slicesOf b rg[13]!.1 rg[13]!.2 nRec)
  let sY1 ← slExpr k "SY1" (slicesOf b rg[14]!.1 rg[14]!.2 nRec)
  defNatN (k "AR") ((1 <<< nRec) - 1)
  defNatN (k "AB2") ((1 <<< nB2) - 1)
  let nch := it[16]!
  for i in [0:nch] do defNatN (k s!"ch{i}") it[17 + i]!
  let o := 17 + nch
  let nV3 := it[o]!
  defNatN (k "V3P") it[o + 1]!
  for (n, i) in ["V3Y0", "V3Y1", "V3Y2", "V3X0", "V3X1", "V3X2", "V3A"].zip (List.range 7) do defNatN (k n) it[o + 2 + i]!
  defNatN (k "RV3") (((1 <<< (32 * nV3)) - 1) / 4294967295)
  let chl := mkList natTy ((List.range nch).map fun i => mkConst (k s!"ch{i}"))
  defConst (k "orb") (mkConst ``G.V2.Orb2) (mkAppN (mkConst ``G.V2.Orb2.mk) #[mkConst (k "r1"), sY0, sY1, sX0, sX1,
    mkConst (k "AR"), mkConst (k "AB2"), mkConst (k "PB2X0"), mkConst (k "PB2X1"), chl, mkConst (k "V3P"),
    mkConst (k "V3Y0"), mkConst (k "V3Y1"), mkConst (k "V3Y2"), mkConst (k "V3X0"), mkConst (k "V3X1"), mkConst (k "V3X2"),
    mkConst (k "V3A"), mkConst (k "RV3")])
  defNatN (k "nB2") nB2
  defNatN (k "nRec") nRec
  defNatN (k "nV3") nV3
  let r2 := ranges2 p
  let r3 := ranges3 p
  defConst (k "rB") (listOf tripTy) (mkList tripTy (r2.toList.map fun (a, b0, b1, _, _, _) => mkTrip a b0 b1))
  defConst (k "rC") (listOf tripTy) (mkList tripTy (r2.toList.map fun (a, _, _, c0, c1, _) => mkTrip a c0 c1))
  defConst (k "rV") (listOf tripTy) (mkList tripTy (r3.toList.map fun (a, v0, v1) => mkTrip a v0 v1))
  logInfo m!"orbData3 {base}: d {d} nB1 {nB1} nC1 {nC1} groups {as1.length} nB2 {nB2} records {nRec} chunks {nch} V3 {nV3}"

meta def thm (n : Name) (e : Expr) : CommandElabM (Nat × Nat) := do
  let ty := mkApp3 (mkConst ``Eq [Level.one]) (mkConst ``Bool) e (mkConst ``Bool.true)
  let prf := mkApp2 (mkConst ``Eq.refl [Level.one]) (mkConst ``Bool) (mkConst ``Bool.true)
  R3RTAdd.addTimed (Declaration.thmDecl { name := n, levelParams := [], type := ty, value := prf }) s!"{n}"

/-! ### phase A theorems -/
elab "#aR1 " ns:ident of:str pf:str : command => do
  let base := ns.getId
  let p ← readPA of.getString pf.getString
  let (w, c) ← thm (base ++ `R1) (mkAppN (mkConst ``G.A2.checkR1) #[mkConst (base ++ `t0), mkRawNatLit p.d, mkConst (base ++ `r1),
    mkConst (base ++ `PB1), mkConst (base ++ `PC1), mkConst (base ++ `B1), mkConst (base ++ `C1)])
  logInfo m!"aR1 {base}: kernel {w} ms wall, {c} ms cpu"
/-- slices: `which` in S1B S1C SX0 SX1 SY0 SY1 -/
elab "#aSl " ns:ident which:ident : command => do
  let base := ns.getId
  let k (s : String) : Name := base ++ Name.mkSimple s
  let w := which.getId.toString
  let (pack, n) := match w with
    | "S1B" => ("PB1", "nB1") | "S1C" => ("PC1", "nC1") | "SX0" => ("PB2X0", "nB2") | "SX1" => ("PB2X1", "nB2")
    | "SY0" => ("PC2Y0", "nRec") | _ => ("PC2Y1", "nRec")
  let sl := mkAppN (mkConst ``G.Sl29.mk) ((List.range 29).toArray.map fun i => mkConst (k s!"{w}{i}"))
  let nE : Expr := if n == "nB1" then mkApp2 (mkConst ``List.length [Level.zero]) natTy (mkConst (k "B1"))
    else if n == "nC1" then mkApp2 (mkConst ``List.length [Level.zero]) natTy (mkConst (k "C1")) else mkConst (k n)
  let (wms, c) ← thm (k s!"SL_{w}") (mkAppN (mkConst ``G.A2.slicesOK) #[sl, mkConst (k pack), nE])
  logInfo m!"aSl {base}.{w}: kernel {wms} ms wall, {c} ms cpu"
elab "#aG " ns:ident v3:num : command => do
  let base := ns.getId
  let k (s : String) : Name := base ++ Name.mkSimple s
  let (w, c) ← thm (k "G") (mkAppN (mkConst ``G.A2.checkGlob) #[mkConst (if v3.getNat == 1 then ``Bool.true else ``Bool.false), mkConst (k "t0"), mkConst (k "orb"), mkConst (k "nB2"),
    mkConst (k "nRec"), mkConst (k "nV3"), mkConst (k "rB"), mkConst (k "rC"), mkConst (k "rV")])
  logInfo m!"aG {base}: kernel {w} ms wall, {c} ms cpu"
elab "#aA2 " ns:ident nm:ident of:str pf:str i0:num i1:num : command => do
  let base := ns.getId
  let k (s : String) : Name := base ++ Name.mkSimple s
  let p ← readPA of.getString pf.getString
  let rs := ranges2 p
  let mut es : Array Expr := #[]
  for i in [i0.getNat:min i1.getNat rs.size] do
    let (_, _, _, _, _, ents) := rs[i]!
    es := es.push (mkPair lnatTy (listOf (listOf centTy)) (listNat ents) (certExpr p.cert2[i]!))
  let (w, c) ← thm (base ++ nm.getId) (mkAppN (mkConst ``G.A2.allA2) #[mkConst (k "t0"), mkRawNatLit p.d, mkConst (k "orb"),
    mkConst (k "PC2Y0"), mkConst (k "PC2Y1"), mkConst (k "rB"), mkConst (k "rC"), mkRawNatLit i0.getNat,
    mkList (prodTy lnatTy (listOf (listOf centTy))) es.toList])
  logInfo m!"aA2 {base}.{nm.getId}: first factors {i0.getNat}..{min i1.getNat rs.size}, kernel {w} ms wall, {c} ms cpu"
elab "#aA3 " ns:ident nm:ident of:str pf:str i0:num i1:num : command => do
  let base := ns.getId
  let k (s : String) : Name := base ++ Name.mkSimple s
  let p ← readPA of.getString pf.getString
  let n3 := (ranges3 p).size
  let mut es : Array Expr := #[]
  for i in [i0.getNat:min i1.getNat n3] do
    es := es.push (certExpr p.cert3[i]!)
  let (w, c) ← thm (base ++ nm.getId) (mkAppN (mkConst ``G.A2.allA3) #[mkConst (k "t0"), mkRawNatLit p.d, mkConst (k "orb"),
    mkConst (k "rV"), mkRawNatLit i0.getNat, mkList (listOf (listOf centTy)) es.toList])
  logInfo m!"aA3 {base}.{nm.getId}: first factors {i0.getNat}..{min i1.getNat n3}, kernel {w} ms wall, {c} ms cpu"

/-! ### per-vertex batches -/
elab "#vB2 " ns:ident nm:ident vf:str lo:num ng:num nch:num : command => do
  let base := ns.getId
  let jt := items (← IO.FS.readBinFile vf.getString) 0 #[]
  let mut c : Cur := ⟨jt, 0⟩
  let mut certs : Array Expr := #[]
  let mut idx := lo.getNat
  let mut mm := 0
  let mut nc := 0
  while c.q < jt.size do
    let (iv, c1) := c.next
    if iv != idx then throwError m!"vB2: expected v {idx}, file has {iv}"
    let (chs, c2) := readChs nch.getNat c1
    let (mems, m, ncore, c3) := readMems3 ng.getNat c2
    let (ws, c4) := c3.list 32
    c := c4
    let mut qs : Array Expr := #[]
    for w in ws do
      let (ss, c5) := c.list 32
      c := c5
      let mut cs : Array Expr := #[]
      for _ in ss do
        let (e, _, c6) := readCore ng.getNat c
        c := c6
        cs := cs.push e
        nc := nc + 1
      qs := qs.push (mkPair natTy (prodTy lnatTy (listOf ccTy)) (mkRawNatLit w) (mkPair lnatTy (listOf ccTy) (listNat ss) (mkList ccTy cs.toList)))
    certs := certs.push (mkPair chsTy (prodTy (listOf memTy) (prodTy lnatTy (listOf qTy))) chs
      (mkPair (listOf memTy) (prodTy lnatTy (listOf qTy)) mems (mkPair lnatTy (listOf qTy) (listNat ws) (mkList qTy qs.toList))))
    idx := idx + 1
    mm := mm + m
    nc := nc + ncore
  let (w, cpu) ← thm (base ++ nm.getId) (mkAppN (mkConst ``G.V2.allV2) #[mkConst (base ++ `orb), mkRawNatLit 17, mkRawNatLit lo.getNat,
    mkList vc2Ty certs.toList])
  logInfo m!"vB2 {base}.{nm.getId}: v {lo.getNat}..{idx}, members {mm}, cores {nc}, kernel {w} ms wall, {cpu} ms cpu"
elab "#vB1 " ns:ident nm:ident vf:str lo:num ng:num nch:num : command => do
  let base := ns.getId
  let jt := items (← IO.FS.readBinFile vf.getString) 0 #[]
  let mut c : Cur := ⟨jt, 0⟩
  let mut certs : Array Expr := #[]
  let mut idx := lo.getNat
  let mut nc := 0
  while c.q < jt.size do
    let (iv, c1) := c.next
    if iv != idx then throwError m!"vB1: expected v {idx}, file has {iv}"
    let (chs, c2) := readChs nch.getNat c1
    let (m, c3) := c2.next
    c := c3
    let mut ms : Array Expr := #[]
    for _ in [0:m] do
      let (up, c4) := c.list 16
      c := c4
      let mut cs : Array Expr := #[]
      for _ in up do
        let (e, _, c5) := readCore ng.getNat c
        c := c5
        cs := cs.push e
        nc := nc + 1
      ms := ms.push (mkPair lnatTy (listOf ccTy) (listNat up) (mkList ccTy cs.toList))
    let (nw, c6) := c.next
    c := c6
    let mut ws : Array Expr := #[]
    for _ in [0:nw] do
      let (w, c7) := c.next
      let (e, _, c8) := readCore ng.getNat c7
      c := c8
      nc := nc + 1
      ws := ws.push (mkPair natTy ccTy (mkRawNatLit w) e)
    certs := certs.push (mkPair chsTy (prodTy (listOf m1Ty) (listOf wTy)) chs (mkPair (listOf m1Ty) (listOf wTy) (mkList m1Ty ms.toList) (mkList wTy ws.toList)))
    idx := idx + 1
  let (w, cpu) ← thm (base ++ nm.getId) (mkAppN (mkConst ``G.V2.allV1) #[mkConst (base ++ `orb), mkRawNatLit 18, mkRawNatLit lo.getNat,
    mkList vc1Ty certs.toList])
  logInfo m!"vB1 {base}.{nm.getId}: v {lo.getNat}..{idx}, cores {nc}, kernel {w} ms wall, {cpu} ms cpu"
meta def entSTy : Expr := prodTy natTy (prodTy natTy (prodTy natTy (prodTy lnatTy (listOf scTy))))
elab "#sB " ns:ident nm:ident vf:str ci:num ng:num nch:num : command => do
  let base := ns.getId
  let jt := items (← IO.FS.readBinFile vf.getString) 0 #[]
  let mut c : Cur := ⟨jt, 0⟩
  let mut ents : Array Expr := #[]
  let mut nv := 0
  let mut nc := 0
  while c.q < jt.size do
    let (cc, c1) := c.next
    let (jlo, c2) := c1.next
    let (jhi, c3) := c2.next
    if cc / 256 != ci.getNat then throwError m!"sB: record {cc} is not in chunk {ci.getNat}"
    let (js, c4) := c3.list 16
    c := c4
    let mut scs : Array Expr := #[]
    for _ in js do
      let (chs, c5) := readChs nch.getNat c
      let (mems, _, ncore, c6) := readMems3 ng.getNat c5
      c := c6
      nc := nc + ncore
      scs := scs.push (mkPair chsTy (listOf memTy) chs mems)
    ents := ents.push (mkPair natTy (prodTy natTy (prodTy natTy (prodTy lnatTy (listOf scTy)))) (mkRawNatLit (cc % 256))
      (mkPair natTy (prodTy natTy (prodTy lnatTy (listOf scTy))) (mkRawNatLit jlo)
      (mkPair natTy (prodTy lnatTy (listOf scTy)) (mkRawNatLit jhi) (mkPair lnatTy (listOf scTy) (listNat js) (mkList scTy scs.toList)))))
    nv := nv + js.size
  let (w, cpu) ← thm (base ++ nm.getId) (mkAppN (mkConst ``G.V2.allS) #[mkConst (base ++ `orb), mkRawNatLit 17, mkRawNatLit ci.getNat,
    mkConst (base ++ Name.mkSimple s!"ch{ci.getNat}"), mkList entSTy ents.toList])
  logInfo m!"sB {base}.{nm.getId}: chunk {ci.getNat}, entries {ents.size}, vertices {nv}, cores {nc}, kernel {w} ms wall, {cpu} ms cpu"

end G.L3
