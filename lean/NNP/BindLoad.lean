module
public import R22Port.U_6050cb77ad13
public meta import Lean
public import Lean
public import R3RT.BindC2
/-! # NNP.BindLoad: kernel checks binding the item checker's static tables to RT's kept rows

R3's `bindQ` (`R3RT.BindC2`) at a row interface `rowE`: table `q < 511` (cap 2) or the cap-1 table (`q = 511`) equals the table
derived from the listed rows, each of which is `rowE`'s entry.  `BindQSpec` (`L5II.bindQ_spec*`, `L5O.bindQ_spec`) turns an
accepted check into `C2OK` / `Conf1OK`.

* `NNB.DC`: every bit of the 511 slots except the diagonal (as R3's `#r3bindc2` and kinds' `#kibind`);
* `#nnb_c2 Name rowE arr lo hi "dir"`: for `lo ≤ q < hi`, rows `NNB.<Name>_rows_<q>` from `dir/q<qqq>.bin` and the kernel check
  `NNB.<Name>_<q> : ∃ rows, R3RT.bindQ rowE q 2 rows (arr.getD q 0) NNB.DC = true` (witness: those rows);
* `#nnb_c1 Name rowE stored "file"`: `NNB.<Name>_c1 : ∃ rows, R3RT.bindQ rowE 511 1 rows stored NNB.DC = true`;
* `#nnb_all Name rowE arr n`: `NNB.<Name>_all : NNB.AllBelow (fun q => ∃ rows, R3RT.bindQ rowE q 2 rows (arr.getD q 0) NNB.DC
  = true) n` from the `n` checks (`NNB.allBelow_spec` gives `∀ q < n`).

Inputs: items `n, n × (id, k, k labels)`, each value as `[u64 length][LE bytes]` (R3's `rerun/r3/bind/mkbind.py` layout). -/
@[expose] public section
set_option maxRecDepth 100000

namespace NNB

/-- a finite conjunction below `n` (reduces to nested `∧`) -/
def AllBelow (P : Nat → Prop) : Nat → Prop
  | 0 => True
  | n + 1 => AllBelow P n ∧ P n

theorem allBelow_spec {P : Nat → Prop} : ∀ {n : Nat}, AllBelow P n → ∀ q, q < n → P q
  | 0, _, q, hq => absurd hq (Nat.not_lt_zero q)
  | n + 1, h, q, hq => by
    rcases Nat.lt_succ_iff_lt_or_eq.mp hq with h' | h'
    · exact allBelow_spec h.1 q h'
    · subst h'; exact h.2

end NNB

open Lean Elab Command Meta
namespace NNBLoad

/-- the values of a bind file -/
meta def items (b : ByteArray) : Array Nat := Id.run do
  let mut acc : Array Nat := #[]
  let mut o := 0
  while o + 8 ≤ b.size do
    let n := (b.extract o (o + 8)).toUInt64LE!.toNat
    let mut v := 0
    for j in [0:n] do v := v + (b.get! (o + 8 + j)).toNat <<< (8 * j)
    acc := acc.push v
    o := o + 8 + n
  return acc

meta def natTy : Expr := mkConst ``Nat
meta def lnatTy : Expr := mkApp (mkConst ``List [.zero]) natTy
meta def rowTy : Expr := mkApp2 (mkConst ``Prod [.zero, .zero]) natTy lnatTy
meta def rowsTy : Expr := mkApp (mkConst ``List [.zero]) rowTy
meta def listE (ty : Expr) (xs : List Expr) : Expr :=
  xs.foldr (fun x acc => mkApp3 (mkConst ``List.cons [.zero]) ty x acc) (mkApp (mkConst ``List.nil [.zero]) ty)

/-- the rows of a bind file as a `List (ℕ × List ℕ)` literal, and their number -/
meta def rowsE (it : Array Nat) : Expr × Nat := Id.run do
  let n := it[0]!
  let mut rs : Array Expr := #[]
  let mut o := 1
  for _ in [0:n] do
    let id := it[o]!; let k := it[o+1]!
    let ls := (List.range k).map fun j => mkRawNatLit it[o+2+j]!
    rs := rs.push (mkApp4 (mkConst ``Prod.mk [.zero, .zero]) natTy lnatTy (mkRawNatLit id) (listE natTy ls))
    o := o + 2 + k
  return (listE rowTy rs.toList, n)

meta def dcE : Expr := mkConst `NNB.DC

/-- `fun rows => R3RT.bindQ rowE q cap rows stored NNB.DC = true` (loose bound variables of the arguments lifted past `rows`) -/
meta def predE (rowE q cap stored : Expr) : Expr :=
  let l := fun (e : Expr) => e.liftLooseBVars 0 1
  mkLambda `rows .default rowsTy
    (mkApp3 (mkConst ``Eq [.succ .zero]) (mkConst ``Bool)
      (mkAppN (mkConst ``R3RT.bindQ) #[l rowE, l q, l cap, mkBVar 0, l stored, dcE]) (mkConst ``Bool.true))

/-- `∃ rows, R3RT.bindQ rowE q cap rows stored NNB.DC = true` -/
meta def stmtE (rowE q cap stored : Expr) : Expr :=
  mkApp2 (mkConst ``Exists [.succ .zero]) rowsTy (predE rowE q cap stored)

/-- `arr.getD q 0` -/
meta def getDE (arr q : Expr) : Expr := mkAppN (mkConst ``Array.getD [.zero]) #[natTy, arr, q, mkRawNatLit 0]

meta def defRows (n : Name) (v : Expr) : CoreM Unit :=
  addDecl (.defnDecl { name := n, levelParams := [], type := rowsTy, value := v, hints := .abbrev, safety := .safe }) (forceExpose := true)

/-- add `thm : stmtE … := ⟨rows, rfl⟩` (the kernel evaluates `bindQ`); returns the kernel's wall time in ms -/
meta def addCheck (thm rowsN : Name) (rowE q cap stored : Expr) : CoreM Nat := do
  let ty := stmtE rowE q cap stored
  let pf := mkApp4 (mkConst ``Exists.intro [.succ .zero]) rowsTy (predE rowE q cap stored) (mkConst rowsN)
    (mkApp2 (mkConst ``Eq.refl [.succ .zero]) (mkConst ``Bool) (mkConst ``Bool.true))
  let t0 ← IO.monoNanosNow
  addDecl (.thmDecl { name := thm, levelParams := [], type := ty, value := pf })
  let t1 ← IO.monoNanosNow
  return (t1 - t0) / 1000000

meta def elabC (t : Syntax) : CommandElabM Expr := liftTermElabM do
  let e ← Term.elabTerm t none
  Term.synthesizeSyntheticMVarsNoPostponing
  instantiateMVars e

/-- `#nnb_dc`: `NNB.DC` -/
elab "#nnb_dc" : command => liftCoreM do
  let mut DC := 2 ^ (511 * 512) - 1
  for u in [0:511] do DC := DC - 2 ^ (513 * u)
  let d : DefinitionVal :=
    { name := `NNB.DC, levelParams := [], type := natTy, value := mkRawNatLit DC, hints := .abbrev, safety := .safe }
  addDecl (.defnDecl d) (forceExpose := true)

elab "#nnb_c2 " nm:ident rowE:term:max arr:term:max lo:num hi:num dir:str : command => do
  let rE ← elabC rowE
  let aE ← elabC arr
  for q in [lo.getNat:hi.getNat] do
    let f := dir.getString ++ "/q" ++ (if q < 10 then "00" else if q < 100 then "0" else "") ++ toString q ++ ".bin"
    let (rs, n) := rowsE (items (← IO.FS.readBinFile f))
    let rowsN := Name.mkStr `NNB s!"{nm.getId}_rows_{q}"
    liftCoreM <| defRows rowsN rs
    let w ← liftCoreM <| addCheck (Name.mkStr `NNB s!"{nm.getId}_{q}") rowsN rE (mkRawNatLit q) (mkRawNatLit 2)
      (getDE aE (mkRawNatLit q))
    logInfo m!"NNB.{nm.getId}_{q}: {n} rows, kernel {w} ms"

elab "#nnb_c1 " nm:ident rowE:term:max stored:term:max f:str : command => do
  let rE ← elabC rowE
  let sE ← elabC stored
  let (rs, n) := rowsE (items (← IO.FS.readBinFile f.getString))
  let rowsN := Name.mkStr `NNB s!"{nm.getId}_rows_c1"
  liftCoreM <| defRows rowsN rs
  let w ← liftCoreM <| addCheck (Name.mkStr `NNB s!"{nm.getId}_c1") rowsN rE (mkRawNatLit 511) (mkRawNatLit 1) sE
  logInfo m!"NNB.{nm.getId}_c1: {n} rows, kernel {w} ms"

elab "#nnb_all " nm:ident rowE:term:max arr:term:max n:num : command => do
  let rE ← elabC rowE
  let aE ← elabC arr
  let P := mkLambda `q .default natTy (stmtE rE (mkBVar 0) (mkRawNatLit 2) (getDE aE (mkBVar 0)))
  let allB (k : Nat) : Expr := mkApp2 (mkConst ``NNB.AllBelow) P (mkRawNatLit k)
  let mut pf := mkConst ``True.intro
  for k in [0:n.getNat] do
    pf := mkApp4 (mkConst ``And.intro) (allB k) (mkApp P (mkRawNatLit k)) pf (mkConst (Name.mkStr `NNB s!"{nm.getId}_{k}"))
  let t0 ← IO.monoNanosNow
  let d : TheoremVal := { name := Name.mkStr `NNB s!"{nm.getId}_all", levelParams := [], type := allB n.getNat, value := pf }
  liftCoreM <| addDecl (.thmDecl d)
  let t1 ← IO.monoNanosNow
  logInfo m!"NNB.{nm.getId}_all: kernel {(t1 - t0) / 1000000} ms"

end NNBLoad

#nnb_dc
