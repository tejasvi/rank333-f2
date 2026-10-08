module
public meta import Lean.Elab.Command
public meta import Lean.Compiler.Options
public import R22N.Rec
/-! # R22D.Load: module-land loaders for the native checkers' static tables (native/infra, 2026-10-07)

Ports of the kernel track's data loaders (`L1Load` `#l1tables`, `#l1hyp`), reading the SAME input files and building the SAME Nat
literals, but in module files (PROOF_OBJECT.md §7 R1):
* every constant is added with `addDecl … (forceExpose := true)` (a plain `addDecl` in a module exports it as an opaque axiom,
  §10 R-d) and compiled (`compileDecl`: IR, evaluated by the interpreter; chunks `meta import` the data modules, §9.2);
* names live under `R22D`; the non-module bridge (`native/infra/lib/bridge`) proves `R22D.x = <kernel constant>` by `rfl`. -/
public meta section
open Lean Elab Command
namespace R22D.Load

/-- little-endian bytes `[lo, hi)` of `b` as a Nat, divide and conquer (= `L1Load.natLE`) -/
partial def natLE (b : ByteArray) (lo hi : Nat) : Nat :=
  if hi ≤ lo then 0
  else if hi - lo ≤ 64 then Id.run do
    let mut acc := 0
    let mut i := hi
    while i > lo do
      i := i - 1
      acc := acc * 256 + (b.get! i).toNat
    return acc
  else
    let mid := lo + (hi - lo) / 2
    natLE b lo mid + (natLE b mid hi <<< (8 * (mid - lo)))

def compiled (d : Declaration) : CoreM Unit := do
  addDecl d (forceExpose := true)
  withOptions (fun o => Compiler.compiler.postponeCompile.set o false) <| compileDecl d

/-- `def n : Nat := v`, exposed and compiled -/
def defNat (n : Name) (v : Nat) : CoreM Unit :=
  compiled (.defnDecl { name := n, levelParams := [], type := mkConst ``Nat, value := mkRawNatLit v, hints := .abbrev, safety := .safe })

/-- `def n : Array Nat := #[c_0, …, c_{k-1}]` over existing constants, exposed and compiled -/
def defArr (n : Name) (cs : List Name) : CoreM Unit := do
  let ty := mkConst ``Nat
  let l := cs.foldr (fun c acc => mkApp3 (mkConst ``List.cons [.zero]) ty (mkConst c) acc) (mkApp (mkConst ``List.nil [.zero]) ty)
  let aty := mkApp (mkConst ``Array [.zero]) ty
  let v := mkApp2 (mkConst ``List.toArray [.zero]) ty l
  compiled (.defnDecl { name := n, levelParams := [], type := aty, value := v, hints := .abbrev, safety := .safe })

def nm (k : String) (l : Nat) : Name := Name.mkStr `R22D s!"{k}_{l}"

/-- `#r22d_l1tables "file"` (port of `#l1tables`): `R22D.c2t_<l>` (l < 511), `R22D.CONF1T`, `R22D.c2tN : Array Nat` -/
elab "#r22d_l1tables " p:str : command => liftCoreM do
  let b ← IO.FS.readBinFile p.getString
  let tab := 511 * 64
  for l in [0:511] do defNat (nm "c2t" l) (natLE b (l * tab) ((l + 1) * tab))
  defNat `R22D.CONF1T (natLE b (511 * tab) (512 * tab))
  defArr `R22D.c2tN ((List.range 511).map (nm "c2t"))

/-- `#r22d_l1hyp "file"` (port of `#l1hyp`): `R22D.h_<l>`, `R22D.suf_<l>` (l < 511), arrays `R22D.hN`, `R22D.sufN` -/
elab "#r22d_l1hyp " p:str : command => liftCoreM do
  let b ← IO.FS.readBinFile p.getString
  let tb := 448
  for l in [0:511] do defNat (nm "h" l) (natLE b (l * tb) ((l + 1) * tb))
  for l in [0:511] do defNat (nm "suf" l) (natLE b ((511 + l) * tb) ((512 + l) * tb))
  defArr `R22D.hN ((List.range 511).map (nm "h"))
  defArr `R22D.sufN ((List.range 511).map (nm "suf"))

/-- `Nat.beq (Nat.land (Nat.shiftRight k b) 1) 1` (as `RTLoad.bitE`) -/
def bitE (k : Expr) (b : Nat) : Expr :=
  mkApp2 (mkConst ``Nat.beq) (mkApp2 (mkConst ``Nat.land) (mkApp2 (mkConst ``Nat.shiftRight) k (mkRawNatLit b)) (mkRawNatLit 1))
    (mkRawNatLit 1)

def defE (n : Name) (ty v : Expr) : CoreM Unit :=
  compiled (.defnDecl { name := n, levelParams := [], type := ty, value := v, hints := .abbrev, safety := .safe })

/-- port of `RTLoad.rttable`: the SAME definitions (`Pfx.C<k>`, `Pfx.D<l>_<i>` with `Bool.rec`, `Pfx.chunk`, `Pfx.entry`, `Pfx.N`),
exposed and compiled (the `Bool.rec` trees compile through `R22N.bool_rec_eq_impl`) -/
def rttable (pf : Name) (path : String) (ch : Nat) (wb : Nat) : CommandElabM Unit := do
  let b ← IO.FS.readBinFile path
  let natTy := mkConst ``Nat
  let wB := wb / 8
  let n := b.size / wB
  let nch := (n + ch - 1) / ch
  for k in [0:nch] do
    liftCoreM <| defE (pf ++ Name.mkSimple s!"C{k}") natTy (mkRawNatLit (natLE b (wB * ch * k) (min b.size (wB * ch * (k + 1)))))
  let dep := Nat.max 1 (Nat.log2 (nch - 1) + 1)
  let fnTy := mkForall `k BinderInfo.default natTy natTy
  for lvl in [1:dep + 1] do
    let cnt := (nch + 2 ^ lvl - 1) / 2 ^ lvl
    for idx in [0:cnt] do
      let kv := mkBVar 0
      let child (c : Nat) : Expr :=
        if lvl == 1 then (if c < nch then mkConst (pf ++ Name.mkSimple s!"C{c}") else mkRawNatLit 0)
        else (if c * 2 ^ (lvl - 1) < nch then mkApp (mkConst (pf ++ Name.mkSimple s!"D{lvl-1}_{c}")) kv else mkRawNatLit 0)
      let body := mkApp4 (mkConst ``Bool.rec [Level.one]) (mkLambda `_ BinderInfo.default (mkConst ``Bool) natTy)
        (child (2 * idx)) (child (2 * idx + 1)) (bitE kv (lvl - 1))
      liftCoreM <| defE (pf ++ Name.mkSimple s!"D{lvl}_{idx}") fnTy (mkLambda `k BinderInfo.default natTy body)
  liftCoreM <| defE (pf ++ `chunk) fnTy (mkLambda `k BinderInfo.default natTy (mkApp (mkConst (pf ++ Name.mkSimple s!"D{dep}_0")) (mkBVar 0)))
  let iv := mkBVar 0
  let ent := mkApp2 (mkConst ``Nat.land)
    (mkApp2 (mkConst ``Nat.shiftRight) (mkApp (mkConst (pf ++ `chunk)) (mkApp2 (mkConst ``Nat.div) iv (mkRawNatLit ch)))
      (mkApp2 (mkConst ``Nat.mul) (mkRawNatLit wb) (mkApp2 (mkConst ``Nat.mod) iv (mkRawNatLit ch))))
    (mkRawNatLit (2 ^ wb - 1))
  liftCoreM <| defE (pf ++ `entry) fnTy (mkLambda `i BinderInfo.default natTy ent)
  liftCoreM <| defE (pf ++ `N) natTy (mkRawNatLit n)
  logInfo m!"#r22d_rttablew {pf}: {n} entries of {wb} bits, {nch} chunks, depth {dep}"

/-- `#r22d_rttablew Pfx "file" ch w` (port of `#rttablew`); `#r22d_rttable Pfx "file" ch` (128-bit entries) -/
elab "#r22d_rttablew " pfx:ident p:str ch:num w:num : command => rttable pfx.getId p.getString ch.getNat w.getNat
elab "#r22d_rttable " pfx:ident p:str ch:num : command => rttable pfx.getId p.getString ch.getNat 128

/-- split variant of `rttable` for big tables.  Rarely needed: the superlinear cost seen first (4k / 8k / 16k chunks: 10.6 / 23.2 /
56.7 s) was asynchronous elaboration; with `set_option Elab.async false` the build is linear (10.4 / 20.8 / 42.1 s). `part = some j` defines the chunks `C<k>` and every dispatcher node `D<l>_<i>` (`l ≤ pb`) whose subtree lies in chunk range
`[j·2^pb, (j+1)·2^pb)`; `part = none` defines the levels above `pb`, `chunk`, `entry`, `N`.  The definitions (names, values, tree)
are exactly `rttable`'s, so the rfl bridge to the kernel table is unchanged. -/
def rttableSplit (pf : Name) (path : String) (ch wb pb : Nat) (part : Option Nat) : CommandElabM Unit := do
  let b ← IO.FS.readBinFile path
  let natTy := mkConst ``Nat
  let wB := wb / 8
  let n := b.size / wB
  let nch := (n + ch - 1) / ch
  let dep := Nat.max 1 (Nat.log2 (nch - 1) + 1)
  let fnTy := mkForall `k BinderInfo.default natTy natTy
  let mkD (lvl idx : Nat) : CommandElabM Unit := do
    let kv := mkBVar 0
    let child (c : Nat) : Expr :=
      if lvl == 1 then (if c < nch then mkConst (pf ++ Name.mkSimple s!"C{c}") else mkRawNatLit 0)
      else (if c * 2 ^ (lvl - 1) < nch then mkApp (mkConst (pf ++ Name.mkSimple s!"D{lvl-1}_{c}")) kv else mkRawNatLit 0)
    let body := mkApp4 (mkConst ``Bool.rec [Level.one]) (mkLambda `_ BinderInfo.default (mkConst ``Bool) natTy)
      (child (2 * idx)) (child (2 * idx + 1)) (bitE kv (lvl - 1))
    liftCoreM <| defE (pf ++ Name.mkSimple s!"D{lvl}_{idx}") fnTy (mkLambda `k BinderInfo.default natTy body)
  match part with
  | some j =>
    let lo := j * 2 ^ pb; let hi := min nch ((j + 1) * 2 ^ pb)
    for k in [lo:hi] do
      liftCoreM <| defE (pf ++ Name.mkSimple s!"C{k}") natTy (mkRawNatLit (natLE b (wB * ch * k) (min b.size (wB * ch * (k + 1)))))
    for lvl in [1:(min pb dep) + 1] do
      let cnt := (nch + 2 ^ lvl - 1) / 2 ^ lvl
      for idx in [0:cnt] do
        if lo ≤ idx * 2 ^ lvl && idx * 2 ^ lvl < hi then mkD lvl idx
    logInfo m!"#r22d_rttablew_part {pf} {j}: chunks [{lo}, {hi}) of {nch}, levels 1..{min pb dep}"
  | none =>
    for lvl in [pb + 1:dep + 1] do
      let cnt := (nch + 2 ^ lvl - 1) / 2 ^ lvl
      for idx in [0:cnt] do mkD lvl idx
    liftCoreM <| defE (pf ++ `chunk) fnTy (mkLambda `k BinderInfo.default natTy (mkApp (mkConst (pf ++ Name.mkSimple s!"D{dep}_0")) (mkBVar 0)))
    let iv := mkBVar 0
    let ent := mkApp2 (mkConst ``Nat.land)
      (mkApp2 (mkConst ``Nat.shiftRight) (mkApp (mkConst (pf ++ `chunk)) (mkApp2 (mkConst ``Nat.div) iv (mkRawNatLit ch)))
        (mkApp2 (mkConst ``Nat.mul) (mkRawNatLit wb) (mkApp2 (mkConst ``Nat.mod) iv (mkRawNatLit ch))))
      (mkRawNatLit (2 ^ wb - 1))
    liftCoreM <| defE (pf ++ `entry) fnTy (mkLambda `i BinderInfo.default natTy ent)
    liftCoreM <| defE (pf ++ `N) natTy (mkRawNatLit n)
    logInfo m!"#r22d_rttablew_top {pf}: {n} entries, {nch} chunks, levels {pb + 1}..{dep}"

/-- `#r22d_rttablew_part Pfx "file" ch w pb j` / `#r22d_rttablew_top Pfx "file" ch w pb` (see `rttableSplit`) -/
elab "#r22d_rttablew_part " pfx:ident p:str ch:num w:num pb:num j:num : command =>
  rttableSplit pfx.getId p.getString ch.getNat w.getNat pb.getNat (some j.getNat)
elab "#r22d_rttablew_top " pfx:ident p:str ch:num w:num pb:num : command =>
  rttableSplit pfx.getId p.getString ch.getNat w.getNat pb.getNat none

/-- `#r22d_l1tablesNS NS "file"` (port of L5.T321Load's `#l1tablesNS`): `NS.c2t_<l>` (l < 511), `NS.CONF1T`, `NS.c2tN` -/
elab "#r22d_l1tablesNS " ns:ident p:str : command => liftCoreM do
  let b ← IO.FS.readBinFile p.getString
  let tab := 511 * 64
  let nm (l : Nat) : Name := ns.getId ++ Name.mkSimple s!"c2t_{l}"
  for l in [0:511] do defNat (nm l) (natLE b (l * tab) ((l + 1) * tab))
  defNat (ns.getId ++ `CONF1T) (natLE b (511 * tab) (512 * tab))
  defArr (ns.getId ++ `c2tN) ((List.range 511).map nm)

/-- `#r22d_l1hypNS NS "file"` (port of `#l1hypNS`): `NS.h_<l>`, `NS.suf_<l>`, `NS.hN`, `NS.sufN` -/
elab "#r22d_l1hypNS " ns:ident p:str : command => liftCoreM do
  let b ← IO.FS.readBinFile p.getString
  let tb := 448
  let nh (l : Nat) : Name := ns.getId ++ Name.mkSimple s!"h_{l}"
  let ns' (l : Nat) : Name := ns.getId ++ Name.mkSimple s!"suf_{l}"
  for l in [0:511] do defNat (nh l) (natLE b (l * tb) ((l + 1) * tb))
  for l in [0:511] do defNat (ns' l) (natLE b ((511 + l) * tb) ((512 + l) * tb))
  defArr (ns.getId ++ `hN) ((List.range 511).map nh)
  defArr (ns.getId ++ `sufN) ((List.range 511).map ns')

/-- `#r22d_e1ext Pfx "file" k` (port of leaf2's `#e1ext`, E1/ExtLoad.lean): the file holds `u32 count`, then per entry `u32 nbytes`
and the little-endian bytes.  `Pfx.X<j>`: consecutive chunks of at most `k` entries, each a `List Nat` of raw literals;
`Pfx.EXT := List.append X0 (List.append X1 (… (List.append X<m-1> [])))`.  Same terms as the kernel loader, exposed and compiled. -/
elab "#r22d_e1ext " pfx:ident p:str k:num : command => liftCoreM do
  let b ← IO.FS.readBinFile p.getString
  let u32 (i : Nat) : Nat :=
    (b.get! i).toNat + 256 * (b.get! (i + 1)).toNat + 65536 * (b.get! (i + 2)).toNat + 16777216 * (b.get! (i + 3)).toNat
  let cnt := u32 0
  let natTy := mkConst ``Nat
  let listTy := mkApp (mkConst ``List [.zero]) natTy
  let nil := mkApp (mkConst ``List.nil [.zero]) natTy
  let mut off := 4
  let mut vals : Array Nat := #[]
  for _ in [0:cnt] do
    let nb := u32 off
    off := off + 4
    vals := vals.push (natLE b off (off + nb))
    off := off + nb
  let kk := k.getNat
  let nch := (cnt + kk - 1) / kk
  let mut chunks : Array Name := #[]
  for j in [0:nch] do
    let lo := j * kk
    let hi := min cnt (lo + kk)
    let mut lst := nil
    for t in [0:hi - lo] do
      lst := mkApp3 (mkConst ``List.cons [.zero]) natTy (mkRawNatLit vals[hi - 1 - t]!) lst
    let n := pfx.getId ++ Name.mkSimple s!"X{j}"
    compiled (.defnDecl { name := n, levelParams := [], type := listTy, value := lst, hints := .abbrev, safety := .safe })
    chunks := chunks.push n
  let mut e := nil
  for n in chunks.reverse do
    e := mkApp3 (mkConst ``List.append [.zero]) natTy (mkConst n) e
  compiled (.defnDecl { name := pfx.getId ++ `EXT, levelParams := [], type := listTy, value := e, hints := .abbrev, safety := .safe })
  logInfo m!"#r22d_e1ext {pfx.getId}: {cnt} entries in {nch} chunks"

end R22D.Load
